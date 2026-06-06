------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-3",
    mode     = "2048x1536@30",
    position = "0x0",
    scale    = "1",
})


hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@75",
    position = "0x-1440",
    scale    = "1",
})
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = 'wofi --show=drun --lines=5 --prompt=""'


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function () 
   hl.exec_cmd("swaybg -o DP-1 -m fill -i /games/canh/Wallpapers/thumb-1920-907796.png")
   hl.exec_cmd("swaybg -o DP-2 -m fill -i /games/canh/Wallpapers/thumb-1920-1347355.png ")
   hl.exec_cmd('waybar & "nm-applet --indicator" &  "wl-paste --type text --watch clipman store --no-persist" & "/usr/bin/easyeffects --gapplication-service" & "/usr/lib/polkit-kde-authentication-agent-1" & dunst')
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_STYLE_OVERRIDE","kvantum")

hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Nordzy-hyprcursors")

-- Phoronix env für Number of runs
hl.env("FORCE_TIMES_TO_RUN", "5")

-- Für ssh-agent startup
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR").."/ssh-agent.socket")

-----------------------
----- PERMISSIONS -----
-----------------------


hl.config({
   ecosystem = {
     enforce_permissions = true,
     no_update_news = true,
     no_donation_nag = true,
   },
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 15,

        border_size = 7,

        col = {
            active_border   = { colors = {"rgba(2e3440ee)", "rgba(88c0d0ee)"}, angle = 45 },
            inactive_border = "rgba(3b4252aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
            render_power = 3,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            new_optimizations = true,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
--hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
--hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("myBezier",       { type = "bezier", points = { {0.05, 0.9},    {0.1, 1.05}     } })

-- Default springs
--hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

--hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 2, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 2, bezier = "myBezier", style = "popin 80%" })
--hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
--hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 2, bezier = "myBezier"})
hl.animation({ leaf = "layers",        enabled = true,  speed = 3, bezier = "myBezier" })
--hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
--hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
--hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
--hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3.8, style = "slidefade", bezier = "default" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.5, bezier = "default", style = "slidefade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 2.5, bezier = "default", style = "slidefade" })
--hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


hl.config({
    dwindle = {
        preserve_split = true, 
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
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        vrr = 1,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "de",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 1, -- -1.0 - 1.0, 0 means no modification.

--        accel_profile = "flat",
    },

    cursor = {
      default_monitor = "DP-1", 
      },


      --turn off auto-hdr
     render = {
         cm_auto_hdr = 0, 
         },
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. "+ SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("ALT + D", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + V", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move with mainMod Shift + arrow keys
hl.bind(mainMod .. "+ SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. "+ SHIFT + H",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. "+ SHIFT + K",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ SHIFT + J",  hl.dsp.window.move({ direction = "down" }))

--workspaces focus wechsel und windows verschieben
for i = 1, 5 do
    local key = i % 5 -- 5 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false}))
end


for i = 6, 10 do
    local key = i % 5 -- 5 maps to key 0
    hl.bind("ALT + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("ALT + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false}))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
--hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Wireplumber, um über Volume Knob Lautstärke zu verwenden
hl.bind("XF86Tools", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_wireplumber.sh") 5%-'))
hl.bind("XF86Launch5", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_wireplumber.sh") 5%+'))


hl.bind("SHIFT + XF86Tools", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_wireplumber.sh") 1%-'))
hl.bind("SHIFT + XF86Launch5", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_wireplumber.sh") 1%+'))


hl.bind(mainMod .. " + XF86Tools", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_wireplumber.sh") 100%'))
hl.bind(mainMod .. " + XF86Launch5", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_wireplumber.sh") 100%'))

-- Universal Script
hl.bind("CTRL + XF86Tools", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_universal.sh") 5%-'))
hl.bind("CTRL + XF86Launch5", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_universal.sh") 5%+'))


hl.bind("CTRL + SHIFT + XF86Tools", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_universal.sh") 1%-'))
hl.bind("CTRL + SHIFT + XF86Launch5", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_universal.sh") 1%+'))


hl.bind(mainMod .. " + CTRL + XF86Tools", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_universal.sh") 100%'))
hl.bind(mainMod .. "+ CTRL + XF86Launch5", hl.dsp.exec_cmd('wpctl set-volume -p $("/home/ca/Bashscripts/volumeknob_universal.sh") 100%'))


-- Requires playerctl
hl.bind(mainMod .. " + ALT + N",  hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + CTRL + N",  hl.dsp.exec_cmd("playerctl previous"))


-- Shortcut für Apps
hl.bind("ALT + K", hl.dsp.exec_cmd("/home/ca/Bashscripts/clipauskee.sh"))
hl.bind("ALT + T", hl.dsp.exec_cmd("thunderbird"))
hl.bind("ALT + SHIFT + E", hl.dsp.exec_cmd("emacs"))
hl.bind("ALT + F", hl.dsp.exec_cmd("firefox"))
hl.bind("ALT + SHIFT + D", function()
    hl.dispatch(hl.dsp.exec_cmd("discord", { workspace = "7 silent" }))
end)
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" /games/canh/screenshots/$(date +%Y-%m-%d_%H-%m-%s).png'))
hl.bind(mainMod .. " + SHIFT + Z", function()
    hl.dispatch(hl.dsp.exec_cmd("alacritty --class mpvy -e /home/ca/Bashscripts/mpv.sh", { workspace = "3 silent" }))
end)
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("swaylock --image /games/canh/Wallpapers/neon-genesis-evangelion-ec-2560x1440.jpg --inside-color 3b4252 --ring-color 2e3440 --key-hl-color d8dee9 --inside-ver-color 81a1c1 --ring-ver-color 88c0d0 -f"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.dpms({ action = "toggle", monitor = "DP-2" }))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd('libreoffice -o "/games/canh/Linux-Pakte/Infos zu Linux/Linux Links.odt"'))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("/home/ca/.joplin/Joplin.AppImage"))
hl.bind("ALT + SHIFT + W", function()
    hl.dispatch(hl.dsp.exec_cmd("firefox --new-window https://web.whatsapp.com/", { workspace = "8" }))
end)
hl.bind("ALT + H", hl.dsp.exec_cmd("clipman pick -t wofi"))


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


hl.window_rule({
    name  = "silent discord",
    match = {
        initial_class      = "discord",
        initial_title      = "Discord"
    },
    no_initial_focus = true, 
    workspace  = "7 silent",
})



hl.window_rule({
    name  = "silent discord",
    match = {
        class      = "firefox",
        title      = "WhatsApp — Mozilla Firefox"
    },
    workspace  = "8",
})

--bind Workspaces to Monitors
hl.workspace_rule({ workspace = "1", monitor = "DP-3"})
hl.workspace_rule({ workspace = "2", monitor = "DP-3"})
hl.workspace_rule({ workspace = "3", monitor = "DP-3"})
hl.workspace_rule({ workspace = "4", monitor = "DP-3"})
hl.workspace_rule({ workspace = "5", monitor = "DP-3"})


hl.workspace_rule({ workspace = "6", monitor = "DP-2"})
hl.workspace_rule({ workspace = "7", monitor = "DP-2"})
hl.workspace_rule({ workspace = "8", monitor = "DP-2"})
hl.workspace_rule({ workspace = "9", monitor = "DP-2"})
hl.workspace_rule({ workspace = "10", monitor = "DP-2"})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

