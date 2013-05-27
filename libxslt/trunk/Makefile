NAME = libxslt
VERSION = 1.1.28
GARTYPE = v2

DESCRIPTION = XSLT engine for the XML Toolkit

define BLURB
	Libxslt is the XSLT C library developed for the GNOME project. XSLT itself is a an XML language to define transformation for XML. Libxslt is based on libxml2 the XML C library developed for the GNOME project. It also implements most of the EXSLT set of processor-portable extensions functions and some of Saxon's evaluate and expressions extensions.
endef

MASTER_SITES = ftp://xmlsoft.org/libxslt/
DISTFILES  = $(NAME)-$(VERSION).tar.gz
PATCHFILES += 0001-Forcefully-disable-version-script.patch

VENDOR_URL = http://xmlsoft.org/XSLT/

BUILD_DEP_PKGS += CSWlibxml2-dev
BUILD_DEP_PKGS += CSWlibgcrypt-dev
BUILD_DEP_PKGS += CSWlibgpg-error-dev
BUILD_DEP_PKGS += CSWpython

PACKAGES = CSWlibxslt
SPKG_DESC_CSWlibxslt =  XSLT engine runtime package
RUNTIME_DEP_PKGS_CSWlibxslt += CSWlibxml2-2
RUNTIME_DEP_PKGS_CSWlibxslt += CSWlibxslt1
RUNTIME_DEP_PKGS_CSWlibxslt += CSWlibexslt0

PACKAGES += CSWlibxslt-dev
SPKG_DESC_CSWlibxslt-dev = XSLT engine development package
PKGFILES_CSWlibxslt-dev  = $(PKGFILES_DEVEL)
PKGFILES_CSWlibxslt-dev += $(docdir)/libxslt-$(VERSION)/.*
PKGFILES_CSWlibxslt-dev += $(libdir)/xsltConf.sh
PKGFILES_CSWlibxslt-dev += $(call isadirs,$(libdir),xsltConf.sh)
RUNTIME_DEP_PKGS_CSWlibxslt-dev = CSWlibxslt
RUNTIME_DEP_PKGS_CSWlibxslt-dev += CSWlibxslt1
RUNTIME_DEP_PKGS_CSWlibxslt-dev += CSWlibexslt0
OBSOLETED_BY_CSWlibxslt-dev = CSWlibxsltdevel

PACKAGES += CSWpy-libxslt
SPKG_DESC_CSWpy-libxslt = XSLT engine python package
PKGFILES_CSWpy-libxslt = $(libdir)/python.*
PKGFILES_CSWpy-libxslt += $(docdir)/libxslt-python-$(VERSION)/.*
RUNTIME_DEP_PKGS_CSWpy-libxslt += CSWlibpython2-6-1-0
RUNTIME_DEP_PKGS_CSWpy-libxslt += CSWpython
RUNTIME_DEP_PKGS_CSWpy-libxslt += CSWlibxslt1
RUNTIME_DEP_PKGS_CSWpy-libxslt += CSWlibexslt0
RUNTIME_DEP_PKGS_CSWpy-libxslt += CSWlibxml2-2
OBSOLETED_BY_CSWpy-libxslt = CSWpylibxslt

# Sadly, yes....
CHECKPKG_OVERRIDES_CSWpy-libxslt += 64-bit-binaries-missing

PACKAGES += CSWlibexslt0
PKGFILES_CSWlibexslt0 += $(call pkgfiles_lib,libexslt.so.0)
SPKG_DESC_CSWlibexslt0 += XSLT engine runtime package, libexslt.so.0
RUNTIME_DEP_PKGS_CSWlibexslt0 += CSWlibxml2-2
RUNTIME_DEP_PKGS_CSWlibexslt0 += CSWlibxslt1
RUNTIME_DEP_PKGS_CSWlibexslt0 += CSWlibgcrypt11
RUNTIME_DEP_PKGS_CSWlibexslt0-sparc += CSWlibgpg-error0
RUNTIME_DEP_PKGS_CSWlibexslt0 += $(RUNTIME_DEP_PKGS_CSWlibexslt0-$(GARCH))

PACKAGES += CSWlibxslt1
SPKG_DESC_CSWlibxslt1 += XSLT engine runtime package, libxslt.so.1
PKGFILES_CSWlibxslt1 += $(call pkgfiles_lib,libxslt.so.1)
RUNTIME_DEP_PKGS_CSWlibxslt1 += CSWlibxml2-2

CONFIGURE_ARGS_32 =
CONFIGURE_ARGS_64 = --without-python
CONFIGURE_ARGS = $(DIRPATHS) $(CONFIGURE_ARGS_$(MEMORYMODEL))

BUILD64 = 1
ISAEXEC = 1

PYCOMPILE = 1

include gar/category.mk

post-merge:
	@echo Correcting DTD reference in tutorial materials.
	@( cd $(PKGROOT)$(docdir)/$(NAME)-$(VERSION)/html/tutorial2/; \
		perl -pi -e 's!/usr/share!/opt/csw/share!' libxslt_pipes.xml)
	@$(MAKECOOKIE)
