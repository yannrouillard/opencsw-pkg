NAME = mod_evasive
VERSION = 1.10.1
GARTYPE = v1

DESCRIPTION = DOS evasive maneuvers module for Apache 2.x
define BLURB
  mod_evasive is an evasive maneuvers module for Apache to provide evasive
  action in the event of an HTTP DoS or DDoS attack or brute force attack. It
  is also designed to be a detection and network management tool, and can be
  easily configured to talk to ipchains, firewalls, routers, and etcetera.
  mod_evasive presently reports abuses via email and syslog facilities. 
endef

MASTER_SITES = http://www.zdziarski.com/projects/$(NAME)/
DISTFILES += $(NAME)_$(VERSION).tar.gz
DISTFILES += $(call admfiles,CSWap2modevasive,depend prototype)

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)_(\d+(?:\.\d+)*).tar.gz

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom
TEST_SCRIPTS =

STRIP_DIRS = $(DESTDIR)$(prefix)/apache2/libexec

include gar/category.mk
include ../apache2/files/extensionbuild.mk

WORKSRC := $(WORKDIR)/$(NAME)

build-custom:
	@( cd $(WORKSRC) ; $(APXS2_BUILD) $(NAME)20.c )
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(docdir)/$(NAME)
	@( cd $(WORKSRC) ; \
		$(APXS2_INSTALL) $(NAME)20.la  ; \
		cp README LICENSE $(DESTDIR)$(docdir)/$(NAME) )
	@$(MAKECOOKIE)

