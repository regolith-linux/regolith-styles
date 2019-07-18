INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)

PATH_REGOLITH_STYLES = $(PREFIX)/usr/share/regolith-styles

all:
	@echo "Nothing to do"

install:
	# Styles - Colors
	$(INSTALL) -m0644 -D Xresources/color-solarized-dark $(PATH_REGOLITH_STYLES)/color-solarized-dark
	$(INSTALL) -m0644 -D Xresources/color-solarized-light $(PATH_REGOLITH_STYLES)/color-solarized-light
	$(INSTALL) -m0644 -D Xresources/color-gruvbox $(PATH_REGOLITH_STYLES)/color-gruvbox
	$(INSTALL) -m0644 -D Xresources/color-gruvbox $(PATH_REGOLITH_STYLES)/color-nord

	# Styles - Fonts
	$(INSTALL) -m0644 -D Xresources/typeface-sourcecodepro $(PATH_REGOLITH_STYLES)/typeface-sourcecodepro

    # App mappings
	$(INSTALL) -m0644 -D Xresources/st-term $(PATH_REGOLITH_STYLES)/st-term
	$(INSTALL) -m0644 -D Xresources/i3-wm $(PATH_REGOLITH_STYLES)/i3-wm
	$(INSTALL) -m0644 -D Xresources/i3xrocks $(PATH_REGOLITH_STYLES)/i3xrocks
	$(INSTALL) -m0644 -D Xresources/rofi $(PATH_REGOLITH_STYLES)/rofi

	# Root File
	$(INSTALL) -m0644 -D Xresources/root $(PATH_REGOLITH_STYLES)/root

uninstall:
	rm -f $(PATH_REGOLITH_STYLES)/*

.PHONY: all install uninstall
