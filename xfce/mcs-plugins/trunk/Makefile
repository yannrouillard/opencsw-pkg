NAME = xfce-mcs-plugins
GARTYPE = v1
CATEGORIES = xfce

DESCRIPTION = Xfce Settings Manager Plugins
define BLURB
   Xfce Settings Manager Plugins
endef

DISTFILES  = $(NAME)-$(VERSION).tar.bz2
# DISTFILES += CSWxfcemcsplugins.depend CSWxfcemcsplugins.gspec CSWxfcemcsplugins.prototype
# DISTFILES += CSWxfcemcspluginsdoc.depend CSWxfcemcspluginsdoc.gspec CSWxfcemcspluginsdoc.prototype

DISTFILES += $(call admfiles,CSWxfcemcsplugins, depend)

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

# PATCHFILES += configure.in.diff
# PATCHFILES += configure.diff

TEST_SCRIPTS = none

include gar/category.mk

test-none :
	@$(MAKECOOKIE)

post-install:
	( gfind $(DESTDIR)/opt/csw -exec bash -c "file {} | ggrep ELF | ggrep -e 'executable' -e 'dynamic lib' | ggrep 'not stripped' && strip {}"  \; )

