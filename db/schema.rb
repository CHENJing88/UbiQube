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

ActiveRecord::Schema.define(version: 20150610145813) do

  create_table "apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_droits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "droit_catalogdroits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "droits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etape_apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etat_apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupe_apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupe_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_droits", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_in_apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_out_apps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_app_roles", force: true do |t|
    t.integer "user_id"
    t.integer "app_id"
    t.integer "role_id"
  end

  add_index "user_app_roles", ["app_id"], name: "index_user_app_roles_on_app_id"
  add_index "user_app_roles", ["user_id"], name: "index_user_app_roles_on_user_id"

  create_table "user_groupe_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vm_install_service_ins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
