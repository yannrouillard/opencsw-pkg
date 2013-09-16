NAME    = libid3tag
VERSION = 0.15.1
REV     = b
GARTYPE = v2

DESCRIPTION = A library for reading and (eventually) writing ID3 tags
define BLURB
endef

SF_PROJECT = mad
MASTER_SITES = $(SF_MIRRORS)
DISTFILES  = $(NAME)-$(VERSION)$(REV).tar.gz
DISTFILES += id3tag.pc-32 id3tag.pc-64

GARCOMPILER = GCC4

WORKSRC = $(WORKDIR)/$(NAME)-$(VERSION)$(REV)

RUNTIME_DEP_PKGS = CSWlibz1

BUILD64_LIBS_ONLY = 1
NOISALIST = 1

CONFIGURE_ARGS = $(DIRPATHS)

SPKG_VERSION := $(SPKG_VERSION)_rev=$(REV)

PACKAGES += CSWlibid3tag0
CATALOGNAME_CSWlibid3tag0 = libid3tag0
PKGFILES_CSWlibid3tag0 += $(call baseisadirs,$(libdir),libid3tag\.so\.0\.3\.0)
PKGFILES_CSWlibid3tag0 += $(call baseisadirs,$(libdir),libid3tag\.so\.0(\.\d+)*)
SPKG_DESC_CSWlibid3tag0 += $(DESCRIPTION), libid3tag.so.0
RUNTIME_DEP_PKGS_CSWlibid3tag0 += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWlibid3tag0 += CSWlibz1
OBSOLETED_BY_CSWlibid3tag0 += CSWlibid3tag

PACKAGES += CSWlibid3tag-dev
CATALOGNAME_CSWlibid3tag-dev = libid3tag_dev
SPKG_DESC_CSWlibid3tag-dev += $(DESCRIPTION), development files
PKGFILES_CSWlibid3tag-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWlibid3tag-dev += CSWlibid3tag0

include gar/category.mk

post-install-modulated:
	@ginstall -d $(DESTDIR)$(libdir)/pkgconfig
	@ginstall $(WORKDIR)/id3tag.pc-$(MEMORYMODEL) $(DESTDIR)$(libdir)/pkgconfig/id3tag.pc
	@$(MAKECOOKIE)
