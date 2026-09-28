---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "ghostty +new-window || ghostty"
local fileManager = "nautilus"
local browser     = "helium-browser"
local music       = "pear-desktop"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod     = "SUPER"         -- Sets "Windows" key as main modifier
local ipc         = "noctalia msg " -- Save on typing noctalia commands

--------------
---- APPS ----
--------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(music))

---------------
---- SHELL ----
---------------

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))
hl.bind(mainMod .. " + + Escape", hl.dsp.exec_cmd("bartib stop; media pause;" .. ipc .. "session lock"))
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(ipc .. "panel-toggle session toggle && bartib stop"))

-------------------
---- UTILITIES ----
-------------------

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ action = "toggle", internal = 1, client = 0 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-----------------
---- WINDOWS ----
-----------------

-- Focusing windows
---@param direction string
local function focusOrChangeWorkspace(direction)
  local cw = hl.get_active_window()
  if not cw then
    hl.dispatch(hl.dsp.focus({ workspace = direction == "down" and "+1" or "-1" }))
    return
  end
  local r = hl.dispatch(hl.dsp.focus({ direction = direction }))
  if not r.ok and r.code == "not_found" then
    hl.dispatch(hl.dsp.focus({ workspace = direction == "down" and "+1" or "-1" }))
  end
end

-- Arrows
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + down", function()
  focusOrChangeWorkspace("down")
end)
hl.bind(mainMod .. " + up", function()
  focusOrChangeWorkspace("up")
end)


-- And HJKL
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", function()
  focusOrChangeWorkspace("down")
end)
hl.bind(mainMod .. " + K", function()
  focusOrChangeWorkspace("up")
end)

-------------------------------------------------------------------

-- Moving windows
---@param direction string
local function swapOrMoveWindow(direction)
  local r = hl.dispatch(hl.dsp.window.swap({ direction = direction }))
  if not r.ok and r.code == "not_found" then
    hl.dispatch(hl.dsp.window.move({ workspace = direction == "down" and "+1" or "-1" }))
  end
end

-- Arrows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + down", function()
  swapOrMoveWindow("down")
end)
hl.bind(mainMod .. " + SHIFT + up", function()
  swapOrMoveWindow("up")
end)

-- And HJKL
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + J", function()
  swapOrMoveWindow("down")
end)
hl.bind(mainMod .. " + SHIFT + K", function()
  swapOrMoveWindow("up")
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------
---- WORKSPACES ----
--------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

---------------
---- MEDIA ----
---------------

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("noctalia msg volume-mute"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("noctalia msg mic-mute"),
  { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("noctalia msg brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness decrease"), { locked = true, repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("noctalia msg media play"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("noctalia msg media pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("noctalia msg media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("noctalia msg media previous"), { locked = true })

------------------
---- GESTURES ----
------------------

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
