#Todo stuff
# There are lots of files and libs which are part of samba 3 package too. There should be removed from packinging
# See http://sources.debian.net/src/samba4/4.0.3%2Bdfsg1-0.1/debian/rules
# All remaining libs are need to be split off. See debian package too.

NAME = samba
VERSION = 4.0.6
GARTYPE = v2

DESCRIPTION = Tools to access a servers filespace and printers via SMB (server)
define BLURB
  Tools to access a servers filespace and printers via SMB (server)
endef

MASTER_SITES = http://samba.org/samba/ftp/stable/
DISTFILES  = $(NAME)-$(VERSION).tar.gz
DISTFILES += cswsamba
DISTFILES += cswwinbind
EXPANDVARS += cswsamba
EXPANDVARS += cswwinbind
EXPANDVARS += smb.conf

# From http://www.reallylinux.com/docs/smb.conf
DISTFILES += smb.conf

# This is taken from the old Samba package
DISTFILES += cswkrb5.conf

PATCHFILES += 0001-fix-xml.patch
#From https://bugzilla.samba.org/show_bug.cgi?id=7588
PATCHFILES += nss_winbind.patch
PATCHFILES += smbd_patch_for_setgroups.patch

BUILD_DEP_PKGS += CSWlibtalloc-dev
PACKAGING_PLATFORMS = solaris10-sparc solaris10-i386

PACKAGES += CSWsamba4
SPKG_DESC_CSWsamba4 = $(DESCRIPTION)
# PKGFILES is catchall
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibpopt0
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibz1
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibintl8
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibfam0
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibgssapi-krb5-2
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibkrb5-3
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibcom-err3
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibreadline6
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibcups2
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibtalloc2
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibk5crypto3
RUNTIME_DEP_PKGS_CSWsamba4 += CSWliblber2-4-2
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibldap2-4-2
RUNTIME_DEP_PKGS_CSWsamba4 += CSWlibwbclient0

# Just docs override for now
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man5/lmhosts.5
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man5/smb.conf.5
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/nmbd.8
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/smbd.8
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/tdbbackup.8
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/idmap_tdb2.8
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/net.8
CHECKPKG_OVERRIDES_CSWsamba4 += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/swat.8

PACKAGES += CSWsamba4-client
SPKG_DESC_CSWsamba4-client = Client binaries for samba4
SMB_CLIENT_TOOLS = cifsdd smbclient4 nmblookup4
PKGFILES_CSWsamba4-client += $(foreach T,$(SMB_CLIENT_TOOLS),$(call baseisadirs,$(bindir),$T) $(mandir)/man1/$T\.1)
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibpopt0
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibz1
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibcom-err3
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibk5crypto3
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibkrb5-3
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibgssapi-krb5-2
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibreadline6
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibtalloc2
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWliblber2-4-2
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibldap2-4-2
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibwbclient0
RUNTIME_DEP_PKGS_CSWsamba4-client += CSWlibtdb1


# Just docs, override for now
CHECKPKG_OVERRIDES_CSWsamba4-client += file-with-bad-content|/usr/local|root/opt/csw/share/man/man1/smbclient.1

#PACKAGES += CSWsambadoc
SPKG_DESC_CSWsambadoc = Samba documentation
ARCHALL_CSWsambadoc = 1

PACKAGES += CSWlibnetapi0
PKGFILES_CSWlibnetapi0 += $(call pkgfiles_lib,libnetapi.so.0)
SPKG_DESC_CSWlibnetapi0 += Samba client library, libnetapi.so.0

PACKAGES += CSWlibnss-winbind1
PKGFILES_CSWlibnss-winbind1 += $(call pkgfiles_lib,libnss_winbind.so.1)
SPKG_DESC_CSWlibnss-winbind1 += Winbind nss libary,libnss_winbind.so.1

PACKAGES += CSWsamba4-dev
SPKG_DESC_CSWsamba4-dev = Development files for Samba, libsmbclient.so.0
PKGFILES_CSWsamba4-dev += $(PKGFILES_DEVEL)
RUNTIME_DEP_PKGS_CSWsamba4-dev += CSWlibsmbclient0
RUNTIME_DEP_PKGS_CSWsamba4-dev += CSWlibwbclient0
RUNTIME_DEP_PKGS_CSWsamba4-dev += CSWlibnetapi0
RUNTIME_DEP_PKGS_CSWsamba4-dev += CSWlibtdb1
RUNTIME_DEP_PKGS_CSWsamba4-dev += CSWlibsmbsharemodes0
RUNTIME_DEP_PKGS_CSWsamba4-dev += CSWsamba


