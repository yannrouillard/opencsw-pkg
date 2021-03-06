NAME = hypermail
VERSION = 2.2.0
GARTYPE = v1

DESCRIPTION = mail archive tool
define BLURB
  Hypermail is a program that takes a file of mail messages in UNIX mailbox
  format and generates a set of cross-referenced HTML documents. Each file
  that is created represents a separate message in the mail archive and
  contains links to other articles, so that the entire archive can be browsed
  in a number of ways by following links. Archives generated by Hypermail can
  be incrementally updated, and Hypermail is set by default to only update
  archives when changes are detected.
endef

MASTER_SITES = $(SF_MIRROR)/$(NAME)/
DISTFILES    = $(NAME)-$(VERSION).tar.gz
DISTFILES   += $(call admfiles,CSWhypermail,depend prototype)

# We define upstream file regex so we can be notifed of new upstream software release
UPSTREAM_MASTER_SITES = $(SF_PROJECT_SHOWFILE)=18117
UPSTREAM_USE_SF = 1
UFILES_REGEX = (\d+(?:\.\d+)*)

# configure cancels out env LDFLAGS by default
PATCHFILES += ldflag.diff
# force Makefiles to honor DESTDIR
PATCHFILES += install.diff

CONFIGURE_ARGS  = $(DIRPATHS)
CONFIGURE_ARGS += --with-gdbm=$(prefix)
CONFIGURE_ARGS += --with-cgidir=$(docdir)/$(NAME)/cgi-bin
CONFIGURE_ARGS += --with-htmldir=$(docdir)/$(NAME)
CONFIGURE_ARGS += --enable-libfnv

# GNU make doesn't like the project makefiles
BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

# No test target
TEST_SCRIPTS =

include gar/category.mk

LD_OPTIONS += -z muldefs
export LD_OPTIONS

build-custom:
	@( cd $(WORKSRC) ; $(BUILD_ENV) /usr/ccs/bin/make $(BUILD_ARGS) )

install-custom:
	@( cd $(WORKSRC) ; $(BUILD_ENV) /usr/ccs/bin/make $(INSTALL_ARGS) install )

