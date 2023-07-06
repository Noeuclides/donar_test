class CreatePaymentMethodInscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_method_inscriptions do |t|
      t.references :payment_method, polymorphic: true, null: false
      t.string :card_token, null: false
      t.integer :status
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
