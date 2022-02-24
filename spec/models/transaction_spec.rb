require 'rails_helper'

describe Transaction do
  let(:transaction) { FactoryBot.create(:transaction) }

  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:input_amount) }
    it { should validate_presence_of(:input_currency_code) }
    it { should validate_presence_of(:input_currency_symbol) }
    it { should validate_presence_of(:output_amount) }
    it { should validate_presence_of(:output_currency_code) }
    it { should validate_presence_of(:output_currency_symbol) }

    it { should validate_numericality_of(:input_amount)}
    it { should validate_numericality_of(:output_amount)}
    it { should validate_numericality_of(:customer_id)}
  end

  describe "Validations currency code" do
    it "validate minimum and maximum characters on input currency code" do
      expect(transaction.input_currency_code.length).to be_between(3,3).inclusive
    end

    it "validate minimum and maximum characters on  output currency code" do
      expect(transaction.output_currency_code.length).to be_between(3,3).inclusive
    end

    it "validate with inclusion of characters input_currency_code" do
      Money::Currency.table.values.each do |v|
        should allow_value(v[:iso_code]).for(:input_currency_code)
      end
    end

    it "validate with inclusion of characters output_currency_code" do
      Money::Currency.table.values.each do |v|
        should allow_value(v[:iso_code]).for(:output_currency_code)
      end
    end

  end
end
