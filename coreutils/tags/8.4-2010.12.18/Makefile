NAME = coreutils
VERSION = 8.7
CATEGORIES = utils

# seq has issues related to the handling of long double's with -O2.
# this issue manifested on sol8 and sol9 x86 only.  sparc was unaffected
# and sol10 x86 was fine too.
# OPT_FLAGS_GCC = -O1 -pipe

# building with gcc gets us extra tools (eg: stdbuf)
GARCOMPILER = GCC4

SHELL = /opt/csw/bin/bash

BUILD_DEP_PKGS =  CSWautomake CSWautoconf CSWbison CSWggettext CSWgit
BUILD_DEP_PKGS += CSWgperf CSWgzip CSWperl CSWrsync CSWgtar CSWbash

RUNTIME_DEP_PKGS = CSWiconv CSWggettextrt CSWlibgmp

INCOMPATIBLE_PKGS = CSWshutils CSWtextutils

DESCRIPTION = GNU core utilities
define BLURB
The GNU Core Utilities are the basic file, shell and text manipulation utilities of the GNU operating system. These are the core utilities which are expected to exist on every operating system.

Previously these utilities were offered as three individual sets of GNU utilities, Fileutils, Shellutils, and Textutils. Those three have been combined into a single set of utilities called Coreutils.
endef

MASTER_SITES = $(GNU_MIRROR)
DISTFILES = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream
# software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

sysconfdir = /etc/opt/csw
localstatedir = /var/opt/csw
CONFIGURE_ARGS = $(DIRPATHS)
CONFIGURE_ARGS += --program-prefix=g
CONFIGURE_ARGS += --with-libintl-prefix=/opt/csw
CONFIGURE_ARGS += --with-libiconv-prefix=/opt/csw
# handle su manually to avoid needing fakeroot or some such.  this is now
# explicitly required as we modify both --enable-*install-program  lists
CONFIGURE_ARGS += --enable-no-install-program=chcon,su
CONFIGURE_ARGS += --enable-install-program=hostname,arch

# required for eaccess and not picked up automatically.
EXTRA_LDFLAGS = -lgen

PROTOTYPE_FILTER  = awk '$$$$3 == "/opt/csw/bin/gsu" { $$$$4 = "4555" }; { print }'

ifneq ($(VERSION), 8.6)
TEST_TARGET = check
else
TEST_SCRIPTS =
endif

include gar/category.mk

PATH := /opt/csw/gnu:/opt/csw/bin:$(PATH)

post-install-modulated:
	@echo Cleaning up install directory...
	rm -rf $(DESTDIR)/$(libdir)
	@echo Manually install gsu \(so no root rights required\)
	cp $(WORKSRC)/src/su $(DESTDIR)$(bindir)/gsu

post-merge:
	@(cd $(PKGROOT)$(prefix); \
		mkdir gnu; cd gnu; \
		for f in ../bin/g*; do \
			echo Linking $$f; \
			base=$$(basename $$f); \
			gln -s $$f ./$${base/g/}; \
		done )
	@$(MAKECOOKIE)
