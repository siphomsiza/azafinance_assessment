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
    expect(Transaction.find(@transaction.id).currency).to eq(@transaction.currency)
  end
end
