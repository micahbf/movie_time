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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140714025105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aka_name", force: true do |t|
    t.integer  "person_id",                null: false
    t.text     "name",                     null: false
    t.string   "imdb_index",    limit: 12
    t.string   "name_pcode_cf", limit: 5
    t.string   "name_pcode_nf", limit: 5
    t.string   "surname_pcode", limit: 5
    t.string   "md5sum",        limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aka_name", ["md5sum"], name: "aka_name_idx_md5", using: :btree
  add_index "aka_name", ["name_pcode_cf"], name: "aka_name_idx_pcodecf", using: :btree
  add_index "aka_name", ["name_pcode_nf"], name: "aka_name_idx_pcodenf", using: :btree
  add_index "aka_name", ["person_id"], name: "aka_name_idx_person", using: :btree
  add_index "aka_name", ["surname_pcode"], name: "aka_name_idx_pcode", using: :btree

  create_table "aka_title", force: true do |t|
    t.integer  "movie_id",                   null: false
    t.text     "title",                      null: false
    t.string   "imdb_index",      limit: 12
    t.integer  "kind_id",                    null: false
    t.integer  "production_year"
    t.string   "phonetic_code",   limit: 5
    t.integer  "episode_of_id"
    t.integer  "season_nr"
    t.integer  "episode_nr"
    t.text     "note"
    t.string   "md5sum",          limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aka_title", ["episode_of_id"], name: "aka_title_idx_epof", using: :btree
  add_index "aka_title", ["md5sum"], name: "aka_title_idx_md5", using: :btree
  add_index "aka_title", ["movie_id"], name: "aka_title_idx_movieid", using: :btree
  add_index "aka_title", ["phonetic_code"], name: "aka_title_idx_pcode", using: :btree

  create_table "cast_info", force: true do |t|
    t.integer  "person_id",      null: false
    t.integer  "movie_id",       null: false
    t.integer  "person_role_id"
    t.text     "note"
    t.integer  "nr_order"
    t.integer  "role",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cast_info", ["movie_id"], name: "cast_info_idx_mid", using: :btree
  add_index "cast_info", ["person_id"], name: "cast_info_idx_pid", using: :btree
  add_index "cast_info", ["person_role_id"], name: "cast_info_idx_cid", using: :btree

  create_table "char_name", force: true do |t|
    t.text     "name",                     null: false
    t.string   "imdb_index",    limit: 12
    t.integer  "imdb_id"
    t.string   "name_pcode_nf", limit: 5
    t.string   "surname_pcode", limit: 5
    t.string   "md5sum",        limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "char_name", ["md5sum"], name: "char_name_idx_md5", using: :btree
  add_index "char_name", ["name"], name: "char_name_idx_name", using: :btree
  add_index "char_name", ["name_pcode_nf"], name: "char_name_idx_pcodenf", using: :btree
  add_index "char_name", ["surname_pcode"], name: "char_name_idx_pcode", using: :btree

  create_table "comp_cast_type", force: true do |t|
    t.string   "kind",       limit: 32, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comp_cast_type", ["kind"], name: "comp_cast_type_kind_key", unique: true, using: :btree

  create_table "company_name", force: true do |t|
    t.text     "name",                     null: false
    t.string   "country_code"
    t.integer  "imdb_id"
    t.string   "name_pcode_nf", limit: 5
    t.string   "name_pcode_sf", limit: 5
    t.string   "md5sum",        limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_name", ["md5sum"], name: "company_name_idx_md5", using: :btree
  add_index "company_name", ["name"], name: "company_name_idx_name", using: :btree
  add_index "company_name", ["name_pcode_nf"], name: "company_name_idx_pcodenf", using: :btree
  add_index "company_name", ["name_pcode_sf"], name: "company_name_idx_pcodesf", using: :btree

  create_table "company_type", force: true do |t|
    t.string   "kind",       limit: 32, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_type", ["kind"], name: "company_type_kind_key", unique: true, using: :btree

  create_table "complete_cast", force: true do |t|
    t.integer  "movie_id"
    t.integer  "subject_id", null: false
    t.integer  "status_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "complete_cast", ["movie_id"], name: "complete_cast_idx_mid", using: :btree

  create_table "info_type", force: true do |t|
    t.string   "info",       limit: 32, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "info_type", ["info"], name: "info_type_info_key", unique: true, using: :btree

  create_table "keyword", force: true do |t|
    t.text     "keyword",                 null: false
    t.string   "phonetic_code", limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keyword", ["keyword"], name: "keyword_idx_keyword", using: :btree
  add_index "keyword", ["phonetic_code"], name: "keyword_idx_pcode", using: :btree

  create_table "kind_type", force: true do |t|
    t.string   "kind",       limit: 15, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kind_type", ["kind"], name: "kind_type_kind_key", unique: true, using: :btree

  create_table "link_type", force: true do |t|
    t.string   "link",       limit: 32, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_type", ["link"], name: "link_type_link_key", unique: true, using: :btree

  create_table "movie_companies", force: true do |t|
    t.integer  "movie_id",        null: false
    t.integer  "company_id",      null: false
    t.integer  "company_type_id", null: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_companies", ["company_id"], name: "movie_companies_idx_cid", using: :btree
  add_index "movie_companies", ["movie_id"], name: "movie_companies_idx_mid", using: :btree

  create_table "movie_info", force: true do |t|
    t.integer  "movie_id",     null: false
    t.integer  "info_type_id", null: false
    t.text     "info",         null: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_info", ["movie_id"], name: "movie_info_idx_mid", using: :btree

  create_table "movie_info_idx", force: true do |t|
    t.integer  "movie_id",     null: false
    t.integer  "info_type_id", null: false
    t.text     "info",         null: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_info_idx", ["info"], name: "movie_info_idx_idx_info", using: :btree
  add_index "movie_info_idx", ["info_type_id"], name: "movie_info_idx_idx_infotypeid", using: :btree
  add_index "movie_info_idx", ["movie_id"], name: "movie_info_idx_idx_mid", using: :btree

  create_table "movie_link", force: true do |t|
    t.integer  "movie_id",        null: false
    t.integer  "linked_movie_id", null: false
    t.integer  "link_type_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movie_link", ["movie_id"], name: "movie_link_idx_mid", using: :btree

  create_table "person", force: true do |t|
    t.text     "name",                     null: false
    t.string   "imdb_index",    limit: 12
    t.integer  "imdb_id"
    t.string   "gender",        limit: 1
    t.string   "name_pcode_cf", limit: 5
    t.string   "name_pcode_nf", limit: 5
    t.string   "surname_pcode", limit: 5
    t.string   "md5sum",        limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person", ["imdb_id"], name: "name_idx_imdb_id", using: :btree
  add_index "person", ["md5sum"], name: "name_idx_md5", using: :btree
  add_index "person", ["name"], name: "name_idx_name", using: :btree
  add_index "person", ["name_pcode_cf"], name: "name_idx_pcodecf", using: :btree
  add_index "person", ["name_pcode_nf"], name: "name_idx_pcodenf", using: :btree
  add_index "person", ["surname_pcode"], name: "name_idx_pcode", using: :btree

  create_table "person_info", force: true do |t|
    t.integer  "person_id",    null: false
    t.integer  "info_type_id", null: false
    t.text     "info",         null: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_info", ["person_id"], name: "person_info_idx_pid", using: :btree

  create_table "role_type", force: true do |t|
    t.string   "role",       limit: 32, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_type", ["role"], name: "role_type_role_key", unique: true, using: :btree

  create_table "title", force: true do |t|
    t.text     "title",                      null: false
    t.string   "imdb_index",      limit: 12
    t.integer  "kind_id",                    null: false
    t.integer  "production_year"
    t.integer  "imdb_id"
    t.string   "phonetic_code",   limit: 5
    t.integer  "episode_of_id"
    t.integer  "season_nr"
    t.integer  "episode_nr"
    t.string   "series_years",    limit: 49
    t.string   "md5sum",          limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "title", ["episode_nr"], name: "title_idx_episode_nr", using: :btree
  add_index "title", ["episode_of_id"], name: "title_idx_epof", using: :btree
  add_index "title", ["imdb_id"], name: "title_idx_imdb_id", using: :btree
  add_index "title", ["md5sum"], name: "title_idx_md5", using: :btree
  add_index "title", ["phonetic_code"], name: "title_idx_pcode", using: :btree
  add_index "title", ["season_nr"], name: "title_idx_season_nr", using: :btree
  add_index "title", ["title"], name: "title_idx_title", using: :btree

  create_table "title_keyword", force: true do |t|
    t.integer  "movie_id",   null: false
    t.integer  "keyword_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "title_keyword", ["keyword_id"], name: "movie_keyword_idx_keywordid", using: :btree
  add_index "title_keyword", ["movie_id"], name: "movie_keyword_idx_mid", using: :btree

end
