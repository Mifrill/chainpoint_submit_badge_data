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

ActiveRecord::Schema.define(version: 2021_08_15_191451) do

  create_table "badges", force: :cascade do |t|
    t.integer "recipient_id", null: false
    t.string "uuid", null: false
    t.string "sha_256", null: false
    t.string "proof_id", null: false
    t.date "issue_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proof_id"], name: "index_badges_on_proof_id", unique: true
    t.index ["recipient_id"], name: "index_badges_on_recipient_id"
    t.index ["sha_256"], name: "index_badges_on_sha_256", unique: true
    t.index ["uuid"], name: "index_badges_on_uuid", unique: true
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "badges", "recipients"
end
