NAME = mod_authnz_external
VERSION = 3.2.6
GARTYPE = v2

DESCRIPTION = Apache RADIUS authentication module
define BLURB
  This is the Apache RADIUS authentication module. It allows any Apache web-server
  to become a RADIUS client for authentication and accounting requests. You will,
  however, need to supply your own RADIUS server to perform the actual authentication.
endef

https://code.google.com/p/mod-auth-external/downloads/detail?name=mod_authnz_external-3.2.6.tar.gz
GOOGLE_PROJECT = mod-auth-external
MASTER_SITES = $(GOOGLE_MIRROR)
DISTFILES  = $(NAME)-$(VERSION).tar.gz
DISTFILES += CSWap2-mod-auth-external.postinstall CSWap2-mod-auth-external.preremove

VENDOR_URL = https://code.google.com/p/mod-auth-external/

PACKAGES = CSWap2-mod-auth-external

DEP_PKGS = CSWapache2

# Apache paths
AP2_ROOT      = $(prefix)/apache2
AP2_LIBEXEC   = $(DESTDIR)$(AP2_ROOT)/libexec
AP2_EXTRACONF = $(DESTDIR)$(AP2_ROOT)/etc/extra
AP2_SBIN      = $(AP2_ROOT)/sbin
APXS          = $(AP2_SBIN)/apxs

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS = custom
TEST_SCRIPTS =
INSTALL_SCRIPTS = custom

STRIP_DIRS = $(DESTDIR)$(prefix)/apache2/libexec

include gar/category.mk

build-custom:
	cd $(WORKSRC) && $(APXS) -c mod_authnz_external.c
	$(MAKECOOKIE)

install-custom: DOCDEST=$(DESTDIR)$(docdir)/$(NAME)
install-custom:
	mkdir -p $(AP2_LIBEXEC)
	cd $(WORKSRC) && $(APXS) -S LIBEXECDIR=$(AP2_LIBEXEC) -i mod_authnz_external.la
	#ginstall -d $(DESTDIR)$(prefix)/apache2/etc/extra
	#ginstall -m 0644 $(WORKSRC)/httpd.conf $(DESTDIR)$(prefix)/apache2/etc/extra/httpd-auth-radius.conf
	ginstall -d $(DOCDEST)
	ginstall $(WORKSRC)/README $(DOCDEST)
	@$(MAKECOOKIE)
