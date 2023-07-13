class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods do |t|
      t.references :holder, polymorphic: true, null: false
      t.integer :franchise
      t.string :card_token, null: false
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
