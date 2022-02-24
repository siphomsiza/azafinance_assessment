class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :subject
      t.decimal :input_amount , precision: 10, scale: 2
      t.decimal :output_amount , precision: 10, scale: 2
      t.references :customer
      t.string :input_currency_code,:limit => 3
      t.string :input_currency_symbol,:limit => 5
      t.string :output_currency_code,:limit => 3
      t.string :output_currency_symbol,:limit => 5
      t.timestamps
    end
  end
end
