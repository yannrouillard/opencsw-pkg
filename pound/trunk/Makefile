NAME = pound
VERSION = 2.6
GARTYPE = v2

DESCRIPTION = Reverse proxy load balancer
define BLURB
  The Pound program is a reverse proxy, load balancer and HTTPS front-end for
  Web server(s). Pound was developed to enable distributing the load among
  several Web-servers and to allow for a convenient SSL wrapper for those Web
  servers that do not offer it natively. Pound is distributed under the GPL -
  no warranty, it's free to use, copy and give away.
endef

MASTER_SITES = http://www.apsis.ch/pound/
DISTNAME = Pound-$(VERSION)
DISTFILES += $(DISTNAME).tgz

# adjust log/run files
#PATCHFILES  = patch-pound.h
#PATCHFILES += patch-pound.8

VENDOR_URL = http://www.apsis.ch/pound/

LICENSE = GPL.txt

RUNTIME_DEP_PKGS += CSWlibssl-dev
RUNTIME_DEP_PKGS += CSWlibcurl-dev

PACKAGES += CSWpound
SPKG_DESC_CSWpound = Reverse proxy load balancer
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWpound += CSWlibpcreposix0
RUNTIME_DEP_PKGS_CSWpound += CSWlibssl1-0-0
OBSOLETED_BY_CSWpound = CSWpound2

# This is just for example scripts
CHECKPKG_OVERRIDES_CSWpound += missing-dependency|CSWpython
CHECKPKG_OVERRIDES_CSWpound += file-with-bad-content|/usr/local|root/opt/csw/share/doc/pound/README

EXTRA_DOCS += README
EXTRA_DOCS += FAQ
EXTRA_DOCS += CHANGELOG
EXTRA_DOCS += z2_2_5_1.py
EXTRA_DOCS += z2_2_6_1.py

POUNDCONFIGDIR = $(sysconfdir)/pound
POUNDCFG = $(POUNDCONFIGDIR)/pound.cfg

REINPLACEMENTS += poundcfg
REINPLACE_MATCH_poundcfg = /usr/local/etc/pound.cfg
REINPLACE_WITH_poundcfg = $/POUNDCFG)
REINPLACE_FILES_poundcfg += pound.8

REINPLACEMENTS += certpath
REINPLACE_MATCH_certpath = /usr/local/etc/pound/cert.pem
REINPLACE_WITH_certpath = $(POUNDCONFIGDIR)/cert.pem
REINPLACE_FILES_certpath += pound.8

REINPLACEMENTS += config
REINPLACE_MATCH_config = /etc/pound/
REINPLACE_WITH_config = $(POUNDCONFIGDIR)/
REINPLACE_FILES_config += pound.8

# Make sure to use OpenCSW OpenSSL as the generated code from Solaris OpenSSL uses different functions not present in the other libcrypto
REINPLACEMENTS += openssl
REINPLACE_MATCH_openssl = openssl
REINPLACE_WITH_openssl = $(bindir)/openssl
REINPLACE_FILES_openssl += Makefile.in

BUILD64 = 1
ISAEXEC = 1

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --enable-super
CONFIGURE_ARGS += --with-maxbuf=8192
CONFIGURE_ARGS += --with-ssl=$(prefix)

BUILD_OVERRIDE_VARS += F_CONF
BUILD_OVERRIDE_ENV_F_CONF = $(POUNDCFG)
BUILD_OVERRIDE_VARS += F_PID
BUILD_OVERRIDE_ENV_F_PID = $(localstatedir)/run/pound.pid

# No test suite available
TEST_SCRIPTS =

# use a custom install
INSTALL_SCRIPTS = custom

PRESERVECONF = $(POUNDCFG)

include gar/category.mk

install-custom: 
	ginstall -d $(DESTDIR)$(sbindir)
	ginstall -m 555 $(WORKSRC)/pound $(DESTDIR)$(sbindir)/pound
	ginstall -m 555 $(WORKSRC)/poundctl $(DESTDIR)$(sbindir)/poundctl
	ginstall -d $(DESTDIR)$(mandir)/man8
	ginstall -m 644 $(WORKSRC)/pound.8 $(DESTDIR)$(mandir)/man8/pound.8
	ginstall -m 644 $(WORKSRC)/poundctl.8 $(DESTDIR)$(mandir)/man8/poundctl.8
	ginstall -d $(DESTDIR)$(sysconfdir)/$(NAME)
	ginstall -m 644 $(FILEDIR)/pound2-sample.cfg $(DESTDIR)$(POUNDCFG)
	ginstall -d $(DESTDIR)$(docdir)/$(NAME)
	ginstall -m 644 $(addprefix $(WORKSRC)/,$(EXTRA_DOCS)) $(DESTDIR)$(docdir)/$(NAME)
	@$(MAKECOOKIE)
