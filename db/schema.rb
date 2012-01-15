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

ActiveRecord::Schema.define(:version => 20120103094950) do

  create_table "boards", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "post_counter"
    t.integer  "node_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "head"
    t.text     "body"
    t.string   "picture"
    t.integer  "number"
    t.string   "formated_date"
    t.integer  "node_id"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", :force => true do |t|
    t.string   "head"
    t.text     "body"
    t.string   "picture"
    t.integer  "number"
    t.integer  "parent"
    t.string   "formated_date"
    t.integer  "comment_id"
    t.integer  "board_id"
    t.datetime "last_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
