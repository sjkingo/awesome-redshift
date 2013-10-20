redshift-awesome
================

This is a library to interface redshift with awesome.

Usage
-----

To use, add the following to your rc.lua:

```lua
local redshift = require("redshift")
redshift.path = "/path/to/redshift/if/non/standard"
redshift.pkill = "/path/to/pkill/if/non/standard"
redshift.init("/home/you/.config/redshift.conf", 1)
```

You probably don't need to set redshift.path or redshift.pkill, so typically
the first and last lines are all that's needed. Change the second argument to
redshift.init() to 0 if you don't want it enabled right away.

Add a keybinding to toggle redshift on and off:

```lua
awful.key({ modkey, }, "r", redshift.toggle)
```

API
---

Firstly, initialise the library by passing the absolute path to your redshift config,
and a flag to tell the library whether to start redshift or not (1 = yes, 0 = no):

```lua
redshift.init(config, enabled)
```

To start redshift:

```lua
redshift.start()
```

To stop redshift:

```lua
redshift.stop()
```

To toggle redshift (start if stopped, stop if started; useful for using as a key binding):

```lua
redshift.toggle()
```

