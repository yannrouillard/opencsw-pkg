NAME = gnutls
VERSION = 3.1.22

DESCRIPTION = GNU Transport Layer Security libraries and tools
define BLURB
  GnuTLS is a project that aims to develop a library which provides a
  secure layer, over a reliable transport layer. Currently the GnuTLS
  library implements the proposed standards by the IETF's TLS working group.
endef

SUBV = $(shell echo $(VERSION) | awk -F. '{print $$1"."$$2}')
MASTER_SITES = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(SUBV)/
DISTFILES += $(DISTNAME).tar.xz
# PATCHFILES += 0001-Do-not-strip-norunpath.patch
PATCHFILES += 0002-Use-AF_UNIX-instead-of-AF_LOCAL-on-Solaris.patch

# Some test scripts now uses some bashisms, so we make
# sure that bash is used instead of sh
PATCHFILES += 0003-force-use-of-bash-shell-in-non-portable-test-scripts.patch

# Sun Studio 12 bails out on .deinit_func
GARCOMPILER = GCC4

VENDOR_URL = http://gnutls.org

BUILD_DEP_PKGS += CSWlibnettle-dev
BUILD_DEP_PKGS += CSWlibreadline-dev
BUILD_DEP_PKGS += CSWlibtasn1-dev
BUILD_DEP_PKGS += CSWlibgpg-error-dev
BUILD_DEP_PKGS += CSWlibgcrypt-dev
BUILD_DEP_PKGS += CSWlibp11kit-dev
BUILD_DEP_PKGS += CSWlibiconv-dev

PACKAGES += CSWgnutls
CATALOGNAME_gnutls = gnutls
SPKG_DESC_CSWgnutls = GNU Transport Layer Security Utility Programs
RUNTIME_DEP_PKGS_CSWgnutls += CSWlibgnutls28
RUNTIME_DEP_PKGS_CSWgnutls += CSWlibintl8
# This is a dependency for legacy packages expecting to find libgnutls*.so.13 in CSWgnutls.
# CSWlibgnutls13 is built from a branch
RUNTIME_DEP_PKGS_CSWgnutls += CSWlibgnutls13
CHECKPKG_OVERRIDES_CSWgnutls += unidentified-dependency|CSWlibgnutls13
CHECKPKG_OVERRIDES_CSWgnutls += surplus-dependency|CSWlibgnutls13
CHECKPKG_OVERRIDES_CSWgnutls += surplus-dependency|CSWlibgnutls28

PACKAGES += CSWlibgnutls28
CATALOGNAME_CSWlibgnutls = libgnutls28
SPKG_DESC_CSWlibgnutls28 = GNU Transport Layer Security libraries and tools providing libgnutls*.so.28
PKGFILES_CSWlibgnutls28  = $(PKGFILES_RT)
PKGFILES_CSWlibgnutls28 += $(docdir)/libgnutls28/.*
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibhogweed2
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibp11kit0
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibgmp10
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibstdc++6
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWlibgnutls28 += CSWlibnettle4

# We put all libs in one package as they are .so.28 and are all bumped together
CHECKPKG_OVERRIDES_CSWlibgnutls28 += shared-lib-pkgname-mismatch

PACKAGES += CSWlibgnutls-dev
SPKG_DESC_CSWlibgnutls-dev = Development Files for GNU TLS
PKGFILES_CSWlibgnutls-dev = $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWlibgnutls-dev += CSWlibgnutls28
OBSOLETED_BY_CSWlibgnutls-dev = CSWgnutlsdevel

# The compilation complains with 
# "gets is a security hole - use fgets instead"
# even if it is not used, so we remove this warning
PATCHFILES += 0001-no-gets-warning.patch

# EXTRA_CPPFLAGS = -D_FILE_OFFSET_BITS=64

BUILD64 = 1

CONFIGURE_ARGS += $(DIRPATHS)
CONFIGURE_ARGS += --with-lzo
CONFIGURE_ARGS += --disable-guile
CONFIGURE_ARGS += --disable-libdane
CONFIGURE_ARGS += --with-default-trust-store-file=$(sysconfdir)/ssl/certs/ca-certificates.crt
CONFIGURE_ARGS += --with-unbound-root-key-file=$(sysconfdir)/unbound/root.key
# libopts doesn't contains yet 64 bits libraries so we have to use
# the included one meanwhile: see https://www.opencsw.org/mantis/view.php?id=5156
CONFIGURE_ARGS += --enable-local-libopts
# Workaround a host detection bug in configure for amd64
CONFIGURE_ARGS += $(CONFIGURE_ARGS_$(ISA))
CONFIGURE_ARGS_amd64 += --build=x86_64-pc-solaris2$(shell uname -r |sed -e 's/[^.]*//')

# If defined with the default value, the test breaks
# # so we only keep the required items
LD_OPTIONS = $(LINKER_MAPS) $(LINKER_DIRECT) $(LINKER_IGNORE)

include gar/category.mk

