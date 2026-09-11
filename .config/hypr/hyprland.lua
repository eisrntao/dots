-----------------
---- IMPORTS ----
-----------------

require("cfg.autostart")
require("cfg.binds")
require("cfg.style")
require("cfg.behavior")
require("cfg.rules")

------------------
---- MONITORS ----
------------------
hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080@60",
  position = "1980x0",
  scale    = 1.25
})

hl.monitor({
  output = "HDMI-A-1",
  mode   = "1920x1080@120",
  scale  = 1.25
})




-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad     = {
      natural_scroll = false,
    },
  },
})

-- For Noctalia Color templates
require("noctalia").apply_theme()
