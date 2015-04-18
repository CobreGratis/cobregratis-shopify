# -*- encoding : utf-8 -*-
require "spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe "GET /" do
    it 'should be ok' do
      get '/'
      expect(last_response).to be_ok
    end
    it "should have content" do
      get '/'
      expect(last_response.body).to match(/middleware/)
    end
  end

  describe "POST /" do
    let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
    context "valid attributes" do
      let(:token) { ENV['COBREGRATIS_TOKEN'] }
      it 'should be ok' do
        VCR.use_cassette('valid-token') do
          post "/#{token}/57/42", request_body, { 'Content-Type' => 'application/json' }
          expect(last_response).to be_ok
        end
      end
    end
    context "invalid attributes" do
      let(:token) { 'invalid-token' }
      it 'should be 500' do
        VCR.use_cassette('invalid-token') do
          post "/#{token}/57/42", request_body, { 'Content-Type' => 'application/json' }
          expect(last_response.status).to eq(500)
        end
      end
    end
  end
end