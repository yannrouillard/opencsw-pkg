# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = gwhois
VERSION = 20120626
GARTYPE = v2

DESCRIPTION = Advanced WHOIS utility
define BLURB
  Advanced WHOIS utility
endef

MASTER_SITES = http://gwhois.de/gwhois/
DISTNAME = $(NAME)_$(VERSION)
DISTFILES  = $(DISTNAME).tar.gz
PATCHFILES += 0001-Proper-config-dir.patch

WORKSRC = $(WORKDIR)/$(NAME)-$(VERSION)
PATCHDIR = $(WORKDIR)/$(NAME)-$(VERSION)
ARCHALL_CSWgwhois = 1

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS =
TEST_SCRIPTS =
SKIPTEST = 1

INSTALL_SCRIPTS = gwhois

RUNTIME_DEP_PKGS += CSWcurl
RUNTIME_DEP_PKGS += CSWlynx
RUNTIME_DEP_PKGS += CSWpm-net-libidn
RUNTIME_DEP_PKGS += CSWpm-libwww-perl
CHECKPKG_OVERRIDES_CSWgwhois += surplus-dependency|CSWcurl
CHECKPKG_OVERRIDES_CSWgwhois += surplus-dependency|CSWlynx
CHECKPKG_OVERRIDES_CSWgwhois += surplus-dependency|CSWpm-net-libidn
CHECKPKG_OVERRIDES_CSWgwhois += surplus-dependency|CSWpm-libwww-perl

REINPLACE_USRSHARE += $(docdir)/$(NAME)/INSTALL
REINPLACE_WHEN_USRSHARE = postinstall

include gar/category.mk

install-gwhois:
	@/opt/csw/bin/ginstall -d -m 755 $(DESTDIR)/$(bindir)
	@/opt/csw/bin/ginstall -d -m 755 $(DESTDIR)/$(gnudir)
	@/opt/csw/bin/ginstall -d -m 755 $(DESTDIR)/$(sysconfdir)/$(NAME)
	@/opt/csw/bin/ginstall -d -m 755 $(DESTDIR)/$(mandir)/man1
	@/opt/csw/bin/ginstall -d -m 755 $(DESTDIR)/$(docdir)/$(NAME)
	@/opt/csw/bin/ginstall -m 755 $(WORKSRC)/gwhois $(DESTDIR)/$(bindir)
	@/opt/csw/bin/ginstall -m 755 $(WORKSRC)/gwhois $(DESTDIR)/$(gnudir)/whois
	@/opt/csw/bin/ginstall -m 644 $(WORKSRC)/pattern $(DESTDIR)/$(sysconfdir)/$(NAME)
	@/opt/csw/bin/ginstall -m 644 $(WORKSRC)/gwhois.1 $(DESTDIR)/$(mandir)/man1
	@/opt/csw/bin/ginstall -m 644 $(WORKSRC)/INSTALL $(DESTDIR)/$(docdir)/$(NAME)
	@/opt/csw/bin/ginstall -m 644 $(WORKSRC)/NEWS.Debian $(DESTDIR)/$(docdir)/$(NAME)
	@/opt/csw/bin/ginstall -m 644 $(WORKSRC)/README.RIPE $(DESTDIR)/$(docdir)/$(NAME)
	@/opt/csw/bin/ginstall -m 644 $(WORKSRC)/TODO $(DESTDIR)/$(docdir)/$(NAME)
	@$(MAKECOOKIE)

