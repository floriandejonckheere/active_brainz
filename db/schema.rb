# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "plpgsql"

  create_table "alternative_medium", id: :serial, force: :cascade do |t|
    t.integer "medium", null: false
    t.integer "alternative_release", null: false
    t.string "name"
    t.index ["alternative_release"], name: "alternative_medium_idx_alternative_release"
  end

  create_table "alternative_medium_track", primary_key: %w(alternative_medium track), force: :cascade do |t|
    t.integer "alternative_medium", null: false
    t.integer "track", null: false
    t.integer "alternative_track", null: false
  end

  create_table "alternative_release", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.integer "release", null: false
    t.string "name"
    t.integer "artist_credit"
    t.integer "type", null: false
    t.integer "language", null: false
    t.integer "script", null: false
    t.string "comment", limit: 255, default: "", null: false
    t.index ["artist_credit"], name: "alternative_release_idx_artist_credit"
    t.index ["gid"], name: "alternative_release_idx_gid", unique: true
    t.index %w(language script), name: "alternative_release_idx_language_script"
    t.index ["name"], name: "alternative_release_idx_name"
    t.index ["release"], name: "alternative_release_idx_release"
  end

  create_table "alternative_release_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
  end

  create_table "alternative_track", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "artist_credit"
    t.integer "ref_count", default: 0, null: false
    t.index ["artist_credit"], name: "alternative_track_idx_artist_credit"
    t.index ["name"], name: "alternative_track_idx_name"
  end

  create_table "annotation", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.text "text"
    t.string "changelog", limit: 255
    t.datetime "created", default: -> { "now()" }
  end

  create_table "application", id: :serial, force: :cascade do |t|
    t.integer "owner", null: false
    t.text "name", null: false
    t.text "oauth_id", null: false
    t.text "oauth_secret", null: false
    t.text "oauth_redirect_uri"
    t.index ["oauth_id"], name: "application_idx_oauth_id", unique: true
    t.index ["owner"], name: "application_idx_owner"
  end

  create_table "area", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "type"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "ended", default: false, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.index ["gid"], name: "area_idx_gid", unique: true
    t.index ["name"], name: "area_idx_name"
  end

  create_table "area_alias", id: :serial, force: :cascade do |t|
    t.integer "area", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(area locale), name: "area_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["area"], name: "area_alias_idx_area"
  end

  create_table "area_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "area_alias_type_idx_gid", unique: true
  end

  create_table "area_annotation", primary_key: %w(area annotation), force: :cascade do |t|
    t.integer "area", null: false
    t.integer "annotation", null: false
  end

  create_table "area_attribute", id: :serial, force: :cascade do |t|
    t.integer "area", null: false
    t.integer "area_attribute_type", null: false
    t.integer "area_attribute_type_allowed_value"
    t.text "area_attribute_text"
    t.index ["area"], name: "area_attribute_idx_area"
  end

  create_table "area_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "area_attribute_type_idx_gid", unique: true
  end

  create_table "area_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "area_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["area_attribute_type"], name: "area_attribute_type_allowed_value_idx_name"
    t.index ["gid"], name: "area_attribute_type_allowed_value_idx_gid", unique: true
  end

  create_table "area_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "area_gid_redirect_idx_new_id"
  end

  create_table "area_tag", primary_key: %w(area tag), force: :cascade do |t|
    t.integer "area", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "area_tag_idx_tag"
  end

  create_table "area_tag_raw", primary_key: %w(area editor tag), force: :cascade do |t|
    t.integer "area", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["area"], name: "area_tag_raw_idx_area"
    t.index ["editor"], name: "area_tag_raw_idx_editor"
    t.index ["tag"], name: "area_tag_raw_idx_tag"
  end

  create_table "area_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "area_type_idx_gid", unique: true
  end

  create_table "artist", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.integer "type"
    t.integer "area"
    t.integer "gender"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "ended", default: false, null: false
    t.integer "begin_area"
    t.integer "end_area"
    t.index "lower((name)::text)", name: "artist_idx_lower_name"
    t.index ["area"], name: "artist_idx_area"
    t.index ["begin_area"], name: "artist_idx_begin_area"
    t.index ["end_area"], name: "artist_idx_end_area"
    t.index ["gid"], name: "artist_idx_gid", unique: true
    t.index %w(name comment), name: "artist_idx_uniq_name_comment", unique: true, where: "(comment IS NOT NULL)"
    t.index ["name"], name: "artist_idx_name"
    t.index ["name"], name: "artist_idx_null_comment", unique: true, where: "(comment IS NULL)"
    t.index ["sort_name"], name: "artist_idx_sort_name"
  end

  create_table "artist_alias", id: :serial, force: :cascade do |t|
    t.integer "artist", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(artist locale), name: "artist_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["artist"], name: "artist_alias_idx_artist"
  end

  create_table "artist_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "artist_alias_type_idx_gid", unique: true
  end

  create_table "artist_annotation", primary_key: %w(artist annotation), force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "annotation", null: false
  end

  create_table "artist_attribute", id: :serial, force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "artist_attribute_type", null: false
    t.integer "artist_attribute_type_allowed_value"
    t.text "artist_attribute_text"
    t.index ["artist"], name: "artist_attribute_idx_artist"
  end

  create_table "artist_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "artist_attribute_type_idx_gid", unique: true
  end

  create_table "artist_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "artist_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["artist_attribute_type"], name: "artist_attribute_type_allowed_value_idx_name"
    t.index ["gid"], name: "artist_attribute_type_allowed_value_idx_gid", unique: true
  end

  create_table "artist_credit", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "artist_count", limit: 2, null: false
    t.integer "ref_count", default: 0
    t.datetime "created", default: -> { "now()" }
    t.integer "edits_pending", default: 0, null: false
  end

  create_table "artist_credit_name", primary_key: %w(artist_credit position), force: :cascade do |t|
    t.integer "artist_credit", null: false
    t.integer "position", limit: 2, null: false
    t.integer "artist", null: false
    t.string "name", null: false
    t.text "join_phrase", default: "", null: false
    t.index ["artist"], name: "artist_credit_name_idx_artist"
  end

  create_table "artist_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "artist_gid_redirect_idx_new_id"
  end

  create_table "artist_ipi", primary_key: %w(artist ipi), force: :cascade do |t|
    t.integer "artist", null: false
    t.string "ipi", limit: 11, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "artist_isni", primary_key: %w(artist isni), force: :cascade do |t|
    t.integer "artist", null: false
    t.string "isni", limit: 16, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "artist_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
  end

  create_table "artist_rating_raw", primary_key: %w(artist editor), force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["artist"], name: "artist_rating_raw_idx_artist"
    t.index ["editor"], name: "artist_rating_raw_idx_editor"
  end

  create_table "artist_tag", primary_key: %w(artist tag), force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "artist_tag_idx_tag"
  end

  create_table "artist_tag_raw", primary_key: %w(artist editor tag), force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "artist_tag_raw_idx_editor"
    t.index ["tag"], name: "artist_tag_raw_idx_tag"
  end

  create_table "artist_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "artist_type_idx_gid", unique: true
  end

  create_table "autoeditor_election", id: :serial, force: :cascade do |t|
    t.integer "candidate", null: false
    t.integer "proposer", null: false
    t.integer "seconder_1"
    t.integer "seconder_2"
    t.integer "status", default: 1, null: false
    t.integer "yes_votes", default: 0, null: false
    t.integer "no_votes", default: 0, null: false
    t.datetime "propose_time", default: -> { "now()" }, null: false
    t.datetime "open_time"
    t.datetime "close_time"
  end

  create_table "autoeditor_election_vote", id: :serial, force: :cascade do |t|
    t.integer "autoeditor_election", null: false
    t.integer "voter", null: false
    t.integer "vote", null: false
    t.datetime "vote_time", default: -> { "now()" }, null: false
  end

  create_table "cdtoc", id: :serial, force: :cascade do |t|
    t.string "discid", limit: 28, null: false
    t.string "freedb_id", limit: 8, null: false
    t.integer "track_count", null: false
    t.integer "leadout_offset", null: false
    t.integer "track_offset", null: false, array: true
    t.boolean "degraded", default: false, null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["discid"], name: "cdtoc_idx_discid", unique: true
    t.index ["freedb_id"], name: "cdtoc_idx_freedb_id"
  end

  create_table "cdtoc_raw", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.string "discid", limit: 28, null: false
    t.integer "track_count", null: false
    t.integer "leadout_offset", null: false
    t.integer "track_offset", null: false, array: true
    t.index ["discid"], name: "cdtoc_raw_discid"
    t.index %w(track_count leadout_offset track_offset), name: "cdtoc_raw_toc", unique: true
    t.index ["track_offset"], name: "cdtoc_raw_track_offset"
  end

  create_table "country_area", primary_key: "area", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "deleted_entity", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.jsonb "data", null: false
    t.datetime "deleted_at", default: -> { "now()" }, null: false
  end

  create_table "edit", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "type", limit: 2, null: false
    t.integer "status", limit: 2, null: false
    t.integer "autoedit", limit: 2, default: 0, null: false
    t.datetime "open_time", default: -> { "now()" }
    t.datetime "close_time"
    t.datetime "expire_time", null: false
    t.integer "language"
    t.integer "quality", limit: 2, default: 1, null: false
    t.index ["close_time"], name: "edit_idx_close_time", using: :brin
    t.index %w(editor id), name: "edit_idx_editor_id_desc", order: { id: :desc }
    t.index %w(editor open_time), name: "edit_idx_editor_open_time"
    t.index ["expire_time"], name: "edit_idx_expire_time", using: :brin
    t.index ["open_time"], name: "edit_idx_open_time", using: :brin
    t.index %w(status id), name: "edit_idx_status_id", where: "(status <> 2)"
    t.index %w(type id), name: "edit_idx_type_id"
  end

  create_table "edit_area", primary_key: %w(edit area), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "area", null: false
    t.index ["area"], name: "edit_area_idx"
  end

  create_table "edit_artist", primary_key: %w(edit artist), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "artist", null: false
    t.integer "status", limit: 2, null: false
    t.index ["artist"], name: "edit_artist_idx"
    t.index ["status"], name: "edit_artist_idx_status"
  end

  create_table "edit_data", primary_key: "edit", id: :integer, default: nil, force: :cascade do |t|
    t.jsonb "data", null: false
    t.index "array_remove(ARRAY[((data #>> '{link_type,id}'::text[]))::integer, ((data #>> '{link,link_type,id}'::text[]))::integer, ((data #>> '{old,link_type,id}'::text[]))::integer, ((data #>> '{new,link_type,id}'::text[]))::integer, ((data #>> '{relationship,link_type,id}'::text[]))::integer], NULL::integer)", name: "edit_data_idx_link_type", using: :gin
  end

  create_table "edit_event", primary_key: %w(edit event), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "event", null: false
    t.index ["event"], name: "edit_event_idx"
  end

  create_table "edit_instrument", primary_key: %w(edit instrument), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "instrument", null: false
    t.index ["instrument"], name: "edit_instrument_idx"
  end

  create_table "edit_label", primary_key: %w(edit label), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "label", null: false
    t.integer "status", limit: 2, null: false
    t.index ["label"], name: "edit_label_idx"
    t.index ["status"], name: "edit_label_idx_status"
  end

  create_table "edit_note", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "edit", null: false
    t.text "text", null: false
    t.datetime "post_time", default: -> { "now()" }
    t.index ["edit"], name: "edit_note_idx_edit"
    t.index ["editor"], name: "edit_note_idx_editor"
    t.index %w(post_time edit), name: "edit_note_idx_post_time_edit", order: { post_time: "DESC NULLS LAST", edit: :desc }
    t.index ["post_time"], name: "edit_note_idx_post_time", using: :brin
  end

  create_table "edit_note_recipient", primary_key: %w(recipient edit_note), force: :cascade do |t|
    t.integer "recipient", null: false
    t.integer "edit_note", null: false
    t.index ["recipient"], name: "edit_note_recipient_idx_recipient"
  end

  create_table "edit_place", primary_key: %w(edit place), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "place", null: false
    t.index ["place"], name: "edit_place_idx"
  end

  create_table "edit_recording", primary_key: %w(edit recording), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "recording", null: false
    t.index ["recording"], name: "edit_recording_idx"
  end

  create_table "edit_release", primary_key: %w(edit release), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "release", null: false
    t.index ["release"], name: "edit_release_idx"
  end

  create_table "edit_release_group", primary_key: %w(edit release_group), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "release_group", null: false
    t.index ["release_group"], name: "edit_release_group_idx"
  end

  create_table "edit_series", primary_key: %w(edit series), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "series", null: false
    t.index ["series"], name: "edit_series_idx"
  end

  create_table "edit_url", primary_key: %w(edit url), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "url", null: false
    t.index ["url"], name: "edit_url_idx"
  end

  create_table "edit_work", primary_key: %w(edit work), force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "work", null: false
    t.index ["work"], name: "edit_work_idx"
  end

  create_table "editor", id: :serial, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "privs", default: 0
    t.string "email", limit: 64
    t.string "website", limit: 255
    t.text "bio"
    t.datetime "member_since", default: -> { "now()" }
    t.datetime "email_confirm_date"
    t.datetime "last_login_date", default: -> { "now()" }
    t.datetime "last_updated", default: -> { "now()" }
    t.date "birth_date"
    t.integer "gender"
    t.integer "area"
    t.string "password", limit: 128, null: false
    t.string "ha1", limit: 32, null: false
    t.boolean "deleted", default: false, null: false
    t.index "lower((name)::text)", name: "editor_idx_name", unique: true
  end

  create_table "editor_collection", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.integer "editor", null: false
    t.string "name", null: false
    t.boolean "public", default: false, null: false
    t.text "description", default: "", null: false
    t.integer "type", null: false
    t.index ["editor"], name: "editor_collection_idx_editor"
    t.index ["gid"], name: "editor_collection_idx_gid", unique: true
    t.index ["name"], name: "editor_collection_idx_name"
  end

  create_table "editor_collection_area", primary_key: %w(collection area), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "area", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_artist", primary_key: %w(collection artist), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "artist", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_collaborator", primary_key: %w(collection editor), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "editor", null: false
  end

  create_table "editor_collection_deleted_entity", primary_key: %w(collection gid), force: :cascade do |t|
    t.integer "collection", null: false
    t.uuid "gid", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_event", primary_key: %w(collection event), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "event", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_instrument", primary_key: %w(collection instrument), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "instrument", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_label", primary_key: %w(collection label), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "label", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_place", primary_key: %w(collection place), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "place", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_recording", primary_key: %w(collection recording), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "recording", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_release", primary_key: %w(collection release), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "release", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_release_group", primary_key: %w(collection release_group), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "release_group", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_series", primary_key: %w(collection series), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "series", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  create_table "editor_collection_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "entity_type", limit: 50, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "editor_collection_type_idx_gid", unique: true
  end

  create_table "editor_collection_work", primary_key: %w(collection work), force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "work", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
  end

  # Could not dump table "editor_language" because of following StandardError
  #   Unknown type 'fluency' for column 'fluency'

  create_table "editor_oauth_token", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "application", null: false
    t.text "authorization_code"
    t.text "refresh_token"
    t.text "access_token"
    t.datetime "expire_time", null: false
    t.integer "scope", default: 0, null: false
    t.datetime "granted", default: -> { "now()" }, null: false
    t.index ["access_token"], name: "editor_oauth_token_idx_access_token", unique: true
    t.index ["editor"], name: "editor_oauth_token_idx_editor"
    t.index ["refresh_token"], name: "editor_oauth_token_idx_refresh_token", unique: true
  end

  create_table "editor_preference", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.string "name", limit: 50, null: false
    t.string "value", limit: 100, null: false
    t.index %w(editor name), name: "editor_preference_idx_editor_name", unique: true
  end

  create_table "editor_subscribe_artist", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "artist", null: false
    t.integer "last_edit_sent", null: false
    t.index ["artist"], name: "editor_subscribe_artist_idx_artist"
    t.index %w(editor artist), name: "editor_subscribe_artist_idx_uniq", unique: true
  end

  create_table "editor_subscribe_artist_deleted", primary_key: %w(editor gid), force: :cascade do |t|
    t.integer "editor", null: false
    t.uuid "gid", null: false
    t.integer "deleted_by", null: false
  end

  create_table "editor_subscribe_collection", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "collection", null: false
    t.integer "last_edit_sent", null: false
    t.boolean "available", default: true, null: false
    t.string "last_seen_name", limit: 255
    t.index ["collection"], name: "editor_subscribe_collection_idx_collection"
    t.index %w(editor collection), name: "editor_subscribe_collection_idx_uniq", unique: true
  end

  create_table "editor_subscribe_editor", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "subscribed_editor", null: false
    t.integer "last_edit_sent", null: false
    t.index %w(editor subscribed_editor), name: "editor_subscribe_editor_idx_uniq", unique: true
  end

  create_table "editor_subscribe_label", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "label", null: false
    t.integer "last_edit_sent", null: false
    t.index %w(editor label), name: "editor_subscribe_label_idx_uniq", unique: true
    t.index ["label"], name: "editor_subscribe_label_idx_label"
  end

  create_table "editor_subscribe_label_deleted", primary_key: %w(editor gid), force: :cascade do |t|
    t.integer "editor", null: false
    t.uuid "gid", null: false
    t.integer "deleted_by", null: false
  end

  create_table "editor_subscribe_series", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "series", null: false
    t.integer "last_edit_sent", null: false
    t.index %w(editor series), name: "editor_subscribe_series_idx_uniq", unique: true
    t.index ["series"], name: "editor_subscribe_series_idx_series"
  end

  create_table "editor_subscribe_series_deleted", primary_key: %w(editor gid), force: :cascade do |t|
    t.integer "editor", null: false
    t.uuid "gid", null: false
    t.integer "deleted_by", null: false
  end

  create_table "editor_watch_artist", primary_key: %w(artist editor), force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "editor", null: false
  end

  create_table "editor_watch_preferences", primary_key: "editor", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "notify_via_email", default: true, null: false
    t.interval "notification_timeframe", default: "7 days", null: false
    t.datetime "last_checked", default: -> { "now()" }, null: false
  end

  create_table "editor_watch_release_group_type", primary_key: %w(editor release_group_type), force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "release_group_type", null: false
  end

  create_table "editor_watch_release_status", primary_key: %w(editor release_status), force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "release_status", null: false
  end

  create_table "event", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.time "time"
    t.integer "type"
    t.boolean "cancelled", default: false, null: false
    t.text "setlist"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "ended", default: false, null: false
    t.index ["gid"], name: "event_idx_gid", unique: true
    t.index ["name"], name: "event_idx_name"
  end

  create_table "event_alias", id: :serial, force: :cascade do |t|
    t.integer "event", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(event locale), name: "event_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["event"], name: "event_alias_idx_event"
  end

  create_table "event_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "event_alias_type_idx_gid", unique: true
  end

  create_table "event_annotation", primary_key: %w(event annotation), force: :cascade do |t|
    t.integer "event", null: false
    t.integer "annotation", null: false
  end

  create_table "event_attribute", id: :serial, force: :cascade do |t|
    t.integer "event", null: false
    t.integer "event_attribute_type", null: false
    t.integer "event_attribute_type_allowed_value"
    t.text "event_attribute_text"
    t.index ["event"], name: "event_attribute_idx_event"
  end

  create_table "event_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "event_attribute_type_idx_gid", unique: true
  end

  create_table "event_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "event_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["event_attribute_type"], name: "event_attribute_type_allowed_value_idx_name"
    t.index ["gid"], name: "event_attribute_type_allowed_value_idx_gid", unique: true
  end

  create_table "event_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "event_gid_redirect_idx_new_id"
  end

  # Could not dump table "event_meta" because of following StandardError
  #   Unknown type 'event_art_presence' for column 'event_art_presence'

  create_table "event_rating_raw", primary_key: %w(event editor), force: :cascade do |t|
    t.integer "event", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "event_rating_raw_idx_editor"
    t.index ["event"], name: "event_rating_raw_idx_event"
  end

  create_table "event_tag", primary_key: %w(event tag), force: :cascade do |t|
    t.integer "event", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "event_tag_idx_tag"
  end

  create_table "event_tag_raw", primary_key: %w(event editor tag), force: :cascade do |t|
    t.integer "event", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "event_tag_raw_idx_editor"
    t.index ["tag"], name: "event_tag_raw_idx_tag"
  end

  create_table "event_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "event_type_idx_gid", unique: true
  end

  create_table "gender", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "gender_idx_gid", unique: true
  end

  create_table "genre", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index "lower((name)::text)", name: "genre_idx_name", unique: true
    t.index ["gid"], name: "genre_idx_gid", unique: true
  end

  create_table "genre_alias", id: :serial, force: :cascade do |t|
    t.integer "genre", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "primary_for_locale", default: false, null: false
    t.index %w(genre locale), name: "genre_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["genre"], name: "genre_alias_idx_genre"
  end

  create_table "instrument", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "type"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.string "comment", limit: 255, default: "", null: false
    t.text "description", default: "", null: false
    t.index ["gid"], name: "instrument_idx_gid", unique: true
    t.index ["name"], name: "instrument_idx_name"
  end

  create_table "instrument_alias", id: :serial, force: :cascade do |t|
    t.integer "instrument", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(instrument locale), name: "instrument_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["instrument"], name: "instrument_alias_idx_instrument"
  end

  create_table "instrument_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "instrument_alias_type_idx_gid", unique: true
  end

  create_table "instrument_annotation", primary_key: %w(instrument annotation), force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "annotation", null: false
  end

  create_table "instrument_attribute", id: :serial, force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "instrument_attribute_type", null: false
    t.integer "instrument_attribute_type_allowed_value"
    t.text "instrument_attribute_text"
    t.index ["instrument"], name: "instrument_attribute_idx_instrument"
  end

  create_table "instrument_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "instrument_attribute_type_idx_gid", unique: true
  end

  create_table "instrument_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "instrument_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "instrument_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["instrument_attribute_type"], name: "instrument_attribute_type_allowed_value_idx_name"
  end

  create_table "instrument_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "instrument_gid_redirect_idx_new_id"
  end

  create_table "instrument_tag", primary_key: %w(instrument tag), force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "instrument_tag_idx_tag"
  end

  create_table "instrument_tag_raw", primary_key: %w(instrument editor tag), force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "instrument_tag_raw_idx_editor"
    t.index ["instrument"], name: "instrument_tag_raw_idx_instrument"
    t.index ["tag"], name: "instrument_tag_raw_idx_tag"
  end

  create_table "instrument_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "instrument_type_idx_gid", unique: true
  end

  create_table "iso_3166_1", primary_key: "code", id: :string, limit: 2, force: :cascade do |t|
    t.integer "area", null: false
    t.index ["area"], name: "iso_3166_1_idx_area"
  end

  create_table "iso_3166_2", primary_key: "code", id: :string, limit: 10, force: :cascade do |t|
    t.integer "area", null: false
    t.index ["area"], name: "iso_3166_2_idx_area"
  end

  create_table "iso_3166_3", primary_key: "code", id: :string, limit: 4, force: :cascade do |t|
    t.integer "area", null: false
    t.index ["area"], name: "iso_3166_3_idx_area"
  end

  create_table "isrc", id: :serial, force: :cascade do |t|
    t.integer "recording", null: false
    t.string "isrc", limit: 12, null: false
    t.integer "source", limit: 2
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.index %w(isrc recording), name: "isrc_idx_isrc_recording", unique: true
    t.index ["isrc"], name: "isrc_idx_isrc"
    t.index ["recording"], name: "isrc_idx_recording"
  end

  create_table "iswc", id: :serial, force: :cascade do |t|
    t.integer "work", null: false
    t.string "iswc", limit: 15
    t.integer "source", limit: 2
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }, null: false
    t.index %w(iswc work), name: "iswc_idx_iswc", unique: true
    t.index ["work"], name: "iswc_idx_work"
  end

  create_table "l_area_area", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_area_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_area_idx_entity1"
  end

  create_table "l_area_artist", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_artist_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_artist_idx_entity1"
  end

  create_table "l_area_event", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_event_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_event_idx_entity1"
  end

  create_table "l_area_instrument", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_instrument_idx_entity1"
  end

  create_table "l_area_label", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_label_idx_entity1"
  end

  create_table "l_area_place", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_place_idx_entity1"
  end

  create_table "l_area_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_recording_idx_entity1"
  end

  create_table "l_area_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_release_idx_entity1"
  end

  create_table "l_area_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_release_group_idx_entity1"
  end

  create_table "l_area_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_series_idx_entity1"
  end

  create_table "l_area_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_url_idx_entity1"
  end

  create_table "l_area_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_area_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_work_idx_entity1"
  end

  create_table "l_artist_artist", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_artist_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_artist_idx_entity1"
  end

  create_table "l_artist_event", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_event_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_event_idx_entity1"
  end

  create_table "l_artist_instrument", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_instrument_idx_entity1"
  end

  create_table "l_artist_label", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_label_idx_entity1"
  end

  create_table "l_artist_place", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_place_idx_entity1"
  end

  create_table "l_artist_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_recording_idx_entity1"
  end

  create_table "l_artist_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_release_idx_entity1"
  end

  create_table "l_artist_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_release_group_idx_entity1"
  end

  create_table "l_artist_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_series_idx_entity1"
  end

  create_table "l_artist_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_url_idx_entity1"
  end

  create_table "l_artist_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_artist_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_work_idx_entity1"
  end

  create_table "l_event_event", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_event_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_event_idx_entity1"
  end

  create_table "l_event_instrument", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_instrument_idx_entity1"
  end

  create_table "l_event_label", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_label_idx_entity1"
  end

  create_table "l_event_place", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_place_idx_entity1"
  end

  create_table "l_event_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_recording_idx_entity1"
  end

  create_table "l_event_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_release_idx_entity1"
  end

  create_table "l_event_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_release_group_idx_entity1"
  end

  create_table "l_event_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_series_idx_entity1"
  end

  create_table "l_event_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_url_idx_entity1"
  end

  create_table "l_event_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_event_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_work_idx_entity1"
  end

  create_table "l_instrument_instrument", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_instrument_idx_entity1"
  end

  create_table "l_instrument_label", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_label_idx_entity1"
  end

  create_table "l_instrument_place", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_place_idx_entity1"
  end

  create_table "l_instrument_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_recording_idx_entity1"
  end

  create_table "l_instrument_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_release_idx_entity1"
  end

  create_table "l_instrument_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_release_group_idx_entity1"
  end

  create_table "l_instrument_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_series_idx_entity1"
  end

  create_table "l_instrument_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_url_idx_entity1"
  end

  create_table "l_instrument_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_instrument_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_work_idx_entity1"
  end

  create_table "l_label_label", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_label_idx_entity1"
  end

  create_table "l_label_place", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_place_idx_entity1"
  end

  create_table "l_label_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_recording_idx_entity1"
  end

  create_table "l_label_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_release_idx_entity1"
  end

  create_table "l_label_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_release_group_idx_entity1"
  end

  create_table "l_label_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_series_idx_entity1"
  end

  create_table "l_label_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_url_idx_entity1"
  end

  create_table "l_label_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_label_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_work_idx_entity1"
  end

  create_table "l_place_place", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_place_idx_entity1"
  end

  create_table "l_place_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_recording_idx_entity1"
  end

  create_table "l_place_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_release_idx_entity1"
  end

  create_table "l_place_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_release_group_idx_entity1"
  end

  create_table "l_place_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_series_idx_entity1"
  end

  create_table "l_place_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_url_idx_entity1"
  end

  create_table "l_place_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_place_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_work_idx_entity1"
  end

  create_table "l_recording_recording", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_recording_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_recording_idx_entity1"
  end

  create_table "l_recording_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_recording_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_release_idx_entity1"
  end

  create_table "l_recording_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_recording_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_release_group_idx_entity1"
  end

  create_table "l_recording_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_recording_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_series_idx_entity1"
  end

  create_table "l_recording_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_recording_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_url_idx_entity1"
  end

  create_table "l_recording_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_recording_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_work_idx_entity1"
  end

  create_table "l_release_group_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_group_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_release_group_idx_entity1"
  end

  create_table "l_release_group_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_group_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_series_idx_entity1"
  end

  create_table "l_release_group_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_group_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_url_idx_entity1"
  end

  create_table "l_release_group_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_group_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_work_idx_entity1"
  end

  create_table "l_release_release", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_release_idx_entity1"
  end

  create_table "l_release_release_group", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_release_group_idx_entity1"
  end

  create_table "l_release_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_series_idx_entity1"
  end

  create_table "l_release_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_url_idx_entity1"
  end

  create_table "l_release_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_release_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_work_idx_entity1"
  end

  create_table "l_series_series", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_series_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_series_series_idx_entity1"
  end

  create_table "l_series_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_series_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_series_url_idx_entity1"
  end

  create_table "l_series_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_series_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_series_work_idx_entity1"
  end

  create_table "l_url_url", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_url_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_url_url_idx_entity1"
  end

  create_table "l_url_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_url_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_url_work_idx_entity1"
  end

  create_table "l_work_work", id: :serial, force: :cascade do |t|
    t.integer "link", null: false
    t.integer "entity0", null: false
    t.integer "entity1", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "link_order", default: 0, null: false
    t.text "entity0_credit", default: "", null: false
    t.text "entity1_credit", default: "", null: false
    t.index %w(entity0 entity1 link link_order), name: "l_work_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_work_work_idx_entity1"
  end

  create_table "label", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.integer "label_code"
    t.integer "type"
    t.integer "area"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "ended", default: false, null: false
    t.index "lower((name)::text)", name: "label_idx_lower_name"
    t.index ["area"], name: "label_idx_area"
    t.index ["gid"], name: "label_idx_gid", unique: true
    t.index %w(name comment), name: "label_idx_uniq_name_comment", unique: true, where: "(comment IS NOT NULL)"
    t.index ["name"], name: "label_idx_name"
    t.index ["name"], name: "label_idx_null_comment", unique: true, where: "(comment IS NULL)"
  end

  create_table "label_alias", id: :serial, force: :cascade do |t|
    t.integer "label", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(label locale), name: "label_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["label"], name: "label_alias_idx_label"
  end

  create_table "label_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "label_alias_type_idx_gid", unique: true
  end

  create_table "label_annotation", primary_key: %w(label annotation), force: :cascade do |t|
    t.integer "label", null: false
    t.integer "annotation", null: false
  end

  create_table "label_attribute", id: :serial, force: :cascade do |t|
    t.integer "label", null: false
    t.integer "label_attribute_type", null: false
    t.integer "label_attribute_type_allowed_value"
    t.text "label_attribute_text"
    t.index ["label"], name: "label_attribute_idx_label"
  end

  create_table "label_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "label_attribute_type_idx_gid", unique: true
  end

  create_table "label_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "label_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "label_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["label_attribute_type"], name: "label_attribute_type_allowed_value_idx_name"
  end

  create_table "label_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "label_gid_redirect_idx_new_id"
  end

  create_table "label_ipi", primary_key: %w(label ipi), force: :cascade do |t|
    t.integer "label", null: false
    t.string "ipi", limit: 11, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "label_isni", primary_key: %w(label isni), force: :cascade do |t|
    t.integer "label", null: false
    t.string "isni", limit: 16, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "label_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
  end

  create_table "label_rating_raw", primary_key: %w(label editor), force: :cascade do |t|
    t.integer "label", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "label_rating_raw_idx_editor"
    t.index ["label"], name: "label_rating_raw_idx_label"
  end

  create_table "label_tag", primary_key: %w(label tag), force: :cascade do |t|
    t.integer "label", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "label_tag_idx_tag"
  end

  create_table "label_tag_raw", primary_key: %w(label editor tag), force: :cascade do |t|
    t.integer "label", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "label_tag_raw_idx_editor"
    t.index ["tag"], name: "label_tag_raw_idx_tag"
  end

  create_table "label_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "label_type_idx_gid", unique: true
  end

  create_table "language", id: :serial, force: :cascade do |t|
    t.string "iso_code_2t", limit: 3
    t.string "iso_code_2b", limit: 3
    t.string "iso_code_1", limit: 2
    t.string "name", limit: 100, null: false
    t.integer "frequency", default: 0, null: false
    t.string "iso_code_3", limit: 3
    t.index ["iso_code_1"], name: "language_idx_iso_code_1", unique: true
    t.index ["iso_code_2b"], name: "language_idx_iso_code_2b", unique: true
    t.index ["iso_code_2t"], name: "language_idx_iso_code_2t", unique: true
    t.index ["iso_code_3"], name: "language_idx_iso_code_3", unique: true
  end

  create_table "link", id: :serial, force: :cascade do |t|
    t.integer "link_type", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.integer "attribute_count", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.boolean "ended", default: false, null: false
    t.index %w(link_type attribute_count), name: "link_idx_type_attr"
  end

  create_table "link_attribute", primary_key: %w(link attribute_type), force: :cascade do |t|
    t.integer "link", null: false
    t.integer "attribute_type", null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "link_attribute_credit", primary_key: %w(link attribute_type), force: :cascade do |t|
    t.integer "link", null: false
    t.integer "attribute_type", null: false
    t.text "credited_as", null: false
  end

  create_table "link_attribute_text_value", primary_key: %w(link attribute_type), force: :cascade do |t|
    t.integer "link", null: false
    t.integer "attribute_type", null: false
    t.text "text_value", null: false
  end

  create_table "link_attribute_type", id: :serial, force: :cascade do |t|
    t.integer "parent"
    t.integer "root", null: false
    t.integer "child_order", default: 0, null: false
    t.uuid "gid", null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["gid"], name: "link_attribute_type_idx_gid", unique: true
  end

  create_table "link_creditable_attribute_type", primary_key: "attribute_type", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "link_text_attribute_type", primary_key: "attribute_type", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "link_type", id: :serial, force: :cascade do |t|
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.uuid "gid", null: false
    t.string "entity_type0", limit: 50, null: false
    t.string "entity_type1", limit: 50, null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.string "link_phrase", limit: 255, null: false
    t.string "reverse_link_phrase", limit: 255, null: false
    t.string "long_link_phrase", limit: 255, null: false
    t.integer "priority", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "is_deprecated", default: false, null: false
    t.boolean "has_dates", default: true, null: false
    t.integer "entity0_cardinality", default: 0, null: false
    t.integer "entity1_cardinality", default: 0, null: false
    t.index ["gid"], name: "link_type_idx_gid", unique: true
  end

  create_table "link_type_attribute_type", primary_key: %w(link_type attribute_type), force: :cascade do |t|
    t.integer "link_type", null: false
    t.integer "attribute_type", null: false
    t.integer "min", limit: 2
    t.integer "max", limit: 2
    t.datetime "last_updated", default: -> { "now()" }
  end

  create_table "medium", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.integer "position", null: false
    t.integer "format"
    t.string "name", default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "track_count", default: 0, null: false
    t.index %w(release position), name: "medium_idx_release_position"
    t.index %w(release position), name: "medium_uniq", unique: true
    t.index ["track_count"], name: "medium_idx_track_count"
  end

  create_table "medium_attribute", id: :serial, force: :cascade do |t|
    t.integer "medium", null: false
    t.integer "medium_attribute_type", null: false
    t.integer "medium_attribute_type_allowed_value"
    t.text "medium_attribute_text"
    t.index ["medium"], name: "medium_attribute_idx_medium"
  end

  create_table "medium_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "medium_attribute_type_idx_gid", unique: true
  end

  create_table "medium_attribute_type_allowed_format", primary_key: %w(medium_format medium_attribute_type), force: :cascade do |t|
    t.integer "medium_format", null: false
    t.integer "medium_attribute_type", null: false
  end

  create_table "medium_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "medium_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "medium_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["medium_attribute_type"], name: "medium_attribute_type_allowed_value_idx_name"
  end

  create_table "medium_attribute_type_allowed_value_allowed_format", primary_key: %w(medium_format medium_attribute_type_allowed_value), force: :cascade do |t|
    t.integer "medium_format", null: false
    t.integer "medium_attribute_type_allowed_value", null: false
  end

  create_table "medium_cdtoc", id: :serial, force: :cascade do |t|
    t.integer "medium", null: false
    t.integer "cdtoc", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["cdtoc"], name: "medium_cdtoc_idx_cdtoc"
    t.index %w(medium cdtoc), name: "medium_cdtoc_idx_uniq", unique: true
    t.index ["medium"], name: "medium_cdtoc_idx_medium"
  end

  create_table "medium_format", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.integer "year", limit: 2
    t.boolean "has_discids", default: false, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "medium_format_idx_gid", unique: true
  end

  # Could not dump table "medium_index" because of following StandardError
  #   Unknown type 'cube' for column 'toc'

  create_table "old_editor_name", id: false, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.index "lower((name)::text)", name: "old_editor_name_idx_name", unique: true
  end

  create_table "orderable_link_type", primary_key: "link_type", id: :integer, default: nil, force: :cascade do |t|
    t.integer "direction", limit: 2, default: 1, null: false
  end

  create_table "place", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "type"
    t.string "address", default: "", null: false
    t.integer "area"
    t.point "coordinates"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "ended", default: false, null: false
    t.index "ll_to_earth(coordinates[0], coordinates[1])", name: "place_idx_geo", where: "(coordinates IS NOT NULL)", using: :gist
    t.index ["area"], name: "place_idx_area"
    t.index ["gid"], name: "place_idx_gid", unique: true
    t.index ["name"], name: "place_idx_name"
  end

  create_table "place_alias", id: :serial, force: :cascade do |t|
    t.integer "place", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(place locale), name: "place_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["place"], name: "place_alias_idx_place"
  end

  create_table "place_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "place_alias_type_idx_gid", unique: true
  end

  create_table "place_annotation", primary_key: %w(place annotation), force: :cascade do |t|
    t.integer "place", null: false
    t.integer "annotation", null: false
  end

  create_table "place_attribute", id: :serial, force: :cascade do |t|
    t.integer "place", null: false
    t.integer "place_attribute_type", null: false
    t.integer "place_attribute_type_allowed_value"
    t.text "place_attribute_text"
    t.index ["place"], name: "place_attribute_idx_place"
  end

  create_table "place_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "place_attribute_type_idx_gid", unique: true
  end

  create_table "place_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "place_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "place_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["place_attribute_type"], name: "place_attribute_type_allowed_value_idx_name"
  end

  create_table "place_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "place_gid_redirect_idx_new_id"
  end

  create_table "place_tag", primary_key: %w(place tag), force: :cascade do |t|
    t.integer "place", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "place_tag_idx_tag"
  end

  create_table "place_tag_raw", primary_key: %w(place editor tag), force: :cascade do |t|
    t.integer "place", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "place_tag_raw_idx_editor"
    t.index ["tag"], name: "place_tag_raw_idx_tag"
  end

  create_table "place_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "place_type_idx_gid", unique: true
  end

  create_table "recording", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "artist_credit", null: false
    t.integer "length"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "video", default: false, null: false
    t.index ["artist_credit"], name: "recording_idx_artist_credit"
    t.index ["gid"], name: "recording_idx_gid", unique: true
    t.index ["name"], name: "recording_idx_name"
  end

  create_table "recording_alias", id: :serial, force: :cascade do |t|
    t.integer "recording", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(recording locale), name: "recording_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["recording"], name: "recording_alias_idx_recording"
  end

  create_table "recording_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "recording_alias_type_idx_gid", unique: true
  end

  create_table "recording_annotation", primary_key: %w(recording annotation), force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "annotation", null: false
  end

  create_table "recording_attribute", id: :serial, force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "recording_attribute_type", null: false
    t.integer "recording_attribute_type_allowed_value"
    t.text "recording_attribute_text"
    t.index ["recording"], name: "recording_attribute_idx_recording"
  end

  create_table "recording_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "recording_attribute_type_idx_gid", unique: true
  end

  create_table "recording_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "recording_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "recording_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["recording_attribute_type"], name: "recording_attribute_type_allowed_value_idx_name"
  end

  create_table "recording_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "recording_gid_redirect_idx_new_id"
  end

  create_table "recording_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
  end

  create_table "recording_rating_raw", primary_key: %w(recording editor), force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "recording_rating_raw_idx_editor"
  end

  create_table "recording_tag", primary_key: %w(recording tag), force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "recording_tag_idx_tag"
  end

  create_table "recording_tag_raw", primary_key: %w(recording editor tag), force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "recording_tag_raw_idx_editor"
    t.index ["recording"], name: "recording_tag_raw_idx_track"
    t.index ["tag"], name: "recording_tag_raw_idx_tag"
  end

  create_table "release", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "artist_credit", null: false
    t.integer "release_group", null: false
    t.integer "status"
    t.integer "packaging"
    t.integer "language"
    t.integer "script"
    t.string "barcode", limit: 255
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.integer "quality", limit: 2, default: -1, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["artist_credit"], name: "release_idx_artist_credit"
    t.index ["gid"], name: "release_idx_gid", unique: true
    t.index ["name"], name: "release_idx_name"
    t.index ["release_group"], name: "release_idx_release_group"
  end

  create_table "release_alias", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(release locale), name: "release_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["release"], name: "release_alias_idx_release"
  end

  create_table "release_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
  end

  create_table "release_annotation", primary_key: %w(release annotation), force: :cascade do |t|
    t.integer "release", null: false
    t.integer "annotation", null: false
  end

  create_table "release_attribute", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.integer "release_attribute_type", null: false
    t.integer "release_attribute_type_allowed_value"
    t.text "release_attribute_text"
    t.index ["release"], name: "release_attribute_idx_release"
  end

  create_table "release_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_attribute_type_idx_gid", unique: true
  end

  create_table "release_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "release_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["release_attribute_type"], name: "release_attribute_type_allowed_value_idx_name"
  end

  create_table "release_country", primary_key: %w(release country), force: :cascade do |t|
    t.integer "release", null: false
    t.integer "country", null: false
    t.integer "date_year", limit: 2
    t.integer "date_month", limit: 2
    t.integer "date_day", limit: 2
    t.index ["country"], name: "release_country_idx_country"
  end

  create_table "release_coverart", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "last_updated"
    t.string "cover_art_url", limit: 255
  end

  create_table "release_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "release_gid_redirect_idx_new_id"
  end

  create_table "release_group", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "artist_credit", null: false
    t.integer "type"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["artist_credit"], name: "release_group_idx_artist_credit"
    t.index ["gid"], name: "release_group_idx_gid", unique: true
    t.index ["name"], name: "release_group_idx_name"
  end

  create_table "release_group_alias", id: :serial, force: :cascade do |t|
    t.integer "release_group", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(release_group locale), name: "release_group_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["release_group"], name: "release_group_alias_idx_release_group"
  end

  create_table "release_group_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_alias_type_idx_gid", unique: true
  end

  create_table "release_group_annotation", primary_key: %w(release_group annotation), force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "annotation", null: false
  end

  create_table "release_group_attribute", id: :serial, force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "release_group_attribute_type", null: false
    t.integer "release_group_attribute_type_allowed_value"
    t.text "release_group_attribute_text"
    t.index ["release_group"], name: "release_group_attribute_idx_release_group"
  end

  create_table "release_group_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_attribute_type_idx_gid", unique: true
  end

  create_table "release_group_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "release_group_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["release_group_attribute_type"], name: "release_group_attribute_type_allowed_value_idx_name"
  end

  create_table "release_group_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "release_group_gid_redirect_idx_new_id"
  end

  create_table "release_group_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "release_count", default: 0, null: false
    t.integer "first_release_date_year", limit: 2
    t.integer "first_release_date_month", limit: 2
    t.integer "first_release_date_day", limit: 2
    t.integer "rating", limit: 2
    t.integer "rating_count"
  end

  create_table "release_group_primary_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_primary_type_idx_gid", unique: true
  end

  create_table "release_group_rating_raw", primary_key: %w(release_group editor), force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "release_group_rating_raw_idx_editor"
    t.index ["release_group"], name: "release_group_rating_raw_idx_release_group"
  end

  create_table "release_group_secondary_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_secondary_type_idx_gid", unique: true
  end

  create_table "release_group_secondary_type_join", primary_key: %w(release_group secondary_type), force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "secondary_type", null: false
    t.datetime "created", default: -> { "now()" }, null: false
  end

  create_table "release_group_tag", primary_key: %w(release_group tag), force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "release_group_tag_idx_tag"
  end

  create_table "release_group_tag_raw", primary_key: %w(release_group editor tag), force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "release_group_tag_raw_idx_editor"
    t.index ["tag"], name: "release_group_tag_raw_idx_tag"
  end

  create_table "release_label", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.integer "label"
    t.string "catalog_number", limit: 255
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["label"], name: "release_label_idx_label"
    t.index ["release"], name: "release_label_idx_release"
  end

  # Could not dump table "release_meta" because of following StandardError
  #   Unknown type 'cover_art_presence' for column 'cover_art_presence'

  create_table "release_packaging", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_packaging_idx_gid", unique: true
  end

  create_table "release_raw", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "artist", limit: 255
    t.datetime "added", default: -> { "now()" }
    t.datetime "last_modified", default: -> { "now()" }
    t.integer "lookup_count", default: 0
    t.integer "modify_count", default: 0
    t.integer "source", default: 0
    t.string "barcode", limit: 255
    t.string "comment", limit: 255, default: "", null: false
    t.index ["last_modified"], name: "release_raw_idx_last_modified"
    t.index ["lookup_count"], name: "release_raw_idx_lookup_count"
    t.index ["modify_count"], name: "release_raw_idx_modify_count"
  end

  create_table "release_status", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_status_idx_gid", unique: true
  end

  create_table "release_tag", primary_key: %w(release tag), force: :cascade do |t|
    t.integer "release", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "release_tag_idx_tag"
  end

  create_table "release_tag_raw", primary_key: %w(release editor tag), force: :cascade do |t|
    t.integer "release", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "release_tag_raw_idx_editor"
    t.index ["tag"], name: "release_tag_raw_idx_tag"
  end

  create_table "release_unknown_country", primary_key: "release", id: :integer, default: nil, force: :cascade do |t|
    t.integer "date_year", limit: 2
    t.integer "date_month", limit: 2
    t.integer "date_day", limit: 2
  end

  create_table "replication_control", id: :serial, force: :cascade do |t|
    t.integer "current_schema_sequence", null: false
    t.integer "current_replication_sequence"
    t.datetime "last_replication_date"
  end

  create_table "script", id: :serial, force: :cascade do |t|
    t.string "iso_code", limit: 4, null: false
    t.string "iso_number", limit: 3, null: false
    t.string "name", limit: 100, null: false
    t.integer "frequency", default: 0, null: false
    t.index ["iso_code"], name: "script_idx_iso_code", unique: true
  end

  create_table "series", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.string "comment", limit: 255, default: "", null: false
    t.integer "type", null: false
    t.integer "ordering_attribute", null: false
    t.integer "ordering_type", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["gid"], name: "series_idx_gid", unique: true
    t.index ["name"], name: "series_idx_name"
  end

  create_table "series_alias", id: :serial, force: :cascade do |t|
    t.integer "series", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(series locale), name: "series_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["series"], name: "series_alias_idx_series"
  end

  create_table "series_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "series_alias_type_idx_gid", unique: true
  end

  create_table "series_annotation", primary_key: %w(series annotation), force: :cascade do |t|
    t.integer "series", null: false
    t.integer "annotation", null: false
  end

  create_table "series_attribute", id: :serial, force: :cascade do |t|
    t.integer "series", null: false
    t.integer "series_attribute_type", null: false
    t.integer "series_attribute_type_allowed_value"
    t.text "series_attribute_text"
    t.index ["series"], name: "series_attribute_idx_series"
  end

  create_table "series_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "series_attribute_type_idx_gid", unique: true
  end

  create_table "series_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "series_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "series_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["series_attribute_type"], name: "series_attribute_type_allowed_value_idx_name"
  end

  create_table "series_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "series_gid_redirect_idx_new_id"
  end

  create_table "series_ordering_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "series_ordering_type_idx_gid", unique: true
  end

  create_table "series_tag", primary_key: %w(series tag), force: :cascade do |t|
    t.integer "series", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "series_tag_idx_tag"
  end

  create_table "series_tag_raw", primary_key: %w(series editor tag), force: :cascade do |t|
    t.integer "series", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["editor"], name: "series_tag_raw_idx_editor"
    t.index ["series"], name: "series_tag_raw_idx_series"
    t.index ["tag"], name: "series_tag_raw_idx_tag"
  end

  create_table "series_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "entity_type", limit: 50, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "series_type_idx_gid", unique: true
  end

  create_table "tag", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "ref_count", default: 0, null: false
    t.index ["name"], name: "tag_idx_name", unique: true
  end

  create_table "tag_relation", primary_key: %w(tag1 tag2), force: :cascade do |t|
    t.integer "tag1", null: false
    t.integer "tag2", null: false
    t.integer "weight", null: false
    t.datetime "last_updated", default: -> { "now()" }
  end

  create_table "track", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.integer "recording", null: false
    t.integer "medium", null: false
    t.integer "position", null: false
    t.text "number", null: false
    t.string "name", null: false
    t.integer "artist_credit", null: false
    t.integer "length"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "is_data_track", default: false, null: false
    t.index ["artist_credit"], name: "track_idx_artist_credit"
    t.index ["gid"], name: "track_idx_gid", unique: true
    t.index %w(medium position), name: "track_idx_medium_position"
    t.index %w(medium position), name: "track_uniq_medium_position", unique: true
    t.index ["name"], name: "track_idx_name"
    t.index ["recording"], name: "track_idx_recording"
  end

  create_table "track_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "track_gid_redirect_idx_new_id"
  end

  create_table "track_raw", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.string "title", limit: 255, null: false
    t.string "artist", limit: 255
    t.integer "sequence", null: false
    t.index ["release"], name: "track_raw_idx_release"
  end

  create_table "url", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.text "url", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["gid"], name: "url_idx_gid", unique: true
    t.index ["url"], name: "url_idx_url", unique: true
  end

  create_table "url_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "url_gid_redirect_idx_new_id"
  end

  create_table "vote", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "edit", null: false
    t.integer "vote", limit: 2, null: false
    t.datetime "vote_time", default: -> { "now()" }
    t.boolean "superseded", default: false, null: false
    t.index ["edit"], name: "vote_idx_edit"
    t.index %w(editor edit), name: "vote_idx_editor_edit", where: "(superseded = false)"
    t.index %w(editor vote_time), name: "vote_idx_editor_vote_time"
    t.index ["vote_time"], name: "vote_idx_vote_time", using: :brin
  end

  create_table "work", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "type"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["gid"], name: "work_idx_gid", unique: true
    t.index ["name"], name: "work_idx_name"
  end

  create_table "work_alias", id: :serial, force: :cascade do |t|
    t.integer "work", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.integer "type"
    t.string "sort_name", null: false
    t.integer "begin_date_year", limit: 2
    t.integer "begin_date_month", limit: 2
    t.integer "begin_date_day", limit: 2
    t.integer "end_date_year", limit: 2
    t.integer "end_date_month", limit: 2
    t.integer "end_date_day", limit: 2
    t.boolean "primary_for_locale", default: false, null: false
    t.boolean "ended", default: false, null: false
    t.index %w(work locale), name: "work_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["work"], name: "work_alias_idx_work"
  end

  create_table "work_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "work_alias_type_idx_gid", unique: true
  end

  create_table "work_annotation", primary_key: %w(work annotation), force: :cascade do |t|
    t.integer "work", null: false
    t.integer "annotation", null: false
  end

  create_table "work_attribute", id: :serial, force: :cascade do |t|
    t.integer "work", null: false
    t.integer "work_attribute_type", null: false
    t.integer "work_attribute_type_allowed_value"
    t.text "work_attribute_text"
    t.index ["work"], name: "work_attribute_idx_work"
  end

  create_table "work_attribute_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "comment", limit: 255, default: "", null: false
    t.boolean "free_text", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "work_attribute_type_idx_gid", unique: true
  end

  create_table "work_attribute_type_allowed_value", id: :serial, force: :cascade do |t|
    t.integer "work_attribute_type", null: false
    t.text "value"
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "work_attribute_type_allowed_value_idx_gid", unique: true
    t.index ["work_attribute_type"], name: "work_attribute_type_allowed_value_idx_name"
  end

  create_table "work_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "work_gid_redirect_idx_new_id"
  end

  create_table "work_language", primary_key: %w(work language), force: :cascade do |t|
    t.integer "work", null: false
    t.integer "language", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "work_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
  end

  create_table "work_rating_raw", primary_key: %w(work editor), force: :cascade do |t|
    t.integer "work", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
  end

  create_table "work_tag", primary_key: %w(work tag), force: :cascade do |t|
    t.integer "work", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "work_tag_idx_tag"
  end

  create_table "work_tag_raw", primary_key: %w(work editor tag), force: :cascade do |t|
    t.integer "work", null: false
    t.integer "editor", null: false
    t.integer "tag", null: false
    t.boolean "is_upvote", default: true, null: false
    t.index ["tag"], name: "work_tag_raw_idx_tag"
  end

  create_table "work_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "work_type_idx_gid", unique: true
  end

  add_foreign_key "alternative_medium", "alternative_release", column: "alternative_release", name: "alternative_medium_fk_alternative_release"
  add_foreign_key "alternative_medium", "medium", column: "medium", name: "alternative_medium_fk_medium"
  add_foreign_key "alternative_medium_track", "alternative_medium", column: "alternative_medium", name: "alternative_medium_track_fk_alternative_medium"
  add_foreign_key "alternative_medium_track", "alternative_track", column: "alternative_track", name: "alternative_medium_track_fk_alternative_track"
  add_foreign_key "alternative_medium_track", "track", column: "track", name: "alternative_medium_track_fk_track"
  add_foreign_key "alternative_release", "alternative_release_type", column: "type", name: "alternative_release_fk_type"
  add_foreign_key "alternative_release", "artist_credit", column: "artist_credit", name: "alternative_release_fk_artist_credit"
  add_foreign_key "alternative_release", "language", column: "language", name: "alternative_release_fk_language"
  add_foreign_key "alternative_release", "release", column: "release", name: "alternative_release_fk_release"
  add_foreign_key "alternative_release", "script", column: "script", name: "alternative_release_fk_script"
  add_foreign_key "alternative_release_type", "alternative_release_type", column: "parent", name: "alternative_release_type_fk_parent"
  add_foreign_key "alternative_track", "artist_credit", column: "artist_credit", name: "alternative_track_fk_artist_credit"
  add_foreign_key "annotation", "editor", column: "editor", name: "annotation_fk_editor"
  add_foreign_key "application", "editor", column: "owner", name: "application_fk_owner"
  add_foreign_key "area", "area_type", column: "type", name: "area_fk_type"
  add_foreign_key "area_alias", "area", column: "area", name: "area_alias_fk_area"
  add_foreign_key "area_alias", "area_alias_type", column: "type", name: "area_alias_fk_type"
  add_foreign_key "area_alias_type", "area_alias_type", column: "parent", name: "area_alias_type_fk_parent"
  add_foreign_key "area_annotation", "annotation", column: "annotation", name: "area_annotation_fk_annotation"
  add_foreign_key "area_annotation", "area", column: "area", name: "area_annotation_fk_area"
  add_foreign_key "area_attribute", "area", column: "area", name: "area_attribute_fk_area"
  add_foreign_key "area_attribute", "area_attribute_type", column: "area_attribute_type", name: "area_attribute_fk_area_attribute_type"
  add_foreign_key "area_attribute", "area_attribute_type_allowed_value", column: "area_attribute_type_allowed_value", name: "area_attribute_fk_area_attribute_type_allowed_value"
  add_foreign_key "area_attribute_type", "area_attribute_type", column: "parent", name: "area_attribute_type_fk_parent"
  add_foreign_key "area_attribute_type_allowed_value", "area_attribute_type", column: "area_attribute_type", name: "area_attribute_type_allowed_value_fk_area_attribute_type"
  add_foreign_key "area_attribute_type_allowed_value", "area_attribute_type_allowed_value", column: "parent", name: "area_attribute_type_allowed_value_fk_parent"
  add_foreign_key "area_gid_redirect", "area", column: "new_id", name: "area_gid_redirect_fk_new_id"
  add_foreign_key "area_tag", "area", column: "area", name: "area_tag_fk_area"
  add_foreign_key "area_tag", "tag", column: "tag", name: "area_tag_fk_tag"
  add_foreign_key "area_tag_raw", "area", column: "area", name: "area_tag_raw_fk_area"
  add_foreign_key "area_tag_raw", "editor", column: "editor", name: "area_tag_raw_fk_editor"
  add_foreign_key "area_tag_raw", "tag", column: "tag", name: "area_tag_raw_fk_tag"
  add_foreign_key "area_type", "area_type", column: "parent", name: "area_type_fk_parent"
  add_foreign_key "artist", "area", column: "area", name: "artist_fk_area"
  add_foreign_key "artist", "area", column: "begin_area", name: "artist_fk_begin_area"
  add_foreign_key "artist", "area", column: "end_area", name: "artist_fk_end_area"
  add_foreign_key "artist", "artist_type", column: "type", name: "artist_fk_type"
  add_foreign_key "artist", "gender", column: "gender", name: "artist_fk_gender"
  add_foreign_key "artist_alias", "artist", column: "artist", name: "artist_alias_fk_artist"
  add_foreign_key "artist_alias", "artist_alias_type", column: "type", name: "artist_alias_fk_type"
  add_foreign_key "artist_alias_type", "artist_alias_type", column: "parent", name: "artist_alias_type_fk_parent"
  add_foreign_key "artist_annotation", "annotation", column: "annotation", name: "artist_annotation_fk_annotation"
  add_foreign_key "artist_annotation", "artist", column: "artist", name: "artist_annotation_fk_artist"
  add_foreign_key "artist_attribute", "artist", column: "artist", name: "artist_attribute_fk_artist"
  add_foreign_key "artist_attribute", "artist_attribute_type", column: "artist_attribute_type", name: "artist_attribute_fk_artist_attribute_type"
  add_foreign_key "artist_attribute", "artist_attribute_type_allowed_value", column: "artist_attribute_type_allowed_value", name: "artist_attribute_fk_artist_attribute_type_allowed_value"
  add_foreign_key "artist_attribute_type", "artist_attribute_type", column: "parent", name: "artist_attribute_type_fk_parent"
  add_foreign_key "artist_attribute_type_allowed_value", "artist_attribute_type", column: "artist_attribute_type", name: "artist_attribute_type_allowed_value_fk_artist_attribute_type"
  add_foreign_key "artist_attribute_type_allowed_value", "artist_attribute_type_allowed_value", column: "parent", name: "artist_attribute_type_allowed_value_fk_parent"
  add_foreign_key "artist_credit_name", "artist", column: "artist", name: "artist_credit_name_fk_artist", on_delete: :cascade
  add_foreign_key "artist_credit_name", "artist_credit", column: "artist_credit", name: "artist_credit_name_fk_artist_credit", on_delete: :cascade
  add_foreign_key "artist_gid_redirect", "artist", column: "new_id", name: "artist_gid_redirect_fk_new_id"
  add_foreign_key "artist_ipi", "artist", column: "artist", name: "artist_ipi_fk_artist"
  add_foreign_key "artist_isni", "artist", column: "artist", name: "artist_isni_fk_artist"
  add_foreign_key "artist_meta", "artist", column: "id", name: "artist_meta_fk_id", on_delete: :cascade
  add_foreign_key "artist_rating_raw", "artist", column: "artist", name: "artist_rating_raw_fk_artist"
  add_foreign_key "artist_rating_raw", "editor", column: "editor", name: "artist_rating_raw_fk_editor"
  add_foreign_key "artist_tag", "artist", column: "artist", name: "artist_tag_fk_artist"
  add_foreign_key "artist_tag", "tag", column: "tag", name: "artist_tag_fk_tag"
  add_foreign_key "artist_tag_raw", "artist", column: "artist", name: "artist_tag_raw_fk_artist"
  add_foreign_key "artist_tag_raw", "editor", column: "editor", name: "artist_tag_raw_fk_editor"
  add_foreign_key "artist_tag_raw", "tag", column: "tag", name: "artist_tag_raw_fk_tag"
  add_foreign_key "artist_type", "artist_type", column: "parent", name: "artist_type_fk_parent"
  add_foreign_key "autoeditor_election", "editor", column: "candidate", name: "autoeditor_election_fk_candidate"
  add_foreign_key "autoeditor_election", "editor", column: "proposer", name: "autoeditor_election_fk_proposer"
  add_foreign_key "autoeditor_election", "editor", column: "seconder_1", name: "autoeditor_election_fk_seconder_1"
  add_foreign_key "autoeditor_election", "editor", column: "seconder_2", name: "autoeditor_election_fk_seconder_2"
  add_foreign_key "autoeditor_election_vote", "autoeditor_election", column: "autoeditor_election", name: "autoeditor_election_vote_fk_autoeditor_election"
  add_foreign_key "autoeditor_election_vote", "editor", column: "voter", name: "autoeditor_election_vote_fk_voter"
  add_foreign_key "cdtoc_raw", "release_raw", column: "release", name: "cdtoc_raw_fk_release"
  add_foreign_key "country_area", "area", column: "area", name: "country_area_fk_area"
  add_foreign_key "edit", "editor", column: "editor", name: "edit_fk_editor"
  add_foreign_key "edit", "language", column: "language", name: "edit_fk_language"
  add_foreign_key "edit_area", "area", column: "area", name: "edit_area_fk_area", on_delete: :cascade
  add_foreign_key "edit_area", "edit", column: "edit", name: "edit_area_fk_edit"
  add_foreign_key "edit_artist", "artist", column: "artist", name: "edit_artist_fk_artist", on_delete: :cascade
  add_foreign_key "edit_artist", "edit", column: "edit", name: "edit_artist_fk_edit"
  add_foreign_key "edit_data", "edit", column: "edit", name: "edit_data_fk_edit"
  add_foreign_key "edit_event", "edit", column: "edit", name: "edit_event_fk_edit"
  add_foreign_key "edit_event", "event", column: "event", name: "edit_event_fk_event", on_delete: :cascade
  add_foreign_key "edit_instrument", "edit", column: "edit", name: "edit_instrument_fk_edit"
  add_foreign_key "edit_instrument", "instrument", column: "instrument", name: "edit_instrument_fk_instrument", on_delete: :cascade
  add_foreign_key "edit_label", "edit", column: "edit", name: "edit_label_fk_edit"
  add_foreign_key "edit_label", "label", column: "label", name: "edit_label_fk_label", on_delete: :cascade
  add_foreign_key "edit_note", "edit", column: "edit", name: "edit_note_fk_edit"
  add_foreign_key "edit_note", "editor", column: "editor", name: "edit_note_fk_editor"
  add_foreign_key "edit_note_recipient", "edit_note", column: "edit_note", name: "edit_note_recipient_fk_edit_note"
  add_foreign_key "edit_note_recipient", "editor", column: "recipient", name: "edit_note_recipient_fk_recipient"
  add_foreign_key "edit_place", "edit", column: "edit", name: "edit_place_fk_edit"
  add_foreign_key "edit_place", "place", column: "place", name: "edit_place_fk_place", on_delete: :cascade
  add_foreign_key "edit_recording", "edit", column: "edit", name: "edit_recording_fk_edit"
  add_foreign_key "edit_recording", "recording", column: "recording", name: "edit_recording_fk_recording", on_delete: :cascade
  add_foreign_key "edit_release", "edit", column: "edit", name: "edit_release_fk_edit"
  add_foreign_key "edit_release", "release", column: "release", name: "edit_release_fk_release", on_delete: :cascade
  add_foreign_key "edit_release_group", "edit", column: "edit", name: "edit_release_group_fk_edit"
  add_foreign_key "edit_release_group", "release_group", column: "release_group", name: "edit_release_group_fk_release_group", on_delete: :cascade
  add_foreign_key "edit_series", "edit", column: "edit", name: "edit_series_fk_edit"
  add_foreign_key "edit_series", "series", column: "series", name: "edit_series_fk_series", on_delete: :cascade
  add_foreign_key "edit_url", "edit", column: "edit", name: "edit_url_fk_edit"
  add_foreign_key "edit_url", "url", column: "url", name: "edit_url_fk_url", on_delete: :cascade
  add_foreign_key "edit_work", "edit", column: "edit", name: "edit_work_fk_edit"
  add_foreign_key "edit_work", "work", column: "work", name: "edit_work_fk_work", on_delete: :cascade
  add_foreign_key "editor", "area", column: "area", name: "editor_fk_area"
  add_foreign_key "editor", "gender", column: "gender", name: "editor_fk_gender"
  add_foreign_key "editor_collection", "editor", column: "editor", name: "editor_collection_fk_editor"
  add_foreign_key "editor_collection", "editor_collection_type", column: "type", name: "editor_collection_fk_type"
  add_foreign_key "editor_collection_area", "area", column: "area", name: "editor_collection_area_fk_area"
  add_foreign_key "editor_collection_area", "editor_collection", column: "collection", name: "editor_collection_area_fk_collection"
  add_foreign_key "editor_collection_artist", "artist", column: "artist", name: "editor_collection_artist_fk_artist"
  add_foreign_key "editor_collection_artist", "editor_collection", column: "collection", name: "editor_collection_artist_fk_collection"
  add_foreign_key "editor_collection_collaborator", "editor", column: "editor", name: "editor_collection_collaborator_fk_editor"
  add_foreign_key "editor_collection_collaborator", "editor_collection", column: "collection", name: "editor_collection_collaborator_fk_collection"
  add_foreign_key "editor_collection_deleted_entity", "deleted_entity", column: "gid", primary_key: "gid", name: "editor_collection_deleted_entity_fk_gid"
  add_foreign_key "editor_collection_deleted_entity", "editor_collection", column: "collection", name: "editor_collection_deleted_entity_fk_collection"
  add_foreign_key "editor_collection_event", "editor_collection", column: "collection", name: "editor_collection_event_fk_collection"
  add_foreign_key "editor_collection_event", "event", column: "event", name: "editor_collection_event_fk_event"
  add_foreign_key "editor_collection_instrument", "editor_collection", column: "collection", name: "editor_collection_instrument_fk_collection"
  add_foreign_key "editor_collection_instrument", "instrument", column: "instrument", name: "editor_collection_instrument_fk_instrument"
  add_foreign_key "editor_collection_label", "editor_collection", column: "collection", name: "editor_collection_label_fk_collection"
  add_foreign_key "editor_collection_label", "label", column: "label", name: "editor_collection_label_fk_label"
  add_foreign_key "editor_collection_place", "editor_collection", column: "collection", name: "editor_collection_place_fk_collection"
  add_foreign_key "editor_collection_place", "place", column: "place", name: "editor_collection_place_fk_place"
  add_foreign_key "editor_collection_recording", "editor_collection", column: "collection", name: "editor_collection_recording_fk_collection"
  add_foreign_key "editor_collection_recording", "recording", column: "recording", name: "editor_collection_recording_fk_recording"
  add_foreign_key "editor_collection_release", "editor_collection", column: "collection", name: "editor_collection_release_fk_collection"
  add_foreign_key "editor_collection_release", "release", column: "release", name: "editor_collection_release_fk_release"
  add_foreign_key "editor_collection_release_group", "editor_collection", column: "collection", name: "editor_collection_release_group_fk_collection"
  add_foreign_key "editor_collection_release_group", "release_group", column: "release_group", name: "editor_collection_release_group_fk_release_group"
  add_foreign_key "editor_collection_series", "editor_collection", column: "collection", name: "editor_collection_series_fk_collection"
  add_foreign_key "editor_collection_series", "series", column: "series", name: "editor_collection_series_fk_series"
  add_foreign_key "editor_collection_type", "editor_collection_type", column: "parent", name: "editor_collection_type_fk_parent"
  add_foreign_key "editor_collection_work", "editor_collection", column: "collection", name: "editor_collection_work_fk_collection"
  add_foreign_key "editor_collection_work", "work", column: "work", name: "editor_collection_work_fk_work"
  add_foreign_key "editor_language", "editor", column: "editor", name: "editor_language_fk_editor"
  add_foreign_key "editor_language", "language", column: "language", name: "editor_language_fk_language"
  add_foreign_key "editor_oauth_token", "application", column: "application", name: "editor_oauth_token_fk_application"
  add_foreign_key "editor_oauth_token", "editor", column: "editor", name: "editor_oauth_token_fk_editor"
  add_foreign_key "editor_preference", "editor", column: "editor", name: "editor_preference_fk_editor"
  add_foreign_key "editor_subscribe_artist", "artist", column: "artist", name: "editor_subscribe_artist_fk_artist"
  add_foreign_key "editor_subscribe_artist", "edit", column: "last_edit_sent", name: "editor_subscribe_artist_fk_last_edit_sent"
  add_foreign_key "editor_subscribe_artist", "editor", column: "editor", name: "editor_subscribe_artist_fk_editor"
  add_foreign_key "editor_subscribe_artist_deleted", "deleted_entity", column: "gid", primary_key: "gid", name: "editor_subscribe_artist_deleted_fk_gid"
  add_foreign_key "editor_subscribe_artist_deleted", "edit", column: "deleted_by", name: "editor_subscribe_artist_deleted_fk_deleted_by"
  add_foreign_key "editor_subscribe_artist_deleted", "editor", column: "editor", name: "editor_subscribe_artist_deleted_fk_editor"
  add_foreign_key "editor_subscribe_collection", "editor", column: "editor", name: "editor_subscribe_collection_fk_editor"
  add_foreign_key "editor_subscribe_editor", "editor", column: "editor", name: "editor_subscribe_editor_fk_editor"
  add_foreign_key "editor_subscribe_editor", "editor", column: "subscribed_editor", name: "editor_subscribe_editor_fk_subscribed_editor"
  add_foreign_key "editor_subscribe_label", "edit", column: "last_edit_sent", name: "editor_subscribe_label_fk_last_edit_sent"
  add_foreign_key "editor_subscribe_label", "editor", column: "editor", name: "editor_subscribe_label_fk_editor"
  add_foreign_key "editor_subscribe_label", "label", column: "label", name: "editor_subscribe_label_fk_label"
  add_foreign_key "editor_subscribe_label_deleted", "deleted_entity", column: "gid", primary_key: "gid", name: "editor_subscribe_label_deleted_fk_gid"
  add_foreign_key "editor_subscribe_label_deleted", "edit", column: "deleted_by", name: "editor_subscribe_label_deleted_fk_deleted_by"
  add_foreign_key "editor_subscribe_label_deleted", "editor", column: "editor", name: "editor_subscribe_label_deleted_fk_editor"
  add_foreign_key "editor_subscribe_series", "edit", column: "last_edit_sent", name: "editor_subscribe_series_fk_last_edit_sent"
  add_foreign_key "editor_subscribe_series", "editor", column: "editor", name: "editor_subscribe_series_fk_editor"
  add_foreign_key "editor_subscribe_series", "series", column: "series", name: "editor_subscribe_series_fk_series"
  add_foreign_key "editor_subscribe_series_deleted", "deleted_entity", column: "gid", primary_key: "gid", name: "editor_subscribe_series_deleted_fk_gid"
  add_foreign_key "editor_subscribe_series_deleted", "edit", column: "deleted_by", name: "editor_subscribe_series_deleted_fk_deleted_by"
  add_foreign_key "editor_subscribe_series_deleted", "editor", column: "editor", name: "editor_subscribe_series_deleted_fk_editor"
  add_foreign_key "editor_watch_artist", "artist", column: "artist", name: "editor_watch_artist_fk_artist", on_delete: :cascade
  add_foreign_key "editor_watch_artist", "editor", column: "editor", name: "editor_watch_artist_fk_editor", on_delete: :cascade
  add_foreign_key "editor_watch_preferences", "editor", column: "editor", name: "editor_watch_preferences_fk_editor", on_delete: :cascade
  add_foreign_key "editor_watch_release_group_type", "editor", column: "editor", name: "editor_watch_release_group_type_fk_editor", on_delete: :cascade
  add_foreign_key "editor_watch_release_group_type", "release_group_primary_type", column: "release_group_type", name: "editor_watch_release_group_type_fk_release_group_type"
  add_foreign_key "editor_watch_release_status", "editor", column: "editor", name: "editor_watch_release_status_fk_editor", on_delete: :cascade
  add_foreign_key "editor_watch_release_status", "release_status", column: "release_status", name: "editor_watch_release_status_fk_release_status"
  add_foreign_key "event", "event_type", column: "type", name: "event_fk_type"
  add_foreign_key "event_alias", "event", column: "event", name: "event_alias_fk_event"
  add_foreign_key "event_alias", "event_alias_type", column: "type", name: "event_alias_fk_type"
  add_foreign_key "event_alias_type", "event_alias_type", column: "parent", name: "event_alias_type_fk_parent"
  add_foreign_key "event_annotation", "annotation", column: "annotation", name: "event_annotation_fk_annotation"
  add_foreign_key "event_annotation", "event", column: "event", name: "event_annotation_fk_event"
  add_foreign_key "event_attribute", "event", column: "event", name: "event_attribute_fk_event"
  add_foreign_key "event_attribute", "event_attribute_type", column: "event_attribute_type", name: "event_attribute_fk_event_attribute_type"
  add_foreign_key "event_attribute", "event_attribute_type_allowed_value", column: "event_attribute_type_allowed_value", name: "event_attribute_fk_event_attribute_type_allowed_value"
  add_foreign_key "event_attribute_type", "event_attribute_type", column: "parent", name: "event_attribute_type_fk_parent"
  add_foreign_key "event_attribute_type_allowed_value", "event_attribute_type", column: "event_attribute_type", name: "event_attribute_type_allowed_value_fk_event_attribute_type"
  add_foreign_key "event_attribute_type_allowed_value", "event_attribute_type_allowed_value", column: "parent", name: "event_attribute_type_allowed_value_fk_parent"
  add_foreign_key "event_gid_redirect", "event", column: "new_id", name: "event_gid_redirect_fk_new_id"
  add_foreign_key "event_meta", "event", column: "id", name: "event_meta_fk_id", on_delete: :cascade
  add_foreign_key "event_rating_raw", "editor", column: "editor", name: "event_rating_raw_fk_editor"
  add_foreign_key "event_rating_raw", "event", column: "event", name: "event_rating_raw_fk_event"
  add_foreign_key "event_tag", "event", column: "event", name: "event_tag_fk_event"
  add_foreign_key "event_tag", "tag", column: "tag", name: "event_tag_fk_tag"
  add_foreign_key "event_tag_raw", "editor", column: "editor", name: "event_tag_raw_fk_editor"
  add_foreign_key "event_tag_raw", "event", column: "event", name: "event_tag_raw_fk_event"
  add_foreign_key "event_tag_raw", "tag", column: "tag", name: "event_tag_raw_fk_tag"
  add_foreign_key "event_type", "event_type", column: "parent", name: "event_type_fk_parent"
  add_foreign_key "gender", "gender", column: "parent", name: "gender_fk_parent"
  add_foreign_key "genre_alias", "genre", column: "genre", name: "genre_alias_fk_genre"
  add_foreign_key "instrument", "instrument_type", column: "type", name: "instrument_fk_type"
  add_foreign_key "instrument_alias", "instrument", column: "instrument", name: "instrument_alias_fk_instrument"
  add_foreign_key "instrument_alias", "instrument_alias_type", column: "type", name: "instrument_alias_fk_type"
  add_foreign_key "instrument_alias_type", "instrument_alias_type", column: "parent", name: "instrument_alias_type_fk_parent"
  add_foreign_key "instrument_annotation", "annotation", column: "annotation", name: "instrument_annotation_fk_annotation"
  add_foreign_key "instrument_annotation", "instrument", column: "instrument", name: "instrument_annotation_fk_instrument"
  add_foreign_key "instrument_attribute", "instrument", column: "instrument", name: "instrument_attribute_fk_instrument"
  add_foreign_key "instrument_attribute", "instrument_attribute_type", column: "instrument_attribute_type", name: "instrument_attribute_fk_instrument_attribute_type"
  add_foreign_key "instrument_attribute", "instrument_attribute_type_allowed_value", column: "instrument_attribute_type_allowed_value", name: "instrument_attribute_fk_instrument_attribute_type_allowed_value"
  add_foreign_key "instrument_attribute_type", "instrument_attribute_type", column: "parent", name: "instrument_attribute_type_fk_parent"
  add_foreign_key "instrument_attribute_type_allowed_value", "instrument_attribute_type", column: "instrument_attribute_type", name: "instrument_attribute_type_allowed_value_fk_instrument_attribute"
  add_foreign_key "instrument_attribute_type_allowed_value", "instrument_attribute_type_allowed_value", column: "parent", name: "instrument_attribute_type_allowed_value_fk_parent"
  add_foreign_key "instrument_gid_redirect", "instrument", column: "new_id", name: "instrument_gid_redirect_fk_new_id"
  add_foreign_key "instrument_tag", "instrument", column: "instrument", name: "instrument_tag_fk_instrument"
  add_foreign_key "instrument_tag", "tag", column: "tag", name: "instrument_tag_fk_tag"
  add_foreign_key "instrument_tag_raw", "editor", column: "editor", name: "instrument_tag_raw_fk_editor"
  add_foreign_key "instrument_tag_raw", "instrument", column: "instrument", name: "instrument_tag_raw_fk_instrument"
  add_foreign_key "instrument_tag_raw", "tag", column: "tag", name: "instrument_tag_raw_fk_tag"
  add_foreign_key "instrument_type", "instrument_type", column: "parent", name: "instrument_type_fk_parent"
  add_foreign_key "iso_3166_1", "area", column: "area", name: "iso_3166_1_fk_area"
  add_foreign_key "iso_3166_2", "area", column: "area", name: "iso_3166_2_fk_area"
  add_foreign_key "iso_3166_3", "area", column: "area", name: "iso_3166_3_fk_area"
  add_foreign_key "isrc", "recording", column: "recording", name: "isrc_fk_recording"
  add_foreign_key "iswc", "work", column: "work", name: "iswc_fk_work"
  add_foreign_key "l_area_area", "area", column: "entity0", name: "l_area_area_fk_entity0"
  add_foreign_key "l_area_area", "area", column: "entity1", name: "l_area_area_fk_entity1"
  add_foreign_key "l_area_area", "link", column: "link", name: "l_area_area_fk_link"
  add_foreign_key "l_area_artist", "area", column: "entity0", name: "l_area_artist_fk_entity0"
  add_foreign_key "l_area_artist", "artist", column: "entity1", name: "l_area_artist_fk_entity1"
  add_foreign_key "l_area_artist", "link", column: "link", name: "l_area_artist_fk_link"
  add_foreign_key "l_area_event", "area", column: "entity0", name: "l_area_event_fk_entity0"
  add_foreign_key "l_area_event", "event", column: "entity1", name: "l_area_event_fk_entity1"
  add_foreign_key "l_area_event", "link", column: "link", name: "l_area_event_fk_link"
  add_foreign_key "l_area_instrument", "area", column: "entity0", name: "l_area_instrument_fk_entity0"
  add_foreign_key "l_area_instrument", "instrument", column: "entity1", name: "l_area_instrument_fk_entity1"
  add_foreign_key "l_area_instrument", "link", column: "link", name: "l_area_instrument_fk_link"
  add_foreign_key "l_area_label", "area", column: "entity0", name: "l_area_label_fk_entity0"
  add_foreign_key "l_area_label", "label", column: "entity1", name: "l_area_label_fk_entity1"
  add_foreign_key "l_area_label", "link", column: "link", name: "l_area_label_fk_link"
  add_foreign_key "l_area_place", "area", column: "entity0", name: "l_area_place_fk_entity0"
  add_foreign_key "l_area_place", "link", column: "link", name: "l_area_place_fk_link"
  add_foreign_key "l_area_place", "place", column: "entity1", name: "l_area_place_fk_entity1"
  add_foreign_key "l_area_recording", "area", column: "entity0", name: "l_area_recording_fk_entity0"
  add_foreign_key "l_area_recording", "link", column: "link", name: "l_area_recording_fk_link"
  add_foreign_key "l_area_recording", "recording", column: "entity1", name: "l_area_recording_fk_entity1"
  add_foreign_key "l_area_release", "area", column: "entity0", name: "l_area_release_fk_entity0"
  add_foreign_key "l_area_release", "link", column: "link", name: "l_area_release_fk_link"
  add_foreign_key "l_area_release", "release", column: "entity1", name: "l_area_release_fk_entity1"
  add_foreign_key "l_area_release_group", "area", column: "entity0", name: "l_area_release_group_fk_entity0"
  add_foreign_key "l_area_release_group", "link", column: "link", name: "l_area_release_group_fk_link"
  add_foreign_key "l_area_release_group", "release_group", column: "entity1", name: "l_area_release_group_fk_entity1"
  add_foreign_key "l_area_series", "area", column: "entity0", name: "l_area_series_fk_entity0"
  add_foreign_key "l_area_series", "link", column: "link", name: "l_area_series_fk_link"
  add_foreign_key "l_area_series", "series", column: "entity1", name: "l_area_series_fk_entity1"
  add_foreign_key "l_area_url", "area", column: "entity0", name: "l_area_url_fk_entity0"
  add_foreign_key "l_area_url", "link", column: "link", name: "l_area_url_fk_link"
  add_foreign_key "l_area_url", "url", column: "entity1", name: "l_area_url_fk_entity1"
  add_foreign_key "l_area_work", "area", column: "entity0", name: "l_area_work_fk_entity0"
  add_foreign_key "l_area_work", "link", column: "link", name: "l_area_work_fk_link"
  add_foreign_key "l_area_work", "work", column: "entity1", name: "l_area_work_fk_entity1"
  add_foreign_key "l_artist_artist", "artist", column: "entity0", name: "l_artist_artist_fk_entity0"
  add_foreign_key "l_artist_artist", "artist", column: "entity1", name: "l_artist_artist_fk_entity1"
  add_foreign_key "l_artist_artist", "link", column: "link", name: "l_artist_artist_fk_link"
  add_foreign_key "l_artist_event", "artist", column: "entity0", name: "l_artist_event_fk_entity0"
  add_foreign_key "l_artist_event", "event", column: "entity1", name: "l_artist_event_fk_entity1"
  add_foreign_key "l_artist_event", "link", column: "link", name: "l_artist_event_fk_link"
  add_foreign_key "l_artist_instrument", "artist", column: "entity0", name: "l_artist_instrument_fk_entity0"
  add_foreign_key "l_artist_instrument", "instrument", column: "entity1", name: "l_artist_instrument_fk_entity1"
  add_foreign_key "l_artist_instrument", "link", column: "link", name: "l_artist_instrument_fk_link"
  add_foreign_key "l_artist_label", "artist", column: "entity0", name: "l_artist_label_fk_entity0"
  add_foreign_key "l_artist_label", "label", column: "entity1", name: "l_artist_label_fk_entity1"
  add_foreign_key "l_artist_label", "link", column: "link", name: "l_artist_label_fk_link"
  add_foreign_key "l_artist_place", "artist", column: "entity0", name: "l_artist_place_fk_entity0"
  add_foreign_key "l_artist_place", "link", column: "link", name: "l_artist_place_fk_link"
  add_foreign_key "l_artist_place", "place", column: "entity1", name: "l_artist_place_fk_entity1"
  add_foreign_key "l_artist_recording", "artist", column: "entity0", name: "l_artist_recording_fk_entity0"
  add_foreign_key "l_artist_recording", "link", column: "link", name: "l_artist_recording_fk_link"
  add_foreign_key "l_artist_recording", "recording", column: "entity1", name: "l_artist_recording_fk_entity1"
  add_foreign_key "l_artist_release", "artist", column: "entity0", name: "l_artist_release_fk_entity0"
  add_foreign_key "l_artist_release", "link", column: "link", name: "l_artist_release_fk_link"
  add_foreign_key "l_artist_release", "release", column: "entity1", name: "l_artist_release_fk_entity1"
  add_foreign_key "l_artist_release_group", "artist", column: "entity0", name: "l_artist_release_group_fk_entity0"
  add_foreign_key "l_artist_release_group", "link", column: "link", name: "l_artist_release_group_fk_link"
  add_foreign_key "l_artist_release_group", "release_group", column: "entity1", name: "l_artist_release_group_fk_entity1"
  add_foreign_key "l_artist_series", "artist", column: "entity0", name: "l_artist_series_fk_entity0"
  add_foreign_key "l_artist_series", "link", column: "link", name: "l_artist_series_fk_link"
  add_foreign_key "l_artist_series", "series", column: "entity1", name: "l_artist_series_fk_entity1"
  add_foreign_key "l_artist_url", "artist", column: "entity0", name: "l_artist_url_fk_entity0"
  add_foreign_key "l_artist_url", "link", column: "link", name: "l_artist_url_fk_link"
  add_foreign_key "l_artist_url", "url", column: "entity1", name: "l_artist_url_fk_entity1"
  add_foreign_key "l_artist_work", "artist", column: "entity0", name: "l_artist_work_fk_entity0"
  add_foreign_key "l_artist_work", "link", column: "link", name: "l_artist_work_fk_link"
  add_foreign_key "l_artist_work", "work", column: "entity1", name: "l_artist_work_fk_entity1"
  add_foreign_key "l_event_event", "event", column: "entity0", name: "l_event_event_fk_entity0"
  add_foreign_key "l_event_event", "event", column: "entity1", name: "l_event_event_fk_entity1"
  add_foreign_key "l_event_event", "link", column: "link", name: "l_event_event_fk_link"
  add_foreign_key "l_event_instrument", "event", column: "entity0", name: "l_event_instrument_fk_entity0"
  add_foreign_key "l_event_instrument", "instrument", column: "entity1", name: "l_event_instrument_fk_entity1"
  add_foreign_key "l_event_instrument", "link", column: "link", name: "l_event_instrument_fk_link"
  add_foreign_key "l_event_label", "event", column: "entity0", name: "l_event_label_fk_entity0"
  add_foreign_key "l_event_label", "label", column: "entity1", name: "l_event_label_fk_entity1"
  add_foreign_key "l_event_label", "link", column: "link", name: "l_event_label_fk_link"
  add_foreign_key "l_event_place", "event", column: "entity0", name: "l_event_place_fk_entity0"
  add_foreign_key "l_event_place", "link", column: "link", name: "l_event_place_fk_link"
  add_foreign_key "l_event_place", "place", column: "entity1", name: "l_event_place_fk_entity1"
  add_foreign_key "l_event_recording", "event", column: "entity0", name: "l_event_recording_fk_entity0"
  add_foreign_key "l_event_recording", "link", column: "link", name: "l_event_recording_fk_link"
  add_foreign_key "l_event_recording", "recording", column: "entity1", name: "l_event_recording_fk_entity1"
  add_foreign_key "l_event_release", "event", column: "entity0", name: "l_event_release_fk_entity0"
  add_foreign_key "l_event_release", "link", column: "link", name: "l_event_release_fk_link"
  add_foreign_key "l_event_release", "release", column: "entity1", name: "l_event_release_fk_entity1"
  add_foreign_key "l_event_release_group", "event", column: "entity0", name: "l_event_release_group_fk_entity0"
  add_foreign_key "l_event_release_group", "link", column: "link", name: "l_event_release_group_fk_link"
  add_foreign_key "l_event_release_group", "release_group", column: "entity1", name: "l_event_release_group_fk_entity1"
  add_foreign_key "l_event_series", "event", column: "entity0", name: "l_event_series_fk_entity0"
  add_foreign_key "l_event_series", "link", column: "link", name: "l_event_series_fk_link"
  add_foreign_key "l_event_series", "series", column: "entity1", name: "l_event_series_fk_entity1"
  add_foreign_key "l_event_url", "event", column: "entity0", name: "l_event_url_fk_entity0"
  add_foreign_key "l_event_url", "link", column: "link", name: "l_event_url_fk_link"
  add_foreign_key "l_event_url", "url", column: "entity1", name: "l_event_url_fk_entity1"
  add_foreign_key "l_event_work", "event", column: "entity0", name: "l_event_work_fk_entity0"
  add_foreign_key "l_event_work", "link", column: "link", name: "l_event_work_fk_link"
  add_foreign_key "l_event_work", "work", column: "entity1", name: "l_event_work_fk_entity1"
  add_foreign_key "l_instrument_instrument", "instrument", column: "entity0", name: "l_instrument_instrument_fk_entity0"
  add_foreign_key "l_instrument_instrument", "instrument", column: "entity1", name: "l_instrument_instrument_fk_entity1"
  add_foreign_key "l_instrument_instrument", "link", column: "link", name: "l_instrument_instrument_fk_link"
  add_foreign_key "l_instrument_label", "instrument", column: "entity0", name: "l_instrument_label_fk_entity0"
  add_foreign_key "l_instrument_label", "label", column: "entity1", name: "l_instrument_label_fk_entity1"
  add_foreign_key "l_instrument_label", "link", column: "link", name: "l_instrument_label_fk_link"
  add_foreign_key "l_instrument_place", "instrument", column: "entity0", name: "l_instrument_place_fk_entity0"
  add_foreign_key "l_instrument_place", "link", column: "link", name: "l_instrument_place_fk_link"
  add_foreign_key "l_instrument_place", "place", column: "entity1", name: "l_instrument_place_fk_entity1"
  add_foreign_key "l_instrument_recording", "instrument", column: "entity0", name: "l_instrument_recording_fk_entity0"
  add_foreign_key "l_instrument_recording", "link", column: "link", name: "l_instrument_recording_fk_link"
  add_foreign_key "l_instrument_recording", "recording", column: "entity1", name: "l_instrument_recording_fk_entity1"
  add_foreign_key "l_instrument_release", "instrument", column: "entity0", name: "l_instrument_release_fk_entity0"
  add_foreign_key "l_instrument_release", "link", column: "link", name: "l_instrument_release_fk_link"
  add_foreign_key "l_instrument_release", "release", column: "entity1", name: "l_instrument_release_fk_entity1"
  add_foreign_key "l_instrument_release_group", "instrument", column: "entity0", name: "l_instrument_release_group_fk_entity0"
  add_foreign_key "l_instrument_release_group", "link", column: "link", name: "l_instrument_release_group_fk_link"
  add_foreign_key "l_instrument_release_group", "release_group", column: "entity1", name: "l_instrument_release_group_fk_entity1"
  add_foreign_key "l_instrument_series", "instrument", column: "entity0", name: "l_instrument_series_fk_entity0"
  add_foreign_key "l_instrument_series", "link", column: "link", name: "l_instrument_series_fk_link"
  add_foreign_key "l_instrument_series", "series", column: "entity1", name: "l_instrument_series_fk_entity1"
  add_foreign_key "l_instrument_url", "instrument", column: "entity0", name: "l_instrument_url_fk_entity0"
  add_foreign_key "l_instrument_url", "link", column: "link", name: "l_instrument_url_fk_link"
  add_foreign_key "l_instrument_url", "url", column: "entity1", name: "l_instrument_url_fk_entity1"
  add_foreign_key "l_instrument_work", "instrument", column: "entity0", name: "l_instrument_work_fk_entity0"
  add_foreign_key "l_instrument_work", "link", column: "link", name: "l_instrument_work_fk_link"
  add_foreign_key "l_instrument_work", "work", column: "entity1", name: "l_instrument_work_fk_entity1"
  add_foreign_key "l_label_label", "label", column: "entity0", name: "l_label_label_fk_entity0"
  add_foreign_key "l_label_label", "label", column: "entity1", name: "l_label_label_fk_entity1"
  add_foreign_key "l_label_label", "link", column: "link", name: "l_label_label_fk_link"
  add_foreign_key "l_label_place", "label", column: "entity0", name: "l_label_place_fk_entity0"
  add_foreign_key "l_label_place", "link", column: "link", name: "l_label_place_fk_link"
  add_foreign_key "l_label_place", "place", column: "entity1", name: "l_label_place_fk_entity1"
  add_foreign_key "l_label_recording", "label", column: "entity0", name: "l_label_recording_fk_entity0"
  add_foreign_key "l_label_recording", "link", column: "link", name: "l_label_recording_fk_link"
  add_foreign_key "l_label_recording", "recording", column: "entity1", name: "l_label_recording_fk_entity1"
  add_foreign_key "l_label_release", "label", column: "entity0", name: "l_label_release_fk_entity0"
  add_foreign_key "l_label_release", "link", column: "link", name: "l_label_release_fk_link"
  add_foreign_key "l_label_release", "release", column: "entity1", name: "l_label_release_fk_entity1"
  add_foreign_key "l_label_release_group", "label", column: "entity0", name: "l_label_release_group_fk_entity0"
  add_foreign_key "l_label_release_group", "link", column: "link", name: "l_label_release_group_fk_link"
  add_foreign_key "l_label_release_group", "release_group", column: "entity1", name: "l_label_release_group_fk_entity1"
  add_foreign_key "l_label_series", "label", column: "entity0", name: "l_label_series_fk_entity0"
  add_foreign_key "l_label_series", "link", column: "link", name: "l_label_series_fk_link"
  add_foreign_key "l_label_series", "series", column: "entity1", name: "l_label_series_fk_entity1"
  add_foreign_key "l_label_url", "label", column: "entity0", name: "l_label_url_fk_entity0"
  add_foreign_key "l_label_url", "link", column: "link", name: "l_label_url_fk_link"
  add_foreign_key "l_label_url", "url", column: "entity1", name: "l_label_url_fk_entity1"
  add_foreign_key "l_label_work", "label", column: "entity0", name: "l_label_work_fk_entity0"
  add_foreign_key "l_label_work", "link", column: "link", name: "l_label_work_fk_link"
  add_foreign_key "l_label_work", "work", column: "entity1", name: "l_label_work_fk_entity1"
  add_foreign_key "l_place_place", "link", column: "link", name: "l_place_place_fk_link"
  add_foreign_key "l_place_place", "place", column: "entity0", name: "l_place_place_fk_entity0"
  add_foreign_key "l_place_place", "place", column: "entity1", name: "l_place_place_fk_entity1"
  add_foreign_key "l_place_recording", "link", column: "link", name: "l_place_recording_fk_link"
  add_foreign_key "l_place_recording", "place", column: "entity0", name: "l_place_recording_fk_entity0"
  add_foreign_key "l_place_recording", "recording", column: "entity1", name: "l_place_recording_fk_entity1"
  add_foreign_key "l_place_release", "link", column: "link", name: "l_place_release_fk_link"
  add_foreign_key "l_place_release", "place", column: "entity0", name: "l_place_release_fk_entity0"
  add_foreign_key "l_place_release", "release", column: "entity1", name: "l_place_release_fk_entity1"
  add_foreign_key "l_place_release_group", "link", column: "link", name: "l_place_release_group_fk_link"
  add_foreign_key "l_place_release_group", "place", column: "entity0", name: "l_place_release_group_fk_entity0"
  add_foreign_key "l_place_release_group", "release_group", column: "entity1", name: "l_place_release_group_fk_entity1"
  add_foreign_key "l_place_series", "link", column: "link", name: "l_place_series_fk_link"
  add_foreign_key "l_place_series", "place", column: "entity0", name: "l_place_series_fk_entity0"
  add_foreign_key "l_place_series", "series", column: "entity1", name: "l_place_series_fk_entity1"
  add_foreign_key "l_place_url", "link", column: "link", name: "l_place_url_fk_link"
  add_foreign_key "l_place_url", "place", column: "entity0", name: "l_place_url_fk_entity0"
  add_foreign_key "l_place_url", "url", column: "entity1", name: "l_place_url_fk_entity1"
  add_foreign_key "l_place_work", "link", column: "link", name: "l_place_work_fk_link"
  add_foreign_key "l_place_work", "place", column: "entity0", name: "l_place_work_fk_entity0"
  add_foreign_key "l_place_work", "work", column: "entity1", name: "l_place_work_fk_entity1"
  add_foreign_key "l_recording_recording", "link", column: "link", name: "l_recording_recording_fk_link"
  add_foreign_key "l_recording_recording", "recording", column: "entity0", name: "l_recording_recording_fk_entity0"
  add_foreign_key "l_recording_recording", "recording", column: "entity1", name: "l_recording_recording_fk_entity1"
  add_foreign_key "l_recording_release", "link", column: "link", name: "l_recording_release_fk_link"
  add_foreign_key "l_recording_release", "recording", column: "entity0", name: "l_recording_release_fk_entity0"
  add_foreign_key "l_recording_release", "release", column: "entity1", name: "l_recording_release_fk_entity1"
  add_foreign_key "l_recording_release_group", "link", column: "link", name: "l_recording_release_group_fk_link"
  add_foreign_key "l_recording_release_group", "recording", column: "entity0", name: "l_recording_release_group_fk_entity0"
  add_foreign_key "l_recording_release_group", "release_group", column: "entity1", name: "l_recording_release_group_fk_entity1"
  add_foreign_key "l_recording_series", "link", column: "link", name: "l_recording_series_fk_link"
  add_foreign_key "l_recording_series", "recording", column: "entity0", name: "l_recording_series_fk_entity0"
  add_foreign_key "l_recording_series", "series", column: "entity1", name: "l_recording_series_fk_entity1"
  add_foreign_key "l_recording_url", "link", column: "link", name: "l_recording_url_fk_link"
  add_foreign_key "l_recording_url", "recording", column: "entity0", name: "l_recording_url_fk_entity0"
  add_foreign_key "l_recording_url", "url", column: "entity1", name: "l_recording_url_fk_entity1"
  add_foreign_key "l_recording_work", "link", column: "link", name: "l_recording_work_fk_link"
  add_foreign_key "l_recording_work", "recording", column: "entity0", name: "l_recording_work_fk_entity0"
  add_foreign_key "l_recording_work", "work", column: "entity1", name: "l_recording_work_fk_entity1"
  add_foreign_key "l_release_group_release_group", "link", column: "link", name: "l_release_group_release_group_fk_link"
  add_foreign_key "l_release_group_release_group", "release_group", column: "entity0", name: "l_release_group_release_group_fk_entity0"
  add_foreign_key "l_release_group_release_group", "release_group", column: "entity1", name: "l_release_group_release_group_fk_entity1"
  add_foreign_key "l_release_group_series", "link", column: "link", name: "l_release_group_series_fk_link"
  add_foreign_key "l_release_group_series", "release_group", column: "entity0", name: "l_release_group_series_fk_entity0"
  add_foreign_key "l_release_group_series", "series", column: "entity1", name: "l_release_group_series_fk_entity1"
  add_foreign_key "l_release_group_url", "link", column: "link", name: "l_release_group_url_fk_link"
  add_foreign_key "l_release_group_url", "release_group", column: "entity0", name: "l_release_group_url_fk_entity0"
  add_foreign_key "l_release_group_url", "url", column: "entity1", name: "l_release_group_url_fk_entity1"
  add_foreign_key "l_release_group_work", "link", column: "link", name: "l_release_group_work_fk_link"
  add_foreign_key "l_release_group_work", "release_group", column: "entity0", name: "l_release_group_work_fk_entity0"
  add_foreign_key "l_release_group_work", "work", column: "entity1", name: "l_release_group_work_fk_entity1"
  add_foreign_key "l_release_release", "link", column: "link", name: "l_release_release_fk_link"
  add_foreign_key "l_release_release", "release", column: "entity0", name: "l_release_release_fk_entity0"
  add_foreign_key "l_release_release", "release", column: "entity1", name: "l_release_release_fk_entity1"
  add_foreign_key "l_release_release_group", "link", column: "link", name: "l_release_release_group_fk_link"
  add_foreign_key "l_release_release_group", "release", column: "entity0", name: "l_release_release_group_fk_entity0"
  add_foreign_key "l_release_release_group", "release_group", column: "entity1", name: "l_release_release_group_fk_entity1"
  add_foreign_key "l_release_series", "link", column: "link", name: "l_release_series_fk_link"
  add_foreign_key "l_release_series", "release", column: "entity0", name: "l_release_series_fk_entity0"
  add_foreign_key "l_release_series", "series", column: "entity1", name: "l_release_series_fk_entity1"
  add_foreign_key "l_release_url", "link", column: "link", name: "l_release_url_fk_link"
  add_foreign_key "l_release_url", "release", column: "entity0", name: "l_release_url_fk_entity0"
  add_foreign_key "l_release_url", "url", column: "entity1", name: "l_release_url_fk_entity1"
  add_foreign_key "l_release_work", "link", column: "link", name: "l_release_work_fk_link"
  add_foreign_key "l_release_work", "release", column: "entity0", name: "l_release_work_fk_entity0"
  add_foreign_key "l_release_work", "work", column: "entity1", name: "l_release_work_fk_entity1"
  add_foreign_key "l_series_series", "link", column: "link", name: "l_series_series_fk_link"
  add_foreign_key "l_series_series", "series", column: "entity0", name: "l_series_series_fk_entity0"
  add_foreign_key "l_series_series", "series", column: "entity1", name: "l_series_series_fk_entity1"
  add_foreign_key "l_series_url", "link", column: "link", name: "l_series_url_fk_link"
  add_foreign_key "l_series_url", "series", column: "entity0", name: "l_series_url_fk_entity0"
  add_foreign_key "l_series_url", "url", column: "entity1", name: "l_series_url_fk_entity1"
  add_foreign_key "l_series_work", "link", column: "link", name: "l_series_work_fk_link"
  add_foreign_key "l_series_work", "series", column: "entity0", name: "l_series_work_fk_entity0"
  add_foreign_key "l_series_work", "work", column: "entity1", name: "l_series_work_fk_entity1"
  add_foreign_key "l_url_url", "link", column: "link", name: "l_url_url_fk_link"
  add_foreign_key "l_url_url", "url", column: "entity0", name: "l_url_url_fk_entity0"
  add_foreign_key "l_url_url", "url", column: "entity1", name: "l_url_url_fk_entity1"
  add_foreign_key "l_url_work", "link", column: "link", name: "l_url_work_fk_link"
  add_foreign_key "l_url_work", "url", column: "entity0", name: "l_url_work_fk_entity0"
  add_foreign_key "l_url_work", "work", column: "entity1", name: "l_url_work_fk_entity1"
  add_foreign_key "l_work_work", "link", column: "link", name: "l_work_work_fk_link"
  add_foreign_key "l_work_work", "work", column: "entity0", name: "l_work_work_fk_entity0"
  add_foreign_key "l_work_work", "work", column: "entity1", name: "l_work_work_fk_entity1"
  add_foreign_key "label", "area", column: "area", name: "label_fk_area"
  add_foreign_key "label", "label_type", column: "type", name: "label_fk_type"
  add_foreign_key "label_alias", "label", column: "label", name: "label_alias_fk_label"
  add_foreign_key "label_alias", "label_alias_type", column: "type", name: "label_alias_fk_type"
  add_foreign_key "label_alias_type", "label_alias_type", column: "parent", name: "label_alias_type_fk_parent"
  add_foreign_key "label_annotation", "annotation", column: "annotation", name: "label_annotation_fk_annotation"
  add_foreign_key "label_annotation", "label", column: "label", name: "label_annotation_fk_label"
  add_foreign_key "label_attribute", "label", column: "label", name: "label_attribute_fk_label"
  add_foreign_key "label_attribute", "label_attribute_type", column: "label_attribute_type", name: "label_attribute_fk_label_attribute_type"
  add_foreign_key "label_attribute", "label_attribute_type_allowed_value", column: "label_attribute_type_allowed_value", name: "label_attribute_fk_label_attribute_type_allowed_value"
  add_foreign_key "label_attribute_type", "label_attribute_type", column: "parent", name: "label_attribute_type_fk_parent"
  add_foreign_key "label_attribute_type_allowed_value", "label_attribute_type", column: "label_attribute_type", name: "label_attribute_type_allowed_value_fk_label_attribute_type"
  add_foreign_key "label_attribute_type_allowed_value", "label_attribute_type_allowed_value", column: "parent", name: "label_attribute_type_allowed_value_fk_parent"
  add_foreign_key "label_gid_redirect", "label", column: "new_id", name: "label_gid_redirect_fk_new_id"
  add_foreign_key "label_ipi", "label", column: "label", name: "label_ipi_fk_label"
  add_foreign_key "label_isni", "label", column: "label", name: "label_isni_fk_label"
  add_foreign_key "label_meta", "label", column: "id", name: "label_meta_fk_id", on_delete: :cascade
  add_foreign_key "label_rating_raw", "editor", column: "editor", name: "label_rating_raw_fk_editor"
  add_foreign_key "label_rating_raw", "label", column: "label", name: "label_rating_raw_fk_label"
  add_foreign_key "label_tag", "label", column: "label", name: "label_tag_fk_label"
  add_foreign_key "label_tag", "tag", column: "tag", name: "label_tag_fk_tag"
  add_foreign_key "label_tag_raw", "editor", column: "editor", name: "label_tag_raw_fk_editor"
  add_foreign_key "label_tag_raw", "label", column: "label", name: "label_tag_raw_fk_label"
  add_foreign_key "label_tag_raw", "tag", column: "tag", name: "label_tag_raw_fk_tag"
  add_foreign_key "label_type", "label_type", column: "parent", name: "label_type_fk_parent"
  add_foreign_key "link", "link_type", column: "link_type", name: "link_fk_link_type"
  add_foreign_key "link_attribute", "link", column: "link", name: "link_attribute_fk_link"
  add_foreign_key "link_attribute", "link_attribute_type", column: "attribute_type", name: "link_attribute_fk_attribute_type"
  add_foreign_key "link_attribute_credit", "link", column: "link", name: "link_attribute_credit_fk_link"
  add_foreign_key "link_attribute_credit", "link_creditable_attribute_type", column: "attribute_type", primary_key: "attribute_type", name: "link_attribute_credit_fk_attribute_type"
  add_foreign_key "link_attribute_text_value", "link", column: "link", name: "link_attribute_text_value_fk_link"
  add_foreign_key "link_attribute_text_value", "link_text_attribute_type", column: "attribute_type", primary_key: "attribute_type", name: "link_attribute_text_value_fk_attribute_type"
  add_foreign_key "link_attribute_type", "link_attribute_type", column: "parent", name: "link_attribute_type_fk_parent"
  add_foreign_key "link_attribute_type", "link_attribute_type", column: "root", name: "link_attribute_type_fk_root"
  add_foreign_key "link_creditable_attribute_type", "link_attribute_type", column: "attribute_type", name: "link_creditable_attribute_type_fk_attribute_type", on_delete: :cascade
  add_foreign_key "link_text_attribute_type", "link_attribute_type", column: "attribute_type", name: "link_text_attribute_type_fk_attribute_type", on_delete: :cascade
  add_foreign_key "link_type", "link_type", column: "parent", name: "link_type_fk_parent"
  add_foreign_key "link_type_attribute_type", "link_attribute_type", column: "attribute_type", name: "link_type_attribute_type_fk_attribute_type"
  add_foreign_key "link_type_attribute_type", "link_type", column: "link_type", name: "link_type_attribute_type_fk_link_type"
  add_foreign_key "medium", "medium_format", column: "format", name: "medium_fk_format"
  add_foreign_key "medium", "release", column: "release", name: "medium_fk_release"
  add_foreign_key "medium_attribute", "medium", column: "medium", name: "medium_attribute_fk_medium"
  add_foreign_key "medium_attribute", "medium_attribute_type", column: "medium_attribute_type", name: "medium_attribute_fk_medium_attribute_type"
  add_foreign_key "medium_attribute", "medium_attribute_type_allowed_value", column: "medium_attribute_type_allowed_value", name: "medium_attribute_fk_medium_attribute_type_allowed_value"
  add_foreign_key "medium_attribute_type", "medium_attribute_type", column: "parent", name: "medium_attribute_type_fk_parent"
  add_foreign_key "medium_attribute_type_allowed_format", "medium_attribute_type", column: "medium_attribute_type", name: "medium_attribute_type_allowed_format_fk_medium_attribute_type"
  add_foreign_key "medium_attribute_type_allowed_format", "medium_format", column: "medium_format", name: "medium_attribute_type_allowed_format_fk_medium_format"
  add_foreign_key "medium_attribute_type_allowed_value", "medium_attribute_type", column: "medium_attribute_type", name: "medium_attribute_type_allowed_value_fk_medium_attribute_type"
  add_foreign_key "medium_attribute_type_allowed_value", "medium_attribute_type_allowed_value", column: "parent", name: "medium_attribute_type_allowed_value_fk_parent"
  add_foreign_key "medium_attribute_type_allowed_value_allowed_format", "medium_attribute_type_allowed_value", column: "medium_attribute_type_allowed_value", name: "medium_attribute_type_allowed_value_allowed_format_fk_medium_at"
  add_foreign_key "medium_attribute_type_allowed_value_allowed_format", "medium_format", column: "medium_format", name: "medium_attribute_type_allowed_value_allowed_format_fk_medium_fo"
  add_foreign_key "medium_cdtoc", "cdtoc", column: "cdtoc", name: "medium_cdtoc_fk_cdtoc"
  add_foreign_key "medium_cdtoc", "medium", column: "medium", name: "medium_cdtoc_fk_medium"
  add_foreign_key "medium_format", "medium_format", column: "parent", name: "medium_format_fk_parent"
  add_foreign_key "medium_index", "medium", column: "medium", name: "medium_index_fk_medium", on_delete: :cascade
  add_foreign_key "orderable_link_type", "link_type", column: "link_type", name: "orderable_link_type_fk_link_type"
  add_foreign_key "place", "area", column: "area", name: "place_fk_area"
  add_foreign_key "place", "place_type", column: "type", name: "place_fk_type"
  add_foreign_key "place_alias", "place", column: "place", name: "place_alias_fk_place"
  add_foreign_key "place_alias", "place_alias_type", column: "type", name: "place_alias_fk_type"
  add_foreign_key "place_alias_type", "place_alias_type", column: "parent", name: "place_alias_type_fk_parent"
  add_foreign_key "place_annotation", "annotation", column: "annotation", name: "place_annotation_fk_annotation"
  add_foreign_key "place_annotation", "place", column: "place", name: "place_annotation_fk_place"
  add_foreign_key "place_attribute", "place", column: "place", name: "place_attribute_fk_place"
  add_foreign_key "place_attribute", "place_attribute_type", column: "place_attribute_type", name: "place_attribute_fk_place_attribute_type"
  add_foreign_key "place_attribute", "place_attribute_type_allowed_value", column: "place_attribute_type_allowed_value", name: "place_attribute_fk_place_attribute_type_allowed_value"
  add_foreign_key "place_attribute_type", "place_attribute_type", column: "parent", name: "place_attribute_type_fk_parent"
  add_foreign_key "place_attribute_type_allowed_value", "place_attribute_type", column: "place_attribute_type", name: "place_attribute_type_allowed_value_fk_place_attribute_type"
  add_foreign_key "place_attribute_type_allowed_value", "place_attribute_type_allowed_value", column: "parent", name: "place_attribute_type_allowed_value_fk_parent"
  add_foreign_key "place_gid_redirect", "place", column: "new_id", name: "place_gid_redirect_fk_new_id"
  add_foreign_key "place_tag", "place", column: "place", name: "place_tag_fk_place"
  add_foreign_key "place_tag", "tag", column: "tag", name: "place_tag_fk_tag"
  add_foreign_key "place_tag_raw", "editor", column: "editor", name: "place_tag_raw_fk_editor"
  add_foreign_key "place_tag_raw", "place", column: "place", name: "place_tag_raw_fk_place"
  add_foreign_key "place_tag_raw", "tag", column: "tag", name: "place_tag_raw_fk_tag"
  add_foreign_key "place_type", "place_type", column: "parent", name: "place_type_fk_parent"
  add_foreign_key "recording", "artist_credit", column: "artist_credit", name: "recording_fk_artist_credit"
  add_foreign_key "recording_alias", "recording", column: "recording", name: "recording_alias_fk_recording"
  add_foreign_key "recording_alias", "recording_alias_type", column: "type", name: "recording_alias_fk_type"
  add_foreign_key "recording_alias_type", "recording_alias_type", column: "parent", name: "recording_alias_type_fk_parent"
  add_foreign_key "recording_annotation", "annotation", column: "annotation", name: "recording_annotation_fk_annotation"
  add_foreign_key "recording_annotation", "recording", column: "recording", name: "recording_annotation_fk_recording"
  add_foreign_key "recording_attribute", "recording", column: "recording", name: "recording_attribute_fk_recording"
  add_foreign_key "recording_attribute", "recording_attribute_type", column: "recording_attribute_type", name: "recording_attribute_fk_recording_attribute_type"
  add_foreign_key "recording_attribute", "recording_attribute_type_allowed_value", column: "recording_attribute_type_allowed_value", name: "recording_attribute_fk_recording_attribute_type_allowed_value"
  add_foreign_key "recording_attribute_type", "recording_attribute_type", column: "parent", name: "recording_attribute_type_fk_parent"
  add_foreign_key "recording_attribute_type_allowed_value", "recording_attribute_type", column: "recording_attribute_type", name: "recording_attribute_type_allowed_value_fk_recording_attribute_t"
  add_foreign_key "recording_attribute_type_allowed_value", "recording_attribute_type_allowed_value", column: "parent", name: "recording_attribute_type_allowed_value_fk_parent"
  add_foreign_key "recording_gid_redirect", "recording", column: "new_id", name: "recording_gid_redirect_fk_new_id"
  add_foreign_key "recording_meta", "recording", column: "id", name: "recording_meta_fk_id", on_delete: :cascade
  add_foreign_key "recording_rating_raw", "editor", column: "editor", name: "recording_rating_raw_fk_editor"
  add_foreign_key "recording_rating_raw", "recording", column: "recording", name: "recording_rating_raw_fk_recording"
  add_foreign_key "recording_tag", "recording", column: "recording", name: "recording_tag_fk_recording"
  add_foreign_key "recording_tag", "tag", column: "tag", name: "recording_tag_fk_tag"
  add_foreign_key "recording_tag_raw", "editor", column: "editor", name: "recording_tag_raw_fk_editor"
  add_foreign_key "recording_tag_raw", "recording", column: "recording", name: "recording_tag_raw_fk_recording"
  add_foreign_key "recording_tag_raw", "tag", column: "tag", name: "recording_tag_raw_fk_tag"
  add_foreign_key "release", "artist_credit", column: "artist_credit", name: "release_fk_artist_credit"
  add_foreign_key "release", "language", column: "language", name: "release_fk_language"
  add_foreign_key "release", "release_group", column: "release_group", name: "release_fk_release_group"
  add_foreign_key "release", "release_packaging", column: "packaging", name: "release_fk_packaging"
  add_foreign_key "release", "release_status", column: "status", name: "release_fk_status"
  add_foreign_key "release", "script", column: "script", name: "release_fk_script"
  add_foreign_key "release_alias", "release", column: "release", name: "release_alias_fk_release"
  add_foreign_key "release_alias", "release_alias_type", column: "type", name: "release_alias_fk_type"
  add_foreign_key "release_alias_type", "release_alias_type", column: "parent", name: "release_alias_type_fk_parent"
  add_foreign_key "release_annotation", "annotation", column: "annotation", name: "release_annotation_fk_annotation"
  add_foreign_key "release_annotation", "release", column: "release", name: "release_annotation_fk_release"
  add_foreign_key "release_attribute", "release", column: "release", name: "release_attribute_fk_release"
  add_foreign_key "release_attribute", "release_attribute_type", column: "release_attribute_type", name: "release_attribute_fk_release_attribute_type"
  add_foreign_key "release_attribute", "release_attribute_type_allowed_value", column: "release_attribute_type_allowed_value", name: "release_attribute_fk_release_attribute_type_allowed_value"
  add_foreign_key "release_attribute_type", "release_attribute_type", column: "parent", name: "release_attribute_type_fk_parent"
  add_foreign_key "release_attribute_type_allowed_value", "release_attribute_type", column: "release_attribute_type", name: "release_attribute_type_allowed_value_fk_release_attribute_type"
  add_foreign_key "release_attribute_type_allowed_value", "release_attribute_type_allowed_value", column: "parent", name: "release_attribute_type_allowed_value_fk_parent"
  add_foreign_key "release_country", "country_area", column: "country", primary_key: "area", name: "release_country_fk_country"
  add_foreign_key "release_country", "release", column: "release", name: "release_country_fk_release"
  add_foreign_key "release_coverart", "release", column: "id", name: "release_coverart_fk_id", on_delete: :cascade
  add_foreign_key "release_gid_redirect", "release", column: "new_id", name: "release_gid_redirect_fk_new_id"
  add_foreign_key "release_group", "artist_credit", column: "artist_credit", name: "release_group_fk_artist_credit"
  add_foreign_key "release_group", "release_group_primary_type", column: "type", name: "release_group_fk_type"
  add_foreign_key "release_group_alias", "release_group", column: "release_group", name: "release_group_alias_fk_release_group"
  add_foreign_key "release_group_alias", "release_group_alias_type", column: "type", name: "release_group_alias_fk_type"
  add_foreign_key "release_group_alias_type", "release_group_alias_type", column: "parent", name: "release_group_alias_type_fk_parent"
  add_foreign_key "release_group_annotation", "annotation", column: "annotation", name: "release_group_annotation_fk_annotation"
  add_foreign_key "release_group_annotation", "release_group", column: "release_group", name: "release_group_annotation_fk_release_group"
  add_foreign_key "release_group_attribute", "release_group", column: "release_group", name: "release_group_attribute_fk_release_group"
  add_foreign_key "release_group_attribute", "release_group_attribute_type", column: "release_group_attribute_type", name: "release_group_attribute_fk_release_group_attribute_type"
  add_foreign_key "release_group_attribute", "release_group_attribute_type_allowed_value", column: "release_group_attribute_type_allowed_value", name: "release_group_attribute_fk_release_group_attribute_type_allowed"
  add_foreign_key "release_group_attribute_type", "release_group_attribute_type", column: "parent", name: "release_group_attribute_type_fk_parent"
  add_foreign_key "release_group_attribute_type_allowed_value", "release_group_attribute_type", column: "release_group_attribute_type", name: "release_group_attribute_type_allowed_value_fk_release_group_att"
  add_foreign_key "release_group_attribute_type_allowed_value", "release_group_attribute_type_allowed_value", column: "parent", name: "release_group_attribute_type_allowed_value_fk_parent"
  add_foreign_key "release_group_gid_redirect", "release_group", column: "new_id", name: "release_group_gid_redirect_fk_new_id"
  add_foreign_key "release_group_meta", "release_group", column: "id", name: "release_group_meta_fk_id", on_delete: :cascade
  add_foreign_key "release_group_primary_type", "release_group_primary_type", column: "parent", name: "release_group_primary_type_fk_parent"
  add_foreign_key "release_group_rating_raw", "editor", column: "editor", name: "release_group_rating_raw_fk_editor"
  add_foreign_key "release_group_rating_raw", "release_group", column: "release_group", name: "release_group_rating_raw_fk_release_group"
  add_foreign_key "release_group_secondary_type", "release_group_secondary_type", column: "parent", name: "release_group_secondary_type_fk_parent"
  add_foreign_key "release_group_secondary_type_join", "release_group", column: "release_group", name: "release_group_secondary_type_join_fk_release_group"
  add_foreign_key "release_group_secondary_type_join", "release_group_secondary_type", column: "secondary_type", name: "release_group_secondary_type_join_fk_secondary_type"
  add_foreign_key "release_group_tag", "release_group", column: "release_group", name: "release_group_tag_fk_release_group"
  add_foreign_key "release_group_tag", "tag", column: "tag", name: "release_group_tag_fk_tag"
  add_foreign_key "release_group_tag_raw", "editor", column: "editor", name: "release_group_tag_raw_fk_editor"
  add_foreign_key "release_group_tag_raw", "release_group", column: "release_group", name: "release_group_tag_raw_fk_release_group"
  add_foreign_key "release_group_tag_raw", "tag", column: "tag", name: "release_group_tag_raw_fk_tag"
  add_foreign_key "release_label", "label", column: "label", name: "release_label_fk_label"
  add_foreign_key "release_label", "release", column: "release", name: "release_label_fk_release"
  add_foreign_key "release_meta", "release", column: "id", name: "release_meta_fk_id", on_delete: :cascade
  add_foreign_key "release_packaging", "release_packaging", column: "parent", name: "release_packaging_fk_parent"
  add_foreign_key "release_status", "release_status", column: "parent", name: "release_status_fk_parent"
  add_foreign_key "release_tag", "release", column: "release", name: "release_tag_fk_release"
  add_foreign_key "release_tag", "tag", column: "tag", name: "release_tag_fk_tag"
  add_foreign_key "release_tag_raw", "editor", column: "editor", name: "release_tag_raw_fk_editor"
  add_foreign_key "release_tag_raw", "release", column: "release", name: "release_tag_raw_fk_release"
  add_foreign_key "release_tag_raw", "tag", column: "tag", name: "release_tag_raw_fk_tag"
  add_foreign_key "release_unknown_country", "release", column: "release", name: "release_unknown_country_fk_release"
  add_foreign_key "series", "link_text_attribute_type", column: "ordering_attribute", primary_key: "attribute_type", name: "series_fk_ordering_attribute"
  add_foreign_key "series", "series_ordering_type", column: "ordering_type", name: "series_fk_ordering_type"
  add_foreign_key "series", "series_type", column: "type", name: "series_fk_type"
  add_foreign_key "series_alias", "series", column: "series", name: "series_alias_fk_series"
  add_foreign_key "series_alias", "series_alias_type", column: "type", name: "series_alias_fk_type"
  add_foreign_key "series_alias_type", "series_alias_type", column: "parent", name: "series_alias_type_fk_parent"
  add_foreign_key "series_annotation", "annotation", column: "annotation", name: "series_annotation_fk_annotation"
  add_foreign_key "series_annotation", "series", column: "series", name: "series_annotation_fk_series"
  add_foreign_key "series_attribute", "series", column: "series", name: "series_attribute_fk_series"
  add_foreign_key "series_attribute", "series_attribute_type", column: "series_attribute_type", name: "series_attribute_fk_series_attribute_type"
  add_foreign_key "series_attribute", "series_attribute_type_allowed_value", column: "series_attribute_type_allowed_value", name: "series_attribute_fk_series_attribute_type_allowed_value"
  add_foreign_key "series_attribute_type", "series_attribute_type", column: "parent", name: "series_attribute_type_fk_parent"
  add_foreign_key "series_attribute_type_allowed_value", "series_attribute_type", column: "series_attribute_type", name: "series_attribute_type_allowed_value_fk_series_attribute_type"
  add_foreign_key "series_attribute_type_allowed_value", "series_attribute_type_allowed_value", column: "parent", name: "series_attribute_type_allowed_value_fk_parent"
  add_foreign_key "series_gid_redirect", "series", column: "new_id", name: "series_gid_redirect_fk_new_id"
  add_foreign_key "series_ordering_type", "series_ordering_type", column: "parent", name: "series_ordering_type_fk_parent"
  add_foreign_key "series_tag", "series", column: "series", name: "series_tag_fk_series"
  add_foreign_key "series_tag", "tag", column: "tag", name: "series_tag_fk_tag"
  add_foreign_key "series_tag_raw", "editor", column: "editor", name: "series_tag_raw_fk_editor"
  add_foreign_key "series_tag_raw", "series", column: "series", name: "series_tag_raw_fk_series"
  add_foreign_key "series_tag_raw", "tag", column: "tag", name: "series_tag_raw_fk_tag"
  add_foreign_key "series_type", "series_type", column: "parent", name: "series_type_fk_parent"
  add_foreign_key "tag_relation", "tag", column: "tag1", name: "tag_relation_fk_tag1"
  add_foreign_key "tag_relation", "tag", column: "tag2", name: "tag_relation_fk_tag2"
  add_foreign_key "track", "artist_credit", column: "artist_credit", name: "track_fk_artist_credit"
  add_foreign_key "track", "medium", column: "medium", name: "track_fk_medium"
  add_foreign_key "track", "recording", column: "recording", name: "track_fk_recording"
  add_foreign_key "track_gid_redirect", "track", column: "new_id", name: "track_gid_redirect_fk_new_id"
  add_foreign_key "track_raw", "release_raw", column: "release", name: "track_raw_fk_release"
  add_foreign_key "url_gid_redirect", "url", column: "new_id", name: "url_gid_redirect_fk_new_id"
  add_foreign_key "vote", "edit", column: "edit", name: "vote_fk_edit"
  add_foreign_key "vote", "editor", column: "editor", name: "vote_fk_editor"
  add_foreign_key "work", "work_type", column: "type", name: "work_fk_type"
  add_foreign_key "work_alias", "work", column: "work", name: "work_alias_fk_work"
  add_foreign_key "work_alias", "work_alias_type", column: "type", name: "work_alias_fk_type"
  add_foreign_key "work_alias_type", "work_alias_type", column: "parent", name: "work_alias_type_fk_parent"
  add_foreign_key "work_annotation", "annotation", column: "annotation", name: "work_annotation_fk_annotation"
  add_foreign_key "work_annotation", "work", column: "work", name: "work_annotation_fk_work"
  add_foreign_key "work_attribute", "work", column: "work", name: "work_attribute_fk_work"
  add_foreign_key "work_attribute", "work_attribute_type", column: "work_attribute_type", name: "work_attribute_fk_work_attribute_type"
  add_foreign_key "work_attribute", "work_attribute_type_allowed_value", column: "work_attribute_type_allowed_value", name: "work_attribute_fk_work_attribute_type_allowed_value"
  add_foreign_key "work_attribute_type", "work_attribute_type", column: "parent", name: "work_attribute_type_fk_parent"
  add_foreign_key "work_attribute_type_allowed_value", "work_attribute_type", column: "work_attribute_type", name: "work_attribute_type_allowed_value_fk_work_attribute_type"
  add_foreign_key "work_attribute_type_allowed_value", "work_attribute_type_allowed_value", column: "parent", name: "work_attribute_type_allowed_value_fk_parent"
  add_foreign_key "work_gid_redirect", "work", column: "new_id", name: "work_gid_redirect_fk_new_id"
  add_foreign_key "work_language", "language", column: "language", name: "work_language_fk_language"
  add_foreign_key "work_language", "work", column: "work", name: "work_language_fk_work"
  add_foreign_key "work_meta", "work", column: "id", name: "work_meta_fk_id", on_delete: :cascade
  add_foreign_key "work_rating_raw", "editor", column: "editor", name: "work_rating_raw_fk_editor"
  add_foreign_key "work_rating_raw", "work", column: "work", name: "work_rating_raw_fk_work"
  add_foreign_key "work_tag", "tag", column: "tag", name: "work_tag_fk_tag"
  add_foreign_key "work_tag", "work", column: "work", name: "work_tag_fk_work"
  add_foreign_key "work_tag_raw", "editor", column: "editor", name: "work_tag_raw_fk_editor"
  add_foreign_key "work_tag_raw", "tag", column: "tag", name: "work_tag_raw_fk_tag"
  add_foreign_key "work_tag_raw", "work", column: "work", name: "work_tag_raw_fk_work"
  add_foreign_key "work_type", "work_type", column: "parent", name: "work_type_fk_parent"
end
