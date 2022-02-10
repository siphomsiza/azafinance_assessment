# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  Transaction.create(subject: Faker::Name.first_name, amount: Faker::Number.decimal ,customer_id: Faker::Number.non_zero_digit ,currency: Money::Currency.table.values.map{|c| c[:iso_code] }.shuffle.first)
end
