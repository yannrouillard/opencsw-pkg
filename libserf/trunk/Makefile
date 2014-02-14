NAME = libserf
VERSION = 1.3.3
DISTNAME = serf-$(VERSION)
GARTYPE = v2

DESCRIPTION = HTTP client library built on APR, multiplexes connections
define BLURB
    The serf library is a C-based HTTP client library built upon the
    Apache Portable Runtime (APR) library. It multiplexes connections,
    running the read/write communication asynchronously. Memory copies
    and transformations are kept to a minimum to provide high performance
    operation.
endef

GOOGLE_PROJECT = serf
MASTER_SITES = $(GOOGLE_MIRROR)
DISTFILES += $(DISTNAME).tar.bz2
PATCHFILES  += 0001-mark-solaris-as-posix-for-scons.patch

LICENSE = LICENSE
VENDOR_URL = http://code.google.com/p/serf/

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS = serf
INSTALL_SCRIPTS = serf
TEST_SCRIPTS =

PACKAGING_PLATFORMS += solaris9-sparc solaris9-i386
PACKAGING_PLATFORMS += solaris10-sparc solaris10-i386

BUILD_DEP_PKGS += CSWscons
BUILD_DEP_PKGS += CSWlibapr-dev
BUILD_DEP_PKGS += CSWlibaprutil-dev

PACKAGES += CSWlibserf1-1
SPKG_DESC_CSWlibserf1-1 += HTTP client library built on APR, multiplexes connections, libserf-1.so.1
RUNTIME_DEP_PKGS_CSWlibserf1-1 += CSWlibapr1-0
RUNTIME_DEP_PKGS_CSWlibserf1-1 += CSWlibaprutil1-0
RUNTIME_DEP_PKGS_CSWlibserf1-1 += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWlibserf1-1 += CSWlibz1
# The name libserf1_3 was wrong due to false soname interpretation
OBSOLETED_BY_CSWlibserf1-1 += CSWlibserf1-3

PACKAGES += CSWlibserf-dev
CATALOGNAME_CSWlibserf-dev = libserf_dev
SPKG_DESC_CSWlibserf-dev = Development files for libserf-1.so.1
PKGFILES_CSWlibserf-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWlibserf-dev = CSWlibserf1-1

BUILD64 = 1

EXTRA_LIB = $(prefix)/bdb48/lib

SCONS_FLAGS += APR=$(bindir)/apr-1-config
SCONS_FLAGS += APU=$(bindir)/apu-1-config

# scons doesn't honor CFLAGS, LDFLAGS... environment variables
# so we must explicitely pass them as arguments
SCONS_FLAGS += CFLAGS="$(CFLAGS)" 

# scons expands the $ISADIR variable, so we must do some more
# escape magics to make sure it is passed as is to the linker
SCONS_FLAGS += LINKFLAGS="$(LDFLAGS) $(subst $$,\\$$\\,$(LD_OPTIONS))"

include gar/category.mk

build-serf:
	(cd $(WORKSRC); \
		$(BUILD_ENV) scons \
		$(SCONS_FLAGS) PREFIX="$(prefix)" LIBDIR="$(libdir)")
	@$(MAKECOOKIE)

install-serf:
	mkdir -p $(DESTDIR)$(prefix)
	(cd $(WORKSRC); \
		$(INSTALL_ENV) scons  \
		$(SCONS_FLAGS) \
		-Q PREFIX=$(DESTDIR)$(prefix) LIBDIR="$(DESTDIR)$(libdir)"\
		install)
	@$(MAKECOOKIE)

