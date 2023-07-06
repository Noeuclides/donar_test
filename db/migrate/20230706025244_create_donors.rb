class CreateDonors < ActiveRecord::Migration[7.0]
  def change
    create_table :donors do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :document_type
      t.string :document_number
      t.string :phone_number
      t.datetime :birthdate
      t.datetime :discarded_at, index: true


      t.timestamps
    end
  end
end
