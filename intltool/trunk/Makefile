# $Id$

NAME = intltool
MAJOR_VER = 0.50
MINOR_VER = 2
VERSION = $(MAJOR_VER).$(MINOR_VER)
GNOME_SUBV = $(MAJOR_VER)
GARTYPE = v2
ARCHALL_CSWintltool = 1

DESCRIPTION =  A collection of tools for internationalization
define BLURB
  The intltool package is a set of tools for translating the contents of data files using the gettext translation framework.
endef

MASTER_SITES = https://launchpad.net/$(NAME)/trunk/$(VERSION)/+download/
DISTFILES  = $(DISTNAME).tar.gz

RUNTIME_DEP_PKGS_CSWintltool = CSWperl CSWpmxmlparser

CONFIGURE_ARGS = $(DIRPATHS)

CHECKPKG_OVERRIDES_CSWintltool += surplus-dependency|CSWpmxmlparser
CHECKPKG_OVERRIDES_CSWintltool += surplus-dependency|CSWperl

include gar/category.mk
