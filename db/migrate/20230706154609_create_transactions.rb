class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :payment_method, null: false, foreign_key: true
      t.integer :status
      t.monetize :amount, null: false
      t.jsonb :raw_response
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
