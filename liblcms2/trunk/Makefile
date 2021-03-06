NAME = lcms2
VERSION = 2.4
GARTYPE = v2

# Retry compiling ghostscript 9.07 on version bump as some new API was introduced not in 2.4 yet:
#   https://bugzilla.redhat.com/show_bug.cgi?id=912307
#   http://list-archives.org/2013/02/14/gs-devel-ghostscript-com/ghostscript-9-07-and-ghostpdl-9-07/f/6061272699

DESCRIPTION = The little color management system and tools
define BLURB
	Little cms intends to be a small-footprint, speed optimized 
	color management engine in open source form. Since the initial release, 
	back in 1998, lcms has been continuously evolving, mostly thanks to 
	contributions done by skilled programmers, who generously donated 
	their valuable time to review the engine and the documentation. 
	For now, little cms has been ported to a big number of platforms and 
	is currently used in many open source and commercial products, 
	as well as being distributed in major linux environments. 
endef

SF_PROJECT = lcms
MASTER_SITES = $(SF_MIRRORS)
DISTFILES  = $(NAME)-$(VERSION).tar.gz

VENDOR_URL = http://www.littlecms.com/

PACKAGES += CSWliblcms2-2
SPKG_DESC_CSWliblcms2-2 = Color management library, liblcms2.so.2
PKGFILES_CSWliblcms2-2 += $(call pkgfiles_lib,liblcms2.so.2)

PACKAGES += CSWliblcms2-dev
SPKG_DESC_CSWliblcms2-dev = Development files for liblcms2.so.2
PKGFILES_CSWliblcms2-dev = $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWliblcms2-dev += CSWliblcms2-2

PACKAGES += CSWliblcms2-utils
SPKG_DESC_CSWliblcms2-utils = Utility programs for LCMS (Little Color Management)
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWliblcms2-utils += CSWliblcms2-2
RUNTIME_DEP_PKGS_CSWliblcms2-utils += CSWlibjpeg7
RUNTIME_DEP_PKGS_CSWliblcms2-utils += CSWlibtiff3

# Probably make separate package for Solaris 10 as it has float support
EXTRA_CPPFLAGS-5.9 = -Dpowf=pow -Dfabsf=labs
EXTRA_CPPFLAGS = $(EXTRA_CPPFLAGS-$(GAROSREL))

BUILD64 = 1
ISAEXEC = 1

# One test with unicode is dumping core on 64 bit, disable for now
SKIPTEST ?= 1

include gar/category.mk
