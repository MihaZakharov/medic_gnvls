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

ActiveRecord::Schema.define(version: 20171114151721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gnvls", force: :cascade do |t|
    t.string   "mnn"
    t.string   "name"
    t.string   "lekform"
    t.string   "owner"
    t.string   "qntpack"
    t.decimal  "prc_wo_nds"
    t.decimal  "prc_first_pack"
    t.text     "n_py"
    t.string   "date_reg"
    t.string   "ean13"
    t.string   "atx"
    t.string   "level_nac_opt"
    t.decimal  "pred_opt_price"
    t.string   "level_nac_rozn"
    t.decimal  "pred_rozn_price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
