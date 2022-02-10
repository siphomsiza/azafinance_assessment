class Transaction < ApplicationRecord
  validates :subject,:amount,:customer_id,:currency, presence: true
  validates :amount,:customer_id, numericality: true
  validates :currency, length: {minimum: 3, maximum: 3}, allow_blank: false
  validates :currency, inclusion: { in: Money::Currency.table.values.map{|c| c[:iso_code] } ,message: "%{value} is not a valid currency code" }
end
