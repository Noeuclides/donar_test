class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods do |t|
      t.references :holder, null: false, foreign_key: { to_table: :donors }
      t.integer :franchise
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
