NAME = proftpd
VERSION = 1.3.4d
GARTYPE = v2

DESCRIPTION = Advanced, incredibly configurable and secure FTP daemon
define BLURB
  ProFTPD is a proven, high-performance, scalable FTP server written from
  scratch, with a focus toward simplicity, security, and ease of configuration.
  Naturally, ProFTPD powers some of the largest sites on the Internet. It
  features a very Apache-like configuration syntax, modules, and a highly
  customizable server infrastructure, including support for multiple 'virtual'
  FTP servers, anonymous FTP, and permission-based directory visibility.
endef

MASTER_SITES = ftp://ftp.proftpd.org/distrib/source/
DISTFILES    = $(NAME)-$(VERSION).tar.gz
DISTFILES   += cswproftpd

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

BUILD_DEP_PKGS = CSWmysql-dev
BUILD_DEP_PKGS += CSWggettext-dev

RUNTIME_DEP_PKGS_CSWproftpd += CSWlibsqlite3-0
RUNTIME_DEP_PKGS_CSWproftpd += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWproftpd += CSWlibz1
RUNTIME_DEP_PKGS_CSWproftpd += CSWlibintl8
RUNTIME_DEP_PKGS_CSWproftpd += CSWlibmysqlclient18
RUNTIME_DEP_PKGS_CSWproftpd += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWproftpd += CSWlibldap2-4-2

# Linking on sparc gives an additional dependency
# probably because of the current bug with Solaris 10
# sparc linker (see http://lists.opencsw.org/pipermail/maintainers/2013-November/018780.html)
RUNTIME_DEP_PKGS_CSWproftpd += $(RUNTIME_DEP_PKGS_CSWproftpd_$(GARCH))
RUNTIME_DEP_PKGS_CSWproftpd_sparc += CSWliblber2-4-2

BUILD64 = 1

ISAEXEC_DIRS                = $(bindir) $(sbindir)
EXTRA_ISAEXEC_EXCLUDE_FILES += $(bindir)/ftpasswd
EXTRA_ISAEXEC_EXCLUDE_FILES += $(bindir)/ftpmail
EXTRA_ISAEXEC_EXCLUDE_FILES += $(bindir)/ftpquota
EXTRA_ISAEXEC_EXCLUDE_FILES += $(bindir)/prxs

EXTRA_MERGE_EXCLUDE_FILES_isa-amd64   = $(prefix)/bin/amd64/ftpasswd $(prefix)/bin/amd64/ftpmail $(prefix)/bin/amd64/ftpquota $(prefix)/bin/amd64/prxs
EXTRA_MERGE_EXCLUDE_FILES_isa-sparcv9 = $(prefix)/bin/sparcv9/ftpasswd $(prefix)/bin/sparcv9/ftpmail $(prefix)/bin/sparcv9/ftpquota $(prefix)/bin/sparcv9/prxs

MIGRATE_FILES   = proftpd.conf

EXTRA_CONFIGURE_ENV  = install_user=$(shell /usr/xpg4/bin/id -un) install_group=$(shell /usr/xpg4/bin/id -gn)
EXTRA_CONFIGURE_ENV += LD_LIBRARY_PATH="$(libdir)"

localstatedir = /var/run/

