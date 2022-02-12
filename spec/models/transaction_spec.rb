require 'rails_helper'

describe Transaction do
  let(:transaction) { FactoryBot.create(:transaction) }

  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:currency_code) }

    it { should validate_numericality_of(:amount)}
    it { should validate_numericality_of(:customer_id)}

  end

  describe "Validations currency_code" do
    it "validate minimum and maximum characters" do
      expect(transaction.currency_code.length).to be_between(3,3).inclusive
    end

    it "validate with inclusion of characters" do
      Money::Currency.table.values.each do |v|
        should allow_value(v[:iso_code]).for(:currency_code)
      end
    end

  end
end
