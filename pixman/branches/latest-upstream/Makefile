NAME      = pixman
VERSION   = 0.16.0
CATEGORIES   = lib

DESCRIPTION = The pixel-manipulation library for X and cairo
define BLURB
endef

MASTER_SITES = http://www.cairographics.org/releases/
DISTFILES = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

# Same as from gar/x11/categories/x11/category.mk
EXTRA_CFLAGS = -xlibmil -errtags=yes -erroff=E_EMPTY_DECLARATION
EXTRA_CXXFLAGS = -xlibmil -xlibmopt -features=tmplife -norunpath

# BUILD64 = 1
# NOISALIST = 1

PATCHFILES = pixman-private.h.diff

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --disable-gtk
CONFIGURE_ARGS += --disable-timers

include gar/category.mk
