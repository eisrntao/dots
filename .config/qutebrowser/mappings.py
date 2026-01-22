c.hints.chars = "arstgmneio"

# basic navigation
config.bind("M", "back")
config.bind("I", "forward")
config.bind("N", "tab-next")
config.bind("E", "tab-prev")

# scroll
config.bind("n", "scroll down")
config.bind("e", "scroll up")

# search
config.bind("k", "search-next")
config.bind("K", "search-prev")

# misc
config.bind("z", "config-cycle colors.webpage.darkmode.enabled")

config.bind("gs", "spawn --userscript loadsession")
