# Copyright 2012 OpenCSW
# Distributed under the terms of the GNU General Public License v2
# $Id$

NAME = puppet3
VERSION = 3.4.1
GARTYPE = v2

define BLURB
  Puppet helps accomplish the goal of a hands-off, automated infrastructure.
  The benefits of automated infrastructure go beyond policy-enforced
  consistency and auditing.  The impact of hardware failure and other disaster
  scenarios can be mitigated, as services can be quickly restored by Puppet. In
  conjunction with virtualizaton, the ability to reliably create new systems
  running consistent services can be leveraged to create autoscaling
  applications as well as test systems identical to production environments.
endef

DISTNAME = puppet-${VERSION}
MASTER_SITES = http://puppetlabs.com/downloads/puppet/
DISTFILES  = ${DISTNAME}.tar.gz
DISTFILES += cswpuppetd
DISTFILES += cswpuppetmasterd
DISTFILES += cswusergroup
DISTFILES += CSWpuppet.postinstall
DISTFILES += README.CSW
DISTFILES += puppet.conf.example-CSW
SPKG_SOURCEURL = http://puppetlabs.com/
LICENSE_CSWpuppet3 = LICENSE
LICENSE_CSWpuppetmaster3 = LICENSE

INITSMF += $(sysconfdir)/init\.d/cswpuppetd
INITSMF += $(sysconfdir)/init\.d/cswpuppetmasterd
USERGROUP = $(sysconfdir)/pkg/puppet/cswusergroup

# Creating a separate package CSWpuppetmaster so that the cswpuppetmaster
# service isn't started upon the installation of CSWpuppet.
PACKAGES += CSWpuppetmaster3
PACKAGES += CSWpuppet3

INCOMPATIBLE_PKGS += CSWpuppet
INCOMPATIBLE_PKGS += CSWpuppetmaster

SPKG_DESC_CSWpuppet3       = System configuration management tool, client daemon
SPKG_DESC_CSWpuppetmaster3 = System configuration management tool, server

RUNTIME_DEP_PKGS                  = CSWfacter
RUNTIME_DEP_PKGS                  += CSWruby18
RUNTIME_DEP_PKGS				  += CSWrubyaugeas
RUNTIME_DEP_PKGS_CSWpuppetmaster3 += CSWpuppet3
RUNTIME_DEP_PKGS_CSWpuppetmaster3 += CSWruby18
BUILD_DEP_PKGS  				  = $(RUNTIME_DEP_PKGS)

PKGFILES_CSWpuppetmaster3  = $(sysconfdir)/init\.d/cswpuppetmasterd
PKGFILES_CSWpuppetmaster3 += $(sbindir)/puppetmasterd
PKGFILES_CSWpuppetmaster3 += $(mandir)/man8/puppetmasterd.8
PKGFILES_CSWpuppetmaster3 += $(libdir)/.*/puppet/application/puppetmasterd.rb
PKGFILES_CSWpuppetmaster3 += $(sysconfdir)/puppet/auth.conf

ARCHALL = 1

sysconfdir     = /etc$(prefix)
localstatedir  = /var$(prefix)
rubysitelibdir = $(shell ruby -rrbconfig -e "puts Config::CONFIG['sitelibdir']")

CONFIGURE_SCRIPTS =
BUILD_SCRIPTS     =
TEST_SCRIPTS      =
INSTALL_SCRIPTS   = puppet

CHECKPKG_OVERRIDES_CSWpuppetmaster3  = surplus-dependency|CSWruby18
CHECKPKG_OVERRIDES_CSWpuppet3        = surplus-dependency|CSWfacter
CHECKPKG_OVERRIDES_CSWpuppet3	    += surplus-dependency|CSWrubyaugeas
CHECKPKG_OVERRIDES_CSWpuppet3       += missing-dependency|CSWpython
# Puppet has hardcoded paths to look at for many OSes, many of which involve
# /usr/share and /usr/local.
CHECKPKG_OVERRIDES_CSWpuppet3 	    += file-with-bad-content
# These files are quite deliberate - without them users will not get CSW
# behaviour. The README explains
CHECKPKG_OVERRIDES_CSWpuppet3 	    += bad-location-of-file|file=/etc/puppet
CHECKPKG_OVERRIDES_CSWpuppet3 	    += bad-location-of-file|file=/etc/puppet/README.CSW
CHECKPKG_OVERRIDES_CSWpuppet3 	    += bad-location-of-file|file=/etc/puppet/puppet.conf.example-CSW
CHECKPKG_OVERRIDES_CSWpuppet3 		+= bad-location-of-file|file=/var/lib
CHECKPKG_OVERRIDES_CSWpuppet3 		+= bad-location-of-file|file=/var/lib/puppet
# yes, yes, we know it conflicts with puppet{,.asmter} - that's the point of
# INCOMPATIBLE_PKGS
CHECKPKG_OVERRIDES_CSWpuppet3 		+= file-collision
CHECKPKG_OVERRIDES_CSWpuppetmaster3	+= file-collision


include gar/category.mk

install-puppet:
	ginstall -m 755 -d $(DESTDIR)
	ginstall -m 755 -d $(DESTDIR)/etc/puppet
	ginstall -m 755 -d $(DESTDIR)/var/lib/puppet
	ginstall -m 644 $(FILEDIR)/README.CSW $(DESTDIR)/etc/puppet/README.CSW
	ginstall -m 644 $(FILEDIR)/puppet.conf.example-CSW $(DESTDIR)/etc/puppet/puppet.conf.example-CSW
	ginstall -m 755 -d $(DESTDIR)$(sysconfdir)/puppet
	ginstall -m 755 -d $(DESTDIR)$(localstatedir)/puppet/run
	ginstall -m 755 -d $(DESTDIR)$(sysconfdir)/init.d
	ginstall -m 755 $(FILEDIR)/cswpuppetd $(DESTDIR)$(sysconfdir)/init.d
	ginstall -m 755 $(FILEDIR)/cswpuppetmasterd $(DESTDIR)$(sysconfdir)/init.d
	ginstall -m 755 $(FILEDIR)/cswpuppetmasterd $(DESTDIR)/etc$(prefix)/init.d
	cd $(WORKSRC) && $(INSTALL_ENV) ruby install.rb \
		--configdir=$(sysconfdir)/puppet \
		--bindir=$(bindir) \
		--sbindir=$(sbindir) \
		--full
	cd $(DESTDIR)$(mandir)/man8 && gunzip *
	mv $(DESTDIR)$(sysconfdir)/puppet/auth.conf $(DESTDIR)$(sysconfdir)/puppet/auth.conf.example
	ginstall -m 644 $(FILEDIR)/puppet.conf.example-CSW $(DESTDIR)$(sysconfdir)/puppet/puppet.conf.example
	ginstall -d -m 755 $(DESTDIR)$(sysconfdir)/pkg/puppet
	ginstall -m 644 $(FILEDIR)/cswusergroup \
		$(DESTDIR)$(sysconfdir)/pkg/puppet/cswusergroup
	mkdir -p $(DESTDIR)$(localstatedir)/lib
	gunzip $(DESTDIR)$(mandir)/man5/puppet.conf.5.gz
	@$(MAKECOOKIE)
