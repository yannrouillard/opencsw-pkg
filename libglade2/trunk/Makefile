NAME = libglade
VERSION = 2.6.4
GARTYPE = v2
RELVER = $(shell echo $(VERSION) |gsed 's/\(^[0-9].*\.[0-9].*\)\.[0-9]*/\1/')

DESCRIPTION = library to load Glade XML user interface files at runtime
define BLURB
Libglade is a library that performs a similar job to the C source output routines in the GLADE user interface builder. Whereas GLADE's output routines create C source code that must be compiled, libglade builds the interface from an XML file (GLADE's save format) at runtime. This can allow modifying the user interface without recompiling.
endef

MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(RELVER)/
DISTFILES  = $(NAME)-$(VERSION).tar.bz2

PACKAGES = CSWlibglade2
CATALOGNAME = libglade2
SPKG_DESC = $(DESCRIPTION)
SPKG_SOURCEURL = http://www.gnome.org/

RUNTIME_DEP_PKGS  = CSWfconfig CSWftype2 CSWggettextrt CSWglib2
RUNTIME_DEP_PKGS += CSWgtk2 CSWlibatk CSWlibcairo CSWlibxml2 CSWpango

# We define upstream file regex so we can be notifed of 
# new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.bz2

EXTRA_INC = $(prefix)/X11/include
EXTRA_LIB = $(prefix)/X11/lib
EXTRA_PKG_CONFIG_DIRS = $(prefix)/X11/lib

SUNX11SUB_sparcv9 = sparcv9/
SUNX11SUB_amd64 = amd64/
EXTRA_LDFLAGS = -lm /usr/openwin/lib/$(SUNX11SUB_$(ISA))libXext.so

BUILD64_LIBS_ONLY = 1
CONFIGURE_ARGS  = $(DIRPATHS)

include gar/category.mk
