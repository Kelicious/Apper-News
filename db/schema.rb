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

ActiveRecord::Schema.define(:version => 20130514135014) do

  create_table "comment_ancestries", :force => true do |t|
    t.integer  "ancestor_id"
    t.integer  "descendent_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comment_ancestries", ["ancestor_id"], :name => "index_comment_ancestries_on_ancestor_id"
  add_index "comment_ancestries", ["descendent_id"], :name => "index_comment_ancestries_on_descendent_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "story_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["parent_id"], :name => "index_comments_on_parent_id"
  add_index "comments", ["story_id"], :name => "index_comments_on_story_id"

  create_table "emails", :force => true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "stories", :force => true do |t|
    t.integer  "author_id"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stories", ["author_id"], :name => "index_stories_on_author_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["story_id"], :name => "index_votes_on_story_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
