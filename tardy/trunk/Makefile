# $Id$
NAME = tardy
VERSION = 1.25
GARTYPE = v2

DESCRIPTION = A tar(1) Postprocessor
define BLURB
endef

MASTER_SITES = $(SF_MIRROR)
DISTFILES  = $(DISTNAME).tar.gz

# Use patch until this is fixed:
#   https://sourceforge.net/tracker/?func=detail&aid=3170673&group_id=116896&atid=676344
PATCHFILES += 0001-Add-includes-for-va_list-on-Solaris.patch

PATCHFILES += 0002-Adjust-memchr-return-type.patch

LICENSE = LICENSE

BUILD_DEP_PKGS += CSWlibexplain-dev

PACKAGES = CSWtardy
SPKG_DESC_CSWtardy = $(DESCRIPTION)
RUNTIME_DEP_PKGS_CSWtardy += CSWlibz1
RUNTIME_DEP_PKGS_CSWtardy += CSWlibexplain30

EXTRA_CPPFLAGS = -D_FILE_OFFSET_BITS=64
EXTRA_CXXFLAGS = -norunpath

CONFIGURE_ARGS += AWK=gawk

# The testsuite relies on lsof which doesn't run inside a zone on the buildfarm
SKIPTEST ?= 1

INSTALL_OVERRIDE_DIRS += bindir
INSTALL_OVERRIDE_DIRS += mandir

include gar/category.mk

pre-install-modulated:
	ginstall -d $(DESTDIR)$(bindir)
	ginstall -d $(DESTDIR)$(mandir)/man1
	ginstall $(WORKSRC)/man/man1/tardy.1 $(DESTDIR)$(mandir)/man1/tardy.1
