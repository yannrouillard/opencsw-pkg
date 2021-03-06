# TBD before release:
# - compile 64 bit version with embedded perl, this should resolve the largefile issue
# - reenable tcpwrappers for both 32 and 64 bit
# - reenable python bindings
#

NAME = netsnmp
VERSION = 5.7.2
GARTYPE = v2

DESCRIPTION = A suite of applications used to implement SNMP
define BLURB
  Simple Network Management Protocol (SNMP) is a widely used protocol for monitoring
  the health and welfare of network equipment (eg. routers), computer equipment and
  even devices like UPSs. Net-SNMP is a suite of applications used to implement
  SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6. The suite includes:
endef

SF_PROJECT = net-snmp
MASTER_SITES = $(SF_MIRRORS)
DISTNAME = $(SF_PROJECT)-$(VERSION)
DISTFILES = $(DISTNAME).tar.gz

REINPLACE_USRLOCAL += perl/TrapReceiver/TrapReceiver.pm
REINPLACE_USRLOCAL += local/ipf-mod.pl
REINPLACE_USRLOCAL += local/traptoemail
REINPLACE_USRSHARE += local/net-snmp-cert

# Patch for perl modules
PATCHFILES = perl_makefiles.diff
# Patch for python module
PATCHFILES += Makefile.in.diff
PATCHFILES += setup-py.patch
PATCHFILES += 0001-fixing-init-scripts.patch
PATCHFILES += 0002-workaround-ksh-stop-alias-problem.patch

VENDOR_URL = http://www.net-snmp.org/

GARCOMPILER = SOS12U3
BUILD_DEP_PKGS = CSWpysetuptools
PACKAGING_PLATFORMS += solaris10-sparc solaris10-i386

INITSMF = $(sysconfdir)/init.d/netsnmpd
INITSMF += $(sysconfdir)/init.d/netsnmptrapd

PACKAGES += CSWnetsnmp-dev
CATALOGNAME_CSWnetsnmp-dev = netsnmp_dev
SPKG_DESC_CSWnetsnmp-dev += $(DESCRIPTION), development files
PKGFILES_CSWnetsnmp-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWnetsnmp-dev += CSWlibnetsnmphelpers30
RUNTIME_DEP_PKGS_CSWnetsnmp-dev += CSWlibnetsnmpmibs30
RUNTIME_DEP_PKGS_CSWnetsnmp-dev += CSWlibnetsnmptrapd30
RUNTIME_DEP_PKGS_CSWnetsnmp-dev += CSWlibnetsnmp30
RUNTIME_DEP_PKGS_CSWnetsnmp-dev += CSWlibnetsnmpagent30
# CHECKPKG_OVERRIDES_CSWnetsnmp-dev += file-with-bad-content|/usr/local|root/opt/csw/share/man/man3/NetSNMP::TrapReceiver.3perl

PACKAGES += CSWlibnetsnmp30
CATALOGNAME_CSWlibnetsnmp30 = libnetsnmp30
SPKG_DESC_CSWlibnetsnmp30 += $(DESCRIPTION), libsnmp.so.30
PKGFILES_CSWlibnetsnmp30 += $(call baseisadirs,$(libdir),libnetsnmp\.so\.30(\.\d+)*)
RUNTIME_DEP_PKGS_CSWlibnetsnmp30 += CSWlibssl1-0-0


PACKAGES += CSWlibnetsnmpagent30
CATALOGNAME_CSWlibnetsnmpagent30 = libnetsnmpagent30
SPKG_DESC_CSWlibnetsnmpagent30 += $(DESCRIPTION), libsnmpagent.so.30
PKGFILES_CSWlibnetsnmpagent30 += $(call baseisadirs,$(libdir),libnetsnmpagent\.so\.30(\.\d+)*)
RUNTIME_DEP_PKGS_CSWlibnetsnmpagent30 += CSWlibnetsnmp30

PACKAGES += CSWlibnetsnmphelpers30
CATALOGNAME_CSWlibnetsnmphelpers30 = libnetsnmphelpers30
SPKG_DESC_CSWlibnetsnmphelpers30 += $(DESCRIPTION), libsnmphelpers.so.30
PKGFILES_CSWlibnetsnmphelpers30 += $(call baseisadirs,$(libdir),libnetsnmphelpers\.so\.30(\.\d+)*)

PACKAGES += CSWlibnetsnmpmibs30
CATALOGNAME_CSWlibnetsnmpmibs30 = libnetsnmpmibs30
SPKG_DESC_CSWlibnetsnmpmibs30 += $(DESCRIPTION), libsnmpmibs.so.30
PKGFILES_CSWlibnetsnmpmibs30 += $(call baseisadirs,$(libdir),libnetsnmpmibs\.so\.30(\.\d+)*)
RUNTIME_DEP_PKGS_CSWlibnetsnmpmibs30 += CSWlibnetsnmp30
RUNTIME_DEP_PKGS_CSWlibnetsnmpmibs30 += CSWlibnetsnmpagent30

