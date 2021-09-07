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

ActiveRecord::Schema.define(version: 2021_09_03_144520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.string "neighborhood"
    t.string "number"
    t.string "complement"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bluetoohsearches", force: :cascade do |t|
    t.string "rfidCode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_bluetoohsearches_on_product_id"
  end

  create_table "buys", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2
    t.decimal "totbuy", precision: 5, scale: 2
    t.integer "quantity"
    t.string "nameProduct"
    t.date "dateBuy"
    t.float "discount"
    t.string "measurement"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "provider_id", null: false
    t.bigint "tax_id", null: false
    t.index ["provider_id"], name: "index_buys_on_provider_id"
    t.index ["tax_id"], name: "index_buys_on_tax_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "nameCat"
    t.string "codCategorie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "corporateName"
    t.string "fantasyName"
    t.string "name"
    t.string "phone"
    t.string "cnpj"
    t.string "email"
    t.string "codeClient"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "quantity"
    t.string "unity"
    t.decimal "price", precision: 5, scale: 2
    t.date "date"
    t.string "productCode"
    t.string "gtin"
    t.string "rfid"
    t.integer "productMin"
    t.integer "productMax"
    t.decimal "salePrice", precision: 5, scale: 2
    t.decimal "saleCost", precision: 5, scale: 2
    t.string "avaliable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "categorie_id"
    t.index ["categorie_id"], name: "index_products_on_categorie_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "corporateName"
    t.string "fantasyName"
    t.string "phone"
    t.string "cnpj"
    t.string "stateRegistration"
    t.string "email"
    t.string "business"
    t.string "codeProvider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_providers_on_address_id"
  end

  create_table "sells", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2
    t.decimal "totsell", precision: 5, scale: 2
    t.integer "quantity"
    t.string "nameProduct"
    t.date "dataSell"
    t.float "discount"
    t.string "measurement"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id", null: false
    t.bigint "client_id", null: false
    t.bigint "tax_id", null: false
    t.index ["client_id"], name: "index_sells_on_client_id"
    t.index ["product_id"], name: "index_sells_on_product_id"
    t.index ["tax_id"], name: "index_sells_on_tax_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.decimal "shipping", precision: 5, scale: 2
    t.decimal "costAdd", precision: 5, scale: 2
    t.decimal "ipi", precision: 5, scale: 2
    t.decimal "icms", precision: 5, scale: 2
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "buy", precision: 5, scale: 2
    t.decimal "sell", precision: 5, scale: 2
    t.decimal "total", precision: 5, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sell_id", null: false
    t.bigint "buy_id", null: false
    t.index ["buy_id"], name: "index_wallets_on_buy_id"
    t.index ["sell_id"], name: "index_wallets_on_sell_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bluetoohsearches", "products"
  add_foreign_key "buys", "providers"
  add_foreign_key "buys", "taxes"
  add_foreign_key "clients", "addresses"
  add_foreign_key "products", "categories", column: "categorie_id"
  add_foreign_key "providers", "addresses"
  add_foreign_key "sells", "clients"
  add_foreign_key "sells", "products"
  add_foreign_key "sells", "taxes"
  add_foreign_key "wallets", "buys"
  add_foreign_key "wallets", "sells"
end
