NAME = perl
VERSION = 5.16.2
VERSION_MAJOR = $(shell echo $(VERSION) | cut -f1-2 -d.)
#CATEGORIES = lang
GARTYPE = bts

DESCRIPTION = A high-level, general-purpose programming language
define BLURB
  Perl is a high-level, general-purpose programming language that makes easy
  things easy and hard things possible. It is optimized for scanning arbitrary
  text files and system administration. It has built-in extended regular
  expression matching and replacement, a dataflow mechanism to improve security
  with setuid scripts and is extendable via modules that can interface to C
  libraries.
endef

#MASTER_SITES   = http://www.cpan.org/src/
#SPKG_SOURCEURL = http://cpan.metacpan.org/authors/id/R/RJ/RJBS/perl-5.16.2.tar.bz2
MASTER_SITES = manual://
VENDOR_URL = http://www.perl.org
#DISTFILES  = $(NAME)-$(VERSION).tar.gz
# The source has been patched to fix a failing patch (Solaris only). The patch was discussed with upstream (p5p) and committed to BLEAD. The patch is in the files directory.
DISTFILES  = $(NAME)-$(VERSION)-patched.tar.gz

PACKAGING_PLATFORMS += solaris10-i386 solaris10-sparc
#BUILD64_ONLY 		  = 1
PACKAGES                 += NIMOSSperl
PKG_DESC_NIMOSSperl         = $(DESCRIPTION)
RUNTIME_DEP_PKGS_NIMOSSperl += NIMOSSlibssp0
RUNTIME_DEP_PKGS_NIMOSSperl += NIMOSSlibgcc-s1
#RUNTIME_DEP_PKGS_NIMOSSperl  = NIMOSSbdb48 NIMOSSlibgdbm4
INCOMPATIBLE_PKGS_NIMOSSperl = NIMOSSperlmods NIMOSSpmdigest NIMOSSpmi18nlangtags

PACKAGES                   += NIMOSSperldoc
SPKG_DESC_NIMOSSperldoc        = Perl documentation
SPKG_DESC_NIMOSSperl       	= Core Perl distribution
RUNTIME_DEP_PKGS_NIMOSSperldoc = NIMOSSperl
ARCHALL_NIMOSSperldoc          = 1

LICENSE = Copying

CHECKPKG_OVERRIDES_NIMOSSperl    += file-with-bad-content
CHECKPKG_OVERRIDES_NIMOSSperldoc += file-with-bad-content
#CHECKPKG_OVERRIDES_NIMOSSperldoc += surplus-dependency|NIMOSSperl
OBSOLETED_BY_NIMOSSperl += NIMOSSpm-module-build 
OBSOLETED_BY_NIMOSSperl += NIMOSSpm-json-pp 
OBSOLETED_BY_NIMOSSperldoc += NIMOSSpm-cpan-meta
OBSOLETED_BY_NIMOSSperldoc += NIMOSSpm-parse-cpan-meta
OBSOLETED_BY_NIMOSSperldoc += NIMOSSpm-cpan-meta-yaml
OBSOLETED_BY_NIMOSSperldoc += NIMOSSpm-module-metadata
CATALOGNAME_NIMOSSpm-cpan-meta-requirements = pm_cpan_meta_reqs_stub
OBSOLETED_BY_NIMOSSperldoc += NIMOSSpm-cpan-meta-requirements
OBSOLETED_BY_NIMOSSperldoc += NIMOSSpm-perl-ostype
CHECKPKG_OVERRIDES_NIMOSSperldoc += surplus-dependency|NIMOSSperl



# Core module updates
# Not used at the moment, leave one as example
#MASTER_SITES  += $(CPAN_FIRST_MIRROR)/S/SM/SMUELLER/
#CORE_UPDATES  += PathTools-3.30
#CORE_OBSOLETE += Cwd.pm File/Spec* auto/Cwd
#DISTFILES += $(foreach N,$(CORE_UPDATES),$(N).tar.gz)

# GCC build (Sunstudio is problematic) # claudio
GARCOMPILER = GCC4
MAKE_OPT_unstable10s = -j 24
MAKE_OPT_unstable10x = -j 4
MAKE_OPT = $(MAKE_OPT_$(shell hostname))
BUILD64 = 1
ISAEXEC = 1

