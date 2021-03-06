# $Id$
# TODO (release-critical prefixed with !, non release-critical with *)
#
NAME = mirrorbrain
VERSION = 2.19.0
GARTYPE = v2

DESCRIPTION = Content distribution tool

MASTER_SITES = http://mirrorbrain.org/files/releases/
DISTFILES  = $(DISTNAME).tar.gz
DISTFILES += CSWap2-mod-autoindex-mb.postinstall
DISTFILES += CSWap2-mod-autoindex-mb.preremove
DISTFILES += CSWap2-mod-mirrorbrain.postinstall
DISTFILES += CSWap2-mod-mirrorbrain.preremove

VENDOR_URL = http://mirrorbrain.org

# Apache paths
AP2_ROOT      = $(prefix)/apache2
AP2_LIBEXEC   = $(AP2_ROOT)/libexec
AP2_EXTRACONF = $(AP2_ROOT)/etc/extra
AP2_SBIN      = $(AP2_ROOT)/sbin
APXS          = $(AP2_SBIN)/apxs

BUILD_DEP_PKGS += CSWapache2-dev
BUILD_DEP_PKGS += CSWap2-mod-form

PACKAGES += CSWap2-mod-mirrorbrain
SPKG_DESC_CSWap2-mod-mirrorbrain = MirrorBrain redirector Apache module
PKGFILES_CSWap2-mod-mirrorbrain += $(AP2_LIBEXEC)/mod_mirrorbrain.so
PKGFILES_CSWap2-mod-mirrorbrain += $(AP2_EXTRACONF)/mod_mirrorbrain.conf.CSW
RUNTIME_DEP_PKGS_CSWap2-mod-mirrorbrain += CSWapache2
RUNTIME_DEP_PKGS_CSWap2-mod-mirrorbrain += CSWap2-mod-form
RUNTIME_DEP_PKGS_CSWap2-mod-mirrorbrain += CSWap2modgeoip
RUNTIME_DEP_PKGS_CSWap2-mod-mirrorbrain += CSWlibaprutil1-dbd-pgsql
# I know these are needed
CHECKPKG_OVERRIDES_CSWap2-mod-mirrorbrain += surplus-dependency|CSWapache2
CHECKPKG_OVERRIDES_CSWap2-mod-mirrorbrain += surplus-dependency|CSWap2-mod-form
CHECKPKG_OVERRIDES_CSWap2-mod-mirrorbrain += surplus-dependency|CSWap2modgeoip
CHECKPKG_OVERRIDES_CSWap2-mod-mirrorbrain += surplus-dependency|CSWlibaprutil1-dbd-pgsql

PACKAGES += CSWap2-mod-autoindex-mb
SPKG_DESC_CSWap2-mod-autoindex-mb = Modified autoindex Module for Apache
PKGFILES_CSWap2-mod-autoindex-mb += $(AP2_LIBEXEC)/mod_autoindex_mb.so
RUNTIME_DEP_PKGS_CSWap2-mod-autoindex-mb += CSWapache2

PACKAGES += CSWmirrorbrain-tools
SPKG_DESC_CSWmirrorbrain-tools = Tools for administering a MirrorBrain Server
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpy-cmdln
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpy-mb
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpy-sqlobject
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpy-psycopg2
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWlibgeoip1
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWperl
# This is needed for /opt/csw/bin/scanner
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpm-dbi
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpm-dbd-pg
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpm-timedate
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpm-libwww-perl
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpm-config-inifiles
RUNTIME_DEP_PKGS_CSWmirrorbrain-tools += CSWpm-digest-md4
# I know these are needed
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpy-cmdln
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpy-mb
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpy-sqlobject
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpy-psycopg2
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWperl
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpm-dbi
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpm-dbd-pg
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpm-timedate
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpm-libwww-perl
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpm-config-inifiles
CHECKPKG_OVERRIDES_CSWmirrorbrain-tools += surplus-dependency|CSWpm-digest-md4

# The Python CSWpy-mb module "mb" and the "mb" binary are in lang-py/mb

REINPLACEMENTS += python
REINPLACE_MATCH_python = \#!.*python.*
REINPLACE_WITH_python = \#!$(bindir)/python
REINPLACE_FILES_python += tools/null-rsync
REINPLACE_FILES_python += mirrorprobe/mirrorprobe.py
REINPLACE_FILES_python += tools/bdecode
REINPLACE_FILES_python += tools/rsyncinfo
REINPLACE_FILES_python += tools/rsyncusers
REINPLACE_FILES_python += tools/create_timestamp

REINPLACEMENTS += perl
REINPLACE_MATCH_perl = \#!.*perl.*
REINPLACE_WITH_perl = \#!$(bindir)/perl -w
REINPLACE_FILES_perl += tools/scanner.pl

REINPLACEMENTS += mbconf
REINPLACE_MATCH_mbconf = /etc/mirrorbrain.conf
REINPLACE_WITH_mbconf = $(sysconfdir)/mirrorbrain.conf
REINPLACE_FILES_mbconf += tools/scanner.pl
REINPLACE_FILES_mbconf += mirrorprobe/mirrorprobe.py

