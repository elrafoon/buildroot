################################################################################
#
# errord
#
################################################################################

ERRORD_VERSION = 1992d10
ERRORD_SITE_METHOD = git
ERRORD_SITE = gitolite@merlin.swind.sk:embedded-tools.git
ERRORD_LICENSE = BSD-3c
ERRORD_SUBDIR = errord

define ERRORD_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(@D)/$(ERRORD_SUBDIR)/errord.service $(TARGET_DIR)/etc/systemd/system/errord.service;
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/systemd/system/basic.target.wants/
	ln -fs ../errord.service $(TARGET_DIR)/etc/systemd/system/basic.target.wants/errord.service;
endef

$(eval $(cmake-package))

