NAME = netpbm
VERSION = 10.63.00
GARTYPE = v2

DESCRIPTION = Netpbm is a toolkit for manipulation of graphic images
define BLURB
  Netpbm is a toolkit for manipulation of graphic images, 
  including conversion of images between a variety of different formats.
endef

SF_PROJECT = netpbm
MASTER_SITES  = svn-http://svn.code.sf.net/p/$(NAME)/code/release_number/
DISTFILES += config.mk
DISTFILES += $(VERSION)
NOCHECKSUM += $(VERSION)
DISTNAME = $(VERSION)

GARCOMPILER = GCC4

EXPANDVARS += config.mk

PATCHFILES += 0006-memcpy_stdlib.patch
PATCHFILES += 0007_stdout_already_used.patch

VENDOR_URL = http://netpbm.sourceforge.net/

LICENSE = doc/GPL_LICENSE.txt

BUILD_DEP_PKGS += CSWx11xproto

PACKAGES += CSWnetpbm
SPKG_DESC_CSWnetpbm = A toolkit for manipulation of graphic images
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibnetpbm11
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibjpeg7
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibtiff5
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibz1
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibxml2-2
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibjbig2
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibpng15-15
RUNTIME_DEP_PKGS_CSWnetpbm += CSWlibjasper1
# Plenty of those, but check_db_symbols returns absolutely nothing
CHECKPKG_OVERRIDES_CSWnetpbm += no-direct-binding

PACKAGES += CSWlibnetpbm11
CATALOGNAME_CSWlibnetpbm11 = libnetpbm11
PKGFILES_CSWlibnetpbm11 += $(call baseisadirs,$(libdir),libnetpbm\.so\.11\.63)
PKGFILES_CSWlibnetpbm11 += $(call baseisadirs,$(libdir),libnetpbm\.so\.11(\.\d+)*)
SPKG_DESC_CSWlibnetpbm11 += $(DESCRIPTION), libnetpbm.so.11
# Acceptable, list of locations for rgb.txt
CHECKPKG_OVERRIDES_CSWlibnetpbm11 += file-with-bad-content|/usr/share|root/opt/csw/lib/libnetpbm.so.11.63

PACKAGES += CSWlibnetpbm-dev
SPKG_DESC_CSWlibnetpbm-dev = Development files for libnetpbm.so.10
PKGFILES_CSWlibnetpbm-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWlibnetpbm-dev += CSWlibnetpbm10
# Acceptable, list of locations for rgb.txt
CHECKPKG_OVERRIDES_CSWlibnetpbm-dev += file-with-bad-content|/usr/share|root/opt/csw/include/netpbm/pm_config.h

CONFIGURE_SCRIPTS = custom

INSTALL_OVERRIDE_VARS += PKGMANDIR
INSTALL_ARGS = package pkgdir=$(DESTDIR)$(prefix)
INSTALL_OVERRIDE_VAR_PKGMANDIR = share/man

# Package has no testsuite
TEST_SCRIPTS =

EXTRA_MERGE_EXCLUDE_FILES += $(prefix)/README
EXTRA_MERGE_EXCLUDE_FILES += $(prefix)/pkginfo
EXTRA_MERGE_EXCLUDE_FILES += $(prefix)/VERSION
EXTRA_MERGE_EXCLUDE_FILES += $(prefix)/config_template
EXTRA_MERGE_EXCLUDE_FILES += $(prefix)/man/.*
EXTRA_MERGE_EXCLUDE_FILES += $(prefix)/link/.*

EXTRA_PAX_ARGS = -s ",$(prefix)/misc,$(sharedstatedir)/netpbm,"

EXTRA_LD_OPTIONS = -z nolazyload

# Needed so the newly built libis picked before the installed one
EXTRA_LD_OPTIONS += -L$(abspath $(WORKSRC)/libs)

include gar/category.mk

PATH := /opt/csw/gnu:$(PATH):/opt/csw/gcc4/bin

configure-custom:
	cp $(WORKDIR)/config.mk $(WORKSRC)
	perl -pi \
		-e 's,(#define\s+RGB_DB1\s+).*,$$1"/opt/csw/share/netpbm/rgb.txt",;' \
		-e 's,(#define\s+RGB_DB2\s+).*,$$1"/usr/openwin/lib/X11/rgb.txt",;' \
		-e 's,(#define\s+RGB_DB3\s+).*,$$1"/usr/openwin/lib/rgb.txt",;' \
		$(WORKSRC)/pm_config.in.h
	@$(MAKECOOKIE)

pre-install-modulated:
	mkdir -p $(DESTDIR)/opt

post-install-modulated:
	rm -f $(DESTDIR)$(libdir)/libnetpbm.so
	gln -s libnetpbm.so.10 $(DESTDIR)$(libdir)/libnetpbm.so
