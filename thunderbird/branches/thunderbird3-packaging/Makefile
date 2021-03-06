NAME = thunderbird
VERSION = 3.0b3
CATEGORIES = apps
DISTNAME = $(NAME)

DESCRIPTION =  Mozilla Thunderbird Mail Client
define BLURB
 Thunderbird 2 is the next generation release of the award-winning Thunderbird email client from Mozilla.
endef

DISTFILES  = $(NAME)-$(VERSION)-source.tar.bz2

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = (\d+(?:\.\d+)*)
MASTER_SITES = http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/$(VERSION)/source/
UPSTREAM_MASTER_SITES = http://releases.mozilla.org/pub/mozilla.org/thunderbird/releases/

PACKAGES 					= CSWthunderbird
CATALOGNAME_CSWthunderbird 	= thunderbird
SPKG_DESC_CSWthunderbird 	= $(DESCRIPTION)

CONFIGURE_ARGS = --prefix=/opt/csw/mozilla/thunderbird

CFLAGS+= -DG_HAVE_ISO_VARARGS
CXXFLAGS+= -DG_HAVE_ISO_VARARGS
LDFLAGS+=-L/usr/lib/lwp -L/opt/csw/mozilla/thunderbird/lib -R/opt/csw/mozilla/thunderbird/lib -L/opt/csw/lib -R/opt/csw/lib

EXTRA_INC = $(prefix)/X11/include
EXTRA_LIB = $(prefix)/X11/lib
EXTRA_PKG_CONFIG_DIRS = $(prefix)/X11/lib

export PERL CFLAGS CXXFLAGS LDFLAGS

RUNTIME_DEP_PKGS_CSWthunderbird  = CSWbonobo2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWfconfig 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWftype2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWgconf2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWggettextrt 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWglib2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWgnomekeyring 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWgnomevfs2
RUNTIME_DEP_PKGS_CSWthunderbird += CSWgtk2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibx11
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibart 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibatk 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibbonoboui 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibcairo 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibgnome 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibgnomecanvas
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibgnomeui 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibidl 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibpopt 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibxft2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWlibxrender 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWorbit2 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWpango 
RUNTIME_DEP_PKGS_CSWthunderbird += CSWzlib

# PATCHFILES  = autoconf.mk.in.diff 
# PATCHFILES += lber-int.h.diff 
# PATCHFILES += ldappr-int.h.diff
# PATCHFILES += ldap-int.h.diff

TEST_SCRIPTS = 

LICENSE = LICENSE

# Variable for direct access to working dir
WORK_BUILD   = $(WORKROOTDIR)/build-$(firstword $(MODULATIONS))/$(NAME)
WORK_INSTALL = $(WORKROOTDIR)/install-$(firstword $(MODULATIONS))

post-extract:
	@mv $(WORKROOTDIR)/build-$(firstword $(MODULATIONS))/mozilla $(WORKROOTDIR)/build-$(firstword $(MODULATIONS))/$(NAME)
	@$(MAKECOOKIE)

pre-configure:
	@cp $(FILEDIR)/.mozconfig  $(WORKROOTDIR)/build-$(firstword $(MODULATIONS))/$(NAME)/.mozconfig

pre-install:
	( if [ ! -d $(WORK_INSTALL)/opt/csw/bin ] ; then mkdir -p $(WORK_INSTALL)/opt/csw/bin ; fi )
	( cd $(WORK_INSTALL)/opt/csw/bin ; rm $(NAME) ; ln -s ../mozilla/$(NAME)/bin/$(NAME) . )
	( mkdir -p $(WORK_INSTALL)/opt/csw/share/pixmaps )
	( cp $(WORK_BUILD)/other-licenses/branding/thunderbird/content/icon64.png $(WORK_INSTALL)/opt/csw/share/pixmaps/thunderbird.png )
	( mkdir -p $(WORK_INSTALL)/opt/csw/share/applications )
	( cp $(FILEDIR)/thunderbird.desktop $(WORK_INSTALL)/opt/csw/share/applications/thunderbird.desktop )
	( mkdir -p $(WORK_INSTALL)/opt/csw/share/gnome/mime-info )
	( cp $(FILEDIR)/thunderbird.keys $(WORK_INSTALL)/opt/csw/share/gnome/mime-info/thunderbird.keys )

post-install:
	( gfind $(WORK_INSTALL)/opt/csw -exec bash -c "file {} | ggrep ELF | ggrep -e 'executable' -e 'dynamic lib' | ggrep 'not stripped' && strip {}"  \; )
	( mv $(WORK_INSTALL)/opt/csw/mozilla/thunderbird/lib/pkgconfig/thunderbird-nspr.pc $(WORK_INSTALL)/opt/csw/mozilla/thunderbird/lib/pkgconfig/thunderbird-nspr.pc.temp && gsed -e s\_-L$(WORK_INSTALL)/opt/csw/lib\_\_g  $(WORK_INSTALL)/opt/csw/mozilla/thunderbird/lib/pkgconfig/thunderbird-nspr.pc.temp > $(WORK_INSTALL)/opt/csw/mozilla/thunderbird/lib/pkgconfig/thunderbird-nspr.pc && rm $(WORK_INSTALL)/opt/csw/mozilla/thunderbird/lib/pkgconfig/thunderbird-nspr.pc.temp )
	( gfind $(WORK_INSTALL)/opt/csw -name chromelist.txt -exec bash -c " mv {} {}.temp && gsed -e  s\_`pwd`/$(WORK_BUILD)/\_\_g {}.temp > {} && rm {}.temp"  \; )
	( gfind $(WORK_INSTALL)/opt/csw/mozilla/thunderbird -name "*.js" -exec bash -c " mv {} {}.temp && gsed -e  s\_`pwd`/$(WORK_BUILD)/\_\_g {}.temp > {} && rm {}.temp"  \; )
	( gfind $(WORK_INSTALL)/opt/csw/mozilla/thunderbird -name "*.jar" -exec bash -c "`pwd`/removeBuildPathFromJar.sh {} `pwd` $(WORKDIR) $(DISTNAME)" \; )

# include the rest of GAR
include gar/category.mk

