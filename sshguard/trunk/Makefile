NAME = sshguard
VERSION = 1.5
GARTYPE = v2

DESCRIPTION = Protects networked hosts from brute force attacks
define BLURB
  Protects networked hosts from brute force attacks
endef

MASTER_SITES = $(SF_MIRRORS)
SF_PROJECT = $(NAME)
DISTFILES  = $(NAME)-$(VERSION).tar.bz2

LICENSE = README

EXTRA_MODULATORS += FIREWALL
MODULATIONS_FIREWALL = ipfilter hosts

GARCOMPILER = GNU

CONFIGURE_ARGS = $(DIRPATHS)
CONFIGURE_ARGS += --with-firewall=$(FIREWALL)

# See ipf(1m) and ipf(4) 
CONFIGURE_ARGS-ipfilter += --with-ipf=/usr/sbin/ipf
CONFIGURE_ARGS-ipfilter += --with-ipfilterconf=/etc/ipf/ipf.conf

# This is defined in OpenCSW TCPwrapper
CONFIGURE_ARGS-hosts += --with-hostsfile=/etc/opt/csw/hosts.allow

CONFIGURE_ARGS += $(CONFIGURE_ARGS-$(FIREWALL))

EXTRA_PAX_ARGS += -s ",\($(sbindir)/sshguard\),/\1-$(FIREWALL),"

MERGE_SCRIPTS_isa-default-firewall-ipfilter = copy-all
MERGE_SCRIPTS_isa-default-firewall-hosts = copy-all

ALTERNATIVES += ipfilter hosts
ALTERNATIVE_ipfilter += $(sbindir)/sshguard sshguard $(sbindir)/sshguard-ipfilter 200
ALTERNATIVE_hosts    += $(sbindir)/sshguard sshguard $(sbindir)/sshguard-hosts 100

include gar/category.mk
