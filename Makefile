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

uninstall:
	rm -f $(PATH_REGOLITH_STYLES)/*

.PHONY: all install uninstall
