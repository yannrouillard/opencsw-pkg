NAME = easytag
VERSION = 2.1.7
GARTYPE = v2

DESCRIPTION = Tag editor for MP3, Ogg Vorbis files and more
define BLURB
  EasyTAG is a utility for viewing and editing tags for MP3, MP2, MP4/AAC, FLAC,
  Ogg Vorbis, MusePack, Monkey's Audio and WavPack files. Its simple and nice GTK+
  interface makes tagging easier under GNU/Linux or Windows.
endef

MASTER_SITES = $(SF_MIRRORS)
DISTFILES += $(NAME)-$(VERSION).tar.bz2

BUILD_DEP_PKGS += CSWlibogg-dev
BUILD_DEP_PKGS += CSWlibvorbis-dev
BUILD_DEP_PKGS += CSWlibflac-dev
BUILD_DEP_PKGS += CSWlibspeex-dev
BUILD_DEP_PKGS += CSWlibwavpack-dev

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

# Needed for gethostbyname
EXTRA_LINKER_FLAGS = -lnsl

EXTRA_CONFIGURE_EXPORTS += LIBS
CONFIGURE_ENV_LIBS = -lCrun

include gar/category.mk
