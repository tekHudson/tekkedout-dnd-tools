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

ActiveRecord::Schema.define(version: 20170629192510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "combat_trackers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combatants", force: :cascade do |t|
    t.integer  "combat_tracker_id"
    t.string   "name",              null: false
    t.integer  "init"
    t.integer  "max_hp"
    t.integer  "hp"
    t.integer  "ac"
    t.integer  "dc"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["combat_tracker_id"], name: "index_combatants_on_combat_tracker_id", using: :btree
  end

  create_table "creatures", force: :cascade do |t|
    t.string   "name",                              null: false
    t.string   "species",                           null: false
    t.string   "size",                              null: false
    t.string   "alignment",                         null: false
    t.integer  "ac",                                null: false
    t.integer  "hp",                                null: false
    t.string   "speed",                default: [],              array: true
    t.integer  "str"
    t.integer  "str_mod"
    t.integer  "dex"
    t.integer  "dex_mod"
    t.integer  "con"
    t.integer  "con_mod"
    t.integer  "int"
    t.integer  "int_mod"
    t.integer  "wis"
    t.integer  "wis_mod"
    t.integer  "cha"
    t.integer  "cha_mod"
    t.string   "saving_throws",        default: [],              array: true
    t.string   "skills",               default: [],              array: true
    t.string   "damage_immunities",    default: [],              array: true
    t.string   "damage_resistance",    default: [],              array: true
    t.string   "condition_immunities", default: [],              array: true
    t.string   "senses",               default: [],              array: true
    t.string   "languages",            default: [],              array: true
    t.string   "chalange",                          null: false
    t.integer  "xp",                                null: false
    t.string   "book",                              null: false
    t.integer  "page",                              null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "spells", force: :cascade do |t|
    t.integer  "level"
    t.string   "name"
    t.string   "sub_klass",    default: [],              array: true
    t.string   "casting_time"
    t.string   "range"
    t.string   "components"
    t.string   "duration"
    t.string   "description"
    t.string   "klass",        default: [],              array: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
