FactoryBot.define do
  factory :transaction do
    id {Transaction.maximum(:id).to_i+1}
    subject {Faker::Name.first_name}
    amount {Faker::Number.decimal}
    customer_id {Faker::Number.non_zero_digit}
    currency_code {Money::Currency.table.values.map{|c| c[:iso_code] }.reject { |c| c.empty? }.shuffle.first}
    currency_symbol {Money::Currency.table.values.map{|c| c[:symbol] }.reject { |c| c.empty? }.shuffle.first}
  end

  # factory :sign_up_step_two do
  #   gender {%w(Male Female Non-binary).shuffle.first}
  #   birthday {Faker::Date.birthday}
  #   university {Faker::University.name}
  # end
  #
  # factory :user do
  #   id {2}
  #   first_name {Faker::Name.first_name}
  #   last_name {Faker::Name.last_name}
  #   email {Faker::Internet.email()}
  # end

end
