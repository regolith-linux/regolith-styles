INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)

PATH_REGOLITH_STYLES = $(PREFIX)/usr/share/regolith-styles

all:
	@echo "Nothing to do"

install:
	# Theme data 
	$(INSTALL) -m0644 -D Xresources/solarized $(PATH_REGOLITH_STYLES)/solarized
	$(INSTALL) -m0644 -D Xresources/st-term $(PATH_REGOLITH_STYLES)/st-term
	$(INSTALL) -m0644 -D Xresources/i3-wm $(PATH_REGOLITH_STYLES)/i3-wm
	$(INSTALL) -m0644 -D Xresources/i3blocks $(PATH_REGOLITH_STYLES)/i3blocks
	$(INSTALL) -m0644 -D Xresources/root $(PATH_REGOLITH_STYLES)/root

uninstall:
	rm -f $(PATH_REGOLITH_STYLES)/*

.PHONY: all install uninstall
