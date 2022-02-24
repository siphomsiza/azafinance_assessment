FactoryBot.define do
  factory :transaction do
    id {Transaction.maximum(:id).to_i+1}
    subject {Faker::Name.first_name}
    customer_id {Faker::Number.non_zero_digit}
    input_amount {Faker::Number.decimal}
    input_currency_code {Money::Currency.table.values.map{|c| c[:iso_code] }.reject { |c| c.empty? }.shuffle.first}
    input_currency_symbol {Money::Currency.table.values.map{|c| c[:symbol] }.reject { |c| c.empty? }.shuffle.first}
    output_amount {Faker::Number.decimal}
    output_currency_code {Money::Currency.table.values.map{|c| c[:iso_code] }.reject { |c| c.empty? }.shuffle.first}
    output_currency_symbol {Money::Currency.table.values.map{|c| c[:symbol] }.reject { |c| c.empty? }.shuffle.first}
  end

end
