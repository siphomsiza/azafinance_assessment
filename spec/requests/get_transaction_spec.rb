require 'rails_helper'
describe "PUT /transactions/:id" do
  before(:each) do
    @transaction = FactoryBot.create(:transaction)
  end

  it 'get a transaction by id' do
    get "/transactions/#{@transaction.id}"

    expect(response.status).to eq(200)
    expect(Transaction.find(@transaction.id).subject).to eq(@transaction.subject)
    expect(Transaction.find(@transaction.id).amount).to eq(@transaction.amount)
    expect(Transaction.find(@transaction.id).customer_id).to eq(@transaction.customer_id)
    expect(Transaction.find(@transaction.id).currency_code).to eq(@transaction.currency_code)
    expect(Transaction.find(@transaction.id).currency_symbol).to eq(@transaction.currency_symbol)
  end
end
