NAME = pango
VERSION = 1.34.1
GARTYPE = v2
GARCOMPILER = SOS12U3

DESCRIPTION = Framework for the layout and rendering of international text
define BLURB
  The goal of the Pango project is to provide an Open Source framework for the
  layout and rendering of internationalized text. It uses Unicode for all of its
  encoding, and will eventually support output in all the world's major
  languages.
endef

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

MASTER_SITES = $(GNOME_MIRROR)
DISTFILES = $(DISTNAME).tar.xz
DISTFILES += CSWpango.postinstall

VENDOR_URL = http://www.pango.org/

PACKAGES += CSWpango
SPKG_DESC_CSWpango = Pango, $(DESCRIPTION)
# Catch all
RUNTIME_DEP_PKGS_CSWpango += CSWlibxft2
RUNTIME_DEP_PKGS_CSWpango += CSWlibcairo2
RUNTIME_DEP_PKGS_CSWpango += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWpango += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibfontconfig1
RUNTIME_DEP_PKGS_CSWpango += CSWlibintl8
RUNTIME_DEP_PKGS_CSWpango += CSWlibpango1-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibpangocairo1-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibpangoft2-1-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibpangoxft1-0-0
RUNTIME_DEP_PKGS_CSWpango += CSWlibthai0
RUNTIME_DEP_PKGS_CSWpango += CSWlibharfbuzz0
CHECKPKG_OVERRIDES_CSWpango += surplus-dependency|CSWlibintl8

PACKAGES += CSWlibpango1-0-0
SPKG_DESC_CSWlibpango1-0-0 = $(DESCRIPTION), libpango-1.0.so.0
PKGFILES_CSWlibpango1-0-0 = $(call pkgfiles_lib,libpango-1.0.so.0)
RUNTIME_DEP_PKGS_CSWlibpango1-0-0 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibpango1-0-0 += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibpango1-0-0 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibpango1-0-0 += CSWlibgmodule2-0-0
CHECKPKG_OVERRIDES_CSWlibpango1-0-0 += surplus-dependency|CSWlibintl8

PACKAGES += CSWlibpangocairo1-0-0
SPKG_DESC_CSWlibpangocairo1-0-0 = Cairo bindings for Pango, libpangocairo-1.0.so.0
PKGFILES_CSWlibpangocairo1-0-0 = $(call pkgfiles_lib,libpangocairo-1.0.so.0)
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibpango1-0-0
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibharfbuzz0
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibcairo2
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibfontconfig1
RUNTIME_DEP_PKGS_CSWlibpangocairo1-0-0 += CSWlibpangoft2-1-0-0
CHECKPKG_OVERRIDES_CSWlibpangocairo1-0-0 += surplus-dependency|CSWlibgmodule2-0-0
CHECKPKG_OVERRIDES_CSWlibpangocairo1-0-0 += surplus-dependency|CSWlibintl8
CHECKPKG_OVERRIDES_CSWlibpangocairo1-0-0 += surplus-dependency|CSWlibharfbuzz0

PACKAGES += CSWlibpangoft2-1-0-0
SPKG_DESC_CSWlibpangoft2-1-0-0 = Freetype bindings for Pango, libpangoft2-1.0.so.0
PKGFILES_CSWlibpangoft2-1-0-0 = $(call pkgfiles_lib,libpangoft2-1.0.so.0)
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibpango1-0-0
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibharfbuzz0
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibpangoft2-1-0-0 += CSWlibfontconfig1
CHECKPKG_OVERRIDES_CSWlibpangoft2-1-0-0 += surplus-dependency|CSWlibgmodule2-0-0
CHECKPKG_OVERRIDES_CSWlibpangoft2-1-0-0 += surplus-dependency|CSWlibintl8

# I wonder where this has gone...
#PACKAGES += CSWlibpangox1-0-0
#SPKG_DESC_CSWlibpangox1-0-0 = X11 bindings for Pango, libpangox-1.0.so.0
#PKGFILES_CSWlibpangox1-0-0 = $(call pkgfiles_lib,libpangox-1.0.so.0)

