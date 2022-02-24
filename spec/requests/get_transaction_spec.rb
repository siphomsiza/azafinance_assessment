require 'rails_helper'
describe "PUT /transactions/:id" do
  before(:each) do
    @transaction = FactoryBot.create(:transaction)
  end

  it 'get a transaction by id' do
    get "/transactions/#{@transaction.id}"

    expect(response.status).to eq(200)
    expect(Transaction.find(@transaction.id).subject).to eq(@transaction.subject)
    expect(Transaction.find(@transaction.id).input_amount).to eq(@transaction.input_amount)
    expect(Transaction.find(@transaction.id).customer_id).to eq(@transaction.customer_id)
    expect(Transaction.find(@transaction.id).input_currency_code).to eq(@transaction.input_currency_code)
    expect(Transaction.find(@transaction.id).input_currency_symbol).to eq(@transaction.input_currency_symbol)
    expect(Transaction.find(@transaction.id).output_currency_code).to eq(@transaction.output_currency_code)
    expect(Transaction.find(@transaction.id).output_currency_symbol).to eq(@transaction.output_currency_symbol)
  end
end
