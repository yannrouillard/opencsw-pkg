NAME = db
VERSION = 4.4.20
GARTYPE = v2

DESCRIPTION = embedded database libraries and utilities
define BLURB
  Berkeley DB (libdb) is a programmatic toolkit that provides embedded database
  support for both traditional and client/server applications. It includes
  b+tree, queue, extended linear hashing, fixed, and variable-length record
  access methods, transactions, locking, logging, shared memory caching and
  database recovery. DB supports C, C++, Java, and Perl APIs. It is available
  for a wide variety of UNIX platforms as well as Windows NT and Windows 95
  (MSVC 4, 5 and 6).
endef

MASTER_SITES = http://download.oracle.com/berkeley-db/
DISTFILES = $(NAME)-$(VERSION).tar.gz 

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

WORKSRC = $(WORKDIR)/$(NAME)-$(VERSION)/build_unix

PATCHDIR = $(WORKSRC)/..
PATCHDIRLEVEL = 0
PATCHFILES += $(notdir $(wildcard $(FILEDIR)/patch.*))
RELEASE = p$(words $(filter patch.$(VERSION).%,$(PATCHFILES)))

BUILD64 = 1

CONFIGURE_SCRIPTS = dist

prefix = $(BUILD_PREFIX)/bdb44
docdir = $(BUILD_PREFIX)/share/doc

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --enable-compat185
CONFIGURE_ARGS += --enable-o_direct
CONFIGURE_ARGS += --enable-rpc
CONFIGURE_ARGS += --enable-cxx
CONFIGURE_ARGS += --enable-java

# Exclude TCL support for 64 bit until we have a 64 bit TCL
CONFIGURE_ARGS-mm-32 = --enable-tcl --with-tcl=$(libpath)
CONFIGURE_ARGS += $(CONFIGURE_ARGS-mm-$(MEMORYMODEL))

FIXCONFIG_DIRS  = $(DESTDIR)$(prefix)/bdb44/lib

# bdb tests are *very* time consuming
TEST_SCRIPTS =

PACKAGES = CSWbdb44 CSWbdb44-devel CSWbdb44-doc

CATALOGNAME_CSWbdb44       = berkeleydb44
CATALOGNAME_CSWbdb44-devel = berkeleydb44_devel
CATALOGNAME_CSWbdb44-doc   = berkeleydb44_doc

ARCHALL_CSWbdb44-doc = 1

SPKG_DESC_CSWbdb44       = BerkeleyDB 4.4 embedded database libraries and utilities
SPKG_DESC_CSWbdb44-devel = BerkeleyDB 4.4 development support
SPKG_DESC_CSWbdb44-doc   = BerkeleyDB 4.4 documentation

SPKG_SOURCEURL = http://www.oracle.com/technology/software/products/berkeley-db/db/index.html

RUNTIME_DEP_PKGS_CSWbdb44-devel = CSWbdb44

LICENSE = LICENSE

EXTRA_PAX_ARGS += -s ',^\.$(prefix)/docs,.$(BUILD_PREFIX)/share/doc/$(CATALOGNAME_CSWbdb44),'
EXTRA_MERGE_EXCLUDE_FILES_isa-sparcv9 = .*/docs.* $(libdir)/db.jar
EXTRA_MERGE_EXCLUDE_FILES_isa-amd64 = .*/docs.* $(libdir)/db.jar

PKGFILES_CSWbdb44-doc = $(PKGFILES_DOC)
PKGFILES_CSWbdb44-devel = $(PKGFILES_DEVEL)

include gar/category.mk

LIBS += -lnsl
export LIBS

PATH := /usr/j2se/bin:$(PATH)
export PATH

configure-dist:
	( cd $(WORKSRC) ; $(CONFIGURE_ENV) ../dist/configure $(CONFIGURE_ARGS) )
	@$(MAKECOOKIE)

post-merge:
	gln -s . $(PKGROOT)$(libdir)/32
	gln -s $(ISA_DEFAULT64) $(PKGROOT)$(libdir)/64
	@$(MAKECOOKIE)

SPKG_REVSTAMP := $(SPKG_REVSTAMP)_rev=$(RELEASE)

