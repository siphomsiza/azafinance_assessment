require 'rails_helper'

describe "get all transactions route", :type => :request do
  let!(:transactions) {FactoryBot.create_list(:transaction, 20)}

  before {get '/transactions'}

  it 'returns all transactions' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