PACKAGES += CSWsamba4-swat
SPKG_DESC_CSWsamba4-swat = Web-based samba administration tools
PKGFILES_CSWsamba4-swat += $(call baseisadirs,$(sbindir),swat)
PKGFILES_CSWsamba4-swat += $(mandir)/.*/swat\.*
PKGFILES_CSWsamba4-swat += $(sharedstatedir)/samba/swat/.*
PKGFILES_CSWsamba4-swat += $(prefix)/swat/.*
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibpopt0
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibz1
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibcom-err3
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibk5crypto3
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibkrb5-3
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibgssapi-krb5-2
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibcups2
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibtalloc2
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWliblber2-4-2
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibldap2-4-2
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibwbclient0
RUNTIME_DEP_PKGS_CSWsamba4-swat += CSWlibtdb1

# Just docs, override for now
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-ByExample/ix01.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-ByExample/appendix.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-ByExample/upgrades.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-ByExample/secure.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-ByExample/nw4migration.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-Developers-Guide/pwencrypt.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/classicalprinting.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/bugreport.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/VFS.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/compiling.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/NetworkBrowsing.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/domain-member.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/SWAT.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/locking.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/ix01.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/samba-pdc.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/install.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/diagnosis.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/FastStart.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/pam.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/winbind.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/Samba3-HOWTO/AccessControls.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/swat.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/lmhosts.5.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/nmbd.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/idmap_tdb2.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/smb.conf.5.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/winbindd.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/smbd.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/net.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/tdbbackup.8.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/local|root/opt/csw/swat/help/manpages/smbclient.1.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/export/home|root/opt/csw/swat/help/Samba3-HOWTO/msdfs.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-ByExample/ix01.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-ByExample/appendix.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-ByExample/upgrades.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-ByExample/happy.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-HOWTO/VFS.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-HOWTO/CUPS-printing.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-HOWTO/SWAT.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-HOWTO/ix01.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-HOWTO/FastStart.html
CHECKPKG_OVERRIDES_CSWsamba4-swat += file-with-bad-content|/usr/share|root/opt/csw/swat/help/Samba3-HOWTO/ch-ldap-tls.html

PACKAGES += CSWsamba4-winbind
SPKG_DESC_CSWsamba4-winbind = Tools to authenticate users from active directory using winbind
PKGFILES_CSWsamba4-winbind += $(call baseisadirs,$(libdir),security/pam_winbind\.so)
PKGFILES_CSWsamba4-winbind += $(sharedstatedir)/locale/.*/pam_winbind\.mo
PKGFILES_CSWsamba4-winbind += $(mandir)/man5/pam_winbind\.conf\.5
PKGFILES_CSWsamba4-winbind += $(mandir)/man7/winbind_krb5_locator\.7
PKGFILES_CSWsamba4-winbind += $(mandir)/man8/pam_winbind\.8
PKGFILES_CSWsamba4-winbind += $(call baseisadirs,$(sbindir),winbindd)
PKGFILES_CSWsamba4-winbind += $(mandir)/man8/winbindd\.8
PKGFILES_CSWsamba4-winbind += /etc/opt/csw/init.d/cswwinbind
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibpopt0
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibiconv2
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibz1
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibintl8
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibtdb1
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibgssapi-krb5-2
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibk5crypto3
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibwbclient0
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibkrb5-3
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibcom-err3
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibtalloc2
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWliblber2-4-2
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibldap2-4-2
RUNTIME_DEP_PKGS_CSWsamba4-winbind += CSWlibnss-winbind1

# Just docs, override for now
CHECKPKG_OVERRIDES_CSWsamba4-winbind += file-with-bad-content|/usr/local|root/opt/csw/share/man/man8/winbindd.8
CHECKPKG_OVERRIDES_CSWsamba4-winbind += surplus-dependency|CSWlibnss-winbind1

EXTRA_CFLAGS = -lrt -lintl -lsec
EXTRA_LDFLAGS = -lrt -lintl -lsec

# At the moment there are errors about python headers missing on 64 bit
#BUILD64 = 1
#ISAEXEC = 1

