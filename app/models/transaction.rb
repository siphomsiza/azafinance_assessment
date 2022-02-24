class Transaction < ApplicationRecord
  validates :subject,:amount,:customer_id,:currency_code,:currency_symbol,:output_currency_code,:output_currency_symbol,:output_amount, presence: true
  validates :amount,:customer_id,:output_amount, numericality: true
  validates :currency_code, length: {minimum: 3, maximum: 3}, allow_blank: false
  validates :currency_code, inclusion: { in: Money::Currency.table.values.map{|c| c[:iso_code] } ,message: "%{value} is not a valid currency code" }
  validates :currency_symbol, length: {minimum: 1, maximum: 5}, allow_blank: false
  validates :currency_symbol, inclusion: { in: Money::Currency.table.values.map{|c| c[:symbol] } ,message: "%{value} is not a valid currency code" }
end
