NAME = gperf
VERSION = 3.0.4
GARTYPE = v2

DESCRIPTION = A perfect hash function generator
define BLURB
  GNU gperf is a perfect hash function generator. For a given list of strings,
  it produces a hash function and hash table, in form of C or C++ code, for
  looking up a value depending on the input string. The hash function is perfect,
  which means that the hash table has no collisions, and the hash table lookup
  needs a single string comparison only.
endef

MASTER_SITES = $(GNU_MIRROR)
DISTFILES    = $(NAME)-$(VERSION).tar.gz

# We define upstream file regex so we can be notifed of new upstream software release
UFILES_REGEX = $(NAME)-(\d+(?:\.\d+)*).tar.gz

CONFIGURE_ARGS = $(DIRPATHS)

EXTRA_LINKER_FLAGS += -norunpath

include gar/category.mk

