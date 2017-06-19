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

ActiveRecord::Schema.define(version: 20170614203037) do

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
    t.integer  "dex"
    t.integer  "con"
    t.integer  "int"
    t.integer  "wis"
    t.integer  "cha"
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

end
