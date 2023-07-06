class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :discarded_at, index: true

      t.timestamps
    end
  end
end
