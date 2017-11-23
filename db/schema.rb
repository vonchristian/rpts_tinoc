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

ActiveRecord::Schema.define(version: 20171123122519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "assessed_real_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.string "number"
    t.boolean "cancelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_assessed_real_properties_on_number", unique: true
    t.index ["real_property_id"], name: "index_assessed_real_properties_on_real_property_id"
  end

  create_table "real_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["type"], name: "index_real_properties_on_type"
  end

  create_table "revisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "date"
    t.uuid "real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_id"], name: "index_revisions_on_real_property_id"
  end

  create_table "tax_declarations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cancelled", default: false
    t.index ["number"], name: "index_tax_declarations_on_number", unique: true
    t.index ["real_property_id"], name: "index_tax_declarations_on_real_property_id"
  end

  create_table "taxpayer_real_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "taxpayer_id"
    t.uuid "real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_id"], name: "index_taxpayer_real_properties_on_real_property_id"
    t.index ["taxpayer_id"], name: "index_taxpayer_real_properties_on_taxpayer_id"
  end

  create_table "taxpayers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_taxpayers_on_email", unique: true
  end

  create_table "transfer_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "new_owner_id"
    t.uuid "previous_owner_id"
    t.uuid "real_property_id"
    t.datetime "date_transferred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_owner_id"], name: "index_transfer_transactions_on_new_owner_id"
    t.index ["previous_owner_id"], name: "index_transfer_transactions_on_previous_owner_id"
    t.index ["real_property_id"], name: "index_transfer_transactions_on_real_property_id"
  end

  add_foreign_key "assessed_real_properties", "real_properties"
  add_foreign_key "revisions", "real_properties"
  add_foreign_key "tax_declarations", "real_properties"
  add_foreign_key "taxpayer_real_properties", "real_properties"
  add_foreign_key "taxpayer_real_properties", "taxpayers"
  add_foreign_key "transfer_transactions", "real_properties"
  add_foreign_key "transfer_transactions", "taxpayers", column: "new_owner_id"
  add_foreign_key "transfer_transactions", "taxpayers", column: "previous_owner_id"
end
