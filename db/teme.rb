  create_table "teme", force: :cascade do |t|
    t.integer "User ID",                            limit: 4
    t.string  "First name",                         limit: 255
    t.string  "Last name",                          limit: 255
    t.string  "Organization",                       limit: 255
    t.string  "e-Mail",                             limit: 255
    t.string  "Phone",                              limit: 255
    t.string  "usms_2018",                          limit: 255
    t.string  "usms_id",                            limit: 255
    t.string  "usms_reg",                           limit: 255
    t.date    "level_changed",                                    null: false
    t.string  "Password",                           limit: 255
    t.string  "Group participation",                limit: 255
    t.string  "Address",                            limit: 255
    t.string  "City",                               limit: 255
    t.string  "Zip",                                limit: 255
    t.string  "State",                              limit: 255
    t.string  "USMS Number",                        limit: 255
    t.string  "Emerg. Contact Name",                limit: 255
    t.string  "Emerg. Contact Phone",               limit: 255
    t.string  "I MOSTLY swim (please choose one):", limit: 255
    t.string  "Lifeguard/CPR/WSI Certified?",       limit: 255
    t.string  "Team Etiquette",                     limit: 255
    t.string  "lifeguard cert date",                limit: 255
    t.string  "Archived",                           limit: 255
    t.string  "Subscribed to emails",               limit: 255
    t.string  "Subscription source",                limit: 255
    t.string  "Opted in",                           limit: 255
    t.string  "Event announcements",                limit: 255
    t.string  "Member emails and newsletters",      limit: 255
    t.string  "Administration access",              limit: 255
    t.string  "Created on",                         limit: 255
    t.string  "Profile last updated",               limit: 255
    t.string  "Last login",                         limit: 255
    t.string  "Updated by",                         limit: 255
    t.string  "Balance",                            limit: 255
    t.float   "Total donated",                      limit: 24
    t.string  "Membership enabled",                 limit: 255
    t.string  "Membership level",                   limit: 255
    t.string  "Membership status",                  limit: 255
    t.string  "Member since",                       limit: 255
    t.string  "Renewal due",                        limit: 255
    t.string  "Renewal date last changed",          limit: 255
    t.string  "Level last changed",                 limit: 255
    t.string  "Access to profile by others",        limit: 255
    t.binary  "Details to show",                    limit: 65535
    t.string  "Photo albums enabled",               limit: 255
    t.string  "Member bundle ID or email",          limit: 255
    t.string  "Member role",                        limit: 255
    t.binary  "Notes",                              limit: 65535
  end

  create_table "usms", force: :cascade do |t|
    t.string  "First Name",  limit: 255
    t.string  "MI",          limit: 255
    t.string  "Last Name",   limit: 255
    t.string  "WO Group",    limit: 255
    t.string  "USMS Number", limit: 255
    t.string  "Reg. Date",   limit: 255
    t.integer "year",        limit: 4,   default: 2018, null: false
    t.date    "usms_reg"
    t.string  "usms_id",     limit: 5
    t.string  "usms_team",   limit: 255, default: "",   null: false
  end
