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

ActiveRecord::Schema.define(version: 2021_04_10_090801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "energy_applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "phone_number"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mailing_address_street"
    t.string "mailing_address_city"
    t.string "mailing_address_state"
    t.string "mailing_address_zip"
    t.string "mailing_address_county"
    t.string "type_of_dwelling"
    t.string "residence_status"
    t.string "types_of_heat", default: [], array: true
    t.string "primary_heat_source"
    t.string "secondary_heat_source"
    t.string "utility_company"
    t.string "household_member_types_of_income", default: [], array: true
    t.string "utility_names", default: [], array: true
    t.string "utility_account_numbers", default: [], array: true
    t.string "utility_account_names", default: [], array: true
    t.boolean "household_members_over_18_without_income", default: [], array: true
    t.string "how_necessities_are_paid"
    t.boolean "household_impacted_by_covid"
    t.boolean "covid_loss_of_employment"
    t.boolean "covid_reduction_of_hours"
    t.boolean "covid_vulnerable_population"
    t.boolean "covid_loss_of_childcare"
    t.string "covid_other_situation"
    t.string "covid_expenses"
    t.string "phone_type"
    t.string "household_type"
    t.string "email_address"
    t.datetime "submission_date"
    t.datetime "confirmation_date"
    t.string "contact_type"
    t.string "contact_info"
    t.index ["user_id"], name: "index_energy_applications_on_user_id"
  end

  create_table "household_members", force: :cascade do |t|
    t.bigint "energy_application_id", null: false
    t.string "name"
    t.date "dob"
    t.string "ssn"
    t.string "gender"
    t.boolean "hispanic"
    t.string "race"
    t.boolean "or_tribe"
    t.string "education"
    t.boolean "disabled"
    t.boolean "veteran"
    t.boolean "homebound"
    t.boolean "snap"
    t.boolean "ohp"
    t.string "other_insurance"
    t.string "income_type"
    t.boolean "over_18_no_formal_income"
    t.decimal "informal_income_amount"
    t.string "informal_income_source"
    t.boolean "in_high_school"
    t.string "type_of_income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utility_records", force: :cascade do |t|
    t.bigint "energy_application_id", null: false
    t.string "utility_name"
    t.string "account_number"
    t.string "accountholder_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "energy_applications", "users"
  add_foreign_key "household_members", "energy_applications"
  add_foreign_key "utility_records", "energy_applications"
end
