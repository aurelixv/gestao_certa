# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_24_011208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "complement"
    t.string "zip_code", null: false
    t.string "number", null: false
    t.string "district", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "bank_account_types", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "branch", null: false
    t.string "account_number", null: false
    t.bigint "bank_account_type_id"
    t.string "bankable_type"
    t.bigint "bankable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_account_type_id"], name: "index_bank_accounts_on_bank_account_type_id"
    t.index ["bankable_type", "bankable_id"], name: "index_bank_accounts_on_bankable_type_and_bankable_id"
  end

  create_table "employee_types", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "archived"
    t.bigint "person_id"
    t.bigint "employee_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_type_id"], name: "index_employees_on_employee_type_id"
    t.index ["person_id"], name: "index_employees_on_person_id"
  end

  create_table "employment_record_cards", force: :cascade do |t|
    t.string "pis_pasep", null: false
    t.string "number", null: false
    t.string "series", null: false
    t.string "state", null: false
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employment_record_cards_on_employee_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "rg", null: false
    t.string "cpf", null: false
    t.string "email", null: false
    t.date "birth_date", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bank_accounts", "bank_account_types"
  add_foreign_key "employees", "employee_types"
  add_foreign_key "employees", "people"
  add_foreign_key "employment_record_cards", "employees"
end
