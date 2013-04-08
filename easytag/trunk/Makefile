NAME = easytag
VERSION = 2.1.8
GARTYPE = v2

DESCRIPTION = Tag editor for MP3, Ogg Vorbis files and more
define BLURB
  EasyTAG is a utility for viewing and editing tags for MP3, MP2, MP4/AAC, FLAC,
  Ogg Vorbis, MusePack, Monkey's Audio and WavPack files. Its simple and nice GTK+
  interface makes tagging easier under GNU/Linux or Windows.
endef

MASTER_SITES = $(GNOME_MIRRORS)
DISTFILES += $(NAME)-$(VERSION).tar.xz

VENDOR_URL = http://projects.gnome.org/easytag/

BUILD_DEP_PKGS += CSWlibogg-dev
BUILD_DEP_PKGS += CSWlibvorbis-dev
BUILD_DEP_PKGS += CSWlibflac-dev
BUILD_DEP_PKGS += CSWlibspeex-dev
BUILD_DEP_PKGS += CSWlibwavpack-dev

# Add more dependencies as suggested by Laurent Blume in
#   http://lists.opencsw.org/pipermail/users/2013-April/009549.html
BUILD_DEP_PKGS += CSWintltool
BUILD_DEP_PKGS += CSWpkgconfig
BUILD_DEP_PKGS += CSWlibgtk2-dev
BUILD_DEP_PKGS += CSWlibpcre-dev
BUILD_DEP_PKGS += CSWfconfig-dev
BUILD_DEP_PKGS += CSWlibfreetype-dev
BUILD_DEP_PKGS += CSWlibpng-dev
BUILD_DEP_PKGS += CSWx11xproto
BUILD_DEP_PKGS += CSWx11renderproto
BUILD_DEP_PKGS += CSWlibx11devel
BUILD_DEP_PKGS += CSWlibxcbdevel
BUILD_DEP_PKGS += CSWlibxaudevel
BUILD_DEP_PKGS += CSWlibxdmcpdevel
BUILD_DEP_PKGS += CSWlibid3-dev
BUILD_DEP_PKGS += CSWlibiconv-dev
BUILD_DEP_PKGS += CSWggettext-dev

RUNTIME_DEP_PKGS_CSWeasytag += CSWlibgdk-x11-2-0-0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibgdk-pixbuf2-0-0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibid3-3-8-3
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibgobject2-0-0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibglib2-0-0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibgtk-x11-2-0-0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibintl8
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibogg0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibid3tag
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibvorbis0
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibwavpack1
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibflac8
RUNTIME_DEP_PKGS_CSWeasytag += CSWpango
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibspeex1
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibvorbisfile3
RUNTIME_DEP_PKGS_CSWeasytag += CSWlibgio2-0-0

# This macro is being phased out of Pango, so this seems like an acceptable fix for now:
#   https://bugzilla.gnome.org/show_bug.cgi?id=652202
EXTRA_CFLAGS += -DG_CONST_RETURN=const

EXTRA_LINKER_FLAGS = -norunpath

# For msgfmt, msgmerge, xgettext and gettext to be used from GNU
CONFIGURE_ENV_PATH = $(prefix)/gnu:$(PATH)

include gar/category.mk
