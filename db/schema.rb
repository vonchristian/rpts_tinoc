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

ActiveRecord::Schema.define(version: 20180110073831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "addressable_type"
    t.uuid "addressable_id"
    t.uuid "street_id"
    t.uuid "barangay_id"
    t.uuid "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["barangay_id"], name: "index_addresses_on_barangay_id"
    t.index ["municipality_id"], name: "index_addresses_on_municipality_id"
    t.index ["street_id"], name: "index_addresses_on_street_id"
  end

  create_table "appraisals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.decimal "unit_value"
    t.decimal "market_value"
    t.datetime "date"
    t.uuid "classification_id"
    t.uuid "sub_classification_id"
    t.uuid "real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "assessed_value"
    t.index ["classification_id"], name: "index_appraisals_on_classification_id"
    t.index ["real_property_id"], name: "index_appraisals_on_real_property_id"
    t.index ["sub_classification_id"], name: "index_appraisals_on_sub_classification_id"
    t.index ["type"], name: "index_appraisals_on_type"
  end

  create_table "assessed_real_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.string "number"
    t.boolean "cancelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_assessed_real_properties_on_number", unique: true
    t.index ["real_property_id"], name: "index_assessed_real_properties_on_real_property_id"
  end

  create_table "barangays", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "municipality_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_barangays_on_municipality_id"
  end

  create_table "building_descriptions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "building_id"
    t.string "kind"
    t.string "structural_type"
    t.datetime "certififate_of_completion_issued_on"
    t.datetime "certificate_of_occupancy_issued_on"
    t.datetime "date_constructed"
    t.datetime "date_occupied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_descriptions_on_building_id"
  end

  create_table "cancellations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.datetime "date_cancelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_id"], name: "index_cancellations_on_real_property_id"
  end

  create_table "classifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_classifications_on_name", unique: true
  end

  create_table "consolidations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "consolidator_id"
    t.uuid "real_property_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consolidator_id"], name: "index_consolidations_on_consolidator_id"
    t.index ["real_property_id"], name: "index_consolidations_on_real_property_id"
  end

  create_table "encumberances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.uuid "real_property_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_id"], name: "index_encumberances_on_real_property_id"
  end

  create_table "floors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "building_id"
    t.decimal "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_floors_on_building_id"
  end

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.uuid "street_id"
    t.uuid "barangay_id"
    t.uuid "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_locations_on_barangay_id"
    t.index ["municipality_id"], name: "index_locations_on_municipality_id"
    t.index ["real_property_id"], name: "index_locations_on_real_property_id"
    t.index ["street_id"], name: "index_locations_on_street_id"
  end

  create_table "market_value_revisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "sub_classification_id"
    t.decimal "market_value"
    t.string "unit"
    t.date "effectivity_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_classification_id"], name: "index_market_value_revisions_on_sub_classification_id"
  end

  create_table "municipalities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "province_id"
    t.index ["province_id"], name: "index_municipalities_on_province_id"
  end

  create_table "penalty_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "max_no_month"
    t.decimal "penalty_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "previous_real_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "latest_real_property_id"
    t.uuid "old_real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latest_real_property_id"], name: "index_previous_real_properties_on_latest_real_property_id"
    t.index ["old_real_property_id"], name: "index_previous_real_properties_on_old_real_property_id"
  end

  create_table "property_administrations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.string "administrator_type"
    t.uuid "administrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_type", "administrator_id"], name: "index_on_administrator_on_property_administrations"
    t.index ["real_property_id"], name: "index_property_administrations_on_real_property_id"
  end

  create_table "property_boundaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.string "type"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_id"], name: "index_property_boundaries_on_real_property_id"
    t.index ["type"], name: "index_property_boundaries_on_type"
  end

  create_table "provinces", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_provinces_on_name", unique: true
  end

  create_table "real_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.uuid "subdivided_real_property_id"
    t.integer "taxability"
    t.uuid "land_reference_id"
    t.uuid "sub_classification_id"
    t.decimal "area"
    t.index ["land_reference_id"], name: "index_real_properties_on_land_reference_id"
    t.index ["sub_classification_id"], name: "index_real_properties_on_sub_classification_id"
    t.index ["subdivided_real_property_id"], name: "index_real_properties_on_subdivided_real_property_id"
    t.index ["taxability"], name: "index_real_properties_on_taxability"
    t.index ["type"], name: "index_real_properties_on_type"
  end

  create_table "real_property_consolidations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "real_property_id"
    t.uuid "consolidation_id"
    t.uuid "consolidator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consolidation_id"], name: "index_real_property_consolidations_on_consolidation_id"
    t.index ["consolidator_id"], name: "index_real_property_consolidations_on_consolidator_id"
    t.index ["real_property_id"], name: "index_real_property_consolidations_on_real_property_id"
  end

  create_table "real_property_ownerships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "property_owner_type"
    t.uuid "property_owner_id"
    t.uuid "real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_owner_type", "property_owner_id"], name: "index_on_real_property_ownerships_property_owner_id"
    t.index ["real_property_id"], name: "index_real_property_ownerships_on_real_property_id"
  end

  create_table "revisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "date"
    t.uuid "real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_id"], name: "index_revisions_on_real_property_id"
  end

  create_table "streets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "barangay_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_streets_on_barangay_id"
  end

  create_table "sub_classifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "classification_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_sub_classifications_on_classification_id"
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

  create_table "tins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tinable_type"
    t.uuid "tinable_id"
    t.datetime "date_issued"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_tins_on_number", unique: true
    t.index ["tinable_type", "tinable_id"], name: "index_tins_on_tinable_type_and_tinable_id"
  end

  create_table "transfer_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "new_owner_id"
    t.uuid "old_real_property_id"
    t.uuid "new_real_property_id"
    t.datetime "date_transferred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_owner_id"], name: "index_transfer_transactions_on_new_owner_id"
    t.index ["new_real_property_id"], name: "index_transfer_transactions_on_new_real_property_id"
    t.index ["old_real_property_id"], name: "index_transfer_transactions_on_old_real_property_id"
  end

  add_foreign_key "addresses", "barangays"
  add_foreign_key "addresses", "municipalities"
  add_foreign_key "addresses", "streets"
  add_foreign_key "appraisals", "classifications"
  add_foreign_key "appraisals", "real_properties"
  add_foreign_key "appraisals", "sub_classifications"
  add_foreign_key "assessed_real_properties", "real_properties"
  add_foreign_key "barangays", "municipalities"
  add_foreign_key "building_descriptions", "real_properties", column: "building_id"
  add_foreign_key "cancellations", "real_properties"
  add_foreign_key "consolidations", "real_properties"
  add_foreign_key "consolidations", "taxpayers", column: "consolidator_id"
  add_foreign_key "encumberances", "real_properties"
  add_foreign_key "floors", "real_properties", column: "building_id"
  add_foreign_key "locations", "barangays"
  add_foreign_key "locations", "municipalities"
  add_foreign_key "locations", "real_properties"
  add_foreign_key "locations", "streets"
  add_foreign_key "market_value_revisions", "sub_classifications"
  add_foreign_key "municipalities", "provinces"
  add_foreign_key "previous_real_properties", "real_properties", column: "latest_real_property_id"
  add_foreign_key "previous_real_properties", "real_properties", column: "old_real_property_id"
  add_foreign_key "property_administrations", "real_properties"
  add_foreign_key "property_boundaries", "real_properties"
  add_foreign_key "real_properties", "real_properties", column: "land_reference_id"
  add_foreign_key "real_properties", "real_properties", column: "subdivided_real_property_id"
  add_foreign_key "real_properties", "sub_classifications"
  add_foreign_key "real_property_consolidations", "consolidations"
  add_foreign_key "real_property_consolidations", "real_properties"
  add_foreign_key "real_property_consolidations", "taxpayers", column: "consolidator_id"
  add_foreign_key "real_property_ownerships", "real_properties"
  add_foreign_key "revisions", "real_properties"
  add_foreign_key "streets", "barangays"
  add_foreign_key "sub_classifications", "classifications"
  add_foreign_key "transfer_transactions", "real_properties", column: "new_real_property_id"
  add_foreign_key "transfer_transactions", "real_properties", column: "old_real_property_id"
  add_foreign_key "transfer_transactions", "taxpayers", column: "new_owner_id"
end