GARCOMPILER = GNU

SMBLOCKDIR = $(localstatedir)/samba/locks
SMBLOGDIR = $(localstatedir)/samba/log
SMBPRIVATEDIR = $(sysconfdir)/samba/private
SMBCONFIGDIR = $(sysconfdir)/samba
SMBPRIVATELIB = $(libdir)/samba

CONFIGURE_ARGS += $(DIRPATHS)
#Remove exec_prefix from DIRPATHS:
NODIRPATHS += --exec_prefix=/opt/csw 

#CONFIGURE_ARGS += --enable-shared=yes
#CONFIGURE_ARGS += --enable-static=no
#CONFIGURE_ARGS += --enable-socket-wrapper
#CONFIGURE_ARGS += --enable-nss-wrapper
CONFIGURE_ARGS += --with-acl-support
CONFIGURE_ARGS += --with-aio-support
CONFIGURE_ARGS += --with-pam
CONFIGURE_ARGS += --with-winbind
CONFIGURE_ARGS += --with-static-modules=vfs_solarisacl
CONFIGURE_ARGS += --with-shared-modules=vfs_zfsacl,vfs_prealloc,vfs_cacheprime,vfs_commit,idmap_ldap,idmap_tdb2,idmap_rid,idmap_ad,idmap_hash,idmap_adex
#CONFIGURE_ARGS += --with-shared-modules=vfs_prealloc,vfs_cacheprime,vfs_commit,idmap_ldap,idmap_tdb2,idmap_rid,idmap_ad,idmap_hash,idmap_adex
#CONFIGURE_ARGS += --with-readline
CONFIGURE_ARGS += --with-ads
CONFIGURE_ARGS += --with-ldap
CONFIGURE_ARGS += --with-automount
#CONFIGURE_ARGS += --with-dnsupdate=no
CONFIGURE_ARGS += --with-privatedir=$(SMBPRIVATELIB)
CONFIGURE_ARGS += --with-configdir=$(SMBCONFIGDIR)
CONFIGURE_ARGS += --with-lockdir=$(SMBLOCKDIR)
CONFIGURE_ARGS += --with-statedir=$(SMBLOCKDIR)
CONFIGURE_ARGS += --with-cachedir=$(SMBLOCKDIR)
CONFIGURE_ARGS += --with-piddir=$(SMBLOCKDIR)
# to stay with the one build with samba 3 build this one private
CONFIGURE_ARGS += --private-libraries=smbclient
CONFIGURE_ARGS += --with-privatelibdir=$(SMBPRIVATELIB)

CONFIGURE_ARGS += --with-logfilebase=$(SMBLOGDIR)

CONFIGURE_ARGS += --enable-cups

# Can't use fdatasync atm do to linker problems
#CONFIGURE_ARGS += ac_cv_lib_rt_fdatasync=no
#CONFIGURE_ARGS += ac_cv_have_fdatasync_decl=no
#CONFIGURE_ARGS += ac_cv_lib_ext_rt_fdatasync=no




TEST_TARGET = test

# Tests need root
SKIPTEST ?= 1

# Some filenames contain a "=" which totally confuses the svr4 packaging system
# These are:
#   /opt/csw/share/setup/cn=replicator.ldif
#   /opt/csw/share/setup/cn=samba-admin.ldif
#   /opt/csw/share/setup/cn=samba.ldif

EXTRA_PAX_ARGS += -s "/=/-/g"

INITSMF += /etc/opt/csw/init.d/cswsamba
INITSMF += /etc/opt/csw/init.d/cswwinbind

PRESERVECONF += $(sysconfdir)/samba/smb.conf

include gar/category.mk

post-install-modulated:
	ginstall -d $(DESTDIR)/etc/opt/csw/init.d
	ginstall $(WORKDIR)/cswsamba $(DESTDIR)/etc/opt/csw/init.d/cswsamba
	ginstall $(WORKDIR)/cswwinbind $(DESTDIR)/etc/opt/csw/init.d/cswwinbind
	ginstall -d $(DESTDIR)/etc/opt/csw/samba
	ginstall $(WORKDIR)/smb.conf $(DESTDIR)/etc/opt/csw/samba/smb.conf
	#ginstall $(WORKSRC)/nsswitch/libnss_winbind.so $(DESTDIR)/$(libdir)/libnss_winbind.so.1
	@$(MAKECOOKIE)

# python buildtools/bin/waf -v build 
