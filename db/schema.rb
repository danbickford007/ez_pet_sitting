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

ActiveRecord::Schema.define(:version => 20130508232337) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "special_instructions"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "city"
    t.integer  "appointment_id"
  end

  create_table "appointments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "animal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "time"
    t.integer  "pet_id"
    t.integer  "address_id"
  end

  create_table "emails", :force => true do |t|
    t.string   "subject"
    t.binary   "content"
    t.integer  "to_user"
    t.integer  "from_user"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pets", :force => true do |t|
    t.string   "breed"
    t.integer  "amount"
    t.binary   "special_instructions"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "name"
    t.integer  "appointment_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "passcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

end
