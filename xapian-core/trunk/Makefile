NAME = xapian-core
VERSION = 1.3.1
GARTYPE = v2

DESCRIPTION = An open source search engine library
define BLURB
  Xapian is an Open Source Probabilistic Information Retrieval Library. It
  offers a highly adaptable toolkit that allows developers to easily add
  advanced indexing and search facilities to applications.
endef

MASTER_SITES = http://oligarchy.co.uk/xapian/$(VERSION)/
DISTFILES += $(NAME)-$(VERSION).tar.gz

PATCHFILES += 0002-Do-not-strip-norunpath-on-libtool.patch

# Use patch until this is fixed:
#   http://trac.xapian.org/ticket/628
PATCHFILES += 0002-Somehow-round-is-missing-in-cmath.patch

# Use patch until this is fixed:
#   http://trac.xapian.org/ticket/627
PATCHFILES += 0003-log-is-ambigous-to-float-and-double.patch
PATCHFILES += 0001-Force-float-to-disambiguise-float-double-invocation-.patch

VENDOR_URL = http://xapian.org/

PACKAGES += CSWxapian
SPKG_DESC_CSWxapian = Xapian search engine binaries
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWxapian += CSWlibxapian1-3-1
RUNTIME_DEP_PKGS_CSWxapian += CSWlibstlport1

PACKAGES += CSWlibxapian1-3-1
SPKG_DESC_CSWlibxapian1-3-1 = An open source search engine library, libxapian-1.3.so.1
PKGFILES_CSWlibxapian1-3-1 = $(call pkgfiles_lib,libxapian-1.3.so.1)
RUNTIME_DEP_PKGS_CSWlibxapian1-3-1 += CSWlibstlport1
RUNTIME_DEP_PKGS_CSWlibxapian1-3-1 += CSWlibz1
RUNTIME_DEP_PKGS_CSWlibxapian1-3-1 += CSWlibuuid1

PACKAGES += CSWlibxapian-dev
SPKG_DESC_CSWlibxapian-dev = Xapian development files for libxapian-1.3.so.1
PKGFILES_CSWlibxapian-dev = $(PKGFILES_DEVEL)
PKGFILES_CSWlibxapian-dev += $(docdir)/xapian-core/apidoc/.*
PKGFILES_CSWlibxapian-dev += .*\.cmake
PKGFILES_CSWlibxapian-dev += $(call baseisadirs,$(bindir),xapian-config-1.3)
RUNTIME_DEP_PKGS_CSWlibxapian-dev += CSWlibxapian1-3-1

EXTRA_LD_FLAGS += -norunpath

# libuuid.so must be searched in /opt/csw/lib, use explicit setting until this is fixed:
#   http://trac.xapian.org/ticket/626
EXTRA_CXXFLAGS += -L$(libdir)

BUILD64 = 1
ISAEXEC = 1

EXTRA_ISAEXEC_EXCLUDE_FILES += $(bindir)/xapian-config-1.3 $(bindir)/%/xapian-config-1.3

# This is just an example of the default install location
CHECKPKG_OVERRIDES_CSWxapian += file-with-bad-content|/usr/local|root/opt/csw/share/doc/xapian-core/install.html

include gar/category.mk
