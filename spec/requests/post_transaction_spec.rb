require 'rails_helper'

describe "post a transaction route", :type => :request do
  before do
    @subject = Faker::Name.first_name
    @amount = Faker::Number.decimal
    @currency = Money::Currency.table.values.map{|c| c[:iso_code] }.shuffle.first
    @customer_id = Faker::Number.non_zero_digit

    post '/transactions', params: {transaction: {subject: @subject,amount: @amount,customer_id: @customer_id,currency: @currency}}.to_json
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

  it 'returns the transaction\'s currency' do
    expect(JSON.parse(response.body)['currency']).to eq(@currency)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
