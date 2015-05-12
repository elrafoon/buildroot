################################################################################
#
# downtime
#
################################################################################

DOWNTIME_VERSION = a68d461
DOWNTIME_SITE_METHOD = git
DOWNTIME_SITE = gitolite@merlin.swind.sk:embedded-tools.git
DOWNTIME_LICENSE = BSD-3c
DOWNTIME_SUBDIR = downtime
DOWNTIME_DEPENDENCIES = dcron

define DOWNTIME_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D)/$(DOWNTIME_SUBDIR) DESTDIR=$(TARGET_DIR) install
endef

define DOWNTIME_INSTALL_TARGET_CGI_$(BR2_PACKAGE_DOWNTIME_CGI)
	$(MAKE) -C $(@D)/$(DOWNTIME_SUBDIR) DESTDIR=$(TARGET_DIR) install-cgi
endef

DOWNTIME_POST_INSTALL_TARGET_HOOKS += DOWNTIME_INSTALL_TARGET_CGI_y

define DOWNTIME_INSTALL_INIT_SYSTEMD
	$(MAKE) -C $(@D)/$(DOWNTIME_SUBDIR) DESTDIR=$(TARGET_DIR) install-systemd
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/systemd/system/basic.target.wants/
	ln -fs ../downtime-save.service $(TARGET_DIR)/etc/systemd/system/basic.target.wants/downtime-save.service
endef

$(eval $(generic-package))

