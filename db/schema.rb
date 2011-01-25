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

ActiveRecord::Schema.define(:version => 20101006030057) do

  create_table "boats", :force => true do |t|
    t.integer  "bow"
    t.integer  "fleet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boats", ["fleet_id"], :name => "index_boats_on_fleet_id"

  create_table "entries", :force => true do |t|
    t.integer  "team_id"
    t.integer  "race_id"
    t.integer  "fleet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["fleet_id"], :name => "index_entries_on_fleet_id"
  add_index "entries", ["race_id"], :name => "index_entries_on_race_id"
  add_index "entries", ["team_id"], :name => "index_entries_on_team_id"

  create_table "finishes", :force => true do |t|
    t.integer  "position"
    t.integer  "race_id"
    t.integer  "boat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finishes", ["boat_id"], :name => "index_finishes_on_boat_id"
  add_index "finishes", ["position"], :name => "index_finishes_on_position"
  add_index "finishes", ["race_id"], :name => "index_finishes_on_race_id"

  create_table "fleets", :force => true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "players", ["team_id"], :name => "index_players_on_team_id"

  create_table "races", :force => true do |t|
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rotation_id"
    t.integer  "home_penalty", :default => 0
    t.integer  "away_penalty", :default => 0
  end

  add_index "races", ["rotation_id"], :name => "index_races_on_rotation_id"

  create_table "rotations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participation_value"
    t.text     "teams"
    t.text     "fleets"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.boolean  "ghost",                :default => false
    t.integer  "tie_break_points",     :default => 0
    t.integer  "repechage_percentage", :default => 0
  end

  add_index "teams", ["name"], :name => "index_teams_on_name"

end
