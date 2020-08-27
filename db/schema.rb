# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_27_053123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_comments_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "block_number"
    t.string "time_stamp"
    t.string "hash"
    t.integer "nonce"
    t.string "blockHash"
    t.integer "transaction_index"
    t.string "gas"
    t.string "gas_price"
    t.string "is_error"
    t.string "txreceipt_status"
    t.string "input"
    t.string "contract_address"
    t.string "cumulative_gas_used"
    t.string "gas_used"
    t.string "confirmations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.string "to"
    t.string "from"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "transactions"
end
