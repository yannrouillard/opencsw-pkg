# TODO
# - SSL certs to /etc/opt/csw/ssl?
# - /var/run/dovecot instead of /var/opt/csw/run?
NAME = dovecot
VERSION = 2.2.12
GARTYPE = v2

DESCRIPTION = Secure IMAP server
define BLURB
  Dovecot is an open source IMAP and POP3 server for Linux/UNIX-like systems,
  written with security primarily in mind. Dovecot is an excellent choice for
  both small and large installations. It's fast, simple to set up, requires no
  special administration and it uses very little memory.
endef

SPKG_SOURCEURL = http://dovecot.org/
MASTER_SITES   = http://dovecot.org/releases/2.2/
DISTFILES      = $(NAME)-$(VERSION).tar.gz
UFILES_REGEX   = $(NAME)-(\d+(?:\.\d+)*).tar.gz

GARCOMPILER	= SOS12

PACKAGES  = CSWdovecot CSWdovecot-dev

CATALOGNAME_CSWdovecot = dovecot
CATALOGNAME_CSWdovecot-dev = dovecot_dev

SPKG_DESC_CSWdovecot = Secure IMAP server
SPKG_DESC_CSWdovecot-dev = Dovecot secure IMAP server header files

OBSOLETED_BY_CSWdovecot-dev = CSWdovecotdevel
CATALOGNAME_CSWdovecotdevel = dovecot_devel_stub

RUNTIME_DEP_PKGS_CSWdovecot += CSWlibmysqlclient18
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibz1
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibbz2-1-0
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibkrb5-3
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibpq5
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibsqlite3-0
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWdovecot += CSWliblber2-4-2
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibldap2-4-2
RUNTIME_DEP_PKGS_CSWdovecot += CSWliblzma5
RUNTIME_DEP_PKGS_CSWdovecot += CSWlibintl8

PKGFILES_CSWdovecot-dev = $(PKGFILES_DEVEL)

# These directories belong to CSWosslrt
PROTOTYPE_FILTER  = awk '\
	$$$$3 == "/opt/csw/ssl/certs" { next } \
	$$$$3 == "/opt/csw/ssl/private" { next } \
	 { print }'

REINPLACEMENTS += ul

REINPLACE_MATCH_ul = /usr/local
REINPLACE_WITH_ul = $(prefix)
REINPLACE_FILES_ul += src/plugins/fts/decode2text.sh
REINPLACE_FILES_ul += doc/wiki/LDA.Sendmail.txt
REINPLACE_FILES_ul += doc/wiki/CompilingSource.txt
REINPLACE_FILES_ul += doc/wiki/HowTo.PopBSMTPAndDovecot.txt

# No test suite for Dovecot available
TEST_SCRIPTS	=

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --with-gssapi
CONFIGURE_ARGS += --with-ldap
CONFIGURE_ARGS += --with-mysql
CONFIGURE_ARGS += --with-pgsql
CONFIGURE_ARGS += --with-sqlite
CONFIGURE_ARGS += --with-ssl=openssl
CONFIGURE_ARGS += --with-ssldir=/etc/opt/csw/ssl
CONFIGURE_ARGS += --with-zlib
CONFIGURE_ARGS += --with-bzlib

# Disable linker map forcing SUNW_1.22.2 as the linked MySQL needs SUNW_1.22.5
LINKER_MAPS =

EXTRA_INC = /opt/csw/include/mysql /opt/csw/include/postgresql

STRIP_DIRS  = $(DESTDIR)$(libexecdir)/dovecot

# cswclassutils integration
INITSMF    = /etc/opt/csw/init.d/cswdovecot
USERGROUP = /etc/opt/csw/pkg/CSWdovecot/cswusergroup
SAMPLECONF = .*/dovecot.pem $(sysconfdir)/dovecot/dovecot.conf
MIGRATE_FILES = dovecot.conf

# the perl search and replace is missing this.  Need to rework the below perl
# lines.  For now overriding since the file(s) are only documentation.

PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

# override needed until ld inconsistancy is resolved on buildfarm
CHECKPKG_OVERRIDES_CSWdovecot += surplus-dependency|CSWlibintl8

include gar/category.mk

pre-install-modulated:
	perl -pi -e 's|/etc/ssl|/etc/opt/csw/ssl|' $(WORKSRC)/doc/mkcert.sh
	perl -pi -e '\
		s| /var/run| /var/opt/csw/run|; \
		s| /etc/ssl| /etc/opt/csw/ssl|; \
		s| /usr/libexec| /opt/csw/libexec/dovecot|; \
		s| /usr/lib/dovecot| /opt/csw/lib/dovecot|; \
		s| /usr/local| /opt/csw|;' \
		$(WORKSRC)/doc/example-config/dovecot.conf
	perl -pi -e '\
		s|/etc/ssl|/etc/opt/csw/ssl|; \
		s|/usr/local|/opt/csw|;' \
		$(WORKSRC)/doc/example-config/conf.d/*
	@$(MAKECOOKIE)

post-install-modulated: DOCDEST = $(DESTDIR)$(docdir)/$(NAME)
post-install-modulated: DOCS = NEWS AUTHORS COPYING.LGPL COPYING.MIT
post-install-modulated: CSWDOCS=README.CSW changelog.CSW
post-install-modulated: SSLDIR = $(DESTDIR)/etc/opt/csw/ssl
post-install-modulated:

	perl -pi -e '\
		s|/etc/ssl|/etc/opt/csw/ssl|; \
		s|/usr/local|/opt/csw|; \
		s|/usr/share|/opt/csw/share|;' \
		$(DESTDIR)/opt/csw/share/doc/dovecot/wiki/*

	# Include these in the pkg. dovecot will create them otherwise
	# with root:root ownership, which conflicts with other pkg's
	ginstall -d $(DESTDIR)$(localstatedir)/run 
	ginstall -d $(DESTDIR)$(localstatedir)/lib

	cp $(FILEDIR)/dovecot-minimal.conf \
		$(DESTDIR)$(sysconfdir)/dovecot/dovecot.conf

	# Create self-signed sample cert
	ginstall -d $(SSLDIR)/certs
	ginstall -d $(SSLDIR)/private
	( cd $(WORKSRC)/doc; SSLDIR=$(SSLDIR) /bin/sh ./mkcert.sh )
	chmod 400 $(SSLDIR)/private/dovecot.pem

	# Copy documentation (upstream + CSW) and mkcert.sh
	ginstall -d $(DOCDEST)
	cp $(addprefix $(FILEDIR)/,$(CSWDOCS)) $(DOCDEST)
	cp $(addprefix $(WORKSRC)/,$(DOCS))    $(DOCDEST)
	ginstall -m 755 $(WORKSRC)/doc/mkcert.sh $(DOCDEST)
	cp $(WORKSRC)/doc/dovecot-openssl.cnf $(DOCDEST)

	# Copy init script
	ginstall -Dm 755 $(FILEDIR)/cswdovecot  \
		$(DESTDIR)/etc/opt/csw/init.d/cswdovecot

	# Copy cswusergroup
	ginstall -m 755 -d $(DESTDIR)/etc/opt/csw/pkg/CSWdovecot
	ginstall -m 444 $(FILEDIR)/cswusergroup \
		$(DESTDIR)/etc/opt/csw/pkg/CSWdovecot/

	@$(MAKECOOKIE)
