NAME = dnswalk
VERSION = 2.0.2
GARTYPE = v2

DESCRIPTION = DNS debugger
define BLURB
  dnswalk is a DNS debugger. It performs zone transfers of specified domains, and checks
  the database in numerous ways for internal consistency, as well as accuracy. 
endef

MASTER_SITES = $(SF_MIRRORS)
DISTFILES  = $(NAME)-$(VERSION).tar.gz
DISTFILES += COPYING

PACKAGES = CSWdnswalk
RUNTIME_DEP_PKGS = CSWperl CSWpmnetdns
ARCHALL = 1

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz
UPSTREAM_USE_SF = 1
UPSTREAM_MASTER_SITES = $(SF_PROJECT_SHOWFILE)=1103

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS =
TEST_SCRIPTS =
INSTALL_SCRIPTS = custom

include gar/category.mk

BINLIST = dnswalk do-dnswalk makereports sendreports
DOCLIST = CHANGES README TODO dnswalk.errors rfc1912.txt

install-custom:
	@echo " ==> Installing $(NAME) (custom)"
	@rm -rf $(DESTDIR)
	@ginstall -d $(DESTDIR)$(bindir)
	@ginstall -d $(DESTDIR)$(docdir)/$(NAME)
	@ginstall -d $(DESTDIR)$(mandir)/man1
	@( cd $(WORKDIR) ; \
	   sed 's|^#!/usr/contrib|#!/opt/csw|' dnswalk > dnswalk.sed ; \
	   mv dnswalk.sed dnswalk ; \
	   chmod 755 dnswalk )
	@( cd $(WORKDIR) ; \
	   sed 's|^#!/usr/contrib|#!/opt/csw|' makereports > makereports.sed ; \
	   mv makereports.sed makereports ; \
	   chmod 755 makereports )
	@$(foreach BIN,$(BINLIST),cp $(WORKDIR)/$(BIN) $(DESTDIR)$(bindir);)
	@cp $(WORKDIR)/$(NAME).1 $(DESTDIR)$(mandir)/man1
	@$(foreach DOC,$(DOCLIST),cp $(WORKDIR)/$(DOC) $(DESTDIR)$(docdir)/$(NAME);)
	@$(MAKECOOKIE)
