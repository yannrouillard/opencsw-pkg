NAME = rcs
VERSION = 5.9.2
GARTYPE = v2

DESCRIPTION = GNU Revision Control System
define BLURB
endef

MASTER_SITES = $(GNU_MIRROR)
DISTFILES  = $(DISTNAME).tar.xz

VENDOR_URL = http://www.gnu.org/software/rcs/

PACKAGES += CSWrcs
SPKG_DESC_CSWrcs = GNU Revision Control System
# PKGFILES is catchall
# We need this for gdiff and gdiff3
RUNTIME_DEP_PKGS_CSWrcs = CSWdiffutils
CHECKPKG_OVERRIDES_CSWrcs += surplus-dependency|CSWdiffutils

DIFF = $(bindir)/gdiff
DIFF3 = $(bindir)/gdiff3

# Sun Studio results in strange errors as reported in
#   https://www.opencsw.org/mantis/view.php?id=5159
GARCOMPILER = GNU

NORUNPATH = 1
CONFIGURE_ARGS = --prefix=$(prefix)
CONFIGURE_ARGS += --with-diffutils

BUILD_OVERRIDE_DIRS = DIFF DIFF3

# 'diff -u' is expected to be GNU
# We need 'id' to take -u, hence /usr/xpg4/bin
TEST_ENV_PATH = /opt/csw/gnu:/usr/xpg4/bin:$(PATH)

include gar/category.mk
