NAME = libXevie
VERSION = 1.0.2
CATEGORIES = x11
GARTYPE = v2

DESCRIPTION = X11 EvIE extension library
define BLURB
  libXevie provides an X Window System client interface to the EvIE extension to the X protocol. 
endef

MASTER_SITES = $(X11_LIB_MASTER_SITE)
DISTFILES  = $(NAME)-$(VERSION).tar.bz2

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

CONFIGURE_ARGS = $(DIRPATHS)

PACKAGES = CSWlibxevie CSWlibxeviedevel

CATALOGNAME_CSWlibxevie = libxevie
CATALOGNAME_CSWlibxeviedevel = libxevie_devel

SPKG_DESC_CSWlibxevie = $(DESCRIPTION)
SPKG_DESC_CSWlibxeviedevel = $(DESCRIPTION) development files

BUILD_DEP_PKGS = CSWevieext

RUNTIME_DEP_PKGS_CSWlibxeviedevel = CSWlibxevie
RUNTIME_DEP_PKGS_CSWlibxevie      = CSWlibx11 CSWlibxext

PKGFILES_CSWlibxeviedevel  = $(PKGFILES_DEVEL)

BUILD64_LIBS_ONLY = 1
NOISALIST = 1

include gar/category.mk
