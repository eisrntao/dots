# pywal theme
config.source('qutewal.py')
# mappings
config.source('mappings.py')

# disable autoconfig
config.load_autoconfig(False)

# settings
c.colors.webpage.darkmode.enabled = True
c.auto_save.session = True
c.window.transparent = True
c.colors.webpage.preferred_color_scheme = "dark"

c.tabs.last_close = "startpage"
c.tabs.show = "multiple"
c.tabs.indicator.width = 0
c.tabs.title.alignment = "center"

# font
c.fonts.default_family = "Iosevka Nerd Font Mono"