# a .git directory will cause failing upstream author tests (the source will be considered blead)
NOGITPATCH = 1

# Custom configure
CONFIGURE_SCRIPTS = perl

# Disabled, this is the first 5.16 release
# If I read the doc correctly, the arguments should be directories and not releases. I the the debian build does not have this option set.
# Compatable with all prior patch revs
# INC_COMPAT = 5.8.0 5.8.2 5.8.4 5.8.6 5.8.7 5.8.8 5.10.0 5.10.1 5.12.0 5.12.1 5.12.2 5.12.3 5.12.4 5.14.0 5.14.1 5.14.2

# We added some libs and options through CONFIGURE_ARGS values. The libs were picked up thorugh the hints mechanism. The db-4.8 must be investigated (needed/wished?)
# Force use of db-4.8
# TBD: Reinsert libperl.so, see below.
#PERL_LIBS-32 += -lsocket -lnsl -lgdbm -ldb-4.8 -ldl -lm -lpthread -lc
#PERL_LIBS-32 += -lsocket -lnsl -ldl -lm -lpthread -lc -lpthread -lgdbm -ldb-4.8 -lcrypt
#PERL_LIBS-64 += -lsocket -lnsl -ldl -lm -lpthread -lc -lpthread -lgdbm -lcrypt
#PERL_LIBS = $(PERL_LIBS-$(MEMORYMODEL)) 
#PERL_LIBS = -lsocket -lgdbm -ldl -lm -lpthread -lc -lcrypt

# Configuration flags
# Commented options were not needed, or broke the build. Alternatives were supplied.
CONFIGURE_ARGS += -Darchlib=$(libdir)/perl/$(VERSION_MAJOR)
CONFIGURE_ARGS += -Dcc=$(CC)
#CONFIGURE_ARGS += -Dccflags="$(CFLAGS)"
#CONFIGURE_ARGS += -Dccversion="$(CC_VERSION)"
CONFIGURE_ARGS += -Dcf_email=$(SPKG_EMAIL)
#CONFIGURE_ARGS += -Dinc_version_list="$(INC_COMPAT)"
#CONFIGURE_ARGS += -Dld=$(CC)
#CONFIGURE_ARGS += -Dldflags="$(LDFLAGS)"
# Workaround below. Do not version libperl.so here otherwise the other 5.10
# lib will be picked up by mgar
#CONFIGURE_ARGS += -Dlibperl=libperl.so.$(VERSION)
#CONFIGURE_ARGS += -Dlocincpth=$(includedir)
#CONFIGURE_ARGS += -Dloclibpth=$(libdir)
CONFIGURE_ARGS += -Dman1dir=$(mandir)/man1
CONFIGURE_ARGS += -Dman1ext=1
CONFIGURE_ARGS += -Dman3dir=$(mandir)/man3
CONFIGURE_ARGS += -Dman3ext=3perl
#CONFIGURE_ARGS += -Doptimize="$(OPTFLAGS)"
CONFIGURE_ARGS += -Dperladmin="root@localhost"
CONFIGURE_ARGS += -Dprefix=$(prefix)
CONFIGURE_ARGS += -Dbin=$(bindir)
CONFIGURE_ARGS += -Dscriptdir=$(bindir)
# NIMOSS provided modules should install in the privlib directory (/opt/csw/share/perl/5.14)
CONFIGURE_ARGS += -Dprivlib=$(datadir)/perl/$(VERSION_MAJOR)
CONFIGURE_ARGS += -Dsitearch=/opt/csw/nimoss/local/lib/perl/$(VERSION_MAJOR)
CONFIGURE_ARGS += -Dsitelib=/opt/csw/nimoss/local/share/perl/$(VERSION)
CONFIGURE_ARGS += -Dsiteman1dir=/opt/csw/nimoss/local/share/man/man1
CONFIGURE_ARGS += -Dsiteman3dir==/opt/csw/nimoss/local/share/man/man3
CONFIGURE_ARGS += -Dsiteprefix=/opt/csw/nimoss/local
CONFIGURE_ARGS += -Duseshrplib
CONFIGURE_ARGS += -Dusesitecustomize
CONFIGURE_ARGS += -Dusethreads
CONFIGURE_ARGS += -Dusedtrace
#CONFIGURE_ARGS += -Dinc_version_list=none
#CONFIGURE_ARGS += $(CONFIGURE_ARGS-$(GAROSREL))
CONFIGURE_ARGS += -Duselargefiles 
CONFIGURE_ARGS += -Dvendorarch=$(libdir)/perl5
CONFIGURE_ARGS += -Dvendorlib=$(datadir)/perl5
CONFIGURE_ARGS += -Dvendorprefix=$(prefix)
#CONFIGURE_ARGS += -Dlibs="$(PERL_LIBS)"
CONFIGURE_ARGS += -Dlibsdirs=" $(abspath /usr/lib/$(MEMORYMODEL)) $(libdir)"
#CONFIGURE_ARGS += -Dlibsdirs=/usr/lib/64
CONFIGURE_ARGS += -Dsed=/opt/csw/bin/gsed
CONFIGURE_ARGS-64 += -Duse64bitint
CONFIGURE_ARGS-64 += -Duse64bitall
CONFIGURE_ARGS += $(CONFIGURE_ARGS-$(MEMORYMODEL)) 
CONFIGURE_ARGS += -Dlddlflags=-shared
CONFIGURE_ARGS += -Dcccdlflags=-fPIC

