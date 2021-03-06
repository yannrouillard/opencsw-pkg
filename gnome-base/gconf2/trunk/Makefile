NAME = gconf2
VERSION = 2.32.4
GARTYPE = v2

DESCRIPTION = GNOME configuration database system
define BLURB
  GConf is a system for storing application preferences. It is intended
  for user preferences; not configuration of something like Apache, or
  arbitrary data storage.
endef

GNOME_PROJ = GConf
MASTER_SITES = $(GNOME_MIRROR)
DISTNAME = GConf-$(VERSION)
DISTFILES += $(DISTNAME).tar.bz2

# New glib is only available for Solaris 10
PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

VENDOR_URL = http://projects.gnome.org/gconf/

# Many more missing
BUILD_DEP_PKGS += CSWlibdbus-glib-dev
BUILD_DEP_PKGS += CSWlibxslt
BUILD_DEP_PKGS += CSWgtk-doc
BUILD_DEP_PKGS += CSWintltool

PACKAGES += CSWlibgconf2-4
SPKG_DESC_CSWlibgconf2-4 = GNOME configuration database system, libgconf-2.so.4
PKGFILES_CSWlibgconf2-4 += $(call pkgfiles_lib,libgconf-2.so.4)
PKGFILES_CSWlibgconf2-4 += $(call baseisadirs,$(libdir),GConf/2/.*)
PKGFILES_CSWlibgconf2-4 += $(sharedstatedir)/locale/.*\.mo
PKGFILES_CSWlibgconf2-4 += $(sharedstatedir)/dbus-1/services/.*
PKGFILES_CSWlibgconf2-4 += $(sysconfdir)/gconf/.*
PKGFILES_CSWlibgconf2-4 += $(bindir)/.*
PKGFILES_CSWlibgconf2-4 += $(libexecdir)/.*
PKGFILES_CSWlibgconf2-4 += $(mandir)/man.*
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWorbit2
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibgthread2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibxml2-2
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibgio2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibgtk-x11-2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWliblber2-4-2
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibldap2-4-2
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibdbus1-3
RUNTIME_DEP_PKGS_CSWlibgconf2-4 += CSWlibdbus-glib1-2

OBSOLETED_BY_CSWlibgconf2-4 += CSWgconf2

PACKAGES += CSWlibgconf-dev
SPKG_DESC_CSWlibgconf-dev = Development files for libgconf-2.so.4
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWorbit2
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibgthread2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibgconf2-4
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibxml2-2
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibdbus-glib1-2
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibdbus1-3
RUNTIME_DEP_PKGS_CSWlibgconf-dev += CSWlibgio2-0-0

BUILD64_LIBS_ONLY = 1

STRIP_LIBTOOL = 1

CONFIGURE_ARGS = $(DIRPATHS)
CONFIGURE_ARGS += --enable-static=no
CONFIGURE_ARGS += --enable-gtk-doc
CONFIGURE_ARGS += --with-gtk=2.0
# This one causes grief duiring build time
CONFIGURE_ARGS += --enable-introspection=no
# gsettings dumps core and does not appear to have any use here,
# as it lacks any schema.xml file to wortk with.
CONFIGURE_ARGS += --enable-gsettings-backend=no

include gar/category.mk

PATH := /opt/csw/gnu:$(PATH)
