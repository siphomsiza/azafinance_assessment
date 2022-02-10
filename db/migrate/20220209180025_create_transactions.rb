class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :subject
      t.decimal :amount , precision: 10, scale: 2
      t.references :customer
      t.string :currency,:limit => 3
      t.timestamps
    end
  end
end
