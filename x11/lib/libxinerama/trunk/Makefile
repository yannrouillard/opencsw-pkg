NAME = libXinerama
VERSION = 1.1
CATEGORIES = x11

DESCRIPTION = X11 Xinerama extension library
define BLURB
  libXinerama provides an X Window System client interface to the XINERAMA extension to the X protocol. 
endef

MASTER_SITES = $(X11_LIB_MASTER_SITE)
DISTFILES  = $(NAME)-$(VERSION).tar.bz2

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

CONFIGURE_ARGS = $(DIRPATHS)

PACKAGES = CSWlibxinerama CSWlibxineramadevel

CATALOGNAME_CSWlibxinerama = libxinerama
CATALOGNAME_CSWlibxineramadevel = libxinerama_devel

SPKG_DESC_CSWlibxinerama = $(DESCRIPTION)
SPKG_DESC_CSWlibxineramadevel = $(DESCRIPTION) development files

BUILD_DEP_PKGS = CSWx11xineramaproto

RUNTIME_DEP_PKGS_CSWlibxineramadevel = CSWlibxinerama
RUNTIME_DEP_PKGS_CSWlibxinerama      = CSWlibx11 CSWlibxext

PKGFILES_CSWlibxineramadevel  = $(PKGFILES_DEVEL)

BUILD64 = 1
NOISALIST = 1

include gar/category.mk
