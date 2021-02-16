# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
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
  enable_extension "unaccent"

  create_table "alternative_medium", id: :serial, force: :cascade do |t|
    t.integer "medium", null: false
    t.integer "alternative_release", null: false
    t.string "name"
    t.index ["alternative_release"], name: "alternative_medium_idx_alternative_release"
    t.check_constraint "(name)::text <> ''::text", name: "alternative_medium_name_check"
  end

  create_table "alternative_medium_track", primary_key: ["alternative_medium", "track"], force: :cascade do |t|
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
    t.index ["language", "script"], name: "alternative_release_idx_language_script"
    t.index ["name"], name: "alternative_release_idx_name"
    t.index ["release"], name: "alternative_release_idx_release"
    t.check_constraint "(name)::text <> ''::text", name: "alternative_release_name_check"
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
    t.check_constraint "((name)::text <> ''::text) AND ((name IS NOT NULL) OR (artist_credit IS NOT NULL))", name: "alternative_track_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "area_idx_name_txt", using: :gin
    t.index ["gid"], name: "area_idx_gid", unique: true
    t.index ["name"], name: "area_idx_name"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "area_check"
    t.check_constraint "edits_pending >= 0", name: "area_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "area_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "area_alias_idx_txt_sort", using: :gin
    t.index ["area", "locale"], name: "area_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["area"], name: "area_alias_idx_area"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "area_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "edits_pending >= 0", name: "area_alias_edits_pending_check"
  end

  create_table "area_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "area_alias_type_idx_gid", unique: true
  end

  create_table "area_annotation", primary_key: ["area", "annotation"], force: :cascade do |t|
    t.integer "area", null: false
    t.integer "annotation", null: false
  end

  create_table "area_attribute", id: :serial, force: :cascade do |t|
    t.integer "area", null: false
    t.integer "area_attribute_type", null: false
    t.integer "area_attribute_type_allowed_value"
    t.text "area_attribute_text"
    t.index ["area"], name: "area_attribute_idx_area"
    t.check_constraint "((area_attribute_type_allowed_value IS NULL) AND (area_attribute_text IS NOT NULL)) OR ((area_attribute_type_allowed_value IS NOT NULL) AND (area_attribute_text IS NULL))", name: "area_attribute_check"
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

  create_table "area_tag", primary_key: ["area", "tag"], force: :cascade do |t|
    t.integer "area", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "area_tag_idx_tag"
  end

  create_table "area_tag_raw", primary_key: ["area", "editor", "tag"], force: :cascade do |t|
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
    t.index "mb_simple_tsvector((name)::text)", name: "artist_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "artist_idx_txt_sort", using: :gin
    t.index ["area"], name: "artist_idx_area"
    t.index ["begin_area"], name: "artist_idx_begin_area"
    t.index ["end_area"], name: "artist_idx_end_area"
    t.index ["gid"], name: "artist_idx_gid", unique: true
    t.index ["name", "comment"], name: "artist_idx_uniq_name_comment", unique: true, where: "(comment IS NOT NULL)"
    t.index ["name"], name: "artist_idx_musicbrainz_collate"
    t.index ["name"], name: "artist_idx_name"
    t.index ["name"], name: "artist_idx_null_comment", unique: true, where: "(comment IS NULL)"
    t.index ["sort_name"], name: "artist_idx_sort_name"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "artist_ended_check"
    t.check_constraint "edits_pending >= 0", name: "artist_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "artist_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "artist_alias_idx_txt_sort", using: :gin
    t.index ["artist", "locale"], name: "artist_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["artist"], name: "artist_alias_idx_artist"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "artist_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 3) OR ((type = 3) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "artist_alias_edits_pending_check"
  end

  create_table "artist_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "artist_alias_type_idx_gid", unique: true
  end

  create_table "artist_annotation", primary_key: ["artist", "annotation"], force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "annotation", null: false
  end

  create_table "artist_attribute", id: :serial, force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "artist_attribute_type", null: false
    t.integer "artist_attribute_type_allowed_value"
    t.text "artist_attribute_text"
    t.index ["artist"], name: "artist_attribute_idx_artist"
    t.check_constraint "((artist_attribute_type_allowed_value IS NULL) AND (artist_attribute_text IS NOT NULL)) OR ((artist_attribute_type_allowed_value IS NOT NULL) AND (artist_attribute_text IS NULL))", name: "artist_attribute_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "artist_credit_idx_txt", using: :gin
    t.index ["name"], name: "artist_credit_idx_musicbrainz_collate"
    t.check_constraint "edits_pending >= 0", name: "artist_credit_edits_pending_check"
  end

  create_table "artist_credit_name", primary_key: ["artist_credit", "position"], force: :cascade do |t|
    t.integer "artist_credit", null: false
    t.integer "position", limit: 2, null: false
    t.integer "artist", null: false
    t.string "name", null: false
    t.text "join_phrase", default: "", null: false
    t.index "mb_simple_tsvector((name)::text)", name: "artist_credit_name_idx_txt", using: :gin
    t.index ["artist"], name: "artist_credit_name_idx_artist"
    t.index ["name"], name: "artist_credit_name_idx_musicbrainz_collate"
  end

  create_table "artist_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "artist_gid_redirect_idx_new_id"
  end

  create_table "artist_ipi", primary_key: ["artist", "ipi"], force: :cascade do |t|
    t.integer "artist", null: false
    t.string "ipi", limit: 11, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.check_constraint "edits_pending >= 0", name: "artist_ipi_edits_pending_check"
    t.check_constraint "ipi ~ '^\\d{11}$'::text", name: "artist_ipi_ipi_check"
  end

  create_table "artist_isni", primary_key: ["artist", "isni"], force: :cascade do |t|
    t.integer "artist", null: false
    t.string "isni", limit: 16, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.check_constraint "edits_pending >= 0", name: "artist_isni_edits_pending_check"
    t.check_constraint "isni ~ '^\\d{15}[\\dX]$'::text", name: "artist_isni_isni_check"
  end

  create_table "artist_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "artist_meta_rating_check"
  end

  create_table "artist_rating_raw", primary_key: ["artist", "editor"], force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["artist"], name: "artist_rating_raw_idx_artist"
    t.index ["editor"], name: "artist_rating_raw_idx_editor"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "artist_rating_raw_rating_check"
  end

  create_table "artist_tag", primary_key: ["artist", "tag"], force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "artist_tag_idx_tag"
  end

  create_table "artist_tag_raw", primary_key: ["artist", "editor", "tag"], force: :cascade do |t|
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
    t.check_constraint "status = ANY (ARRAY[1, 2, 3, 4, 5, 6])", name: "autoeditor_election_status_check"
  end

  create_table "autoeditor_election_vote", id: :serial, force: :cascade do |t|
    t.integer "autoeditor_election", null: false
    t.integer "voter", null: false
    t.integer "vote", null: false
    t.datetime "vote_time", default: -> { "now()" }, null: false
    t.check_constraint "vote = ANY (ARRAY['-1'::integer, 0, 1])", name: "autoeditor_election_vote_vote_check"
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
    t.index ["track_count", "leadout_offset", "track_offset"], name: "cdtoc_raw_toc", unique: true
  end

  create_table "country_area", primary_key: "area", id: :integer, default: nil, force: :cascade do |t|
  end

  create_table "dbmirror_pending", primary_key: "seqid", id: :serial, force: :cascade do |t|
    t.string "tablename", null: false
    t.string "op", limit: 1
    t.integer "xid", null: false
    t.index ["xid"], name: "dbmirror_pending_xid_index"
  end

  create_table "dbmirror_pendingdata", primary_key: ["seqid", "iskey"], force: :cascade do |t|
    t.integer "seqid", null: false
    t.boolean "iskey", null: false
    t.string "data"
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
    t.index ["editor", "id"], name: "edit_idx_editor_id_desc", order: { id: :desc }
    t.index ["editor", "open_time"], name: "edit_idx_editor_open_time"
    t.index ["expire_time"], name: "edit_idx_expire_time", using: :brin
    t.index ["open_time"], name: "edit_idx_open_time", using: :brin
    t.index ["status", "id"], name: "edit_idx_status_id", where: "(status <> 2)"
    t.index ["type", "id"], name: "edit_idx_type_id"
  end

  create_table "edit_area", primary_key: ["edit", "area"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "area", null: false
    t.index ["area"], name: "edit_area_idx"
  end

  create_table "edit_artist", primary_key: ["edit", "artist"], force: :cascade do |t|
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

  create_table "edit_event", primary_key: ["edit", "event"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "event", null: false
    t.index ["event"], name: "edit_event_idx"
  end

  create_table "edit_instrument", primary_key: ["edit", "instrument"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "instrument", null: false
    t.index ["instrument"], name: "edit_instrument_idx"
  end

  create_table "edit_label", primary_key: ["edit", "label"], force: :cascade do |t|
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
  end

  create_table "edit_note_recipient", primary_key: ["recipient", "edit_note"], force: :cascade do |t|
    t.integer "recipient", null: false
    t.integer "edit_note", null: false
    t.index ["recipient"], name: "edit_note_recipient_idx_recipient"
  end

  create_table "edit_place", primary_key: ["edit", "place"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "place", null: false
    t.index ["place"], name: "edit_place_idx"
  end

  create_table "edit_recording", primary_key: ["edit", "recording"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "recording", null: false
    t.index ["recording"], name: "edit_recording_idx"
  end

  create_table "edit_release", primary_key: ["edit", "release"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "release", null: false
    t.index ["release"], name: "edit_release_idx"
  end

  create_table "edit_release_group", primary_key: ["edit", "release_group"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "release_group", null: false
    t.index ["release_group"], name: "edit_release_group_idx"
  end

  create_table "edit_series", primary_key: ["edit", "series"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "series", null: false
    t.index ["series"], name: "edit_series_idx"
  end

  create_table "edit_url", primary_key: ["edit", "url"], force: :cascade do |t|
    t.integer "edit", null: false
    t.integer "url", null: false
    t.index ["url"], name: "edit_url_idx"
  end

  create_table "edit_work", primary_key: ["edit", "work"], force: :cascade do |t|
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
  end

  create_table "editor_collection_area", primary_key: ["collection", "area"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "area", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_area_position_check"
  end

  create_table "editor_collection_artist", primary_key: ["collection", "artist"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "artist", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_artist_position_check"
  end

  create_table "editor_collection_collaborator", primary_key: ["collection", "editor"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "editor", null: false
  end

  create_table "editor_collection_deleted_entity", primary_key: ["collection", "gid"], force: :cascade do |t|
    t.integer "collection", null: false
    t.uuid "gid", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_deleted_entity_position_check"
  end

  create_table "editor_collection_event", primary_key: ["collection", "event"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "event", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_event_position_check"
  end

  create_table "editor_collection_instrument", primary_key: ["collection", "instrument"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "instrument", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_instrument_position_check"
  end

  create_table "editor_collection_label", primary_key: ["collection", "label"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "label", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_label_position_check"
  end

  create_table "editor_collection_place", primary_key: ["collection", "place"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "place", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_place_position_check"
  end

  create_table "editor_collection_recording", primary_key: ["collection", "recording"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "recording", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_recording_position_check"
  end

  create_table "editor_collection_release", primary_key: ["collection", "release"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "release", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_release_position_check"
  end

  create_table "editor_collection_release_group", primary_key: ["collection", "release_group"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "release_group", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_release_group_position_check"
  end

  create_table "editor_collection_series", primary_key: ["collection", "series"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "series", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_series_position_check"
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

  create_table "editor_collection_work", primary_key: ["collection", "work"], force: :cascade do |t|
    t.integer "collection", null: false
    t.integer "work", null: false
    t.datetime "added", default: -> { "now()" }
    t.integer "position", default: 0, null: false
    t.text "comment", default: "", null: false
    t.check_constraint "\"position\" >= 0", name: "editor_collection_work_position_check"
  end

  create_table "editor_language", primary_key: ["editor", "language"], force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "language", null: false
    t.enum "fluency", null: false
    t.index ["language"], name: "editor_language_idx_language"
  end

  create_table "editor_oauth_token", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "application", null: false
    t.text "authorization_code"
    t.text "refresh_token"
    t.text "access_token"
    t.datetime "expire_time", null: false
    t.integer "scope", default: 0, null: false
    t.datetime "granted", default: -> { "now()" }, null: false
    t.text "code_challenge"
    t.enum "code_challenge_method"
    t.index ["access_token"], name: "editor_oauth_token_idx_access_token", unique: true
    t.index ["editor"], name: "editor_oauth_token_idx_editor"
    t.index ["refresh_token"], name: "editor_oauth_token_idx_refresh_token", unique: true
    t.check_constraint "((code_challenge IS NULL) = (code_challenge_method IS NULL)) AND ((code_challenge IS NULL) OR (code_challenge ~ '^[A-Za-z0-9.~_-]{43,128}$'::text))", name: "valid_code_challenge"
  end

  create_table "editor_preference", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.string "name", limit: 50, null: false
    t.string "value", limit: 100, null: false
    t.index ["editor", "name"], name: "editor_preference_idx_editor_name", unique: true
  end

  create_table "editor_subscribe_artist", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "artist", null: false
    t.integer "last_edit_sent", null: false
    t.index ["artist"], name: "editor_subscribe_artist_idx_artist"
    t.index ["editor", "artist"], name: "editor_subscribe_artist_idx_uniq", unique: true
  end

  create_table "editor_subscribe_artist_deleted", primary_key: ["editor", "gid"], force: :cascade do |t|
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
    t.index ["editor", "collection"], name: "editor_subscribe_collection_idx_uniq", unique: true
  end

  create_table "editor_subscribe_editor", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "subscribed_editor", null: false
    t.integer "last_edit_sent", null: false
    t.index ["editor", "subscribed_editor"], name: "editor_subscribe_editor_idx_uniq", unique: true
  end

  create_table "editor_subscribe_label", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "label", null: false
    t.integer "last_edit_sent", null: false
    t.index ["editor", "label"], name: "editor_subscribe_label_idx_uniq", unique: true
    t.index ["label"], name: "editor_subscribe_label_idx_label"
  end

  create_table "editor_subscribe_label_deleted", primary_key: ["editor", "gid"], force: :cascade do |t|
    t.integer "editor", null: false
    t.uuid "gid", null: false
    t.integer "deleted_by", null: false
  end

  create_table "editor_subscribe_series", id: :serial, force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "series", null: false
    t.integer "last_edit_sent", null: false
    t.index ["editor", "series"], name: "editor_subscribe_series_idx_uniq", unique: true
    t.index ["series"], name: "editor_subscribe_series_idx_series"
  end

  create_table "editor_subscribe_series_deleted", primary_key: ["editor", "gid"], force: :cascade do |t|
    t.integer "editor", null: false
    t.uuid "gid", null: false
    t.integer "deleted_by", null: false
  end

  create_table "editor_watch_artist", primary_key: ["artist", "editor"], force: :cascade do |t|
    t.integer "artist", null: false
    t.integer "editor", null: false
  end

  create_table "editor_watch_preferences", primary_key: "editor", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "notify_via_email", default: true, null: false
    t.interval "notification_timeframe", default: "P7D", null: false
    t.datetime "last_checked", default: -> { "now()" }, null: false
  end

  create_table "editor_watch_release_group_type", primary_key: ["editor", "release_group_type"], force: :cascade do |t|
    t.integer "editor", null: false
    t.integer "release_group_type", null: false
  end

  create_table "editor_watch_release_status", primary_key: ["editor", "release_status"], force: :cascade do |t|
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
    t.index "mb_simple_tsvector((name)::text)", name: "event_idx_txt", using: :gin
    t.index ["gid"], name: "event_idx_gid", unique: true
    t.index ["name"], name: "event_idx_name"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "event_ended_check"
    t.check_constraint "edits_pending >= 0", name: "event_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "event_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "event_alias_idx_txt_sort", using: :gin
    t.index ["event", "locale"], name: "event_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["event"], name: "event_alias_idx_event"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "event_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 2) OR ((type = 2) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "event_alias_edits_pending_check"
  end

  create_table "event_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "event_alias_type_idx_gid", unique: true
  end

  create_table "event_annotation", primary_key: ["event", "annotation"], force: :cascade do |t|
    t.integer "event", null: false
    t.integer "annotation", null: false
  end

  create_table "event_attribute", id: :serial, force: :cascade do |t|
    t.integer "event", null: false
    t.integer "event_attribute_type", null: false
    t.integer "event_attribute_type_allowed_value"
    t.text "event_attribute_text"
    t.index ["event"], name: "event_attribute_idx_event"
    t.check_constraint "((event_attribute_type_allowed_value IS NULL) AND (event_attribute_text IS NOT NULL)) OR ((event_attribute_type_allowed_value IS NOT NULL) AND (event_attribute_text IS NULL))", name: "event_attribute_check"
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

  create_table "event_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
    t.enum "event_art_presence", default: "absent", null: false
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "event_meta_rating_check"
  end

  create_table "event_rating_raw", primary_key: ["event", "editor"], force: :cascade do |t|
    t.integer "event", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "event_rating_raw_idx_editor"
    t.index ["event"], name: "event_rating_raw_idx_event"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "event_rating_raw_rating_check"
  end

  create_table "event_tag", primary_key: ["event", "tag"], force: :cascade do |t|
    t.integer "event", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "event_tag_idx_tag"
  end

  create_table "event_tag_raw", primary_key: ["event", "editor", "tag"], force: :cascade do |t|
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
    t.check_constraint "edits_pending >= 0", name: "genre_edits_pending_check"
  end

  create_table "genre_alias", id: :serial, force: :cascade do |t|
    t.integer "genre", null: false
    t.string "name", null: false
    t.text "locale"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.boolean "primary_for_locale", default: false, null: false
    t.index ["genre", "locale"], name: "genre_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["genre"], name: "genre_alias_idx_genre"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "edits_pending >= 0", name: "genre_alias_edits_pending_check"
  end

  create_table "instrument", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "type"
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.string "comment", limit: 255, default: "", null: false
    t.text "description", default: "", null: false
    t.index "mb_simple_tsvector((name)::text)", name: "instrument_idx_txt", using: :gin
    t.index ["gid"], name: "instrument_idx_gid", unique: true
    t.index ["name"], name: "instrument_idx_name"
    t.check_constraint "edits_pending >= 0", name: "instrument_edits_pending_check"
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
    t.index ["instrument", "locale"], name: "instrument_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["instrument"], name: "instrument_alias_idx_instrument"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "instrument_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 2) OR ((type = 2) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "instrument_alias_edits_pending_check"
  end

  create_table "instrument_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "instrument_alias_type_idx_gid", unique: true
  end

  create_table "instrument_annotation", primary_key: ["instrument", "annotation"], force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "annotation", null: false
  end

  create_table "instrument_attribute", id: :serial, force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "instrument_attribute_type", null: false
    t.integer "instrument_attribute_type_allowed_value"
    t.text "instrument_attribute_text"
    t.index ["instrument"], name: "instrument_attribute_idx_instrument"
    t.check_constraint "((instrument_attribute_type_allowed_value IS NULL) AND (instrument_attribute_text IS NOT NULL)) OR ((instrument_attribute_type_allowed_value IS NOT NULL) AND (instrument_attribute_text IS NULL))", name: "instrument_attribute_check"
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

  create_table "instrument_tag", primary_key: ["instrument", "tag"], force: :cascade do |t|
    t.integer "instrument", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "instrument_tag_idx_tag"
  end

  create_table "instrument_tag_raw", primary_key: ["instrument", "editor", "tag"], force: :cascade do |t|
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

  create_table "iso_3166_1", primary_key: "code", id: { type: :string, limit: 2 }, force: :cascade do |t|
    t.integer "area", null: false
    t.index ["area"], name: "iso_3166_1_idx_area"
  end

  create_table "iso_3166_2", primary_key: "code", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.integer "area", null: false
    t.index ["area"], name: "iso_3166_2_idx_area"
  end

  create_table "iso_3166_3", primary_key: "code", id: { type: :string, limit: 4 }, force: :cascade do |t|
    t.integer "area", null: false
    t.index ["area"], name: "iso_3166_3_idx_area"
  end

  create_table "isrc", id: :serial, force: :cascade do |t|
    t.integer "recording", null: false
    t.string "isrc", limit: 12, null: false
    t.integer "source", limit: 2
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["isrc", "recording"], name: "isrc_idx_isrc_recording", unique: true
    t.index ["isrc"], name: "isrc_idx_isrc"
    t.index ["recording"], name: "isrc_idx_recording"
    t.check_constraint "edits_pending >= 0", name: "isrc_edits_pending_check"
    t.check_constraint "isrc ~ '^[A-Z]{2}[A-Z0-9]{3}[0-9]{7}$'::text", name: "isrc_isrc_check"
  end

  create_table "iswc", id: :serial, force: :cascade do |t|
    t.integer "work", null: false
    t.string "iswc", limit: 15
    t.integer "source", limit: 2
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }, null: false
    t.index ["iswc", "work"], name: "iswc_idx_iswc", unique: true
    t.index ["work"], name: "iswc_idx_work"
    t.check_constraint "iswc ~ '^T-?\\d{3}.?\\d{3}.?\\d{3}[-.]?\\d$'::text", name: "iswc_iswc_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_area_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_area_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_area_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_area_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_artist_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_artist_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_artist_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_artist_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_event_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_event_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_event_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_event_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_instrument_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_instrument_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_instrument_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_label_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_label_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_label_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_place_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_place_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_place_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_area_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_area_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_area_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_area_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_artist_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_artist_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_artist_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_artist_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_event_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_event_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_event_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_event_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_instrument_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_instrument_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_instrument_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_label_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_label_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_label_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_place_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_place_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_place_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_artist_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_artist_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_artist_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_artist_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_event_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_event_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_event_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_event_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_instrument_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_instrument_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_instrument_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_label_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_label_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_label_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_place_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_place_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_place_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_event_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_event_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_event_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_event_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_instrument_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_instrument_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_instrument_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_instrument_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_label_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_label_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_label_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_place_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_place_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_place_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_instrument_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_instrument_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_instrument_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_instrument_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_label_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_label_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_label_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_label_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_place_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_place_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_place_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_label_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_label_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_label_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_label_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_place_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_place_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_place_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_place_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_place_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_place_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_place_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_place_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_recording_recording_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_recording_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_recording_recording_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_recording_recording_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_recording_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_recording_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_recording_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_recording_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_recording_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_recording_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_recording_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_recording_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_recording_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_recording_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_recording_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_recording_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_recording_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_recording_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_recording_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_recording_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_group_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_group_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_group_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_group_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_group_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_group_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_group_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_group_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_group_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_group_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_group_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_group_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_group_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_release_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_release_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_release_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_release_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_release_group_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_release_group_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_release_group_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_release_group_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_release_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_release_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_release_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_release_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_series_series_idx_uniq", unique: true
    t.index ["entity1"], name: "l_series_series_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_series_series_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_series_series_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_series_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_series_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_series_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_series_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_series_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_series_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_series_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_series_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_url_url_idx_uniq", unique: true
    t.index ["entity1"], name: "l_url_url_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_url_url_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_url_url_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_url_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_url_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_url_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_url_work_link_order_check"
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
    t.index ["entity0", "entity1", "link", "link_order"], name: "l_work_work_idx_uniq", unique: true
    t.index ["entity1"], name: "l_work_work_idx_entity1"
    t.check_constraint "edits_pending >= 0", name: "l_work_work_edits_pending_check"
    t.check_constraint "link_order >= 0", name: "l_work_work_link_order_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "label_idx_txt", using: :gin
    t.index ["area"], name: "label_idx_area"
    t.index ["gid"], name: "label_idx_gid", unique: true
    t.index ["name", "comment"], name: "label_idx_uniq_name_comment", unique: true, where: "(comment IS NOT NULL)"
    t.index ["name"], name: "label_idx_musicbrainz_collate"
    t.index ["name"], name: "label_idx_name"
    t.index ["name"], name: "label_idx_null_comment", unique: true, where: "(comment IS NULL)"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "label_ended_check"
    t.check_constraint "(label_code > 0) AND (label_code < 100000)", name: "label_label_code_check"
    t.check_constraint "edits_pending >= 0", name: "label_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "label_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "label_alias_idx_txt_sort", using: :gin
    t.index ["label", "locale"], name: "label_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["label"], name: "label_alias_idx_label"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "label_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 2) OR ((type = 2) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "label_alias_edits_pending_check"
  end

  create_table "label_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "label_alias_type_idx_gid", unique: true
  end

  create_table "label_annotation", primary_key: ["label", "annotation"], force: :cascade do |t|
    t.integer "label", null: false
    t.integer "annotation", null: false
  end

  create_table "label_attribute", id: :serial, force: :cascade do |t|
    t.integer "label", null: false
    t.integer "label_attribute_type", null: false
    t.integer "label_attribute_type_allowed_value"
    t.text "label_attribute_text"
    t.index ["label"], name: "label_attribute_idx_label"
    t.check_constraint "((label_attribute_type_allowed_value IS NULL) AND (label_attribute_text IS NOT NULL)) OR ((label_attribute_type_allowed_value IS NOT NULL) AND (label_attribute_text IS NULL))", name: "label_attribute_check"
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

  create_table "label_ipi", primary_key: ["label", "ipi"], force: :cascade do |t|
    t.integer "label", null: false
    t.string "ipi", limit: 11, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.check_constraint "edits_pending >= 0", name: "label_ipi_edits_pending_check"
    t.check_constraint "ipi ~ '^\\d{11}$'::text", name: "label_ipi_ipi_check"
  end

  create_table "label_isni", primary_key: ["label", "isni"], force: :cascade do |t|
    t.integer "label", null: false
    t.string "isni", limit: 16, null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.check_constraint "edits_pending >= 0", name: "label_isni_edits_pending_check"
    t.check_constraint "isni ~ '^\\d{15}[\\dX]$'::text", name: "label_isni_isni_check"
  end

  create_table "label_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "label_meta_rating_check"
  end

  create_table "label_rating_raw", primary_key: ["label", "editor"], force: :cascade do |t|
    t.integer "label", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "label_rating_raw_idx_editor"
    t.index ["label"], name: "label_rating_raw_idx_label"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "label_rating_raw_rating_check"
  end

  create_table "label_tag", primary_key: ["label", "tag"], force: :cascade do |t|
    t.integer "label", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "label_tag_idx_tag"
  end

  create_table "label_tag_raw", primary_key: ["label", "editor", "tag"], force: :cascade do |t|
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
    t.check_constraint "(iso_code_2t IS NOT NULL) OR (iso_code_3 IS NOT NULL)", name: "iso_code_check"
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
    t.index ["link_type", "attribute_count"], name: "link_idx_type_attr"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "link_ended_check"
  end

  create_table "link_attribute", primary_key: ["link", "attribute_type"], force: :cascade do |t|
    t.integer "link", null: false
    t.integer "attribute_type", null: false
    t.datetime "created", default: -> { "now()" }
  end

  create_table "link_attribute_credit", primary_key: ["link", "attribute_type"], force: :cascade do |t|
    t.integer "link", null: false
    t.integer "attribute_type", null: false
    t.text "credited_as", null: false
  end

  create_table "link_attribute_text_value", primary_key: ["link", "attribute_type"], force: :cascade do |t|
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

  create_table "link_type_attribute_type", primary_key: ["link_type", "attribute_type"], force: :cascade do |t|
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
    t.index ["release", "position"], name: "medium_idx_release_position"
    t.index ["track_count"], name: "medium_idx_track_count"
    t.check_constraint "edits_pending >= 0", name: "medium_edits_pending_check"
  end

  create_table "medium_attribute", id: :serial, force: :cascade do |t|
    t.integer "medium", null: false
    t.integer "medium_attribute_type", null: false
    t.integer "medium_attribute_type_allowed_value"
    t.text "medium_attribute_text"
    t.index ["medium"], name: "medium_attribute_idx_medium"
    t.check_constraint "((medium_attribute_type_allowed_value IS NULL) AND (medium_attribute_text IS NOT NULL)) OR ((medium_attribute_type_allowed_value IS NOT NULL) AND (medium_attribute_text IS NULL))", name: "medium_attribute_check"
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

  create_table "medium_attribute_type_allowed_format", primary_key: ["medium_format", "medium_attribute_type"], force: :cascade do |t|
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

  create_table "medium_attribute_type_allowed_value_allowed_format", primary_key: ["medium_format", "medium_attribute_type_allowed_value"], force: :cascade do |t|
    t.integer "medium_format", null: false
    t.integer "medium_attribute_type_allowed_value", null: false
  end

  create_table "medium_cdtoc", id: :serial, force: :cascade do |t|
    t.integer "medium", null: false
    t.integer "cdtoc", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["cdtoc"], name: "medium_cdtoc_idx_cdtoc"
    t.index ["medium", "cdtoc"], name: "medium_cdtoc_idx_uniq", unique: true
    t.index ["medium"], name: "medium_cdtoc_idx_medium"
    t.check_constraint "edits_pending >= 0", name: "medium_cdtoc_edits_pending_check"
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

  create_table "medium_index", primary_key: "medium", id: :integer, default: nil, force: :cascade do |t|
    t.column "toc", nil
    t.index ["toc"], name: "medium_index_idx", using: :gist
  end

  create_table "old_editor_name", id: false, force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.index "lower((name)::text)", name: "old_editor_name_idx_name", unique: true
  end

  create_table "orderable_link_type", primary_key: "link_type", id: :integer, default: nil, force: :cascade do |t|
    t.integer "direction", limit: 2, default: 1, null: false
    t.check_constraint "(direction = 1) OR (direction = 2)", name: "orderable_link_type_direction_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "place_idx_name_txt", using: :gin
    t.index ["area"], name: "place_idx_area"
    t.index ["gid"], name: "place_idx_gid", unique: true
    t.index ["name"], name: "place_idx_name"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "place_check"
    t.check_constraint "edits_pending >= 0", name: "place_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "place_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "place_alias_idx_txt_sort", using: :gin
    t.index ["place", "locale"], name: "place_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["place"], name: "place_alias_idx_place"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "place_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 2) OR ((type = 2) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "place_alias_edits_pending_check"
  end

  create_table "place_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "place_alias_type_idx_gid", unique: true
  end

  create_table "place_annotation", primary_key: ["place", "annotation"], force: :cascade do |t|
    t.integer "place", null: false
    t.integer "annotation", null: false
  end

  create_table "place_attribute", id: :serial, force: :cascade do |t|
    t.integer "place", null: false
    t.integer "place_attribute_type", null: false
    t.integer "place_attribute_type_allowed_value"
    t.text "place_attribute_text"
    t.index ["place"], name: "place_attribute_idx_place"
    t.check_constraint "((place_attribute_type_allowed_value IS NULL) AND (place_attribute_text IS NOT NULL)) OR ((place_attribute_type_allowed_value IS NOT NULL) AND (place_attribute_text IS NULL))", name: "place_attribute_check"
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

  create_table "place_tag", primary_key: ["place", "tag"], force: :cascade do |t|
    t.integer "place", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "place_tag_idx_tag"
  end

  create_table "place_tag_raw", primary_key: ["place", "editor", "tag"], force: :cascade do |t|
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
    t.index "mb_simple_tsvector((name)::text)", name: "recording_idx_txt", using: :gin
    t.index ["artist_credit"], name: "recording_idx_artist_credit"
    t.index ["gid"], name: "recording_idx_gid", unique: true
    t.index ["name"], name: "recording_idx_musicbrainz_collate"
    t.index ["name"], name: "recording_idx_name"
    t.check_constraint "(length IS NULL) OR (length > 0)", name: "recording_length_check"
    t.check_constraint "edits_pending >= 0", name: "recording_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "recording_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "recording_alias_idx_txt_sort", using: :gin
    t.index ["recording", "locale"], name: "recording_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["recording"], name: "recording_alias_idx_recording"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "recording_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "edits_pending >= 0", name: "recording_alias_edits_pending_check"
  end

  create_table "recording_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "recording_alias_type_idx_gid", unique: true
  end

  create_table "recording_annotation", primary_key: ["recording", "annotation"], force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "annotation", null: false
  end

  create_table "recording_attribute", id: :serial, force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "recording_attribute_type", null: false
    t.integer "recording_attribute_type_allowed_value"
    t.text "recording_attribute_text"
    t.index ["recording"], name: "recording_attribute_idx_recording"
    t.check_constraint "((recording_attribute_type_allowed_value IS NULL) AND (recording_attribute_text IS NOT NULL)) OR ((recording_attribute_type_allowed_value IS NOT NULL) AND (recording_attribute_text IS NULL))", name: "recording_attribute_check"
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

  create_table "recording_first_release_date", primary_key: "recording", id: :integer, default: nil, force: :cascade do |t|
    t.integer "year", limit: 2
    t.integer "month", limit: 2
    t.integer "day", limit: 2
  end

  create_table "recording_gid_redirect", primary_key: "gid", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "new_id", null: false
    t.datetime "created", default: -> { "now()" }
    t.index ["new_id"], name: "recording_gid_redirect_idx_new_id"
  end

  create_table "recording_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "recording_meta_rating_check"
  end

  create_table "recording_rating_raw", primary_key: ["recording", "editor"], force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "recording_rating_raw_idx_editor"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "recording_rating_raw_rating_check"
  end

  create_table "recording_tag", primary_key: ["recording", "tag"], force: :cascade do |t|
    t.integer "recording", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "recording_tag_idx_tag"
  end

  create_table "recording_tag_raw", primary_key: ["recording", "editor", "tag"], force: :cascade do |t|
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
    t.index "mb_simple_tsvector((name)::text)", name: "release_idx_txt", using: :gin
    t.index ["artist_credit"], name: "release_idx_artist_credit"
    t.index ["gid"], name: "release_idx_gid", unique: true
    t.index ["name"], name: "release_idx_musicbrainz_collate"
    t.index ["name"], name: "release_idx_name"
    t.index ["release_group"], name: "release_idx_release_group"
    t.check_constraint "edits_pending >= 0", name: "release_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "release_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "release_alias_idx_txt_sort", using: :gin
    t.index ["release", "locale"], name: "release_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["release"], name: "release_alias_idx_release"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "release_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "edits_pending >= 0", name: "release_alias_edits_pending_check"
  end

  create_table "release_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
  end

  create_table "release_annotation", primary_key: ["release", "annotation"], force: :cascade do |t|
    t.integer "release", null: false
    t.integer "annotation", null: false
  end

  create_table "release_attribute", id: :serial, force: :cascade do |t|
    t.integer "release", null: false
    t.integer "release_attribute_type", null: false
    t.integer "release_attribute_type_allowed_value"
    t.text "release_attribute_text"
    t.index ["release"], name: "release_attribute_idx_release"
    t.check_constraint "((release_attribute_type_allowed_value IS NULL) AND (release_attribute_text IS NOT NULL)) OR ((release_attribute_type_allowed_value IS NOT NULL) AND (release_attribute_text IS NULL))", name: "release_attribute_check"
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

  create_table "release_country", primary_key: ["release", "country"], force: :cascade do |t|
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

  create_table "release_first_release_date", primary_key: "release", id: :integer, default: nil, force: :cascade do |t|
    t.integer "year", limit: 2
    t.integer "month", limit: 2
    t.integer "day", limit: 2
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
    t.index "mb_simple_tsvector((name)::text)", name: "release_group_idx_txt", using: :gin
    t.index ["artist_credit"], name: "release_group_idx_artist_credit"
    t.index ["gid"], name: "release_group_idx_gid", unique: true
    t.index ["name"], name: "release_group_idx_musicbrainz_collate"
    t.index ["name"], name: "release_group_idx_name"
    t.check_constraint "edits_pending >= 0", name: "release_group_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "release_group_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "release_group_alias_idx_txt_sort", using: :gin
    t.index ["release_group", "locale"], name: "release_group_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["release_group"], name: "release_group_alias_idx_release_group"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "release_group_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "edits_pending >= 0", name: "release_group_alias_edits_pending_check"
  end

  create_table "release_group_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_alias_type_idx_gid", unique: true
  end

  create_table "release_group_annotation", primary_key: ["release_group", "annotation"], force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "annotation", null: false
  end

  create_table "release_group_attribute", id: :serial, force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "release_group_attribute_type", null: false
    t.integer "release_group_attribute_type_allowed_value"
    t.text "release_group_attribute_text"
    t.index ["release_group"], name: "release_group_attribute_idx_release_group"
    t.check_constraint "((release_group_attribute_type_allowed_value IS NULL) AND (release_group_attribute_text IS NOT NULL)) OR ((release_group_attribute_type_allowed_value IS NOT NULL) AND (release_group_attribute_text IS NULL))", name: "release_group_attribute_check"
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
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "release_group_meta_rating_check"
  end

  create_table "release_group_primary_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_primary_type_idx_gid", unique: true
  end

  create_table "release_group_rating_raw", primary_key: ["release_group", "editor"], force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.index ["editor"], name: "release_group_rating_raw_idx_editor"
    t.index ["release_group"], name: "release_group_rating_raw_idx_release_group"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "release_group_rating_raw_rating_check"
  end

  create_table "release_group_secondary_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_group_secondary_type_idx_gid", unique: true
  end

  create_table "release_group_secondary_type_join", primary_key: ["release_group", "secondary_type"], force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "secondary_type", null: false
    t.datetime "created", default: -> { "now()" }, null: false
  end

  create_table "release_group_tag", primary_key: ["release_group", "tag"], force: :cascade do |t|
    t.integer "release_group", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "release_group_tag_idx_tag"
  end

  create_table "release_group_tag_raw", primary_key: ["release_group", "editor", "tag"], force: :cascade do |t|
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

  create_table "release_meta", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "date_added", default: -> { "now()" }
    t.string "info_url", limit: 255
    t.string "amazon_asin", limit: 10
    t.string "amazon_store", limit: 20
    t.enum "cover_art_presence", default: "absent", null: false
  end

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
  end

  create_table "release_status", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "release_status_idx_gid", unique: true
  end

  create_table "release_tag", primary_key: ["release", "tag"], force: :cascade do |t|
    t.integer "release", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "release_tag_idx_tag"
  end

  create_table "release_tag_raw", primary_key: ["release", "editor", "tag"], force: :cascade do |t|
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
    t.index "mb_simple_tsvector((name)::text)", name: "series_idx_txt", using: :gin
    t.index ["gid"], name: "series_idx_gid", unique: true
    t.index ["name"], name: "series_idx_name"
    t.check_constraint "edits_pending >= 0", name: "series_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "series_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "series_alias_idx_txt_sort", using: :gin
    t.index ["series", "locale"], name: "series_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["series"], name: "series_alias_idx_series"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "series_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 2) OR ((type = 2) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "series_alias_edits_pending_check"
  end

  create_table "series_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "series_alias_type_idx_gid", unique: true
  end

  create_table "series_annotation", primary_key: ["series", "annotation"], force: :cascade do |t|
    t.integer "series", null: false
    t.integer "annotation", null: false
  end

  create_table "series_attribute", id: :serial, force: :cascade do |t|
    t.integer "series", null: false
    t.integer "series_attribute_type", null: false
    t.integer "series_attribute_type_allowed_value"
    t.text "series_attribute_text"
    t.index ["series"], name: "series_attribute_idx_series"
    t.check_constraint "((series_attribute_type_allowed_value IS NULL) AND (series_attribute_text IS NOT NULL)) OR ((series_attribute_type_allowed_value IS NOT NULL) AND (series_attribute_text IS NULL))", name: "series_attribute_check"
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

  create_table "series_tag", primary_key: ["series", "tag"], force: :cascade do |t|
    t.integer "series", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "series_tag_idx_tag"
  end

  create_table "series_tag_raw", primary_key: ["series", "editor", "tag"], force: :cascade do |t|
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
    t.index "mb_simple_tsvector((name)::text)", name: "tag_idx_name_txt", using: :gin
    t.index ["name"], name: "tag_idx_name", unique: true
  end

  create_table "tag_relation", primary_key: ["tag1", "tag2"], force: :cascade do |t|
    t.integer "tag1", null: false
    t.integer "tag2", null: false
    t.integer "weight", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.check_constraint "tag1 < tag2", name: "tag_relation_check"
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
    t.index ["medium", "position"], name: "track_idx_medium_position"
    t.index ["recording"], name: "track_idx_recording"
    t.check_constraint "(length IS NULL) OR (length > 0)", name: "track_length_check"
    t.check_constraint "edits_pending >= 0", name: "track_edits_pending_check"
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
    t.check_constraint "edits_pending >= 0", name: "url_edits_pending_check"
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
    t.index ["editor", "edit"], name: "vote_idx_editor_edit", where: "(superseded = false)"
    t.index ["editor", "vote_time"], name: "vote_idx_editor_vote_time"
  end

  create_table "work", id: :serial, force: :cascade do |t|
    t.uuid "gid", null: false
    t.string "name", null: false
    t.integer "type"
    t.string "comment", limit: 255, default: "", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index "mb_simple_tsvector((name)::text)", name: "work_idx_txt", using: :gin
    t.index ["gid"], name: "work_idx_gid", unique: true
    t.index ["name"], name: "work_idx_musicbrainz_collate"
    t.index ["name"], name: "work_idx_name"
    t.check_constraint "edits_pending >= 0", name: "work_edits_pending_check"
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
    t.index "mb_simple_tsvector((name)::text)", name: "work_alias_idx_txt", using: :gin
    t.index "mb_simple_tsvector((sort_name)::text)", name: "work_alias_idx_txt_sort", using: :gin
    t.index ["work", "locale"], name: "work_alias_idx_primary", unique: true, where: "((primary_for_locale = true) AND (locale IS NOT NULL))"
    t.index ["work"], name: "work_alias_idx_work"
    t.check_constraint "(((end_date_year IS NOT NULL) OR (end_date_month IS NOT NULL) OR (end_date_day IS NOT NULL)) AND (ended = true)) OR ((end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL))", name: "work_alias_check"
    t.check_constraint "((locale IS NULL) AND (primary_for_locale IS FALSE)) OR (locale IS NOT NULL)", name: "primary_check"
    t.check_constraint "(type <> 2) OR ((type = 2) AND ((sort_name)::text = (name)::text) AND (begin_date_year IS NULL) AND (begin_date_month IS NULL) AND (begin_date_day IS NULL) AND (end_date_year IS NULL) AND (end_date_month IS NULL) AND (end_date_day IS NULL) AND (primary_for_locale IS FALSE) AND (locale IS NULL))", name: "search_hints_are_empty"
    t.check_constraint "edits_pending >= 0", name: "work_alias_edits_pending_check"
  end

  create_table "work_alias_type", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "parent"
    t.integer "child_order", default: 0, null: false
    t.text "description"
    t.uuid "gid", null: false
    t.index ["gid"], name: "work_alias_type_idx_gid", unique: true
  end

  create_table "work_annotation", primary_key: ["work", "annotation"], force: :cascade do |t|
    t.integer "work", null: false
    t.integer "annotation", null: false
  end

  create_table "work_attribute", id: :serial, force: :cascade do |t|
    t.integer "work", null: false
    t.integer "work_attribute_type", null: false
    t.integer "work_attribute_type_allowed_value"
    t.text "work_attribute_text"
    t.index ["work"], name: "work_attribute_idx_work"
    t.check_constraint "((work_attribute_type_allowed_value IS NULL) AND (work_attribute_text IS NOT NULL)) OR ((work_attribute_type_allowed_value IS NOT NULL) AND (work_attribute_text IS NULL))", name: "work_attribute_check"
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

  create_table "work_language", primary_key: ["work", "language"], force: :cascade do |t|
    t.integer "work", null: false
    t.integer "language", null: false
    t.integer "edits_pending", default: 0, null: false
    t.datetime "created", default: -> { "now()" }
    t.check_constraint "edits_pending >= 0", name: "work_language_edits_pending_check"
  end

  create_table "work_meta", id: :integer, default: nil, force: :cascade do |t|
    t.integer "rating", limit: 2
    t.integer "rating_count"
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "work_meta_rating_check"
  end

  create_table "work_rating_raw", primary_key: ["work", "editor"], force: :cascade do |t|
    t.integer "work", null: false
    t.integer "editor", null: false
    t.integer "rating", limit: 2, null: false
    t.check_constraint "(rating >= 0) AND (rating <= 100)", name: "work_rating_raw_rating_check"
  end

  create_table "work_tag", primary_key: ["work", "tag"], force: :cascade do |t|
    t.integer "work", null: false
    t.integer "tag", null: false
    t.integer "count", null: false
    t.datetime "last_updated", default: -> { "now()" }
    t.index ["tag"], name: "work_tag_idx_tag"
  end

  create_table "work_tag_raw", primary_key: ["work", "editor", "tag"], force: :cascade do |t|
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

  add_foreign_key "dbmirror_pendingdata", "dbmirror_pending", column: "seqid", primary_key: "seqid", name: "dbmirror_pendingdata_seqid_fkey", on_update: :cascade, on_delete: :cascade
end
