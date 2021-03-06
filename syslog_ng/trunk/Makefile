# $Id$

NAME = syslog-ng
VERSION = 3.5.3
GARTYPE = v2

DESCRIPTION = A powerful syslogd replacement
define BLURB
  Syslog New Generation is a powerful replacement for the standard syslogd. It
  can filter messages based on content using regular expressions and forward
  logs using TCP.
endef

MASTER_SITES = http://www.balabit.com/downloads/files/$(NAME)/open-source-edition/$(VERSION)/source/
DISTFILES += $(NAME)_$(VERSION).tar.gz
DISTFILES += $(NAME).conf.CSW
DISTFILES += cswsyslog_ng
DISTFILES += CSWsyslog-ng.preinstall
DISTFILES += CSWsyslog-ng.postremove
DISTFILES += CSWsyslog-ng.cswreleasenotes

# Patch taken from
#   https://www.redhat.com/archives/open-scap-list/2011-May/msg00021.html
PATCHFILES += 0001-Add-substitute-for-getline-on-Solaris.patch

VENDOR_URL = http://www.balabit.com/network-security/syslog-ng/opensource-logging-system/

INITSMF += /etc/opt/csw/init\.d/cswsyslog_ng
PRESERVECONF += $(sysconfdir)/syslog-ng\.conf
PRESERVECONF += $(sysconfdir)/scl\.conf

# Syslog links against glib2, which is packaged in different packages on
# Solaris 9 and Solaris 10. Therefore, we need to build separately on 9 and
# 10, and declare different dependencies.
PACKAGING_PLATFORMS = solaris9-sparc solaris9-i386
PACKAGING_PLATFORMS += solaris10-sparc solaris10-i386

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --enable-dynamic-linking
CONFIGURE_ARGS += --enable-spoof-source=no
CONFIGURE_ARGS += --enable-tcp-wrapper
CONFIGURE_ARGS += --enable-ssl

GARCOMPILER = GNU
TEST_SCRIPTS =

# The configure script finds -lwrap but doesn't actually use it.
# We need to be more pushy.
EXTRA_LDFLAGS = -L/opt/csw/lib -lwrap -lsocket

BUILD_DEP_PKGS  = $(RUNTIME_DEP_PKGS)
BUILD_DEP_PKGS += CSWgcc4core
BUILD_DEP_PKGS += CSWggettext
BUILD_DEP_PKGS += CSWglib2devel
BUILD_DEP_PKGS += CSWpkgconfig

PACKAGES = CSWsyslog-ng
SPKG_DESC_CSWsyslog-ng = $(DESCRIPTION)
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibdbi1
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibevtlog0
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibgcc-s1
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibpcre1
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibwrap1
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibintl8
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibuuid1
RUNTIME_DEP_PKGS_CSWsyslog-ng += CSWlibgnutls28

# This is correct, zoneinfo is searched at
#   /usr/share/zoneinfo/
#   /usr/share/lib/zoneinfo/
CHECKPKG_OVERRIDES_CSWsyslog-ng += file-with-bad-content|/usr/share|root/opt/csw/lib/libsyslog-ng-3.5.3.so

# This is optional
CHECKPKG_OVERRIDES_CSWsyslog-ng += missing-dependency|CSWperl

# Specifying different dependencies for 5.9 and 5.10.
RUNTIME_DEP_PKGS_CSWsyslog-ng_5.10 += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWsyslog-ng_5.10 += CSWlibgmodule2-0-0
RUNTIME_DEP_PKGS_CSWsyslog-ng_5.10 += CSWlibgthread2-0-0

RUNTIME_DEP_PKGS_CSWsyslog-ng_5.9 += CSWglib2

RUNTIME_DEP_PKGS_CSWsyslog-ng += $(RUNTIME_DEP_PKGS_CSWsyslog-ng_$(GAROSREL))

OBSOLETED_BY_CSWsyslog-ng = CSWsyslogng
CATALOGNAME_CSWsyslogng = syslog_ng_stub

# It it were split, it'd look like this:
# PACKAGES += CSWlibsyslog-ng0
# CATALOGNAME_CSWlibsyslog-ng0 = libsyslog_ng0
# PKGFILES_CSWlibsyslog-ng0 += $(call baseisadirs,$(libdir),libsyslog-ng\.so\.0\.0\.0)
# PKGFILES_CSWlibsyslog-ng0 += $(call baseisadirs,$(libdir),libsyslog-ng\.so\.0(\.\d+)*)
# SPKG_DESC_CSWlibsyslog-ng0 += $(DESCRIPTION), libsyslog-ng.so.0
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWlibevtlog0
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWlibintl8
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWlibwrap1
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWlibgnutls26
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWlibgcc-s1
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWlibpcre1
# RUNTIME_DEP_PKGS_CSWlibsyslog-ng0 += CSWglib2
# 
# PACKAGES += CSWsyslog-ng-dev
# CATALOGNAME_CSWsyslog-ng-dev = syslog_ng_dev
# SPKG_DESC_CSWsyslog-ng-dev += $(DESCRIPTION), development files
# PKGFILES_CSWsyslog-ng-dev += /opt/csw/lib/libsyslog-ng.so
# RUNTIME_DEP_PKGS_CSWsyslog-ng-dev += CSWlibsyslog-ng0

# A reference to /usr/share/lib/zoneinfo
CHECKPKG_OVERRIDES_CSWsyslog-ng += file-with-bad-content|/usr/share|root/opt/csw/lib/libsyslog-ng.so.0.0.0

# Not splitting the syslog-ng libraries.  There are no known packages linking
# to syslog's shared objects.
CHECKPKG_OVERRIDES_CSWsyslog-ng += shared-lib-package-contains-so-symlink
CHECKPKG_OVERRIDES_CSWsyslog-ng += shared-lib-pkgname-mismatch
CHECKPKG_OVERRIDES_CSWsyslog-ng += soname-equals-filename

# Missing TLS symbols
EXTRA_LINKER_FLAGS = -lgnutls

include gar/category.mk

post-install-modulated:
	ginstall -d $(DESTDIR)/etc/opt/csw
	ginstall -m 444 $(WORKDIR)/$(NAME).conf.CSW \
		$(DESTDIR)/etc/opt/csw/$(NAME).conf.CSW
	ginstall -d $(DESTDIR)/etc/opt/csw/init.d
	ginstall -m 755 $(FILEDIR)/cswsyslog_ng \
		$(DESTDIR)/etc/opt/csw/init.d/cswsyslog_ng
	ginstall -m 755 -d $(DESTDIR)$(localstatedir)/run
	@$(MAKECOOKIE)
