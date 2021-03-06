NAME = firefox-l10n
VERSION = 3.0.14
GARTYPE = v2

DESCRIPTION = Firefox language pack :
define BLURB
  Firefox Community Edition web browser localization file.   
endef

# Definition of the list of locale to process
LANG = af ar be bg bn-IN ca cs cy da de el en-GB eo es-AR es-ES et eu fi fr fy-NL ga-IE gl gu-IN he hi-IN hu id is it ja ka kn ko ku lt lv mk mn mr nb-NO nl nn-NO oc pa-IN pl pt-BR pt-PT ro ru si sk sl sq sr sv-SE te th tr uk zh-CN zh-TW

# Short list of locales, used only for testing during build description modification
# LANG = de fr pt-PT

# Set arch to all
ARCHALL = 1

# Defines the list of packages
PACKAGES = $(foreach PKG, $(LANG), CSWffox-l10n-$(PKG) )
LICENSE  = License

# There was previously a french localization package. It is renamed, thus declared as incompatible
INCOMPATIBLE_PKGS_CSWffox-l10n-fr = CSWfirefox-fr

# Add firefox as a depend
RUNTIME_DEP_PKGS = CSWfirefox

# Defines the package description
$(foreach LOCALE_NAME, $(LANG), $(eval SPKG_DESC_CSWffox-l10n-$(LOCALE_NAME) = $(DESCRIPTION) $(LOCALE_NAME)))

# Defines the catalog names
$(foreach LOCALE_NAME, $(LANG), $(eval CATALOGNAME_CSWffox-l10n-$(LOCALE_NAME) = firefox_l10n_$(shell echo $(LOCALE_NAME) | tr \- _ | tr [A-Z] [a-z] )))

# Defines the files filters
$(foreach LOCALE_NAME, $(LANG), $(eval PKGFILES_CSWffox-l10n-$(LOCALE_NAME) = .*langpack-$(LOCALE_NAME).*))

# Defines the content to be downloaded
MASTER_SITES = ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$(VERSION)/linux-i686/xpi/
DISTFILES = License
$(foreach LOCALE_NAME, $(LANG), $(eval DISTFILES += $(LOCALE_NAME).xpi))

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

# If the url used to check for software update is different of MASTER_SITES, then 
# uncomment the next line. Otherwise it is set by default to the value of MASTER_SITES
# UPSTREAM_MASTER_SITES = 

# Defines the custom steps
CONFIGURE_SCRIPTS =
BUILD_SCRIPTS     =
TEST_SCRIPTS      =
INSTALL_SCRIPTS   = custom

include gar/category.mk

post-extract-modulated:
	for LOCALE_NAME in $(foreach L,$(LANG),$(L)); do \
		mkdir -p "$(WORKROOTDIR)/build-$(MODULATIONS)/$$LOCALE_NAME" ; \
		CUR_DIR=`pwd` ; \
		cd "$(WORKROOTDIR)/build-$(MODULATIONS)/$$LOCALE_NAME" ; \
		unzip -u ../$$LOCALE_NAME.xpi ; \
		cd $$CUR_DIR ; \
	done
	$(MAKECOOKIE)

install-custom:
	@echo " ==> Installing $(NAME)"

	for LOCALE_NAME in $(foreach L, $(LANG), $(L)); do \
		PKG_EXTENSION=`grep "em:id=" "$(WORKROOTDIR)/build-$(MODULATIONS)/$$LOCALE_NAME/install.rdf" | cut -d\" -f 2` ; \
		ginstall -d "$(PKGROOT)$(prefix)/mozilla/firefox/lib/extensions" ; \
		cp -fr "$(WORKROOTDIR)/build-$(MODULATIONS)/$$LOCALE_NAME" "$(PKGROOT)$(prefix)/mozilla/firefox/lib/extensions/$$PKG_EXTENSION" ; \
	done
	@$(MAKECOOKIE)
