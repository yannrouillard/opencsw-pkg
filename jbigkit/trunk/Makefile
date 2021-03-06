# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = jbigkit
VERSION = 2.0
GARTYPE = v2

DESCRIPTION = JBIG kit, a data compression algorithm for bi-level high-resolution images
define BLURB
endef

MASTER_SITES = http://www.cl.cam.ac.uk/~mgk25/download/
DISTFILES += $(NAME)-$(VERSION).tar.gz
DISTNAME = $(NAME)

VENDOR_URL = http://www.cl.cam.ac.uk/~mgk25/jbigkit/

PACKAGES += CSWlibjbig2
SPKG_DESC_CSWlibjbig2 = A data compression library for bi-level high-resolution images, libjbig.so.2
PKGFILES_CSWlibjbig2 += $(call pkgfiles_lib,libjbig.so.2)

PACKAGES += CSWlibjbig85-2
SPKG_DESC_CSWlibjbig85-2 = T.85 light version of the libjbig.so.2 library, libjbig85.so.2
PKGFILES_CSWlibjbig85-2 += $(call pkgfiles_lib,libjbig85.so.2)

PACKAGES += CSWlibjbig-dev
SPKG_DESC_CSWlibjbig-dev = Development files for libjbig.so.2 and libjbig85.so.2
PKGFILES_CSWlibjbig-dev += $(PKGFILES_DEVEL)
PKGFILES_CSWlibjbig-dev += $(docdir)/libjbig_dev/.*
RUNTIME_DEP_PKGS_CSWlibjbig-dev += CSWlibjbig2
RUNTIME_DEP_PKGS_CSWlibjbig-dev += CSWlibjbig85-2

PACKAGES += CSWjbigkit
SPKG_DESC_CSWjbigkit = JBIG kit, a data compression algorithm for bi-level high-resolution images
# PKGFILES is catchall
# This is a legacy dependency, the binaries are statically linked against libjbig
RUNTIME_DEP_PKGS_CSWjbigkit += CSWlibjbig2
CHECKPKG_OVERRIDES_CSWjbigkit += surplus-dependency|CSWlibjbig2

BUILD64 = 1
ISAEXEC = 1

REINPLACEMENTS += gmake
REINPLACE_MATCH_gmake = make
REINPLACE_WITH_gmake = gmake
REINPLACE_FILES_gmake += Makefile
REINPLACE_FILES_gmake += pbmtools/Makefile

# Generate position independent code for shared library
EXTRA_CFLAGS-sparc = -xcode=pic13

# Use -Kpic on amd64 or this error will be thrown on ldd -r:
#   ld.so.1: lddstub: fatal: relocation error: R_AMD64_32: file /opt/csw/lib/amd64/libjbig.so.2: symbol (unknown): value 0xfffffd7fff37aa9c does not fit
# See for details
#   http://developers.sun.com/solaris/articles/about_amd64_abi.html
EXTRA_CFLAGS-i386 = -Kpic

EXTRA_CFLAGS += $(EXTRA_CFLAGS-$(GARCH))

# There is no configure
CONFIGURE_SCRIPTS =

BUILD_OVERRIDE_VARS = CC CCFLAGS
BUILD_OVERRIDE_VAR_CC = $(CC)
BUILD_OVERRIDE_VAR_CCFLAGS = $(CFLAGS)

TEST_TARGET = test

INSTALL_SCRIPTS = custom

include gar/category.mk

install-custom:
	ginstall -d $(DESTDIR)$(includedir)
	cd $(WORKSRC)/libjbig && ginstall jbig.h jbig_ar.h jbig85.h $(DESTDIR)$(includedir)
	ginstall -d $(DESTDIR)$(bindir)
	cd $(WORKSRC)/pbmtools && ginstall jbgtopbm jbgtopbm85 pbmtojbg pbmtojbg85 $(DESTDIR)$(bindir)
	ginstall -d $(DESTDIR)$(libdir)
	$(CC) $(LDFLAGS) -z allextract -z defs -G -h libjbig.so.2 -o $(DESTDIR)$(libdir)/libjbig.so.2.0 $(WORKSRC)/libjbig/libjbig.a -lc
	gln -s libjbig.so.2 $(DESTDIR)$(libdir)/libjbig.so
	gln -s libjbig.so.2.0 $(DESTDIR)$(libdir)/libjbig.so.2
	$(CC) $(LDFLAGS) -z allextract -z defs -G -h libjbig85.so.2 -o $(DESTDIR)$(libdir)/libjbig85.so.2.0 $(WORKSRC)/libjbig/libjbig85.a -lc
	gln -s libjbig85.so.2 $(DESTDIR)$(libdir)/libjbig85.so
	gln -s libjbig85.so.2.0 $(DESTDIR)$(libdir)/libjbig85.so.2
	ginstall -d $(DESTDIR)$(docdir)/libjbig_dev
	cd $(WORKSRC)/libjbig && ginstall jbig.txt jbig85.txt $(DESTDIR)$(docdir)/libjbig_dev
	ginstall -d $(DESTDIR)$(mandir)/man1
	cd $(WORKSRC)/pbmtools && ginstall *.1 $(DESTDIR)$(mandir)/man1
	@$(MAKECOOKIE)