#EXTRA_LIB += $(prefix)/bdb48/lib
#EXTRA_INC += $(prefix)/bdb48/include
EXTRA_INC += /usr/include
#LD_LIBRARY_PATH for testing
#LD_LIBRARY_PATH += $(prefix)/bdb48/lib/$(MEMORYMODEL)

# Somehow the CPPFLAGS do not make it into the compile environment.
# Add them explicitly here, otherwise specifically the bdb48/include will
# not make it resulting in db.h not to be found and DB_File.pm not to be built
# as reported here:
#   https://www.opencsw.org/mantis/view.php?id=4544
#EXTRA_CFLAGS = $(CPPFLAGS)
# Adding -lperl requires that libperl.so is available during compilation, which is not 
# the case on bootstrapping. However, we require explicit libperl linkage or programs 
# embedding perl will have problems with duplicated static variables. 
# XXX Investigate further after 64 bit has built 
#EXTRA_LDFLAGS-32 = -L$(libdir) -lperl 
#EXTRA_LDFLAGS-32 = -L$(libdir) -L/usr/lib
#EXTRA_LDFLAGS += $(EXTRA_LDFLAGS-$(MEMORYMODEL)) -R /usr/lib -R/opt/csw/bdb48/lib -R/opt/csw/lib
#EXTRA_LDFLAGS += $(EXTRA_LDFLAGS-$(MEMORYMODEL)) -R /usr/lib/64 -R/opt/csw/bdb48/lib/64 -R/opt/csw/lib/64
#EXTRA_LDFLAGS += $(EXTRA_LDFLAGS-$(MEMORYMODEL))
EXTRA_LDFLAGS = -lperl

# We want 64 bit binaries
#MERGE_DIRS_isa-extra = $(bindir) $(sbindir) $(libdir) $(libexecdir)

EXTRA_MERGE_EXCLUDE_FILES = .*\/perllocal.pod
PKGFILES_NIMOSSperldoc = .*\/pod\/.*\.pod .*\/man\/man.\/.*

# The diagnostics.pm module needs the podfile to output its messages.
# That means it must be included in the main package, not the docs.
EXTRA_PKGFILES_EXCLUDED_NIMOSSperldoc = .*\/perldiag.pod
EXTRA_PKGFILES_INCLUDED_NIMOSSperl = .*\/perldiag.pod

# Tests take a long time, run once for every release
BUILD_SCRIPTS = perl

TEST_SCRIPTS = perl

# Make sure we don't include the path to the newly built perl as the
# library is not in place yet.
#IGNORE_DESTDIR = 1

# Do not exclude static libs as at least DynaLoader.a is needed for XS compilation
#MERGE_EXCLUDE_STATICLIBS =

