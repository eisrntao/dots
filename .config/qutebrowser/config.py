# pywal theme
config.source('qutewal.py')
# mappings
config.source('mappings.py')

# disable autoconfig
config.load_autoconfig(False)

# settings
c.auto_save.session = True
c.session.default_name = "Recent"
c.window.transparent = True
c.colors.webpage.preferred_color_scheme = "dark"

c.tabs.last_close = "startpage"
c.tabs.show = "multiple"
c.tabs.indicator.width = 0
c.tabs.title.alignment = "center"

# font
c.fonts.default_family = "Iosevka Nerd Font Mono"

# use yazi as file chooser
picker = [ "ghostty", "--class=custom.float", "--title=termfilechooser", "-e", "yazi", "--chooser-file={}" ]
c.fileselect.handler = "external"
c.fileselect.folder.command = picker
c.fileselect.multiple_files.command = picker
c.fileselect.single_file.command = picker
