class Transaction < ApplicationRecord
  validates :subject,:input_amount,:customer_id,:input_currency_code,
            :input_currency_symbol,:output_currency_code,
            :output_currency_symbol,:output_amount, presence: true
  validates :input_amount,:customer_id,:output_amount, numericality: true

  validates :input_currency_code, length: {minimum: 3, maximum: 3}, allow_blank: false
  validates :input_currency_code, inclusion: { in: Money::Currency.table.values.map{|c| c[:iso_code] } ,message: "%{value} is not a valid currency code" }
  validates :input_currency_symbol, length: {minimum: 1, maximum: 5}, allow_blank: false
  validates :input_currency_symbol, inclusion: { in: Money::Currency.table.values.map{|c| c[:symbol] } ,message: "%{value} is not a valid currency code" }

  validates :output_currency_code, length: {minimum: 3, maximum: 3}, allow_blank: false
  validates :output_currency_code, inclusion: { in: Money::Currency.table.values.map{|c| c[:iso_code] } ,message: "%{value} is not a valid currency code" }
  validates :output_currency_symbol, length: {minimum: 1, maximum: 5}, allow_blank: false
  validates :output_currency_symbol, inclusion: { in: Money::Currency.table.values.map{|c| c[:symbol] } ,message: "%{value} is not a valid currency code" }

end