PACKAGES += CSWlibnetsnmptrapd30
CATALOGNAME_CSWlibnetsnmptrapd30 = libnetsnmptrapd30
SPKG_DESC_CSWlibnetsnmptrapd30 += $(DESCRIPTION), libsnmptrapd.so.30
PKGFILES_CSWlibnetsnmptrapd30 += $(call baseisadirs,$(libdir),libnetsnmptrapd\.so\.30(\.\d+)*)
RUNTIME_DEP_PKGS_CSWlibnetsnmptrapd30 += CSWlibnetsnmpmibs30
RUNTIME_DEP_PKGS_CSWlibnetsnmptrapd30 += CSWlibnetsnmp30
RUNTIME_DEP_PKGS_CSWlibnetsnmptrapd30 += CSWlibnetsnmpagent30

EXTRA_MERGE_EXCLUDE_FILES += .*/perllocal.pod
PACKAGES += CSWpmnetsnmp
SPKG_DESC_CSWpmnetsnmp+= $(DESCRIPTION), Perl binding
PKGFILES_CSWpmnetsnmp += $(libdir)/perl.*
RUNTIME_DEP_PKGS_CSWpmnetsnmp += CSWperl
# RUNTIME_DEP_PKGS_CSWpmnetsnmp += CSWlibnetsnmpmibs30
RUNTIME_DEP_PKGS_CSWpmnetsnmp += CSWlibnetsnmptrapd30
RUNTIME_DEP_PKGS_CSWpmnetsnmp += CSWlibnetsnmp30
RUNTIME_DEP_PKGS_CSWpmnetsnmp += CSWlibnetsnmpagent30

