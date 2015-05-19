################################################################################
#
# crontab-cgi
#
################################################################################

CRONTAB_CGI_VERSION = c35044b
CRONTAB_CGI_SITE_METHOD = git
CRONTAB_CGI_SITE = gitolite@merlin.swind.sk:embedded-tools.git
CRONTAB_CGI_LICENSE = BSD-3c
CRONTAB_CGI_SUBDIR = crontab-cgi

define CRONTAB_CGI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(CRONTAB_CGI_SUBDIR)/crontab-cgi.sh $(TARGET_DIR)/usr/libexec/cgi-bin/crontab
endef

$(eval $(generic-package))

