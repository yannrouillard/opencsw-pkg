NAME = Net-SMTP-SSL
VERSION = 1.01
CATEGORIES = cpan
GARTYPE = v2
AUTHOR = CWEST

DESCRIPTION = SSL support for Net::SMTP
define BLURB

Implements the same API as Net::SMTP, but uses IO::Socket::SSL for its
network operations. Due to the nature of "Net::SMTP"'s "new" method, it
is not overridden to make use of a default port for the SMTPS service.
Perhaps future versions will be smart like that. Port 465 is usually
what you want, and it's not a pain to specify that. 
For interface documentation, please see Net::SMTP.
endef

ARCHALL = 1

PACKAGES = CSWpmnetsmtpssl
CATALOGNAME_CSWpmnetsmtpssl = pm_netsmtpssl

BUILD_DEP_PKGS = CSWperl
RUNTIME_DEP_PKGS = CSWpmiosocketssl

include gar/category.mk


post-extract-modulated:
	@echo "Adding 'license' file..."
	@cp $(FILEDIR)/COPYING $(WORKSRC)/
	@$(MAKECOOKIE)