CONFIGURE_ARGS += $(DIRPATHS)
CONFIGURE_ARGS += --libexecdir=$(libdir)/proftpd
CONFIGURE_ARGS += --enable-dso --disable-static
CONFIGURE_ARGS += --enable-facl
CONFIGURE_ARGS += --enable-openssl
CONFIGURE_ARGS += --enable-sendfile
CONFIGURE_ARGS += --enable-nls
CONFIGURE_ARGS += --enable-ctrls
CONFIGURE_ARGS += --enable-buffer-size=8192
CONFIGURE_ARGS += --with-includes=$(prefix)/include:$(prefix)/include/openssl:$(prefix)/include/mysql
CONFIGURE_ARGS += --with-modules=mod_facl
CONFIGURE_ARGS += --with-shared=mod_auth_pam:mod_ban:mod_ctrls_admin:mod_dynmasq:mod_exec:mod_ident:mod_ifsession:mod_ldap:mod_load:mod_quotatab:mod_quotatab_file:mod_quotatab_ldap:mod_quotatab_radius:mod_quotatab_sql:mod_radius:mod_ratio:mod_readme:mod_rewrite:mod_sftp:mod_sftp_pam:mod_sftp_sql:mod_shaper:mod_site_misc:mod_sql:mod_sql_mysql:mod_sql_passwd:mod_sql_sqlite:mod_tls:mod_tls_shmcache:mod_unique_id:mod_wrap2:mod_wrap2_file:mod_wrap2_sql

CHECKPKG_OVERRIDES_CSWproftpd += bad-location-of-file|file=/var/run/proftpd
CHECKPKG_OVERRIDES_CSWproftpd += missing-dependency|CSWbonnie++|or|CSWcollectd|or|CSWgnupg2|or|CSWleafnode|or|CSWlighttpd|or|CSWlogrotate|or|CSWnginx|or|CSWopenldap|or|CSWpound|or|CSWsamba|or|CSWsamba-swat|or|CSWsamba-winbind|or|CSWsysstat|or|CSWzabbix-agent|or|CSWzabbix-server

TEST_SCRIPTS =

INITSMF      = $(sysconfdir)/init.d/cswproftpd
PRESERVECONF = $(sysconfdir)/proftpd.conf

PROFTPDDOC   = doc sample-configurations COPYING NEWS README RELEASE_NOTES
CONTRIBUTILS = ftpasswd ftpmail ftpquota

include gar/category.mk

post-configure-modulated:
	gsed -i s/\^LDFLAGS=/#LDFLAGS=/ $(WORKSRC)/contrib/mod_load/Makefile
	gsed -i s/\^LDFLAGS=/#LDFLAGS=/ $(WORKSRC)/contrib/mod_sftp/Makefile
	gsed -i s/\^LDFLAGS=/#LDFLAGS=/ $(WORKSRC)/contrib/mod_wrap2/Makefile
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/NEWS
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/RELEASE_NOTES
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/sample-configurations/anonymous.conf
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/sample-configurations/virtual.conf
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/Configuration.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/faq.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/ftpasswd.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/ftpquota.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_ldap.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_quotatab_file.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_quotatab_ldap.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_quotatab_radius.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_sftp.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_sql_odbc.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_sql_sqlite.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/contrib/mod_tls.html
	gsed -i s#/usr/local#/opt/csw#g $(WORKSRC)/doc/howto/Compiling.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/howto/ConfigFile.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/howto/ConfigurationTricks.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/howto/DNS.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/howto/DSO.html
	gsed -i s#/usr/local#/opt/csw#g $(WORKSRC)/doc/howto/SQL.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/howto/Stopping.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/howto/TLS.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/modules/mod_dso.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/modules/mod_lang.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/utils/ftpasswd.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/utils/ftpquota.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/utils/ftpscrub.html
	gsed -i s#/usr/local#/opt/csw#  $(WORKSRC)/doc/utils/ftptop.html
	$(MAKECOOKIE)

post-install-modulated:
	ginstall -d $(DESTDIR)$(sysconfdir)/init.d
	ginstall -d $(DESTDIR)$(docdir)/proftpd
	ginstall -d $(DESTDIR)$(localstatedir)/proftpd
	cp $(WORKDIR)/cswproftpd $(DESTDIR)$(sysconfdir)/init.d/
	cd $(WORKSRC); cp -r $(PROFTPDDOC) $(DESTDIR)$(docdir)/proftpd
	cd $(WORKSRC)/contrib ; cp $(CONTRIBUTILS) $(DESTDIR)$(bindir)
	rm -f $(DESTDIR)$(libdir)/proftpd/*.la
	$(MAKECOOKIE)
