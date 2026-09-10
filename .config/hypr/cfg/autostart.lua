-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia")
  hl.exec_cmd("oniri --first-only --tiling-layout")
  hl.exec_cmd("niri-sidebar listen")
end)
