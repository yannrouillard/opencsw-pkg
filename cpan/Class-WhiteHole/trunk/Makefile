NAME = Class-WhiteHole
VERSION = 0.04
CATEGORIES = cpan
GARTYPE = v2
AUTHOR = MSCHWERN

DESCRIPTION = base class to treat unhandled method calls as errors
define BLURB
  Its possible to accidentally inherit an AUTOLOAD method. Often this will
  happen if a class somewhere in the chain uses AutoLoader or defines one of
  their own. This can lead to confusing error messages when method lookups
  fail.
endef

DISTFILES += CSWpmclasswhitehole.gspec

include gar/category.mk
