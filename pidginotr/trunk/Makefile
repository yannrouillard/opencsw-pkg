NAME    = pidgin-otr
VERSION = 4.0.0
GARTYPE = v2

DESCRIPTION = Off-The-Record Messaging plugin for pidgin
define BLURB
  Off-the-Record (OTR) Messaging allows you to have private conversations over instant messaging.
endef

MASTER_SITES = http://www.cypherpunks.ca/otr/
DISTFILES  = $(NAME)-$(VERSION).tar.gz
#PATCHFILES = otr_priority.patch

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = -(\d+(?:\.\d+)*).tar.gz

# For msgfmt, msgmerge, xgettext and gettext to be used from GNU
CONFIGURE_ENV_PATH = $(prefix)/gnu:$(PATH)

# pidgin-otr requires gnu gettex but doesn't do a good job of locating it
#INTLTOOL_XGETTEXT = /opt/csw/bin/gxgettext
#XGETTEXT = $(INTLTOOL_XGETTEXT)
#INTLTOOL_MSGFMT = /opt/csw/bin/gmsgfmt
#MSGFMT = $(INTLTOOL_MSGFMT)
#INTLTOOL_MSGMERGE = /opt/csw/bin/gmsgmerge
#EXTRA_CONFIGURE_EXPORTS = INTLTOOL_XGETTEXT XGETTEXT INTLTOOL_MSGFMT MSGFMT INTLTOOL_MSGMERGE

CONFIGURE_ARGS = $(DIRPATHS)

RUNTIME_DEP_PKGS_CSWpidginotr = CSWlibotr5
RUNTIME_DEP_PKGS_CSWpidginotr = CSWpidgin

BUILD_DEP_PKGS += CSWotr-dev
BUILD_DEP_PKGS += CSWlibgcrypt-dev
BUILD_DEP_PKGS += CSWlibgpg-error-dev


include gar/category.mk
