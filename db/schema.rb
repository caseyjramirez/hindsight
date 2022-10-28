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

ActiveRecord::Schema[7.0].define(version: 2022_10_28_221117) do
  create_table "applications", force: :cascade do |t|
    t.integer "posting_id", null: false
    t.integer "user_id", null: false
    t.string "description"
    t.boolean "isRejected"
    t.boolean "isAccepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posting_id"], name: "index_applications_on_posting_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string "mentee"
    t.integer "topic_id", null: false
    t.integer "community_id", null: false
    t.string "desciption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_mentors_on_community_id"
    t.index ["topic_id"], name: "index_mentors_on_topic_id"
  end

  create_table "postings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "topic_id", null: false
    t.integer "community_id", null: false
    t.string "description"
    t.boolean "isFilled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_postings_on_community_id"
    t.index ["topic_id"], name: "index_postings_on_topic_id"
    t.index ["user_id"], name: "index_postings_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "mentor_id"
    t.integer "mentee_id"
    t.integer "topic_id", null: false
    t.integer "community_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_relationships_on_community_id"
    t.index ["mentee_id"], name: "index_relationships_on_mentee_id"
    t.index ["mentor_id"], name: "index_relationships_on_mentor_id"
    t.index ["topic_id"], name: "index_relationships_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "description"
    t.integer "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["community_id"], name: "index_topics_on_community_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_type_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "email"
    t.integer "phone_number"
    t.string "description"
    t.integer "community_id", null: false
    t.string "password_digest"
    t.string "profile_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_users_on_community_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "applications", "postings"
  add_foreign_key "applications", "users"
  add_foreign_key "mentors", "communities"
  add_foreign_key "mentors", "topics"
  add_foreign_key "postings", "communities"
  add_foreign_key "postings", "topics"
  add_foreign_key "postings", "users"
  add_foreign_key "relationships", "communities"
  add_foreign_key "relationships", "topics"
  add_foreign_key "relationships", "users", column: "mentee_id"
  add_foreign_key "relationships", "users", column: "mentor_id"
  add_foreign_key "topics", "communities"
  add_foreign_key "users", "communities"
  add_foreign_key "users", "user_types"
end
