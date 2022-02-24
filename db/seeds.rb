# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do
  input_currency = Money::Currency.table.values.shuffle.first
  output_currency = Money::Currency.table.values.shuffle.last
  Transaction.create(subject: Faker::Name.first_name,
                     input_amount: Faker::Number.decimal ,
                     output_amount: Faker::Number.decimal ,
                     customer_id: Faker::Number.non_zero_digit ,
                     input_currency_code: input_currency[:iso_code],
                     output_currency_code: output_currency[:iso_code],
                     input_currency_symbol: input_currency[:symbol],
                     output_currency_symbol: output_currency[:symbol])
end
