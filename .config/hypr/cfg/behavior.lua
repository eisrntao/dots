-------------------
----  BEHAVIOR ----
-------------------

hl.config({
  dwindle = {
    preserve_split = true
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

----------------
----  MISC  ----
----------------

hl.config({
  general = {
    -- makes focus throw if no window, used by the switch workspace function
    no_focus_fallback = true
  },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo   = false,
  },
})
