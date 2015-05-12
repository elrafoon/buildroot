################################################################################
#
# astroclock
#
################################################################################

ASTROCLOCK_VERSION = 81e5944
ASTROCLOCK_SITE_METHOD = git
ASTROCLOCK_SITE = gitolite@merlin.swind.sk:embedded-tools.git
ASTROCLOCK_LICENSE = BSD-3c
ASTROCLOCK_SUBDIR = astroclock
ASTROCLOCK_DEPENDENCIES = dcron

define ASTROCLOCK_INSTALL_TARGET_CGI_$(BR2_PACKAGE_ASTROCLOCK_CGI)
	$(INSTALL) -D -m 0755 $(@D)/$(ASTROCLOCK_SUBDIR)/astro-cgi.sh $(TARGET_DIR)/usr/libexec/cgi-bin/astro
endef

ASTROCLOCK_POST_INSTALL_TARGET_HOOKS += ASTROCLOCK_INSTALL_TARGET_CGI_y

define ASTROCLOCK_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/$(ASTROCLOCK_SUBDIR)/astroclock.service $(TARGET_DIR)/etc/systemd/system/astroclock.service;
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
	ln -fs ../astroclock.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/astroclock.service;
endef

$(eval $(cmake-package))

