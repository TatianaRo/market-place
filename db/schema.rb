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

ActiveRecord::Schema.define(version: 2020_09_10_153731) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "price"
    t.integer "status"
    t.integer "product_category_id", null: false
    t.integer "company_employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_employee_id"], name: "index_ads_on_company_employee_id"
    t.index ["product_category_id"], name: "index_ads_on_product_category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.text "body"
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "legal_name"
    t.string "cnpj"
    t.string "address"
    t.string "social_media"
    t.string "domain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_employees", force: :cascade do |t|
    t.string "full_name"
    t.date "date_of_birth"
    t.string "position"
    t.string "departament"
    t.string "cpf"
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_employees_on_company_id"
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sale_id", null: false
    t.integer "history_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_id"], name: "index_histories_on_sale_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "buyer_id", null: false
    t.integer "ad_id", null: false
    t.integer "status"
    t.decimal "final_price"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_sales_on_ad_id"
    t.index ["buyer_id"], name: "index_sales_on_buyer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_employee_id"
    t.index ["company_employee_id"], name: "index_users_on_company_employee_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ads", "company_employees"
  add_foreign_key "ads", "product_categories"
  add_foreign_key "comments", "users"
  add_foreign_key "company_employees", "companies"
  add_foreign_key "histories", "sales"
  add_foreign_key "histories", "users"
  add_foreign_key "sales", "ads"
  add_foreign_key "sales", "users", column: "buyer_id"
  add_foreign_key "users", "company_employees"
end
