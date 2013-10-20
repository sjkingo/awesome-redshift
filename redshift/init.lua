-- Redshift plugin for the Awesome WM
-- Sam Kingston <sam@sjkwi.com.au>
--
-- Free use to any and all for whatever you want.
--
-- To use, add the following to your rc.lua:
--
--   local redshift = require("redshift")
--   redshift.path = "/path/to/redshift/if/non/standard"
--   redshift.pkill = "/path/to/pkill/if/non/standard"
--   redshift.init("/home/you/.config/redshift.conf", 1)
--
-- You probably don't need to set redshift.path or redshift.pkill, so
-- typically the first and last lines are all that's needed. Change the
-- second argument to redshift.init() to 0 if you don't want it enabled
-- right away.
--
-- Add a keybinding to toggle redshift on and off:
--
--   awful.key({ modkey, }, "r", redshift.toggle)

local awful = require("awful")

local redshift = {}
redshift.path = "/bin/redshift"
redshift.pkill = "/bin/pkill"
redshift.config = ""                    -- config file, passed to init()
redshift.state = 0                      -- 1 = running, 0 = not running

redshift.start = function()
    if redshift.state == 0
    then
        awful.util.spawn(redshift.path .. " -c " .. redshift.config)
        redshift.state = 1
    end
end

redshift.stop = function()
    if redshift.state == 1
    then
        awful.util.spawn(redshift.pkill .. " redshift ")
        redshift.state = 0
    end
end

redshift.toggle = function()
    if redshift.state == 0
    then
        redshift.start()
    else
        redshift.stop()
    end
end

-- init():
--   config path must be an absolute path with no variables as they
--   will not be expanded.
--   enabled = 1 to start redshift, 0 to not
redshift.init = function(config, enabled)
    redshift.config = config
    if enabled == 1
    then
        redshift.start()
    end
end

return redshift
