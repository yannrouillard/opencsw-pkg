# known build facts
#
# no linkage against
# - mysql 
# - pgsql
NAME = pure-ftpd
VERSION = 1.0.36
GARTYPE = v2

DESCRIPTION = A secure FTP daemon
define BLURB
  Pure-FTPd is a free (BSD), secure, production-quality and
  standard-conformant FTP server. It doesn't provide useless bells and
  whistles, but focuses on efficiency and ease of use. It provides simple
  answers to common needs, plus unique useful features for personal users
  as well as hosting providers.
endef

MASTER_SITES = http://download.pureftpd.org/pub/pure-ftpd/releases/
DISTFILES += $(DISTNAME).tar.gz

BUILD_DEP_PKGS += CSWlibssl-dev
BUILD_DEP_PKGS += CSWopenldap-dev

PACKAGES += CSWpureftpd
SPKG_DESC_CSWpureftpd = A secure FTP daemon
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWpureftpd += CSWlibssl1-0-0
RUNTIME_DEP_PKGS_CSWpureftpd += CSWlibssp0
RUNTIME_DEP_PKGS_CSWpureftpd += CSWlibldap2-4-2
CHECKPKG_OVERRIDES_CSWpureftpd += file-with-bad-content|/usr/share|root/opt/csw/share/man/man8/pure-ftpd.8

GARCOMPILER = GNU

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --with-everything
CONFIGURE_ARGS += --with-paranoidmsg
CONFIGURE_ARGS += --with-virtualchroot
CONFIGURE_ARGS += --with-tls
CONFIGURE_ARGS += --with-pam
CONFIGURE_ARGS += --with-altlog
CONFIGURE_ARGS += --with-brokenrealpath
CONFIGURE_ARGS += --enable-largefile
CONFIGURE_ARGS += --sysconfdir=$(prefix)/etc/pure-ftpd
CONFIGURE_ARGS += --with-ldap

# use X/Open CAE specifications
EXTRA_CFLAGS = -D_XOPEN_SOURCE=1 -D_XOPEN_SOURCE_EXTENDED=1

# No test suite available
TEST_SCRIPTS =

SAMPLECONF = $(sysconfdir)/pure-ftpd/*.conf

include gar/category.mk

# make sure, the linker uses libcrypt before libssl
post-configure:
	@perl -pi -e 's@-lssl -lcrypto -lcrypt@-lcrypt -lssl -lcrypto@' \
           ${WORKSRC}/Makefile
	@perl -pi -e 's@-lssl -lcrypto -lcrypt@-lcrypt -lssl -lcrypto@' \
           ${WORKSRC}/src/Makefile


# strange archive...
post-build:
	@chmod 751 $(WORKSRC)/x

# create config directory
pre-install:
	ginstall -d $(DESTDIR)$(sysconfdir)/pure-ftpd
	ginstall -d $(DESTDIR)$(docdir)/pure-ftpd
	ginstall -d $(DESTDIR)/var/opt/csw/run
	perl -pi -e 's@/var/run@/var/opt/csw/run@' ${WORKSRC}/src/ftpd.h
	perl -pi -e 's@/var/run@/var/opt/csw/run@' ${WORKSRC}/src/ftpwho-update.h
	perl -pi -e 's@/var/run@/var/opt/csw/run@' ${WORKSRC}/src/upload-pipe.h
	@$(MAKECOOKIE)

conf-list  = $(WORKSRC)/pureftpd-ldap.conf
conf-list += $(WORKSRC)/pureftpd-mysql.conf
conf-list += $(WORKSRC)/pureftpd-pgsql.conf
post-install:
	( for file in $(conf-list) ; do \
		ginstall -m 644 $$file $(DESTDIR)$(sysconfdir)/pure-ftpd ; \
		done )
	ginstall -m 644 $(WORKSRC)/pureftpd.schema $(DESTDIR)$(docdir)/pure-ftpd
	@$(MAKECOOKIE)
