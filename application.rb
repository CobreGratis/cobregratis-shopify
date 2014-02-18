# -*- encoding : utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'cobregratis'
require 'haml'
require './lib/parser'
require 'logger'

configure do
  LOG = Logger.new(STDOUT)
  LOG.level = Logger.const_get ENV['LOG_LEVEL'] || 'DEBUG'

  set :views, '.'
end

get '/' do
  markdown :README, :layout_engine => :haml
end

post '/:token/:service_id/:bank_billet_account_id' do
  request_body = request.body.read.to_s
  LOG.info "---> Receiving request: #{request_body.inspect}"
  parser = Parser.new(request_body)
  if parser.valid_to_process?
    LOG.info "---> Request valid to process."
    Cobregratis::BankBillet.site = "https://app.cobregratis.com.br"
    Cobregratis::BankBillet.user = params[:token]
    Cobregratis::BankBillet.password = 'X'
    Cobregratis::BankBillet.format = :xml
    bank_billet_attributes = parser.bank_billet_attributes.merge(service_id: params[:service_id], bank_billet_account_id: params[:bank_billet_account_id])
    LOG.info "----> Bank Billet Attributes = #{bank_billet_attributes.inspect}"
    if Cobregratis::BankBillet.create(bank_billet_attributes)
      LOG.info "----> Bank billet created!"
    else
      LOG.info "----> Error creating bank billet."
    end
  else
    LOG.info "---> Request ignored."
  end
end