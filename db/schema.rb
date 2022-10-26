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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_193223) do
  create_table "applications", force: :cascade do |t|
    t.integer "relationship_id", null: false
    t.integer "applicant_id", null: false
    t.string "description"
    t.boolean "isRejected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_applications_on_applicant_id"
    t.index ["relationship_id"], name: "index_applications_on_relationship_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentees", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "description"
    t.integer "phone_number"
    t.integer "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["community_id"], name: "index_mentees_on_community_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "description"
    t.integer "phone_number"
    t.integer "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["community_id"], name: "index_mentors_on_community_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "mentor_id", null: false
    t.integer "topic_id", null: false
    t.integer "community_id", null: false
    t.string "description"
    t.boolean "isEstablished"
    t.integer "mentee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_relationships_on_community_id"
    t.index ["mentee_id"], name: "index_relationships_on_mentee_id"
    t.index ["mentor_id"], name: "index_relationships_on_mentor_id"
    t.index ["topic_id"], name: "index_relationships_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_topics_on_community_id"
  end

  add_foreign_key "applications", "applicants"
  add_foreign_key "applications", "relationships"
  add_foreign_key "mentees", "communities"
  add_foreign_key "mentors", "communities"
  add_foreign_key "relationships", "communities"
  add_foreign_key "relationships", "mentees"
  add_foreign_key "relationships", "mentors"
  add_foreign_key "relationships", "topics"
  add_foreign_key "topics", "communities"
end
