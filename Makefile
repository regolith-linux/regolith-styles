INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)

PATH_REGOLITH_STYLES = $(PREFIX)/usr/share/regolith-styles

all:
	@echo "Nothing to do"

install:
	# Styles 
	$(INSTALL) -m0644 -D Xresources/color-solarized $(PATH_REGOLITH_STYLES)/color-solarized
	$(INSTALL) -m0644 -D Xresources/color-gruvbox $(PATH_REGOLITH_STYLES)/color-gruvbox
	$(INSTALL) -m0644 -D Xresources/typeface-sourcecodepro $(PATH_REGOLITH_STYLES)/typeface-sourcecodepro

    # App mappings
	$(INSTALL) -m0644 -D Xresources/st-term $(PATH_REGOLITH_STYLES)/st-term
	$(INSTALL) -m0644 -D Xresources/i3-wm $(PATH_REGOLITH_STYLES)/i3-wm
	$(INSTALL) -m0644 -D Xresources/i3blocks $(PATH_REGOLITH_STYLES)/i3blocks
	$(INSTALL) -m0644 -D Xresources/rofi $(PATH_REGOLITH_STYLES)/rofi
	$(INSTALL) -m0644 -D Xresources/root $(PATH_REGOLITH_STYLES)/root

uninstall:
	rm -f $(PATH_REGOLITH_STYLES)/*

.PHONY: all install uninstall
