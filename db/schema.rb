# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_191_203_093_500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'cities', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'coach_specialties', force: :cascade do |t|
    t.bigint 'coach_id'
    t.bigint 'specialty_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['coach_id'], name: 'index_coach_specialties_on_coach_id'
    t.index ['specialty_id'], name: 'index_coach_specialties_on_specialty_id'
  end

  create_table 'coaches', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.integer 'siret'
    t.string 'phone_number'
    t.string 'address'
    t.string 'zip_code'
    t.integer 'price', default: 30
    t.string 'account_number'
    t.string 'account_name'
    t.boolean 'reviewed', default: false
    t.bigint 'city_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['city_id'], name: 'index_coaches_on_city_id'
  end

  create_table 'data', force: :cascade do |t|
    t.integer 'height'
    t.float 'weight'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_data_on_user_id'
  end

  create_table 'objectives', force: :cascade do |t|
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'seances', force: :cascade do |t|
    t.bigint 'coach_id'
    t.bigint 'user_id'
    t.datetime 'start_date'
    t.integer 'duration'
    t.string 'place'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['coach_id'], name: 'index_seances_on_coach_id'
    t.index ['user_id'], name: 'index_seances_on_user_id'
  end

  create_table 'specialties', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.datetime 'birth_date'
    t.string 'phone_number'
    t.string 'address'
    t.string 'zip_code'
    t.text 'description'
    t.boolean 'is_admin', default: false
    t.bigint 'city_id'
    t.bigint 'objective_id'
    t.string 'facebook_id'
    t.string 'google_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['city_id'], name: 'index_users_on_city_id'
    t.index ['objective_id'], name: 'index_users_on_objective_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
end
