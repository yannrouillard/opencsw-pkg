NAME = pygtk
VERSION = 2.12.1
GARTYPE = v2
RELVER = $(shell echo $(VERSION) |gsed 's/\(^[0-9].*\.[0-9].*\)\.[0-9]*/\1/')

DESCRIPTION = Python bindings for the GTK library

MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/pygtk/$(RELVER)/
DISTFILES  = $(NAME)-$(VERSION).tar.bz2
STRIP_LIBTOOL = 1

# mgar test fails with "GtkWarning: could not open display"
# however a gmake check works and finish successfull!
SKIPTEST = 1

PACKAGING_PLATFORMS = solaris9-i386 solaris9-sparc

BUILD_DEP_PKGS += CSWpkgconfig
BUILD_DEP_PKGS += CSWpygobject
# BUILD_DEP_PKGS += CSWlibglib2-dev
BUILD_DEP_PKGS += CSWlibatk-dev
BUILD_DEP_PKGS += CSWpangodevel
# BUILD_DEP_PKGS += CSWpy-cairo
BUILD_DEP_PKGS += CSWlibcairo-dev
BUILD_DEP_PKGS += CSWlibxcbdevel

PACKAGES = CSWpygtk

SPKG_DESC_CSWpygtk = $(DESCRIPTION)
OBSOLETED_BY_CSWpy-gtk = CSWpygtk

RUNTIME_DEP_PKGS_CSWpygtk += CSWglib2
RUNTIME_DEP_PKGS_CSWpygtk += CSWgtk2
RUNTIME_DEP_PKGS_CSWpygtk += CSWlibatk1-0-0
RUNTIME_DEP_PKGS_CSWpygtk += CSWlibcairo2
RUNTIME_DEP_PKGS_CSWpygtk += CSWlibglade2
RUNTIME_DEP_PKGS_CSWpygtk += CSWlibintl8
RUNTIME_DEP_PKGS_CSWpygtk += CSWpango

CHECKPKG_OVERRIDES_CSWpygtk += pkgname-does-not-start-with-CSWpy-
CHECKPKG_OVERRIDES_CSWpygtk += catalogname-does-not-start-with-py_
CHECKPKG_OVERRIDES_CSWpygtk += missing-dependency|CSWpython

EXTRA_MERGE_EXCLUDE_FILES = .*\.pyo .*\.pyc
PROTOTYPE_FILTER = awk '$$$$3 ~ /.*\.py$$$$/ { $$$$2 = "cswpycompile" } { print }'
SPKG_CLASSES = none cswpycompile
RUNTIME_DEP_PKGS += CSWcswclassutils

# PKG_CONFIG_PATH = /opt/csw/lib/pkgconfig:/opt/csw/X11/lib/pkgconfig
# EXTRA_EXPORTS = PKG_CONFIG_PATH

CONFIGURE_ARGS  = $(DIRPATHS)

#TEST_SCRIPTS =

include gar/category.mk