REINPLACEMENTS += mplog
REINPLACE_MATCH_mplog = /var/log/mirrorbrain/mirrorprobe.log
REINPLACE_WITH_mplog = $(localstatedir)/mirrorbrain/mirrorprobe.log
REINPLACE_FILES_mplog += mirrorprobe/mirrorprobe.py

# The language must be in lower case
#REINPLACEMENTS += sql
#REINPLACE_MATCH_sql = 'SQL'
#REINPLACE_WITH_sql = 'sql'
#REINPLACE_FILES_sql += sql/schema-postgresql.sql

GEOIPCITYFILE = $(sharedstatedir)/GeoIP/GeoIPCity.dat
GEOIPFILE = $(sharedstatedir)/GeoIP/GeoIP.dat

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS = custom
TEST_SCRIPTS =
INSTALL_SCRIPTS = custom

PRESERVECONF += $(AP2_EXTRACONF)/mod_mirrorbrain.conf

STRIP_DIRS = $(DESTDIR)$(prefix)/apache2/libexec

include gar/category.mk

build-custom:
	cd $(WORKSRC)/mod_mirrorbrain && $(APXS) -c mod_mirrorbrain.c
	cd $(WORKSRC)/mod_autoindex_mb && $(APXS) -c mod_autoindex_mb.c
	cd $(WORKSRC)/tools && LD_OPTIONS="$(LD_OPTIONS)" $(CC) $(CPPFLAGS) $(CFLAGS) $(LINKER_FLAGS) -DDEFAULT_GEOIPCITYFILE=\"$(GEOIPCITYFILE)\" -lGeoIP geoiplookup_city.c -o geoiplookup_city
	cd $(WORKSRC)/tools && LD_OPTIONS="$(LD_OPTIONS)" $(CC) $(CPPFLAGS) $(CFLAGS) $(LINKER_FLAGS) -DDEFAULT_GEOIPFILE=\"$(GEOIPFILE)\" -lGeoIP geoiplookup_continent.c -o geoiplookup_continent
	@$(MAKECOOKIE)

install-custom:
	mkdir -p $(DESTDIR)$(AP2_LIBEXEC)
	cd $(WORKSRC)/mod_mirrorbrain && $(APXS) -lm -S LIBEXECDIR=$(DESTDIR)$(AP2_LIBEXEC) -i mod_mirrorbrain.la
	cd $(WORKSRC)/mod_autoindex_mb && $(APXS) -lm -S LIBEXECDIR=$(DESTDIR)$(AP2_LIBEXEC) -i mod_autoindex_mb.la
	ginstall -d $(DESTDIR)$(prefix)/apache2/etc/extra
	ginstall -m 0644 $(WORKSRC)/mod_mirrorbrain/mod_mirrorbrain.conf $(DESTDIR)$(prefix)/apache2/etc/extra/mod_mirrorbrain.conf.CSW
	ginstall -d $(DESTDIR)$(bindir)
	ginstall -m 0755 $(WORKSRC)/tools/geoiplookup_city $(DESTDIR)$(bindir)/geoiplookup_city
	ginstall -m 0755 $(WORKSRC)/tools/geoiplookup_continent $(DESTDIR)$(bindir)/geoiplookup_continent
	ginstall -m 0755 $(WORKSRC)/tools/null-rsync $(DESTDIR)$(bindir)/null-rsync
	ginstall -m 0755 $(WORKSRC)/tools/scanner.pl $(DESTDIR)$(bindir)/scanner
	ginstall -m 0755 $(WORKSRC)/tools/bdecode $(DESTDIR)$(bindir)/bdecode
	ginstall -m 0755 $(WORKSRC)/tools/rsyncinfo $(DESTDIR)$(bindir)/rsyncinfo
	ginstall -m 0755 $(WORKSRC)/tools/rsyncusers $(DESTDIR)$(bindir)/rsyncusers
	ginstall -m 0755 $(WORKSRC)/tools/create_timestamp $(DESTDIR)$(bindir)/create_timestamp
	ginstall -m 0755 $(WORKSRC)/mirrorprobe/mirrorprobe.py $(DESTDIR)$(bindir)/mirrorprobe
	ginstall -d $(DESTDIR)$(sharedstatedir)/mirrorbrain/sql
	ginstall -m 0644 $(WORKSRC)/sql/initialdata-postgresql.sql $(DESTDIR)$(sharedstatedir)/mirrorbrain/sql/initialdata-postgresql.sql
	@# LANG SQL must in fact be LANG sql (lowercase!) or the creation faills
	ginstall -m 0644 $(WORKSRC)/sql/schema-postgresql.sql $(DESTDIR)$(sharedstatedir)/mirrorbrain/sql/schema-postgresql.sql
	ginstall -d $(DESTDIR)$(localstatedir)/mirrorbrain
	@$(MAKECOOKIE)

