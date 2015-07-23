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

ActiveRecord::Schema.define(version: 20150708151858) do

  create_table "applications", force: true do |t|
    t.string   "nom"
    t.float    "version",    limit: 24
    t.string   "uid_admin"
    t.integer  "etat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "nom"
    t.string   "niveau"
    t.string   "description"
    t.integer  "etat_app_id"
    t.integer  "etape_app_id"
    t.integer  "groupe_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_droits", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_services", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "droit_catalogdroits", force: true do |t|
    t.integer  "role_id"
    t.integer  "catalogdroit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "droit_catalogdroits", ["role_id", "catalogdroit_id"], name: "index_droit_catalogdroits_on_role_id_and_catalogdroit_id", unique: true, using: :btree

  create_table "droits", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etape_apps", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etat_apps", force: true do |t|
    t.string   "nom"
    t.integer  "etat_collection_id"
    t.string   "etat_collection_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupe_apps", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupe_users", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ips", force: true do |t|
    t.integer  "ip_addr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reseau_services", force: true do |t|
    t.integer  "reseau_id"
    t.integer  "service_in_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reseau_services", ["reseau_id", "service_in_app_id"], name: "index_reseau_services_on_reseau_id_and_service_in_app_id", unique: true, using: :btree

  create_table "reseaus", force: true do |t|
    t.string   "nom"
    t.integer  "ip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_droits", force: true do |t|
    t.integer  "role_id"
    t.integer  "droit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_droits", ["droit_id"], name: "index_role_droits_on_droit_id", using: :btree
  add_index "role_droits", ["role_id", "droit_id"], name: "index_role_droits_on_role_id_and_droit_id", unique: true, using: :btree
  add_index "role_droits", ["role_id"], name: "index_role_droits_on_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_catalogservices", force: true do |t|
    t.integer  "serv_id"
    t.integer  "catalogserv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_catalogservices", ["serv_id", "catalogserv_id"], name: "index_service_catalogservices_on_serv_id_and_catalogserv_id", unique: true, using: :btree

  create_table "service_in_apps", force: true do |t|
    t.integer  "app_id"
    t.integer  "service_id"
    t.integer  "port"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_in_apps", ["app_id", "service_id"], name: "index_service_in_apps_on_app_id_and_service_id", unique: true, using: :btree

  create_table "service_out_apps", force: true do |t|
    t.integer  "app_id"
    t.integer  "service_in_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_out_apps", ["app_id", "service_in_app_id"], name: "index_service_out_apps_on_app_id_and_service_in_app_id", unique: true, using: :btree

  create_table "services", force: true do |t|
    t.string   "nom"
    t.integer  "port_defaut"
    t.string   "protocole"
    t.boolean  "install_defaut"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_app_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_app_roles", ["user_id", "app_id", "role_id"], name: "index_user_app_roles_on_user_id_and_app_id_and_role_id", unique: true, using: :btree

  create_table "user_groupe_users", force: true do |t|
    t.integer  "groupe_user_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groupe_users", ["groupe_user_id"], name: "index_user_groupe_users_on_groupe_user_id", using: :btree
  add_index "user_groupe_users", ["user_id", "groupe_user_id"], name: "index_user_groupe_users_on_user_id_and_groupe_user_id", unique: true, using: :btree
  add_index "user_groupe_users", ["user_id"], name: "index_user_groupe_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vm_install_service_ins", force: true do |t|
    t.integer  "service_in_app_id"
    t.integer  "vm_id"
    t.integer  "ip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vm_install_service_ins", ["service_in_app_id", "vm_id"], name: "index_vm_install_service_ins_on_service_in_app_id_and_vm_id", unique: true, using: :btree

  create_table "vms", force: true do |t|
    t.string   "nom"
    t.integer  "ip_defaut"
    t.string   "template"
    t.integer  "etat_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
