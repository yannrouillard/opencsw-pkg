NAME = xtrans
VERSION = 1.2.5
CATEGORIES = x11
GARTYPE = bts

DESCRIPTION = X transport library
define BLURB
  xtrans includes a number of routines to make X implementations transport-independent;
  at time of writing, it includes support for UNIX sockets, IPv4, IPv6, and DECnet.
endef

MASTER_SITES = $(X11_LIB_MASTER_SITE)
DISTFILES = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

RUNTIME_DEP_PKGS = NIMOSSx11common

BUILD64 = 1
CONFIGURE_ARGS = $(DIRPATHS)

PATCHFILES  = Makefile.am.diff
PATCHFILES += Makefile.in.diff

include gar/category.mk

