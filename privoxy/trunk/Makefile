#
# WARNING. This is still a (non-maintainer) stub and needs to be checked
# against the current CSWprivoxy package by someone with regards to (at
# least) log rotation.
#
NAME = privoxy
VERSION = 3.0.21
GARTYPE = v2

DESCRIPTION = A web proxy with advanced filtering capabilities
define BLURB
Privoxy is a non-caching web proxy with advanced filtering capabilities
for enhancing privacy, modifying web page data and HTTP headers,
controlling access, and removing ads and other obnoxious Internet junk.
Privoxy has a flexible configuration and can be customized to suit
individual needs and tastes. It has application for both stand-alone
systems and multi-user networks.
endef

MASTER_SITES = $(SF_MIRRORS)
SF_PROJECT = ijbswa
DISTNAME = $(NAME)-$(VERSION)-stable
DISTFILES += $(DISTNAME)-src.tar.gz
DISTFILES += cswprivoxy
DISTFILES += cswusergroup

VENDOR_URL = http://www.privoxy.org/
RUNTIME_DEP_PKGS_CSWprivoxy += CSWlibpcre1
RUNTIME_DEP_PKGS_CSWprivoxy += CSWlibpcreposix0
RUNTIME_DEP_PKGS_CSWprivoxy += CSWlibz1

sysconfdir = /etc$(prefix)/privoxy

INITSMF += /etc/opt/csw/init.d/cswprivoxy
USERGROUP += /opt/csw/etc/pkg/CSWprivoxy/cswusergroup

CONFFILES += config
CONFFILES += user.action
CONFFILES += user.filter
PRESERVECONF += $(addprefix $(sysconfdir)/,$(CONFFILES))

# This is just an example
CHECKPKG_OVERRIDES_CSWprivoxy += file-with-bad-content|/usr/share|root/etc/opt/csw/privoxy/config.CSW

# There is no testsuite
TEST_SCRIPTS =

CONFIGURE_ARGS = $(DIRPATHS)

# Supress sub directories for logs and pid file
INSTALL_ARGS += LOGS_DEST=$(localstatedir)
INSTALL_ARGS += PIDS_DEST=$(localstatedir)

include gar/category.mk

pre-configure-modulated:
		perl -pi -e 's|-Wall||' $(WORKSRC)/GNUmakefile.in
		cd $(WORKSRC) && autoheader && autoconf
		@$(MAKECOOKIE)


post-install-modulated:
		@echo --- Installing cswusergroup file ---
		ginstall -d $(DESTDIR)/opt/csw/etc/pkg/CSWprivoxy/
		cp $(WORKDIR)/cswusergroup $(DESTDIR)/opt/csw/etc/pkg/CSWprivoxy/

		@echo --- Installing cpsampleconf config files ---
		$(foreach C,$(CONFFILES), \
			mv $(DESTDIR)$(sysconfdir)/$(C) $(DESTDIR)$(sysconfdir)/$(C).CSW; )

		@echo --- Installing cswinitsmf file ---
		ginstall -d $(DESTDIR)/etc/opt/csw/init.d
		cp $(WORKDIR)/cswprivoxy $(DESTDIR)/etc/opt/csw/init.d/
		@$(MAKECOOKIE)
