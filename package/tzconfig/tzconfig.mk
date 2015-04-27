################################################################################
#
# tzconfig
#
################################################################################

TZCONFIG_VERSION = d9abd51
TZCONFIG_SITE_METHOD = git
TZCONFIG_SITE = gitolite@merlin.swind.sk:embedded-tools.git
TZCONFIG_LICENSE = BSD-3c
TZCONFIG_SUBDIR = tzconfig

define TZCONFIG_INSTALL_TARGET_CGI
	$(INSTALL) -D -m 0755 $(@D)/$(TZCONFIG_SUBDIR)/tzconfig-cgi.sh $(TARGET_DIR)/usr/libexec/cgi-bin/tzconfig
endef

TZCONFIG_POST_INSTALL_TARGET_HOOKS += TZCONFIG_INSTALL_TARGET_CGI

$(eval $(generic-package))

