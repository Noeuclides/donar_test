class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.references :donor, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true
      t.references :campaign, null: true, foreign_key: true
      t.monetize :amount, null: false
      t.integer :status, null: false
      t.string :ip, null: false
      t.string :user_agent, null: false
      t.datetime :payment_date
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
