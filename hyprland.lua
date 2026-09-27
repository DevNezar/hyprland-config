-- Hyprland configuration (Lua API)

-- =============================================================
-- Monitors
-- =============================================================
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60.03",
    position = "0x0",
    scale = "1.33",
})

hl.monitor({
    output = "HDMI-A-2",
    mode = "preferred",
    position = "0x0",
    scale = "1",
    mirror = "eDP-1",
})

-- =============================================================
-- Local variables
-- =============================================================
local terminal = "wezterm"
local fileManager = "nemo"
local menu = "wofi"
local editor = "zeditor"
local minecraftLauncher = "java -jar ~/Downloads/SKlauncher-3.2.18.jar"
local directMinecraft = "~/.config/hypr/scripts/run_minecraft.sh"

-- =============================================================
-- Environment variables
-- =============================================================
hl.env("XCURSOR_SIZE", "6")
hl.env("HYPRCURSOR_SIZE", "6")

-- =============================================================
-- General config
-- =============================================================
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
    general = {
        gaps_in = 3,
        gaps_out = 1,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,
        active_opacity = 1.0,
        inactive_opacity = 0.85,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- =============================================================
-- Curves
-- =============================================================
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- =============================================================
-- Animations (currently disabled via animations.enabled = false)
-- =============================================================
hl.animation({ leaf = "global",         enabled = true, speed = 10,    bezier = "default" })
hl.animation({ leaf = "border",         enabled = true, speed = 5.39,  bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",        enabled = true, speed = 4.79,  bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 4.1,   bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 1.49,  bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 1.73,  bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 1.46,  bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3.03,  bezier = "quick" })
hl.animation({ leaf = "layers",         enabled = true, speed = 3.81,  bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 4,     bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1.5,   bezier = "linear",        style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 1.79,  bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 1.39,  bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 1.94,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",   enabled = true, speed = 1.21,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut",  enabled = true, speed = 1.94,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",     enabled = true, speed = 7,     bezier = "quick" })

-- =============================================================
-- Gestures
-- =============================================================
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- =============================================================
-- Devices
-- =============================================================
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- =============================================================
-- Keybinds — applications & windows
-- =============================================================
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E",      hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(menu .. " --show drun"))
hl.bind("SUPER + X", hl.dsp.exec_cmd(editor))
hl.bind("SUPER + K", hl.dsp.exec_cmd(minecraftLauncher))
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd(directMinecraft))

hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + W", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + M", function()
  local handle = io.popen("command -v hyprshutdown 2>/dev/null")
  local found = handle:read("*a")
  handle:close()

  if found ~= "" then
    hl.exec_cmd("hyprshutdown")
  else
    hl.dispatch(hl.dsp.exit())
  end
end)

-- =============================================================
-- Keybinds — focus
-- =============================================================
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- =============================================================
-- Keybinds — media & brightness
-- =============================================================
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

-- =============================================================
-- Keybinds — utilities
-- =============================================================
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))
hl.bind("SUPER + B",       hl.dsp.exec_cmd("pgrep waybar && pkill waybar || waybar &"))
hl.bind("SUPER + A",       hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy --type image/png"))
hl.bind("SUPER + Z",       hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/random-wallpaper.sh"))
hl.bind("SUPER + L",       hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("kitty --start-as=fullscreen $HOME/larp.sh"))

-- =============================================================
-- Keybinds — window resize
-- =============================================================
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 10,  y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 10,  relative = true }), { repeating = true })

-- Lid switch
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })

-- =============================================================
-- Keybinds — workspace navigation (grouped into "environments")
-- =============================================================
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/go_to_ws.sh " .. i))
end
hl.bind("SUPER + 0", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/go_to_ws.sh 10"))

for i = 1, 3 do
    hl.bind("SUPER + CTRL + " .. i, hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/go_to_env.sh " .. i))
end

for i = 1, 9 do
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/move_to_ws.sh " .. i))
end
hl.bind("SUPER + SHIFT + 0", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/move_to_ws.sh 10"))

for i = 1, 3 do
    hl.bind("SUPER + SHIFT + CTRL + " .. i, hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/move_to_env.sh " .. i))
end

-- Zoom
hl.bind("SUPER + equal", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/zoom.sh +0.25"), { repeating = true })
hl.bind("SUPER + minus", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/zoom.sh -0.25"), { repeating = true })

-- =============================================================
-- Window rules
-- =============================================================
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

-- =============================================================
-- Autostart
-- =============================================================
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("mako")
    hl.exec_cmd("$HOME/.config/hypr/scripts/random-wallpaper.sh")
    hl.exec_cmd("swaybg -i $HOME/wallpaper.png")
    hl.exec_cmd("waybar")
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("firefox-developer-edition")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland HYPRLAND_INSTANCE_SIGNATURE")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
end)