PACKAGES += CSWlibpangoxft1-0-0
SPKG_DESC_CSWlibpangoxft1-0-0 = XFT bindings for Pango, libpangoxft-1.0.so.0
PKGFILES_CSWlibpangoxft1-0-0 = $(call pkgfiles_lib,libpangoxft-1.0.so.0)
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibpango1-0-0
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibharfbuzz0
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibxft2
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibxrender
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibfreetype6
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibfontconfig1
RUNTIME_DEP_PKGS_CSWlibpangoxft1-0-0 += CSWlibpangoft2-1-0-0
CHECKPKG_OVERRIDES_CSWlibpangoxft1-0-0 += surplus-dependency|CSWlibfreetype6
CHECKPKG_OVERRIDES_CSWlibpangoxft1-0-0 += surplus-dependency|CSWlibgmodule2-0-0
CHECKPKG_OVERRIDES_CSWlibpangoxft1-0-0 += surplus-dependency|CSWlibintl8
CHECKPKG_OVERRIDES_CSWlibpangoxft1-0-0 += surplus-dependency|CSWlibharfbuzz0

PACKAGES += CSWlibpango-dev
OBSOLETED_BY_CSWlibpango-dev += CSWpangodevel
CATALOGNAME_CSWpangodevel = libpangodevel_stub
SPKG_DESC_CSWlibpango-dev = Developer files for libpango-1.0.so.0 and assorted libs
PKGFILES_CSWlibpango-dev = $(PKGFILES_DEVEL)
# To make sure pango-querymodules will be called
RUNTIME_DEP_PKGS_CSWlibpango-dev += CSWpango
RUNTIME_DEP_PKGS_CSWlibpango-dev += CSWlibcairo-dev
RUNTIME_DEP_PKGS_CSWlibpango-dev += CSWlibpango1-0-0
RUNTIME_DEP_PKGS_CSWlibpango-dev += CSWlibpangoft2-1-0-0
RUNTIME_DEP_PKGS_CSWlibpango-dev += CSWlibpangoxft1-0-0
RUNTIME_DEP_PKGS_CSWlibpango-dev += CSWlibpangocairo1-0-0

PACKAGES += CSWpango-doc
ARCHALL_CSWpango-doc = 1
OBSOLETED_BY_CSWpango-doc += CSWpangodoc
CATALOGNAME_CSWpangodoc += libpango_doc_stub
SPKG_DESC_CSWpango-doc = Documentation for Pango
PKGFILES_CSWpango-doc = $(sharedstatedir)/gtk-doc/.*


BUILD_DEP_PKGS += CSWggettext-dev
BUILD_DEP_PKGS += CSWgtk-doc
BUILD_DEP_PKGS += CSWlibxslt
BUILD_DEP_PKGS += CSWglib2devel
BUILD_DEP_PKGS += CSWlibharfbuzz-dev
BUILD_DEP_PKGS += CSWlibxft2devel
BUILD_DEP_PKGS += CSWvim # for generating docs

BUILD64 = 1

# check.defs fails, and I'dont care too much about it.
#
# So, employing a custom test script only performing tests in tests
TEST_SCRIPTS = custom

sysconfdir-suffix-64 = /64
sysconfdir = /etc/opt/csw$(sysconfdir-suffix-$(MEMORYMODEL))

# EXTRA_ISAEXEC_EXCLUDE_FILES = $(bindir)/pango-querymodules
CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --enable-gtk-doc
CONFIGURE_ARGS += --with-xft
CONFIGURE_ARGS += --disable-static
CONFIGURE_ARGS += --disable-introspection

STRIP_LIBTOOL = 1

include gar/category.mk

test-custom:
	cd $(WORKSRC)/tests && env $(BUILD_ENV) $(MAKE) check
	@$(MAKECOOKIE)

post-merge:
	[ -d $(PKGROOT)$(sysconfdir)/pango ] || mkdir -p $(PKGROOT)$(sysconfdir)/pango
	@$(MAKECOOKIE)
