-- Borrowed from this github issue comment:
-- https://github.com/Hammerspoon/hammerspoon/issues/2570#issuecomment-792351312

HYPER = {"cmd", "alt", "ctrl", "shift"}
local hs = hs;

-- Helper function to send commands to yabai.
local yabai = function(args)
    -- Runs in background very fast.
    hs.task.new("/opt/homebrew/bin/yabai", nil, function(ud, ...)
            print("stream", hs.inspect(table.pack(...)))
            return true
        end, args):start()
end

-- Helper function to create a yabai mode
local createYabaiMode = function(modelCord, modalKey, modeName, modePopup) 
    local mode = hs.hotkey.modal.new(modelCord, modalKey)
    mode:bind('', 'escape', function() mode:exit() end)

    if modePopup then
        function mode:entered() hs.alert.show(string.format("Entered %s mode", modeName)) end
        function mode:exited() hs.alert.show(string.format("Exited %s mode", modeName)) end
    end
    return mode
  end

-- Yabai modes key-bindings.
local focusWindowMode = createYabaiMode(HYPER, 'f', "focus window", true)
local swapWindowMode = createYabaiMode(HYPER, 's', 'swap window', true)
local resizeWindowMode = createYabaiMode(HYPER, 'r', 'resize window', true)
local yabaiWindowMode = createYabaiMode(HYPER, 'y', 'yabai', true)

-- Focus window mode key-bindings
focusWindowMode:bind('', 'h', function() yabai({"-m", "window", "--focus", "west"}) focusWindowMode:exit() end)
focusWindowMode:bind('', 'l', function() yabai({"-m", "window", "--focus", "east"}) focusWindowMode:exit() end)
focusWindowMode:bind('', 'j', function() yabai({"-m", "window", "--focus", "sout"}) focusWindowMode:exit() end)
focusWindowMode:bind('', 'k', function() yabai({"-m", "window", "--focus", "east"}) focusWindowMode:exit() end)

-- Swap window mode key-bindings
swapWindowMode:bind('', 'h', function() yabai({"-m", "window", "--swap", "west"}) swapWindowMode:exit() end)
swapWindowMode:bind('', 'l', function() yabai({"-m", "window", "--swap", "east"}) swapWindowMode:exit() end)
swapWindowMode:bind('', 'j', function() yabai({"-m", "window", "--swap", "sout"}) swapWindowMode:exit() end)
swapWindowMode:bind('', 'k', function() yabai({"-m", "window", "--swap", "east"}) swapWindowMode:exit() end)

-- Resize window mode key-bindings
resizeWindowMode:bind('', 'left',  function() yabai({"-m", "window", "--resize", "left:-20:0"})  end)
resizeWindowMode:bind('', 'right', function() yabai({"-m", "window", "--resize", "left:0:-20"})  end)
resizeWindowMode:bind('', 'down',  function() yabai({"-m", "window", "--resize", "top:0:-20"})   end)
resizeWindowMode:bind('', 'up',    function() yabai({"-m", "window", "--resize", "bottom:0:-20"}) end)

-- Yabai window mode keybindings
yabaiWindowMode:bind('', 'b', function() yabai({"-m", "space", "--layout", "bsp"})   yabaiWindowMode:exit() end)
yabaiWindowMode:bind('', 'f', function() yabai({"-m", "space", "--layout", "float"}) yabaiWindowMode:exit() end)

