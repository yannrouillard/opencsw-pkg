NAME = leptonica
VERSION = 1.69
GARTYPE = v2

DESCRIPTION = An open source C library for efficient image processing and image analysis operations

MASTER_SITES = $(GOOGLE_MIRROR)
DISTFILES += $(DISTNAME).tar.gz

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

LICENSE = README.html

PACKAGES += CSWliblept3
SPKG_DESC_CSWliblept3 = An open source C library for efficient image processing and image analysis operations, liblept.so.3
PKGFILES_CSWliblept3 += $(call pkgfiles_lib,liblept.so.3)
RUNTIME_DEP_PKGS_CSWliblept3 += CSWlibwebp4
RUNTIME_DEP_PKGS_CSWliblept3 += CSWlibpng15-15
RUNTIME_DEP_PKGS_CSWliblept3 += CSWlibz1
RUNTIME_DEP_PKGS_CSWliblept3 += CSWlibtiff5
RUNTIME_DEP_PKGS_CSWliblept3 += CSWlibjpeg7
RUNTIME_DEP_PKGS_CSWliblept3 += CSWlibgif4

PACKAGES += CSWliblept-dev
SPKG_DESC_CSWliblept-dev = Development files for liblept.so.3
PKGFILES_CSWliblept-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWliblept-dev += CSWliblept3

PACKAGES += CSWleptonica
SPKG_DESC_CSWleptonica = Tools for efficient image processing and image analysis operations
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWleptonica += CSWliblept3

# This is used in the sourcecode, but not set anywhere
EXTRA_CPPFLAGS += -D__SOLARIS__

# We need this for stdbool.h
EXTRA_CFLAGS += -xc99=all

BUILD64 = 1
ISAEXEC = 1

include gar/category.mk

