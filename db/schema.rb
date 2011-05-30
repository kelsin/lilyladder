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

ActiveRecord::Schema.define(:version => 20110530034050) do

  create_table "games", :force => true do |t|
    t.integer  "match_id"
    t.integer  "winner_id"
    t.integer  "map_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_pools", :force => true do |t|
    t.integer  "season_id"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.integer  "round_id"
    t.integer  "winner_id"
    t.integer  "group"
    t.time     "reported_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "match_id"
    t.integer  "registration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "season_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "race_id"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "position"
    t.time     "starts_at"
    t.time     "ends_at"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "smf_admin_info_files", :primary_key => "id_file", :force => true do |t|
    t.string "filename",   :default => "", :null => false
    t.string "path",       :default => "", :null => false
    t.string "parameters", :default => "", :null => false
    t.text   "data",                       :null => false
    t.string "filetype",   :default => "", :null => false
  end

  add_index "smf_admin_info_files", ["filename"], :name => "filename", :length => {"filename"=>"30"}

  create_table "smf_approval_queue", :id => false, :force => true do |t|
    t.integer "id_msg",                 :default => 0, :null => false
    t.integer "id_attach",              :default => 0, :null => false
    t.integer "id_event",  :limit => 2, :default => 0, :null => false
  end

  create_table "smf_attachments", :primary_key => "id_attach", :force => true do |t|
    t.integer "id_thumb",                      :default => 0,  :null => false
    t.integer "id_msg",                        :default => 0,  :null => false
    t.integer "id_member",       :limit => 3,  :default => 0,  :null => false
    t.integer "id_folder",       :limit => 1,  :default => 1,  :null => false
    t.integer "attachment_type", :limit => 1,  :default => 0,  :null => false
    t.string  "filename",                      :default => "", :null => false
    t.string  "file_hash",       :limit => 40, :default => "", :null => false
    t.string  "fileext",         :limit => 8,  :default => "", :null => false
    t.integer "size",                          :default => 0,  :null => false
    t.integer "downloads",       :limit => 3,  :default => 0,  :null => false
    t.integer "width",           :limit => 3,  :default => 0,  :null => false
    t.integer "height",          :limit => 3,  :default => 0,  :null => false
    t.string  "mime_type",       :limit => 20, :default => "", :null => false
    t.integer "approved",        :limit => 1,  :default => 1,  :null => false
  end

  add_index "smf_attachments", ["attachment_type"], :name => "attachment_type"
  add_index "smf_attachments", ["id_member", "id_attach"], :name => "id_member", :unique => true
  add_index "smf_attachments", ["id_msg"], :name => "id_msg"

  create_table "smf_ban_groups", :primary_key => "id_ban_group", :force => true do |t|
    t.string  "name",            :limit => 20, :default => "", :null => false
    t.integer "ban_time",                      :default => 0,  :null => false
    t.integer "expire_time"
    t.integer "cannot_access",   :limit => 1,  :default => 0,  :null => false
    t.integer "cannot_register", :limit => 1,  :default => 0,  :null => false
    t.integer "cannot_post",     :limit => 1,  :default => 0,  :null => false
    t.integer "cannot_login",    :limit => 1,  :default => 0,  :null => false
    t.string  "reason",                        :default => "", :null => false
    t.text    "notes",                                         :null => false
  end

  create_table "smf_ban_items", :primary_key => "id_ban", :force => true do |t|
    t.integer "id_ban_group",  :limit => 2, :default => 0,  :null => false
    t.integer "ip_low1",       :limit => 1, :default => 0,  :null => false
    t.integer "ip_high1",      :limit => 1, :default => 0,  :null => false
    t.integer "ip_low2",       :limit => 1, :default => 0,  :null => false
    t.integer "ip_high2",      :limit => 1, :default => 0,  :null => false
    t.integer "ip_low3",       :limit => 1, :default => 0,  :null => false
    t.integer "ip_high3",      :limit => 1, :default => 0,  :null => false
    t.integer "ip_low4",       :limit => 1, :default => 0,  :null => false
    t.integer "ip_high4",      :limit => 1, :default => 0,  :null => false
    t.string  "hostname",                   :default => "", :null => false
    t.string  "email_address",              :default => "", :null => false
    t.integer "id_member",     :limit => 3, :default => 0,  :null => false
    t.integer "hits",          :limit => 3, :default => 0,  :null => false
  end

  add_index "smf_ban_items", ["id_ban_group"], :name => "id_ban_group"

  create_table "smf_board_permissions", :id => false, :force => true do |t|
    t.integer "id_group",   :limit => 2,  :default => 0,  :null => false
    t.integer "id_profile", :limit => 2,  :default => 0,  :null => false
    t.string  "permission", :limit => 30, :default => "", :null => false
    t.integer "add_deny",   :limit => 1,  :default => 1,  :null => false
  end

  create_table "smf_boards", :primary_key => "id_board", :force => true do |t|
    t.integer "id_cat",            :limit => 1, :default => 0,      :null => false
    t.integer "child_level",       :limit => 1, :default => 0,      :null => false
    t.integer "id_parent",         :limit => 2, :default => 0,      :null => false
    t.integer "board_order",       :limit => 2, :default => 0,      :null => false
    t.integer "id_last_msg",                    :default => 0,      :null => false
    t.integer "id_msg_updated",                 :default => 0,      :null => false
    t.string  "member_groups",                  :default => "-1,0", :null => false
    t.integer "id_profile",        :limit => 2, :default => 1,      :null => false
    t.string  "name",                           :default => "",     :null => false
    t.text    "description",                                        :null => false
    t.integer "num_topics",        :limit => 3, :default => 0,      :null => false
    t.integer "num_posts",         :limit => 3, :default => 0,      :null => false
    t.integer "count_posts",       :limit => 1, :default => 0,      :null => false
    t.integer "id_theme",          :limit => 1, :default => 0,      :null => false
    t.integer "override_theme",    :limit => 1, :default => 0,      :null => false
    t.integer "unapproved_posts",  :limit => 2, :default => 0,      :null => false
    t.integer "unapproved_topics", :limit => 2, :default => 0,      :null => false
    t.string  "redirect",                       :default => "",     :null => false
  end

  add_index "smf_boards", ["id_cat", "id_board"], :name => "categories", :unique => true
  add_index "smf_boards", ["id_msg_updated"], :name => "id_msg_updated"
  add_index "smf_boards", ["id_parent"], :name => "id_parent"
  add_index "smf_boards", ["member_groups"], :name => "member_groups", :length => {"member_groups"=>"48"}

  create_table "smf_calendar", :primary_key => "id_event", :force => true do |t|
    t.date    "start_date",              :default => '0001-01-01', :null => false
    t.date    "end_date",                :default => '0001-01-01', :null => false
    t.integer "id_board",   :limit => 2, :default => 0,            :null => false
    t.integer "id_topic",   :limit => 3, :default => 0,            :null => false
    t.string  "title",                   :default => "",           :null => false
    t.integer "id_member",  :limit => 3, :default => 0,            :null => false
  end

  add_index "smf_calendar", ["end_date"], :name => "end_date"
  add_index "smf_calendar", ["id_topic", "id_member"], :name => "topic"
  add_index "smf_calendar", ["start_date"], :name => "start_date"

  create_table "smf_calendar_holidays", :primary_key => "id_holiday", :force => true do |t|
    t.date   "event_date", :default => '0001-01-01', :null => false
    t.string "title",      :default => "",           :null => false
  end

  add_index "smf_calendar_holidays", ["event_date"], :name => "event_date"

  create_table "smf_categories", :primary_key => "id_cat", :force => true do |t|
    t.integer "cat_order",    :limit => 1, :default => 0,    :null => false
    t.string  "name",                      :default => "",   :null => false
    t.boolean "can_collapse",              :default => true, :null => false
  end

  create_table "smf_collapsed_categories", :id => false, :force => true do |t|
    t.integer "id_cat",    :limit => 1, :default => 0, :null => false
    t.integer "id_member", :limit => 3, :default => 0, :null => false
  end

  create_table "smf_custom_fields", :primary_key => "id_field", :force => true do |t|
    t.string  "col_name",      :limit => 12, :default => "",             :null => false
    t.string  "field_name",    :limit => 40, :default => "",             :null => false
    t.string  "field_desc",                  :default => "",             :null => false
    t.string  "field_type",    :limit => 8,  :default => "text",         :null => false
    t.integer "field_length",  :limit => 2,  :default => 255,            :null => false
    t.text    "field_options",                                           :null => false
    t.string  "mask",                        :default => "",             :null => false
    t.integer "show_reg",      :limit => 1,  :default => 0,              :null => false
    t.integer "show_display",  :limit => 1,  :default => 0,              :null => false
    t.string  "show_profile",  :limit => 20, :default => "forumprofile", :null => false
    t.integer "private",       :limit => 1,  :default => 0,              :null => false
    t.integer "active",        :limit => 1,  :default => 1,              :null => false
    t.integer "bbc",           :limit => 1,  :default => 0,              :null => false
    t.integer "can_search",    :limit => 1,  :default => 0,              :null => false
    t.string  "default_value",               :default => "",             :null => false
    t.text    "enclose",                                                 :null => false
    t.integer "placement",     :limit => 1,  :default => 0,              :null => false
  end

  add_index "smf_custom_fields", ["col_name"], :name => "col_name", :unique => true

  create_table "smf_group_moderators", :id => false, :force => true do |t|
    t.integer "id_group",  :limit => 2, :default => 0, :null => false
    t.integer "id_member", :limit => 3, :default => 0, :null => false
  end

  create_table "smf_log_actions", :primary_key => "id_action", :force => true do |t|
    t.integer "id_log",    :limit => 1,  :default => 1,  :null => false
    t.integer "log_time",                :default => 0,  :null => false
    t.integer "id_member", :limit => 3,  :default => 0,  :null => false
    t.string  "ip",        :limit => 16, :default => "", :null => false
    t.string  "action",    :limit => 30, :default => "", :null => false
    t.integer "id_board",  :limit => 2,  :default => 0,  :null => false
    t.integer "id_topic",  :limit => 3,  :default => 0,  :null => false
    t.integer "id_msg",                  :default => 0,  :null => false
    t.text    "extra",                                   :null => false
  end

  add_index "smf_log_actions", ["id_board"], :name => "id_board"
  add_index "smf_log_actions", ["id_log"], :name => "id_log"
  add_index "smf_log_actions", ["id_member"], :name => "id_member"
  add_index "smf_log_actions", ["id_msg"], :name => "id_msg"
  add_index "smf_log_actions", ["log_time"], :name => "log_time"

  create_table "smf_log_activity", :primary_key => "date", :force => true do |t|
    t.integer "hits",      :limit => 3, :default => 0, :null => false
    t.integer "topics",    :limit => 2, :default => 0, :null => false
    t.integer "posts",     :limit => 2, :default => 0, :null => false
    t.integer "registers", :limit => 2, :default => 0, :null => false
    t.integer "most_on",   :limit => 2, :default => 0, :null => false
  end

  add_index "smf_log_activity", ["most_on"], :name => "most_on"

  create_table "smf_log_banned", :primary_key => "id_ban_log", :force => true do |t|
    t.integer "id_member", :limit => 3,  :default => 0,  :null => false
    t.string  "ip",        :limit => 16, :default => "", :null => false
    t.string  "email",                   :default => "", :null => false
    t.integer "log_time",                :default => 0,  :null => false
  end

  add_index "smf_log_banned", ["log_time"], :name => "log_time"

  create_table "smf_log_boards", :id => false, :force => true do |t|
    t.integer "id_member", :limit => 3, :default => 0, :null => false
    t.integer "id_board",  :limit => 2, :default => 0, :null => false
    t.integer "id_msg",                 :default => 0, :null => false
  end

  create_table "smf_log_comments", :primary_key => "id_comment", :force => true do |t|
    t.integer "id_member",      :limit => 3,  :default => 0,         :null => false
    t.string  "member_name",    :limit => 80, :default => "",        :null => false
    t.string  "comment_type",   :limit => 8,  :default => "warning", :null => false
    t.integer "id_recipient",   :limit => 3,  :default => 0,         :null => false
    t.string  "recipient_name",               :default => "",        :null => false
    t.integer "log_time",                     :default => 0,         :null => false
    t.integer "id_notice",      :limit => 3,  :default => 0,         :null => false
    t.integer "counter",        :limit => 1,  :default => 0,         :null => false
    t.text    "body",                                                :null => false
  end

  add_index "smf_log_comments", ["comment_type"], :name => "comment_type"
  add_index "smf_log_comments", ["id_recipient"], :name => "id_recipient"
  add_index "smf_log_comments", ["log_time"], :name => "log_time"

  create_table "smf_log_digest", :id => false, :force => true do |t|
    t.integer "id_topic",  :limit => 3,                      :null => false
    t.integer "id_msg",                                      :null => false
    t.string  "note_type", :limit => 10, :default => "post", :null => false
    t.integer "daily",     :limit => 1,  :default => 0,      :null => false
    t.integer "exclude",   :limit => 3,  :default => 0,      :null => false
  end

  create_table "smf_log_errors", :primary_key => "id_error", :force => true do |t|
    t.integer "log_time",                 :default => 0,         :null => false
    t.integer "id_member",  :limit => 3,  :default => 0,         :null => false
    t.string  "ip",         :limit => 16, :default => "",        :null => false
    t.text    "url",                                             :null => false
    t.text    "message",                                         :null => false
    t.string  "session",    :limit => 32, :default => "",        :null => false
    t.string  "error_type", :limit => 15, :default => "general", :null => false
    t.string  "file",                     :default => "",        :null => false
    t.integer "line",       :limit => 3,  :default => 0,         :null => false
  end

  add_index "smf_log_errors", ["id_member"], :name => "id_member"
  add_index "smf_log_errors", ["ip"], :name => "ip"
  add_index "smf_log_errors", ["log_time"], :name => "log_time"

  create_table "smf_log_floodcontrol", :id => false, :force => true do |t|
    t.string  "ip",       :limit => 16, :default => "",     :null => false
    t.integer "log_time",               :default => 0,      :null => false
    t.string  "log_type", :limit => 8,  :default => "post", :null => false
  end

  create_table "smf_log_group_requests", :primary_key => "id_request", :force => true do |t|
    t.integer "id_member",    :limit => 3, :default => 0, :null => false
    t.integer "id_group",     :limit => 2, :default => 0, :null => false
    t.integer "time_applied",              :default => 0, :null => false
    t.text    "reason",                                   :null => false
  end

  add_index "smf_log_group_requests", ["id_member", "id_group"], :name => "id_member", :unique => true

  create_table "smf_log_karma", :id => false, :force => true do |t|
    t.integer "id_target",   :limit => 3, :default => 0, :null => false
    t.integer "id_executor", :limit => 3, :default => 0, :null => false
    t.integer "log_time",                 :default => 0, :null => false
    t.integer "action",      :limit => 1, :default => 0, :null => false
  end

  add_index "smf_log_karma", ["log_time"], :name => "log_time"

  create_table "smf_log_mark_read", :id => false, :force => true do |t|
    t.integer "id_member", :limit => 3, :default => 0, :null => false
    t.integer "id_board",  :limit => 2, :default => 0, :null => false
    t.integer "id_msg",                 :default => 0, :null => false
  end

  create_table "smf_log_member_notices", :primary_key => "id_notice", :force => true do |t|
    t.string "subject", :default => "", :null => false
    t.text   "body",                    :null => false
  end

  create_table "smf_log_notify", :id => false, :force => true do |t|
    t.integer "id_member", :limit => 3, :default => 0,     :null => false
    t.integer "id_topic",  :limit => 3, :default => 0,     :null => false
    t.integer "id_board",  :limit => 2, :default => 0,     :null => false
    t.boolean "sent",                   :default => false, :null => false
  end

  add_index "smf_log_notify", ["id_topic", "id_member"], :name => "id_topic"

  create_table "smf_log_online", :primary_key => "session", :force => true do |t|
    t.integer "log_time",               :default => 0, :null => false
    t.integer "id_member", :limit => 3, :default => 0, :null => false
    t.integer "id_spider", :limit => 2, :default => 0, :null => false
    t.integer "ip",                     :default => 0, :null => false
    t.text    "url",                                   :null => false
  end

  add_index "smf_log_online", ["id_member"], :name => "id_member"
  add_index "smf_log_online", ["log_time"], :name => "log_time"

  create_table "smf_log_packages", :primary_key => "id_install", :force => true do |t|
    t.string  "filename",                         :default => "", :null => false
    t.string  "package_id",                       :default => "", :null => false
    t.string  "name",                             :default => "", :null => false
    t.string  "version",                          :default => "", :null => false
    t.integer "id_member_installed", :limit => 3, :default => 0,  :null => false
    t.string  "member_installed",                 :default => "", :null => false
    t.integer "time_installed",                   :default => 0,  :null => false
    t.integer "id_member_removed",   :limit => 3, :default => 0,  :null => false
    t.string  "member_removed",                   :default => "", :null => false
    t.integer "time_removed",                     :default => 0,  :null => false
    t.integer "install_state",       :limit => 1, :default => 1,  :null => false
    t.text    "failed_steps",                                     :null => false
    t.string  "themes_installed",                 :default => "", :null => false
    t.text    "db_changes",                                       :null => false
  end

  add_index "smf_log_packages", ["filename"], :name => "filename", :length => {"filename"=>"15"}

  create_table "smf_log_polls", :id => false, :force => true do |t|
    t.integer "id_poll",   :limit => 3, :default => 0, :null => false
    t.integer "id_member", :limit => 3, :default => 0, :null => false
    t.integer "id_choice", :limit => 1, :default => 0, :null => false
  end

  add_index "smf_log_polls", ["id_poll", "id_member", "id_choice"], :name => "id_poll"

  create_table "smf_log_reported", :primary_key => "id_report", :force => true do |t|
    t.integer "id_msg",                    :default => 0,  :null => false
    t.integer "id_topic",     :limit => 3, :default => 0,  :null => false
    t.integer "id_board",     :limit => 2, :default => 0,  :null => false
    t.integer "id_member",    :limit => 3, :default => 0,  :null => false
    t.string  "membername",                :default => "", :null => false
    t.string  "subject",                   :default => "", :null => false
    t.text    "body",                                      :null => false
    t.integer "time_started",              :default => 0,  :null => false
    t.integer "time_updated",              :default => 0,  :null => false
    t.integer "num_reports",  :limit => 3, :default => 0,  :null => false
    t.integer "closed",       :limit => 1, :default => 0,  :null => false
    t.integer "ignore_all",   :limit => 1, :default => 0,  :null => false
  end

  add_index "smf_log_reported", ["closed"], :name => "closed"
  add_index "smf_log_reported", ["id_member"], :name => "id_member"
  add_index "smf_log_reported", ["id_msg"], :name => "id_msg"
  add_index "smf_log_reported", ["id_topic"], :name => "id_topic"
  add_index "smf_log_reported", ["time_started"], :name => "time_started"

  create_table "smf_log_reported_comments", :primary_key => "id_comment", :force => true do |t|
    t.integer "id_report",     :limit => 3, :default => 0,  :null => false
    t.integer "id_member",     :limit => 3,                 :null => false
    t.string  "membername",                 :default => "", :null => false
    t.string  "email_address",              :default => "", :null => false
    t.string  "member_ip",                  :default => "", :null => false
    t.string  "comment",                    :default => "", :null => false
    t.integer "time_sent",                                  :null => false
  end

  add_index "smf_log_reported_comments", ["id_member"], :name => "id_member"
  add_index "smf_log_reported_comments", ["id_report"], :name => "id_report"
  add_index "smf_log_reported_comments", ["time_sent"], :name => "time_sent"

  create_table "smf_log_scheduled_tasks", :primary_key => "id_log", :force => true do |t|
    t.integer "id_task",    :limit => 2, :default => 0,   :null => false
    t.integer "time_run",                :default => 0,   :null => false
    t.float   "time_taken",              :default => 0.0, :null => false
  end

  create_table "smf_log_search_messages", :id => false, :force => true do |t|
    t.integer "id_search", :limit => 1, :default => 0, :null => false
    t.integer "id_msg",                 :default => 0, :null => false
  end

  create_table "smf_log_search_results", :id => false, :force => true do |t|
    t.integer "id_search",   :limit => 1, :default => 0, :null => false
    t.integer "id_topic",    :limit => 3, :default => 0, :null => false
    t.integer "id_msg",                   :default => 0, :null => false
    t.integer "relevance",   :limit => 2, :default => 0, :null => false
    t.integer "num_matches", :limit => 2, :default => 0, :null => false
  end

  create_table "smf_log_search_subjects", :id => false, :force => true do |t|
    t.string  "word",     :limit => 20, :default => "", :null => false
    t.integer "id_topic", :limit => 3,  :default => 0,  :null => false
  end

  add_index "smf_log_search_subjects", ["id_topic"], :name => "id_topic"

  create_table "smf_log_search_topics", :id => false, :force => true do |t|
    t.integer "id_search", :limit => 1, :default => 0, :null => false
    t.integer "id_topic",  :limit => 3, :default => 0, :null => false
  end

  create_table "smf_log_spider_hits", :primary_key => "id_hit", :force => true do |t|
    t.integer "id_spider", :limit => 2, :default => 0,  :null => false
    t.integer "log_time",               :default => 0,  :null => false
    t.string  "url",                    :default => "", :null => false
    t.integer "processed", :limit => 1, :default => 0,  :null => false
  end

  add_index "smf_log_spider_hits", ["id_spider"], :name => "id_spider"
  add_index "smf_log_spider_hits", ["log_time"], :name => "log_time"
  add_index "smf_log_spider_hits", ["processed"], :name => "processed"

  create_table "smf_log_spider_stats", :id => false, :force => true do |t|
    t.integer "id_spider", :limit => 2, :default => 0,            :null => false
    t.integer "page_hits", :limit => 2, :default => 0,            :null => false
    t.integer "last_seen",              :default => 0,            :null => false
    t.date    "stat_date",              :default => '0001-01-01', :null => false
  end

  create_table "smf_log_subscribed", :primary_key => "id_sublog", :force => true do |t|
    t.integer "id_subscribe",     :limit => 3, :default => 0,  :null => false
    t.integer "id_member",                     :default => 0,  :null => false
    t.integer "old_id_group",     :limit => 2, :default => 0,  :null => false
    t.integer "start_time",                    :default => 0,  :null => false
    t.integer "end_time",                      :default => 0,  :null => false
    t.integer "status",           :limit => 1, :default => 0,  :null => false
    t.integer "payments_pending", :limit => 1, :default => 0,  :null => false
    t.text    "pending_details",                               :null => false
    t.integer "reminder_sent",    :limit => 1, :default => 0,  :null => false
    t.string  "vendor_ref",                    :default => "", :null => false
  end

  add_index "smf_log_subscribed", ["end_time"], :name => "end_time"
  add_index "smf_log_subscribed", ["id_member"], :name => "id_member"
  add_index "smf_log_subscribed", ["id_subscribe", "id_member"], :name => "id_subscribe", :unique => true
  add_index "smf_log_subscribed", ["payments_pending"], :name => "payments_pending"
  add_index "smf_log_subscribed", ["reminder_sent"], :name => "reminder_sent"
  add_index "smf_log_subscribed", ["status"], :name => "status"

  create_table "smf_log_topics", :id => false, :force => true do |t|
    t.integer "id_member", :limit => 3, :default => 0, :null => false
    t.integer "id_topic",  :limit => 3, :default => 0, :null => false
    t.integer "id_msg",                 :default => 0, :null => false
  end

  add_index "smf_log_topics", ["id_topic"], :name => "id_topic"

  create_table "smf_mail_queue", :primary_key => "id_mail", :force => true do |t|
    t.integer "time_sent",              :default => 0,     :null => false
    t.string  "recipient",              :default => "",    :null => false
    t.text    "body",                                      :null => false
    t.string  "subject",                :default => "",    :null => false
    t.text    "headers",                                   :null => false
    t.integer "send_html", :limit => 1, :default => 0,     :null => false
    t.integer "priority",  :limit => 1, :default => 1,     :null => false
    t.boolean "private",                :default => false, :null => false
  end

  add_index "smf_mail_queue", ["priority", "id_mail"], :name => "mail_priority"
  add_index "smf_mail_queue", ["time_sent"], :name => "time_sent"

  create_table "smf_membergroups", :primary_key => "id_group", :force => true do |t|
    t.string  "group_name",   :limit => 80, :default => "", :null => false
    t.text    "description",                                :null => false
    t.string  "online_color", :limit => 20, :default => "", :null => false
    t.integer "min_posts",    :limit => 3,  :default => -1, :null => false
    t.integer "max_messages", :limit => 2,  :default => 0,  :null => false
    t.string  "stars",                      :default => "", :null => false
    t.integer "group_type",   :limit => 1,  :default => 0,  :null => false
    t.integer "hidden",       :limit => 1,  :default => 0,  :null => false
    t.integer "id_parent",    :limit => 2,  :default => -2, :null => false
  end

  add_index "smf_membergroups", ["min_posts"], :name => "min_posts"

  create_table "smf_members", :primary_key => "id_member", :force => true do |t|
    t.string  "member_name",          :limit => 80, :default => "",           :null => false
    t.integer "date_registered",                    :default => 0,            :null => false
    t.integer "posts",                :limit => 3,  :default => 0,            :null => false
    t.integer "id_group",             :limit => 2,  :default => 0,            :null => false
    t.string  "lngfile",                            :default => "",           :null => false
    t.integer "last_login",                         :default => 0,            :null => false
    t.string  "real_name",                          :default => "",           :null => false
    t.integer "instant_messages",     :limit => 2,  :default => 0,            :null => false
    t.integer "unread_messages",      :limit => 2,  :default => 0,            :null => false
    t.integer "new_pm",               :limit => 1,  :default => 0,            :null => false
    t.text    "buddy_list",                                                   :null => false
    t.string  "pm_ignore_list",                     :default => "",           :null => false
    t.integer "pm_prefs",             :limit => 3,  :default => 0,            :null => false
    t.string  "mod_prefs",            :limit => 20, :default => "",           :null => false
    t.text    "message_labels",                                               :null => false
    t.string  "passwd",               :limit => 64, :default => "",           :null => false
    t.text    "openid_uri",                                                   :null => false
    t.string  "email_address",                      :default => "",           :null => false
    t.string  "personal_text",                      :default => "",           :null => false
    t.integer "gender",               :limit => 1,  :default => 0,            :null => false
    t.date    "birthdate",                          :default => '0001-01-01', :null => false
    t.string  "website_title",                      :default => "",           :null => false
    t.string  "website_url",                        :default => "",           :null => false
    t.string  "location",                           :default => "",           :null => false
    t.string  "icq",                                :default => "",           :null => false
    t.string  "aim",                                :default => "",           :null => false
    t.string  "yim",                  :limit => 32, :default => "",           :null => false
    t.string  "msn",                                :default => "",           :null => false
    t.integer "hide_email",           :limit => 1,  :default => 0,            :null => false
    t.integer "show_online",          :limit => 1,  :default => 1,            :null => false
    t.string  "time_format",          :limit => 80, :default => "",           :null => false
    t.text    "signature",                                                    :null => false
    t.float   "time_offset",                        :default => 0.0,          :null => false
    t.string  "avatar",                             :default => "",           :null => false
    t.integer "pm_email_notify",      :limit => 1,  :default => 0,            :null => false
    t.integer "karma_bad",            :limit => 2,  :default => 0,            :null => false
    t.integer "karma_good",           :limit => 2,  :default => 0,            :null => false
    t.string  "usertitle",                          :default => "",           :null => false
    t.integer "notify_announcements", :limit => 1,  :default => 1,            :null => false
    t.integer "notify_regularity",    :limit => 1,  :default => 1,            :null => false
    t.integer "notify_send_body",     :limit => 1,  :default => 0,            :null => false
    t.integer "notify_types",         :limit => 1,  :default => 2,            :null => false
    t.string  "member_ip",                          :default => "",           :null => false
    t.string  "member_ip2",                         :default => "",           :null => false
    t.string  "secret_question",                    :default => "",           :null => false
    t.string  "secret_answer",        :limit => 64, :default => "",           :null => false
    t.integer "id_theme",             :limit => 1,  :default => 0,            :null => false
    t.integer "is_activated",         :limit => 1,  :default => 1,            :null => false
    t.string  "validation_code",      :limit => 10, :default => "",           :null => false
    t.integer "id_msg_last_visit",                  :default => 0,            :null => false
    t.string  "additional_groups",                  :default => "",           :null => false
    t.string  "smiley_set",           :limit => 48, :default => "",           :null => false
    t.integer "id_post_group",        :limit => 2,  :default => 0,            :null => false
    t.integer "total_time_logged_in",               :default => 0,            :null => false
    t.string  "password_salt",                      :default => "",           :null => false
    t.text    "ignore_boards",                                                :null => false
    t.integer "warning",              :limit => 1,  :default => 0,            :null => false
    t.string  "passwd_flood",         :limit => 12, :default => "",           :null => false
    t.integer "pm_receive_from",      :limit => 1,  :default => 1,            :null => false
  end

  add_index "smf_members", ["birthdate"], :name => "birthdate"
  add_index "smf_members", ["date_registered"], :name => "date_registered"
  add_index "smf_members", ["id_group"], :name => "id_group"
  add_index "smf_members", ["id_post_group"], :name => "id_post_group"
  add_index "smf_members", ["id_theme"], :name => "id_theme"
  add_index "smf_members", ["last_login"], :name => "last_login"
  add_index "smf_members", ["lngfile"], :name => "lngfile", :length => {"lngfile"=>"30"}
  add_index "smf_members", ["member_name"], :name => "member_name"
  add_index "smf_members", ["posts"], :name => "posts"
  add_index "smf_members", ["real_name"], :name => "real_name"
  add_index "smf_members", ["total_time_logged_in"], :name => "total_time_logged_in"
  add_index "smf_members", ["warning"], :name => "warning"

  create_table "smf_message_icons", :primary_key => "id_icon", :force => true do |t|
    t.string  "title",      :limit => 80, :default => "", :null => false
    t.string  "filename",   :limit => 80, :default => "", :null => false
    t.integer "id_board",   :limit => 2,  :default => 0,  :null => false
    t.integer "icon_order", :limit => 2,  :default => 0,  :null => false
  end

  add_index "smf_message_icons", ["id_board"], :name => "id_board"

  create_table "smf_messages", :primary_key => "id_msg", :force => true do |t|
    t.integer "id_topic",        :limit => 3,  :default => 0,    :null => false
    t.integer "id_board",        :limit => 2,  :default => 0,    :null => false
    t.integer "poster_time",                   :default => 0,    :null => false
    t.integer "id_member",       :limit => 3,  :default => 0,    :null => false
    t.integer "id_msg_modified",               :default => 0,    :null => false
    t.string  "subject",                       :default => "",   :null => false
    t.string  "poster_name",                   :default => "",   :null => false
    t.string  "poster_email",                  :default => "",   :null => false
    t.string  "poster_ip",                     :default => "",   :null => false
    t.integer "smileys_enabled", :limit => 1,  :default => 1,    :null => false
    t.integer "modified_time",                 :default => 0,    :null => false
    t.string  "modified_name",                 :default => "",   :null => false
    t.text    "body",                                            :null => false
    t.string  "icon",            :limit => 16, :default => "xx", :null => false
    t.integer "approved",        :limit => 1,  :default => 1,    :null => false
  end

  add_index "smf_messages", ["approved"], :name => "approved"
  add_index "smf_messages", ["id_board", "id_msg"], :name => "id_board", :unique => true
  add_index "smf_messages", ["id_member", "approved", "id_msg"], :name => "id_member_msg"
  add_index "smf_messages", ["id_member", "id_board"], :name => "show_posts"
  add_index "smf_messages", ["id_member", "id_msg"], :name => "id_member", :unique => true
  add_index "smf_messages", ["id_member", "id_topic"], :name => "participation"
  add_index "smf_messages", ["id_member", "poster_ip", "id_msg"], :name => "related_ip"
  add_index "smf_messages", ["id_topic", "id_msg", "id_member", "approved"], :name => "current_topic"
  add_index "smf_messages", ["id_topic", "id_msg"], :name => "topic", :unique => true
  add_index "smf_messages", ["id_topic"], :name => "id_topic"
  add_index "smf_messages", ["poster_ip", "id_topic"], :name => "ip_index", :length => {"poster_ip"=>"15", "id_topic"=>nil}

  create_table "smf_moderators", :id => false, :force => true do |t|
    t.integer "id_board",  :limit => 2, :default => 0, :null => false
    t.integer "id_member", :limit => 3, :default => 0, :null => false
  end

  create_table "smf_openid_assoc", :id => false, :force => true do |t|
    t.text    "server_url",                               :null => false
    t.string  "handle",                   :default => "", :null => false
    t.text    "secret",                                   :null => false
    t.integer "issued",                   :default => 0,  :null => false
    t.integer "expires",                  :default => 0,  :null => false
    t.string  "assoc_type", :limit => 64,                 :null => false
  end

  add_index "smf_openid_assoc", ["expires"], :name => "expires"

  create_table "smf_package_servers", :primary_key => "id_server", :force => true do |t|
    t.string "name", :default => "", :null => false
    t.string "url",  :default => "", :null => false
  end

  create_table "smf_permission_profiles", :primary_key => "id_profile", :force => true do |t|
    t.string "profile_name", :default => "", :null => false
  end

  create_table "smf_permissions", :id => false, :force => true do |t|
    t.integer "id_group",   :limit => 2,  :default => 0,  :null => false
    t.string  "permission", :limit => 30, :default => "", :null => false
    t.integer "add_deny",   :limit => 1,  :default => 1,  :null => false
  end

  create_table "smf_personal_messages", :primary_key => "id_pm", :force => true do |t|
    t.integer "id_pm_head",                     :default => 0,  :null => false
    t.integer "id_member_from",    :limit => 3, :default => 0,  :null => false
    t.integer "deleted_by_sender", :limit => 1, :default => 0,  :null => false
    t.string  "from_name",                      :default => "", :null => false
    t.integer "msgtime",                        :default => 0,  :null => false
    t.string  "subject",                        :default => "", :null => false
    t.text    "body",                                           :null => false
  end

  add_index "smf_personal_messages", ["id_member_from", "deleted_by_sender"], :name => "id_member"
  add_index "smf_personal_messages", ["id_pm_head"], :name => "id_pm_head"
  add_index "smf_personal_messages", ["msgtime"], :name => "msgtime"

  create_table "smf_pm_recipients", :id => false, :force => true do |t|
    t.integer "id_pm",                   :default => 0,    :null => false
    t.integer "id_member", :limit => 3,  :default => 0,    :null => false
    t.string  "labels",    :limit => 60, :default => "-1", :null => false
    t.integer "bcc",       :limit => 1,  :default => 0,    :null => false
    t.integer "is_read",   :limit => 1,  :default => 0,    :null => false
    t.integer "is_new",    :limit => 1,  :default => 0,    :null => false
    t.integer "deleted",   :limit => 1,  :default => 0,    :null => false
  end

  add_index "smf_pm_recipients", ["id_member", "deleted", "id_pm"], :name => "id_member", :unique => true

  create_table "smf_pm_rules", :primary_key => "id_rule", :force => true do |t|
    t.integer "id_member",               :default => 0, :null => false
    t.string  "rule_name", :limit => 60,                :null => false
    t.text    "criteria",                               :null => false
    t.text    "actions",                                :null => false
    t.integer "delete_pm", :limit => 1,  :default => 0, :null => false
    t.integer "is_or",     :limit => 1,  :default => 0, :null => false
  end

  add_index "smf_pm_rules", ["delete_pm"], :name => "delete_pm"
  add_index "smf_pm_rules", ["id_member"], :name => "id_member"

  create_table "smf_poll_choices", :id => false, :force => true do |t|
    t.integer "id_poll",   :limit => 3, :default => 0,  :null => false
    t.integer "id_choice", :limit => 1, :default => 0,  :null => false
    t.string  "label",                  :default => "", :null => false
    t.integer "votes",     :limit => 2, :default => 0,  :null => false
  end

  create_table "smf_polls", :primary_key => "id_poll", :force => true do |t|
    t.string  "question",                      :default => "",    :null => false
    t.boolean "voting_locked",                 :default => false, :null => false
    t.integer "max_votes",        :limit => 1, :default => 1,     :null => false
    t.integer "expire_time",                   :default => 0,     :null => false
    t.integer "hide_results",     :limit => 1, :default => 0,     :null => false
    t.integer "change_vote",      :limit => 1, :default => 0,     :null => false
    t.integer "guest_vote",       :limit => 1, :default => 0,     :null => false
    t.integer "num_guest_voters",              :default => 0,     :null => false
    t.integer "reset_poll",                    :default => 0,     :null => false
    t.integer "id_member",        :limit => 3, :default => 0,     :null => false
    t.string  "poster_name",                   :default => "",    :null => false
  end

  create_table "smf_scheduled_tasks", :primary_key => "id_task", :force => true do |t|
    t.integer "next_time",                     :default => 0,   :null => false
    t.integer "time_offset",                   :default => 0,   :null => false
    t.integer "time_regularity", :limit => 2,  :default => 0,   :null => false
    t.string  "time_unit",       :limit => 1,  :default => "h", :null => false
    t.integer "disabled",        :limit => 1,  :default => 0,   :null => false
    t.string  "task",            :limit => 24, :default => "",  :null => false
  end

  add_index "smf_scheduled_tasks", ["disabled"], :name => "disabled"
  add_index "smf_scheduled_tasks", ["next_time"], :name => "next_time"
  add_index "smf_scheduled_tasks", ["task"], :name => "task", :unique => true

  create_table "smf_sessions", :primary_key => "session_id", :force => true do |t|
    t.integer "last_update", :null => false
    t.text    "data",        :null => false
  end

  create_table "smf_settings", :primary_key => "variable", :force => true do |t|
    t.text "value", :null => false
  end

  create_table "smf_smileys", :primary_key => "id_smiley", :force => true do |t|
    t.string  "code",         :limit => 30, :default => "", :null => false
    t.string  "filename",     :limit => 48, :default => "", :null => false
    t.string  "description",  :limit => 80, :default => "", :null => false
    t.integer "smiley_row",   :limit => 1,  :default => 0,  :null => false
    t.integer "smiley_order", :limit => 2,  :default => 0,  :null => false
    t.integer "hidden",       :limit => 1,  :default => 0,  :null => false
  end

  create_table "smf_spiders", :primary_key => "id_spider", :force => true do |t|
    t.string "spider_name", :default => "", :null => false
    t.string "user_agent",  :default => "", :null => false
    t.string "ip_info",     :default => "", :null => false
  end

  create_table "smf_subscriptions", :primary_key => "id_subscribe", :force => true do |t|
    t.string  "name",           :limit => 60, :default => "", :null => false
    t.string  "description",                  :default => "", :null => false
    t.text    "cost",                                         :null => false
    t.string  "length",         :limit => 6,  :default => "", :null => false
    t.integer "id_group",       :limit => 2,  :default => 0,  :null => false
    t.string  "add_groups",     :limit => 40, :default => "", :null => false
    t.integer "active",         :limit => 1,  :default => 1,  :null => false
    t.integer "repeatable",     :limit => 1,  :default => 0,  :null => false
    t.integer "allow_partial",  :limit => 1,  :default => 0,  :null => false
    t.integer "reminder",       :limit => 1,  :default => 0,  :null => false
    t.text    "email_complete",                               :null => false
  end

  add_index "smf_subscriptions", ["active"], :name => "active"

  create_table "smf_themes", :id => false, :force => true do |t|
    t.integer "id_member", :limit => 3, :default => 0,  :null => false
    t.integer "id_theme",  :limit => 1, :default => 1,  :null => false
    t.string  "variable",               :default => "", :null => false
    t.text    "value",                                  :null => false
  end

  add_index "smf_themes", ["id_member"], :name => "id_member"

  create_table "smf_topics", :primary_key => "id_topic", :force => true do |t|
    t.integer "is_sticky",         :limit => 1, :default => 0, :null => false
    t.integer "id_board",          :limit => 2, :default => 0, :null => false
    t.integer "id_first_msg",                   :default => 0, :null => false
    t.integer "id_last_msg",                    :default => 0, :null => false
    t.integer "id_member_started", :limit => 3, :default => 0, :null => false
    t.integer "id_member_updated", :limit => 3, :default => 0, :null => false
    t.integer "id_poll",           :limit => 3, :default => 0, :null => false
    t.integer "id_previous_board", :limit => 2, :default => 0, :null => false
    t.integer "id_previous_topic", :limit => 3, :default => 0, :null => false
    t.integer "num_replies",                    :default => 0, :null => false
    t.integer "num_views",                      :default => 0, :null => false
    t.integer "locked",            :limit => 1, :default => 0, :null => false
    t.integer "unapproved_posts",  :limit => 2, :default => 0, :null => false
    t.integer "approved",          :limit => 1, :default => 1, :null => false
  end

  add_index "smf_topics", ["approved"], :name => "approved"
  add_index "smf_topics", ["id_board", "id_first_msg"], :name => "board_news"
  add_index "smf_topics", ["id_board", "is_sticky", "id_last_msg"], :name => "last_message_sticky"
  add_index "smf_topics", ["id_board"], :name => "id_board"
  add_index "smf_topics", ["id_first_msg", "id_board"], :name => "first_message", :unique => true
  add_index "smf_topics", ["id_last_msg", "id_board"], :name => "last_message", :unique => true
  add_index "smf_topics", ["id_member_started", "id_board"], :name => "member_started"
  add_index "smf_topics", ["id_poll", "id_topic"], :name => "poll", :unique => true
  add_index "smf_topics", ["is_sticky"], :name => "is_sticky"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
