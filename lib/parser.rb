# -*- encoding : utf-8 -*-
require 'json'

class Parser
  attr_reader :params

  def initialize(params = '')
    @params = JSON.parse(params)
  end

  def valid_to_process?
    confirmed? and
    !cancelled? and
    currency_brl? and
    financial_status_pending? and
    manual_processing_method? and
    correct_gateway?
  end

  def bank_billet_attributes
    {
      amount: amount,
      expire_at: expire_at,
      name: name,
      cnpj_cpf: cnpj_cpf,
      address: address,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipcode: zipcode,
      generate_on_creation: true,
      send_email_on_creation: true,
      email: {
        name: email_name,
        address: email_address
      },
      meta: meta
    }
  end

  private

    def confirmed?
      params['confirmed'] == true
    end

    def cancelled?
      params['cancelled_at'] != nil
    end

    def currency_brl?
      params['currency'] == 'BRL'
    end

    def financial_status_pending?
      params['financial_status'] == 'pending'
    end

    def manual_processing_method?
      params['processing_method'] == 'manual'
    end

    def correct_gateway?
      params['gateway'] == 'Boleto Bancário'
    end

    def amount
      params['total_price'].to_f
    end

    def expire_at
      (Time.parse(params['updated_at'])+259200).to_date
    end

    def name
      params['billing_address']['name']
    end

    def cnpj_cpf
      params['billing_address']['company']
    end

    def address
      params['billing_address']['address1']
    end

    def neighborhood
      params['billing_address']['address2']
    end

    def city
      params['billing_address']['city']
    end

    def state
      params['billing_address']['province_code']
    end

    def zipcode
      params['billing_address']['zip']
    end

    def email_name
      params['customer']['first_name']
    end

    def email_address
      params['customer']['email']
    end

    def meta
      {
        order_id: params['id'],
        order_number: params['order_number']
      }.to_json
    end

end