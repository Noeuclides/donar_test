# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_06_154609) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_campaigns_on_discarded_at"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.bigint "payment_method_id", null: false
    t.bigint "campaign_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.integer "status", null: false
    t.string "ip", null: false
    t.datetime "payment_date"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_donations_on_campaign_id"
    t.index ["discarded_at"], name: "index_donations_on_discarded_at"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["payment_method_id"], name: "index_donations_on_payment_method_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "document_type"
    t.string "document_number"
    t.string "phone_number"
    t.datetime "birthdate"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_donors_on_discarded_at"
  end

  create_table "payment_method_inscriptions", force: :cascade do |t|
    t.string "payment_method_type", null: false
    t.bigint "payment_method_id", null: false
    t.string "card_token", null: false
    t.integer "status"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_payment_method_inscriptions_on_discarded_at"
    t.index ["payment_method_type", "payment_method_id"], name: "index_payment_method_inscriptions_on_payment_method"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.bigint "holder_id", null: false
    t.integer "franchise"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_payment_methods_on_discarded_at"
    t.index ["holder_id"], name: "index_payment_methods_on_holder_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "payment_method_inscription_id", null: false
    t.integer "status"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.jsonb "raw_response"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_transactions_on_discarded_at"
    t.index ["payment_method_inscription_id"], name: "index_transactions_on_payment_method_inscription_id"
  end

  add_foreign_key "donations", "campaigns"
  add_foreign_key "donations", "donors"
  add_foreign_key "donations", "payment_methods"
  add_foreign_key "payment_methods", "donors", column: "holder_id"
  add_foreign_key "transactions", "payment_method_inscriptions"
end