EXTRA_MERGE_EXCLUDE_FILES += .*/*.pyc
PACKAGES += CSWpy-netsnmp
# OBSOLETED_BY_CSWpy-netsnmp = CSWnetsnmp-py
SPKG_DESC_CSWpy-netsnmp += $(DESCRIPTION), Python binding
PKGFILES_CSWpy-netsnmp = $(libdir)/python.*
RUNTIME_DEP_PKGS_CSWpy-netsnmp += CSWpython
RUNTIME_DEP_PKGS_CSWpy-netsnmp += CSWlibpython2-6-1-0
RUNTIME_DEP_PKGS_CSWpy-netsnmp += CSWlibnetsnmp30
CHECKPKG_OVERRIDES_CSWpy-netsnmp += surplus-dependency|CSWpython

PACKAGES += CSWnetsnmp
SPKG_DESC_CSWnetsnmp += $(DESCRIPTION), Base
RUNTIME_DEP_PKGS_CSWnetsnmp += CSWlibnetsnmpmibs30
RUNTIME_DEP_PKGS_CSWnetsnmp += CSWlibnetsnmptrapd30
RUNTIME_DEP_PKGS_CSWnetsnmp += CSWlibnetsnmp30
RUNTIME_DEP_PKGS_CSWnetsnmp += CSWlibnetsnmpagent30
RUNTIME_DEP_PKGS_CSWnetsnmp += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWnetsnmp += CSWperl
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/share/man/man1/snmpcmd.1
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/share/man/man1/snmpconf.1
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/snmpd.8
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/share/man/man5/snmpd.conf.5
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/bin/traptoemail
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/bin/ipf-mod.pl
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/local|root/opt/csw/share/snmp/mib2c-data/mfd-makefile.m2m
# CHECKPKG_OVERRIDES_CSWnetsnmp += file-with-bad-content|/usr/share|root/opt/csw/bin/net-snmp-cert

# BUILD64 = 1
BUILD64_LIBS_ONLY = 1
NOISALIST = 1

# The -I/opt/csw/include pulls in installed version before built version and breaks testsuite
# CPPFLAGS =
EXTRA_CFLAGS = $(INCLUDE_FLAGS)
# link not to the old already installed libs
# LD_OPTIONS =
EXTRA_LINKER_FLAGS = $(RUNPATH_LINKER_FLAGS) -xnorunpath
# EXTRA_LDFLAGS = $(LD_OPTIONS)

CONFIGURE_ARGS_mm-32  = --disable-embedded-perl
CONFIGURE_ARGS_mm-32  += --with-perl-modules=yes
CONFIGURE_ARGS_mm-32  += --with-python-modules=yes
# Enable Perl for 64 bit later
#
# we have no perl64 nr python64
CONFIGURE_ARGS_mm-64  = --disable-embedded-perl 
# CONFIGURE_ARGS_mm-64  = --enable-embedded-perl 
# CONFIGURE_ARGS_mm-64  += --with-perl-modules
CONFIGURE_ARGS_mm-64 += --without-perl-modules
CONFIGURE_ARGS_mm-64 += --without-python-modules

CONFIGURE_ARGS = $(DIRPATHS)
CONFIGURE_ARGS += --with-default-snmp-version=1
CONFIGURE_ARGS += --with-sys-contact=unknown
CONFIGURE_ARGS += --with-sys-location=unknown
CONFIGURE_ARGS += --with-logfile=/var/opt/csw/log/snmpd.log
CONFIGURE_ARGS += --with-persistent-directory=/var/opt/csw/net-snmp
CONFIGURE_ARGS += --with-mib-modules="ucd-snmp/diskio agentx mibII/mta_sendmail"
# Disable for now
# CONFIGURE_ARGS += --with-libwrap=/opt/csw/lib
CONFIGURE_ARGS += --enable-ipv6
CONFIGURE_ARGS += --with-openssl=/opt/csw
CONFIGURE_ARGS += --with-transports="UDP TCP Unix"
CONFIGURE_ARGS += $(CONFIGURE_ARGS_mm-$(MEMORYMODEL))

# Solaris /bin/bash does not allow empty lists in "for i in ; do echo; done"
EXTRA_CONFIGURE_EXPORTS = CONFIG_SHELL
EXTRA_CONFIGURE_ENV_CONFIG_SHELL = /opt/csw/bin/bash

# TBD: Make alternatives
# - with embedded Perl and disabled modules
#     --with-mib-modules="smux mibII/mta_sendmail"
#     --with-defaults --enable-ipv6 --with-out-mib-modules="ucd_snmp host mibII/ipv6 ucd_snmp/memory ucd_snmp/memory_solaris2 ucd_snmp/proc host/hr_swrun host/hr_storage" --with-perl-modules --enable-embedded-perl --disable-perl-cc-checks --enable-shared
# - without embedded Perl and all modules

# Disable testsuite until this has been fixed or /tmp will fill up:
#   https://sourceforge.net/tracker/?func=detail&aid=3006962&group_id=12694&atid=112694
SKIPTEST ?= 1

TEST_TARGET = test

INSTALL_OVERRIDE_VARS += SHELL
INSTALL_OVERRIDE_VAR_SHELL = /opt/csw/bin/bash


# Overriding specific libs is not possible right now. Refine when finished.
# CHECKPKG_OVERRIDES_CSWnetsnmp  = symbol-not-found|opt/csw/lib/python/site-packages/netsnmp/client_intf.so
# CHECKPKG_OVERRIDES_CSWnetsnmp  = symbol-not-found

include gar/category.mk

pre-configure-modulated:
	cd $(WORKSRC) && rm ltmain.sh && libtoolize --copy --force
	cd $(WORKSRC) && autoreconf
	@$(MAKECOOKIE)

# if find the header in /opt/csw/include first use the old header from
# installed older version, thats why remove /opt/csw/include
CFLAGS := $(filter-out -I/opt/csw/include,$(CFLAGS))
# LDFLAGS := $(filter-out -R/opt/csw/lib% -L/opt/csw/lib,$(LDFLAGS))

post-install:
	ginstall -d $(DESTDIR)/$(sysconfdir)/init.d
	ginstall -d $(DESTDIR)/$(sysconfdir)/snmp
	ginstall -m 755	$(WORKSRC)/dist/snmpd-init.d $(DESTDIR)/$(sysconfdir)/init.d/netsnmpd
	ginstall -m 755	$(WORKSRC)/dist/snmptrapd-init.d $(DESTDIR)/$(sysconfdir)/init.d/netsnmptrapd
	ginstall -m 755	$(WORKSRC)/EXAMPLE.conf $(DESTDIR)/$(sysconfdir)/snmp/snmpd.conf
	@$(MAKECOOKIE)

#post-install-isa-sparcv8:
#	( cd $(INSTALLISADIR)$(libdir) ; gzip -dc $(DESTDIR)/../../$(FILEDIR)/old_libs_s.tar.gz |tar xf -)
#	ln -s libnetsnmp.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmp.so.10
#	ln -s libnetsnmpagent.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmpagent.so.10
#	ln -s libnetsnmphelpers.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmphelpers.so.10
#	ln -s libnetsnmpmibs.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmpmibs.so.10
#	ln -s libnetsnmptrapd.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmptrapd.so.10
#	@$(MAKECOOKIE)

#post-install-isa-i386:
#	( cd $(INSTALLISADIR)$(libdir) ; gzip -dc $(DESTDIR)/../../$(FILEDIR)/old_libs_i.tar.gz |tar xf -)
#	ln -s libnetsnmp.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmp.so.10
#	ln -s libnetsnmpagent.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmpagent.so.10
#	ln -s libnetsnmphelpers.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmphelpers.so.10
#	ln -s libnetsnmpmibs.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmpmibs.so.10
#	@ln -s libnetsnmptrapd.so.10.0.1 $(INSTALLISADIR)$(libdir)/libnetsnmptrapd.so.10
#	@$(MAKECOOKIE)
