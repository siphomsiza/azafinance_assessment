require 'rails_helper'

describe "post a transaction route", :type => :request do
  before do
    @subject = Faker::Name.first_name
    @input_amount = Faker::Number.decimal
    @output_amount = Faker::Number.decimal
    @input_currency_code = Money::Currency.table.values.map{|c| c[:iso_code] }.reject { |c| c.empty? }.shuffle.first
    @output_currency_code = Money::Currency.table.values.map{|c| c[:iso_code] }.reject { |c| c.empty? }.shuffle.last
    @input_currency_symbol = Money::Currency.table.values.map{|c| c[:symbol] }.reject { |c| c.empty? }.shuffle.first
    @output_currency_symbol = Money::Currency.table.values.map{|c| c[:symbol] }.reject { |c| c.empty? }.shuffle.last
    @customer_id = Faker::Number.non_zero_digit

    post '/transactions', params: {transaction: {subject: @subject,input_amount: @input_amount,
                                                 output_amount: @output_amount,customer_id: @customer_id,
                                                 input_currency_code: @input_currency_code,output_currency_code: @output_currency_code,
                                                 input_currency_symbol: @input_currency_symbol,output_currency_symbol: @output_currency_symbol}}.to_json
  end

  it 'returns the transaction subject' do
    expect(JSON.parse(response.body)['subject']).to eq(@subject)
  end

  it 'returns the transaction\'s output_amount' do
    expect(JSON.parse(response.body)['output_amount']).to eq(@output_amount.to_s)
  end

  it 'returns the transaction\'s customer_id' do
    expect(JSON.parse(response.body)['customer_id']).to eq(@customer_id)
  end

  it 'returns the transaction\'s input_currency_code' do
    expect(JSON.parse(response.body)['input_currency_code']).to eq(@input_currency_code)
  end

  it 'returns the transaction\'s input_currency_symbol' do
    expect(JSON.parse(response.body)['input_currency_symbol']).to eq(@input_currency_symbol)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
