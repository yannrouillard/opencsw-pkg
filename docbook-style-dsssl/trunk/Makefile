NAME = docbookdsssl
VERSION = 1.79
PATCHLEVEL = 4.1
GARTYPE = v2

PACKAGES = CSWdocbookdsssl
CATALOGNAME_CSWdocbookdsssl = docbookdsssl

ARCHALL_CSWdocbookdsssl = 1

LICENSE_CSWdocbookdsssl = README

DESCRIPTION = Norman Walsh's modular stylesheets for DocBook
define BLURB
These DSSSL stylesheets allow to convert any DocBook document to another
printed (for example, RTF or PostScript) or online (for example, HTML)
format.  They are highly customizable.
endef

SF_PROJECT = docbook
MASTER_SITES = $(SF_MIRRORS)
DISTFILES = docbook-dsssl-$(VERSION).tar.gz
DISTFILES += CSWdocbookdsssl.postinstall CSWdocbookdsssl.preremove
PATCHFILES = add_makefile.patch fix_perl_path.patch

RUNTIME_DEP_PKGS = CSWdocbookdtds CSWsgmlcommon CSWopenjade CSWperl

# We define upstream file regex so we can be notifed of new upstream
# software release
UFILES_REGEX = (\d+(?:\.\d+)*).tar.gz

# If the url used to check for software update is different of
# MASTER_SITES, then uncomment the next line. Otherwise it is set by
# default to the value of MASTER_SITES UPSTREAM_MASTER_SITES =

tar-gz-extract-docbook-dsssl-$(VERSION).tar.gz:
	@echo " ==> Extracting $(DOWNLOADDIR)/docbook-dsssl-$(VERSION).tar.gz"
	@mkdir -p $(WORKSRC)
	@gzip -dc $(DOWNLOADDIR)/docbook-dsssl-$(VERSION).tar.gz | gtar $(TAR_ARGS) -xf - -C $(WORKSRC) --strip-components 1
	@$(MAKECOOKIE)

#nothing to configure or test
CONFIGURE_SCRIPTS =
BUILD_SCRIPTS =
TEST_SCRIPTS =

INSTALL_ARGS = DESTDIR=$(DESTDIR)
INSTALL_ARGS += bindir=$(bindir) datadir=$(datadir)

include gar/category.mk
