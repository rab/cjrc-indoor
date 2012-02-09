# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120209061644) do

  create_table "entries", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "score"
    t.string   "affiliation"
    t.integer  "event_id"
    t.boolean  "lightweight",       :default => false, :null => false
    t.integer  "age"
    t.date     "dob"
    t.string   "responsible_party"
    t.boolean  "waiver",            :default => false, :null => false
    t.datetime "registered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["event_id"], :name => "index_entries_on_event_id"

  create_table "events", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
