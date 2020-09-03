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

ActiveRecord::Schema.define(version: 2020_09_03_193614) do

  create_table "payments", force: :cascade do |t|
    t.string "descricao"
    t.string "natureza"
    t.integer "sinal"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.float "balance"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "payment_type"
    t.date "date"
    t.float "value"
    t.string "cpf"
    t.string "card"
    t.datetime "time"
    t.string "owner"
    t.string "store"
    t.integer "store_id"
  end

end
