# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME    = libwebp
VERSION = 0.3.1
GARTYPE = v2

DESCRIPTION = An image format that does lossy compression of digital photographic images
define BLURB
endef

GOOGLE_PROJECT = webp
MASTER_SITES = $(GOOGLE_MIRROR)
DISTFILES  = $(DISTNAME).tar.gz

GARCOMPILER = SOS12U3

PACKAGES += CSWlibwebp-dev
SPKG_DESC_CSWlibwebp-dev = Development files for libwebp.so.4
PKGFILES_CSWlibwebp-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWlibwebp-dev += CSWlibwebp4

PACKAGES += CSWlibwebp4
SPKG_DESC_CSWlibwebp4 = Library for the WebP lossy photographic image format, libwebp.so.4
PKGFILES_CSWlibwebp4 = $(call pkgfiles_lib,libwebp.so.4)

PACKAGES += CSWwebp
SPKG_DESC_CSWwebp = An image format that does lossy compression of digital photographic images
# PKGFILES is catchall

BUILD_DEP_PKGS += CSWlibpng-dev
BUILD_DEP_PKGS += CSWlibjpeg-dev
BUILD_DEP_PKGS += CSWlibtiff-dev

RUNTIME_DEP_PKGS_CSWwebp += CSWlibwebp4
RUNTIME_DEP_PKGS_CSWwebp += CSWlibjpeg7
RUNTIME_DEP_PKGS_CSWwebp += CSWlibpng15-15
RUNTIME_DEP_PKGS_CSWwebp += CSWlibtiff5

ISAEXEC = 1
BUILD64 = 1

include gar/category.mk

post-extract-modulated:
	@# This tarball has not been boostrapped
	-cd $(WORKSRC) && ./autogen.sh
	@$(MAKECOOKIE)
