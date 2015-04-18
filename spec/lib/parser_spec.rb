# -*- encoding : utf-8 -*-
require "spec_helper"

describe Parser do
  let(:parser) { Parser.new(request_body) }
  describe :valid_to_process? do
    context "valid" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).to be_valid_to_process }
    end
    context "not confirmed" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":false,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).not_to be_valid_to_process }
    end
    context "diferent currency" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"USD","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).not_to be_valid_to_process }
    end
    context "status not pending" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"complete","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).not_to be_valid_to_process }
    end
    context "not manual processing" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"automatic","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).not_to be_valid_to_process }
    end
    context "diferent gateway" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Dinheiro","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).not_to be_valid_to_process }
    end
    context "cancelled" do
      let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":"other","cancelled_at":"2014-02-17T21:02:15-05:00","cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
      it { expect(parser).not_to be_valid_to_process }
    end
  end

  context 'case 1' do
    let(:request_body) { '{"buyer_accepts_marketing":false,"cancel_reason":null,"cancelled_at":null,"cart_token":"e9af63db992cce9f91326ee4035916c1","checkout_token":"b0553b89883533ab96d1259239da7dd3","closed_at":null,"confirmed":true,"created_at":"2014-01-07T22:28:16-05:00","currency":"BRL","email":"email@example.com","financial_status":"pending","fulfillment_status":null,"gateway":"Boleto Banc\u00e1rio","id":219230809,"landing_site":"/","location_id":null,"name":"#1002","note":"","number":2,"reference":null,"referring_site":"","source":"browser","subtotal_price":"60.00","taxes_included":true,"test":false,"token":"e8d5c61de428979ac30be83ff080b763","total_discounts":"0.00","total_line_items_price":"60.00","total_price":"70.00","total_price_usd":"29.41","total_tax":"0.00","total_weight":0,"updated_at":"2014-01-07T22:28:16-05:00","user_id":null,"browser_ip":null,"landing_site_ref":null,"order_number":1002,"discount_codes":[],"note_attributes":[],"processing_method":"manual","checkout_id":185282229,"source_name":"web","tax_lines":[{"price":"0.00","rate":0.17,"title":"VAT"}],"line_items":[{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351377,"price":"30.00","product_id":206874989,"quantity":1,"requires_shipping":true,"sku":"camisa-m","title":"Camisa HE:labs Unissex Preta","variant_id":470720497,"variant_title":"M","vendor":"HE:labs","name":"Camisa HE:labs Unissex Preta - M","variant_inventory_management":"shopify","properties":[],"product_exists":true},{"fulfillment_service":"manual","fulfillment_status":null,"grams":0,"id":387351381,"price":"30.00","product_id":189493369,"quantity":1,"requires_shipping":true,"sku":"camisa-p","title":"Camisa HE:labs Unissex Branca","variant_id":434287345,"variant_title":"P","vendor":"HE:labs","name":"Camisa HE:labs Unissex Branca - P","variant_inventory_management":"shopify","properties":[],"product_exists":true}],"shipping_lines":[{"code":"Standard Shipping","price":"10.00","source":"shopify","title":"Standard Shipping"}],"billing_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"shipping_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","last_name":"Lima","latitude":"-22.91608","longitude":"-43.08435","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","country_code":"BR","province_code":"RJ"},"fulfillments":[],"customer":{"accepts_marketing":false,"created_at":"2013-12-30T23:57:36-05:00","email":"email@example.com","first_name":"Rafael","id":180315317,"last_name":"Lima","last_order_id":219230809,"multipass_identifier":null,"note":null,"orders_count":2,"state":"enabled","total_spent":"110.00","updated_at":"2014-01-07T22:28:16-05:00","verified_email":true,"tags":"","last_order_name":"#1002","default_address":{"address1":"Av. Candango 321 489","address2":"Guaranim","city":"Rio de Janeiro","company":"89234567831","country":"Brazil","first_name":"Rafael","id":231794009,"last_name":"Lima","phone":"99324545","province":"Rio de Janeiro","zip":"21324-009","name":"Rafael Lima","province_code":"RJ","country_code":"BR","country_name":"Brazil","default":true}}}' }
    describe :bank_billet_attributes do
      it {
        expect(parser.bank_billet_attributes).to eq({
              amount: 70.00,
              expire_at: Date.parse('2014-01-10'),
              name: "Rafael Lima",
              cnpj_cpf: "89234567831",
              address: "Av. Candango 321 489",
              neighborhood: "Guaranim",
              city: "Rio de Janeiro",
              state: "RJ",
              zipcode: "21324-009",
              send_email_on_creation: true,
              generate_on_creation: true,
              email: {
                name: "Rafael",
                address: "email@example.com"
              },
              meta: "{\"order_id\":219230809,\"order_number\":1002}"
            })
      }
    end
  end
  context 'case 2' do
    let(:request_body) { "{\"buyer_accepts_marketing\":true,\"cancel_reason\":null,\"cancelled_at\":null,\"cart_token\":\"30d8b04c051f67c0260f023577f948ed\",\"checkout_token\":\"a6d3c31e53f323047936c751e94dbb7f\",\"closed_at\":\"2015-04-18T10:31:29-04:00\",\"confirmed\":true,\"created_at\":\"2015-04-17T20:53:17-04:00\",\"currency\":\"BRL\",\"device_id\":null,\"email\":\"eduraider@hotmail.com\",\"financial_status\":\"pending\",\"gateway\":\"Boleto Banc\xC3\xA1rio\",\"id\":405433569,\"landing_site\":\"\\/\",\"location_id\":null,\"name\":\"#121031\",\"note\":null,\"number\":31,\"processed_at\":\"2015-04-17T20:53:17-04:00\"
,\"reference\":null,\"referring_site\":\"\",\"source_identifier\":null,\"source_url\":null,\"subtotal_price\":\"180.00\",\"taxes_included\":false,\"test\":false,\"token\":\"66a703549c1c96f65b529cf54b747131\",\"total_discounts\":\"0.00\",\"total_line_items_price\":\"180.00\",\"total_price\":\"180.00\",\"total_price_usd\":\"59.71\",\"total_tax\":\"0.00\",\"total_weight\":0,\"updated_at\":\"2015-04-18T10:31:29-04:00\",\"user_id\":null,\"browser_ip\":null,\"landing_site_ref\":null,\"order_number\":1031,\"discount_codes\":[],\"note_attributes\":[],\"processing_method\":\"manual\",\"source\":\"checkout_next\",\"checkout_id\":480143429,\"source_name\":\"web\",\"fulfillment_status\":null,\"tax_lines\":[],\"tags\":\"\",\"line_items\":[{\"fulfillment_service\":\"manual\",\"fulfillment_status\":null,\"gift_card\":false,\"grams\":0,\"id\":707118813,\"price\":\"180.00\",\"product_id\":438918417,\"quantity\":1,\"requires_shipping\":true,\"sku\":\"1000.06.29-A\",\"taxable\":false,\"title\":\"Moletom Masculino\",\"variant_id\":1154391361,\"variant_title\":\"\",\"vendor\":\"n\\/a\",\"name\":\"Moletom Masculino\",\"variant_inventory_management\":\"shopify\",\"properties\":[],\"product_exists\":true,\"fulfillable_quantity\":1,\"total_discount\":\"0.00\",\"tax_lines\":[]}],\"shipping_lines\":[{\"code\":\"Correios: Prazo de entrega 18 a 30 dias \xC3\xBAteis\",\"price\":\"0.00\",\"source\":\"shopify\",\"title\":\"Correios: Prazo de entrega 18 a 30 dias \xC3\xBAteis\",\"tax_lines\":[]}],\"billing_address\":{\"address1\":\"Rua Inglaterra, 2512\",\"address2\":\"Jardim Europa\",\"city\":\"Jales\",\"company\":null,\"country\":\"Brazil\",\"first_name\":\"Eduardo\",\"last_name\":\"Raider\",\"latitude\":-20.275271,\"longitude\":-50.543295,\"phone\":\"+5511984045177\",\"province\":\"S\xC3\xA3o Paulo\",\"zip\":\"15703186\",\"name\":\"Eduardo Raider\",\"country_code\":\"BR\",\"province_code\":\"SP\"},\"shipping_address\":{\"address1\":\"Rua Inglaterra, 2512\",\"address2\":\"Jardim Europa\",\"city\":\"Jales\",\"company\":null,\"country\":\"Brazil\",\"first_name\":\"Eduardo\",\"last_name\":\"Raider\",\"latitude\":-20.275271,\"longitude\":-50.543295,\"phone\":\"+5511984045177\",\"province\":\"S\xC3\xA3o Paulo\",\"zip\":\"15703186\",\"name\":\"Eduardo Raider\",\"country_code\":\"BR\",\"province_code\":\"SP\"},\"fulfillments\":[],\"client_details\":{\"accept_language\":\"pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4\",\"browser_height\":799,\"browser_ip\":\"179.99.135.64\",\"browser_width\":1583,\"session_hash\":\"e33b5f64e50651e61e5c059fe18c034f\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/41.0.2272.118 Safari\\/537.36\"},\"refunds\":[],\"customer\":{\"accepts_marketing\":true,\"created_at\":\"2015-04-14T19:00:34-04:00\",\"email\":\"eduraider@hotmail.com\",\"first_name\":\"Eduardo\",\"id\":379693537,\"last_name\":\"Raider\",\"last_order_id\":405449909,\"multipass_identifier\":null,\"note\":null,\"orders_count\":13,\"state\":\"enabled\",\"total_spent\":\"1005.00\",\"updated_at\":\"2015-04-18T10:31:29-04:00\",\"verified_email\":true,\"tags\":\"newsletter, prospect\",\"last_order_name\":\"#121033\",\"default_address\":{\"address1\":\"Rua Inglaterra, 2512\",\"address2\":\"Jardim Europa\",\"city\":\"Jales\",\"company\":null,\"country\":\"Brazil\",\"first_name\":\"Eduardo\",\"id\":455705661,\"last_name\":\"Raider\",\"phone\":\"+5511984045177\",\"province\":\"S\xC3\xA3o Paulo\",\"zip\":\"15703186\",\"name\":\"Eduardo Raider\",\"province_code\":\"SP\",\"country_code\":\"BR\",\"country_name\":\"Brazil\",\"default\":true}}}" }
    describe :bank_billet_attributes do
      it {
        expect(parser.bank_billet_attributes).to eq(
            { :amount => 180.0, :expire_at => Date.parse('2015-04-21'),
              :name => "Eduardo Raider", :cnpj_cpf => nil, :address => "Rua Inglaterra, 2512",
              :neighborhood => "Jardim Europa", :city => "Jales", :state => "SP",
              :zipcode => "15703186", :generate_on_creation => true,
              :send_email_on_creation => true,
              :email => { :name => "Eduardo", :address => "eduraider@hotmail.com" },
              :meta => "{\"order_id\":405433569,\"order_number\":1031}"
            }
          )
      }
    end
  end
end