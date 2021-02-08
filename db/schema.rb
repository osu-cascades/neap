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

ActiveRecord::Schema.define(version: 2021_02_05_095822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "declaration_of_household_incomes", force: :cascade do |t|
    t.integer "parent_application_id", null: false
    t.string "member_name"
    t.money "informal_income_amount", scale: 2
    t.string "informal_income_source"
    t.boolean "is_highschooler"
  end

  create_table "energy_applications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "phone_number"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "first_name"
    t.text "last_name"
    t.text "household_member_names", default: [], array: true
    t.date "household_member_birthdates", default: [], array: true
    t.text "household_member_ssids", default: [], array: true
    t.text "household_member_genders", default: [], array: true
    t.boolean "household_members_who_are_hispanic", default: [], array: true
    t.text "household_member_races", default: [], array: true
    t.boolean "household_members_in_or_tribe", default: [], array: true
    t.text "household_member_educations", default: [], array: true
    t.boolean "household_members_with_disabilities", default: [], array: true
    t.boolean "household_member_veterans", default: [], array: true
    t.boolean "household_members_who_are_homebound", default: [], array: true
    t.boolean "household_member_snaps", default: [], array: true
    t.boolean "household_member_ohps", default: [], array: true
    t.text "household_member_other_medical_insurances", default: [], array: true
    t.text "mailing_address_street"
    t.text "mailing_address_city"
    t.text "mailing_address_state"
    t.text "mailing_address_zip"
    t.text "mailing_address_county"
    t.text "type_of_dwelling"
    t.text "residence_status"
    t.text "types_of_heat", default: [], array: true
    t.text "primary_heat_source"
    t.text "secondary_heat_source"
    t.text "utility_company"
    t.text "household_member_types_of_income", default: [], array: true
    t.text "utility_names", default: [], array: true
    t.text "utility_account_numbers", default: [], array: true
    t.text "utility_account_names", default: [], array: true
    t.boolean "household_members_over_18_without_income", default: [], array: true
    t.text "household_member_informal_incomes_last_month", default: [], array: true
    t.text "household_member_informal_income_sources", default: [], array: true
    t.boolean "household_members_in_high_school", default: [], array: true
    t.text "how_necessities_are_paid"
    t.boolean "household_impacted_by_covid"
    t.boolean "covid_loss_of_employment"
    t.boolean "covid_reduction_of_hours"
    t.boolean "covid_vulnerable_population"
    t.boolean "covid_loss_of_childcare"
    t.text "covid_other_situation"
    t.text "covid_expenses"
    t.text "phone_type"
    t.text "household_type"
    t.text "email_address"
    t.index ["user_id"], name: "index_energy_applications_on_user_id"
  end

  create_table "household_member_incomes", force: :cascade do |t|
    t.integer "parent_application_id", null: false
    t.string "name"
    t.string "income_type"
  end

  create_table "household_members", force: :cascade do |t|
    t.integer "parent_application_id", null: false
    t.string "name"
    t.date "dob"
    t.string "ssn"
    t.string "gender"
    t.boolean "hispanic"
    t.string "race"
    t.boolean "tribal_member"
    t.string "education"
    t.boolean "disabled"
    t.boolean "veteran"
    t.boolean "homebound"
    t.boolean "snap"
    t.boolean "ohp"
    t.string "other_insurance"
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
    t.integer "parent_application_id", null: false
    t.string "utility_name"
    t.string "account_number"
    t.string "accountholder_name"
  end

  add_foreign_key "energy_applications", "users"
end