# This is for the communication with checkpkg. These pathes are searched for modules
# when resolving dependencies.
#PROTOTYPE_FILTER_NIMOSSperl = ( cat; echo "i cswperlincpath=NIMOSSperl.cswperlincpath")

# Splitting of a separate libperl.so requires more work and careful planning.
# Override for now.
#CHECKPKG_OVERRIDES_NIMOSSperl += shared-lib-package-contains-so-symlink|file=/opt/csw/lib/libperl.so
#CHECKPKG_OVERRIDES_NIMOSSperl += shared-lib-pkgname-mismatch|file=opt/csw/lib/libperl.so.5.16.1|soname=libperl.so.5.16.1|pkgname=NIMOSSperl|expected=NIMOSSlibperl5-16-1

include gar/category.mk

# This is probably due to -lperl, but during Configure the one in /opt/csw/lib is picked up and 
# the one in $WORKSRC has not been built yet 
# TBD: Investigate
#post-extract-modulated:
#	mkdir -p $(WORKSRC)
#	#gln -s libperl.so.$(VERSION) $(WORKSRC)/libperl.so
#	@$(MAKECOOKIE)

#ifneq ($(CORE_UPDATES),)
#POST_TARGETS = install-core-updates
#include files/updatecore.mk
#endif

# How to configure Perl
#configure-perl: CONFIGURE_EXPORTS = PATH LD_OPTIONS
configure-perl:
	(cd $(WORKSRC) ; $(CONFIGURE_ENV) ./Configure $(CONFIGURE_ARGS) -ders)
	@$(MAKECOOKIE)

build-perl: BUILD_EXPORTS = LD_OPTIONS
build-perl:
	@echo " ==> Running make in $*"
	cd $(WORKSRC) && $(BUILD_ENV) gmake $(MAKE_OPT)
	@$(MAKECOOKIE)

test-perl:
	@echo " ==> Running make $(TEST_TARGET) in $*"
	cd $(WORKSRC) && gmake test
	@$(MAKECOOKIE)

# Make links to libperl and minor-major lib dirs
POST_TARGETS += syslinks
syslinks:
	@echo "Creating links to libperl and minor-major lib dirs"
	cd $(DESTDIR)$(libdir)/perl && ln -s $(VERSION_MAJOR) $(VERSION) &&\
	cd $(VERSION_MAJOR) && ln -s libperl.so libperl.so.$(VERSION) && ln -s libperl.so libperl.so.$(VERSION_MAJOR) &&\
	cd $(DESTDIR)$(datadir)/perl && ln -s $(VERSION_MAJOR) $(VERSION) 
	@$(MAKECOOKIE)

# Remove build paths from Config
#POST_TARGETS += perlconf
#perlconf:
#	@( cd $(DESTDIR)$(libdir)/perl/$(VERSION) ; \
#        /bin/perl -i -lne "\
#            next if /config_arg[1-9]/; \
#            s/^config_args=.+$$/config_args=''/; \
#            s/^config_argc=.+$$/config_argc='0'/; \
#            s,-I$(DESTDIR)$(includedir),,g; \
#            s,-[LR]$(DESTDIR)$(libdir),,g; \
#            s,( -I$(includedir))+,\$$1,g; \
#            s,( -[LR]$(libdir))+,\$$1,g; \
#            s,-R $(libdir)/perl/$(VERSION)/CORE,-R $(libdir),; \
#            s, (-L)?$(CC_HOME)\S+,,g; \
#            if (/^\w+=/) { \
#                s/\s{2,}(\-)/ \-/g; \
#                s/(^\w+=.) /\$$1/; \
#                s/ (.)$$/\$$1/g; \
#            } \
#            print \
#        " Config.pm Config_heavy.pl )
#	@$(MAKECOOKIE)

#POST_TARGETS += NIMOSSperl.cswperlincpath
#NIMOSSperl.cswperlincpath:
#	LD_LIBRARY_PATH=$(WORKSRC) $(WORKSRC)/perl -I./lib -e 'print "$$_\n" foreach(@INC)' >$(WORKDIR_GLOBAL)/NIMOSSperl.cswperlincpath

# Invoke post-install targets
post-install-modulated: $(POST_TARGETS)
	@$(MAKECOOKIE)
