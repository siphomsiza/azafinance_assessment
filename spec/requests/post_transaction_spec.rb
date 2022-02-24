require 'rails_helper'

describe "post a transaction route", :type => :request do
  before do
    @subject = Faker::Name.first_name
    @amount = Faker::Number.decimal
    @currency_code = Money::Currency.table.values.map{|c| c[:iso_code] }.shuffle.first
    @currency_symbol = Money::Currency.table.values.map{|c| c[:symbol] }.shuffle.first
    @customer_id = Faker::Number.non_zero_digit

    post '/transactions', params: {transaction: {subject: @subject,amount: @amount,customer_id: @customer_id,currency_code: @currency_code,currency_symbol: @currency_symbol}}.to_json
  end

  it 'returns the transaction subject' do
    expect(JSON.parse(response.body)['subject']).to eq(@subject)
  end

  it 'returns the transaction\'s amount' do
    expect(JSON.parse(response.body)['amount']).to eq(@amount.to_s)
  end

  it 'returns the transaction\'s customer_id' do
    expect(JSON.parse(response.body)['customer_id']).to eq(@customer_id)
  end

  it 'returns the transaction\'s currency_code' do
    expect(JSON.parse(response.body)['currency_code']).to eq(@currency_code)
  end

  it 'returns the transaction\'s currency_symbol' do
    expect(JSON.parse(response.body)['currency_symbol']).to eq(@currency_symbol)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
