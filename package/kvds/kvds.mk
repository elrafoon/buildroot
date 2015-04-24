################################################################################
#
# kvds
#
################################################################################

KVDS_VERSION = 1afedf9
KVDS_SITE_METHOD = git
KVDS_SITE = gitolite@merlin.swind.sk:embedded-tools.git
KVDS_LICENSE = BSD-3c
KVDS_SUBDIR = kvds

define KVDS_INSTALL_TARGET_KVDS
	$(INSTALL) -D -m 0755 $(@D)/$(KVDS_SUBDIR)/kvds $(TARGET_DIR)/usr/bin/kvds
endef

define KVDS_INSTALL_TARGET_KVDS_CGI_$(BR2_PACKAGE_KVDS_CGI)
	$(INSTALL) -D -m 0755 package/kvds/kvds-cgi.sh $(TARGET_DIR)/usr/libexec/cgi-bin/kvds
endef

KVDS_POST_INSTALL_TARGET_HOOKS += KVDS_INSTALL_TARGET_KVDS
KVDS_POST_INSTALL_TARGET_HOOKS += KVDS_INSTALL_TARGET_KVDS_CGI_y

$(eval $(generic-package))

