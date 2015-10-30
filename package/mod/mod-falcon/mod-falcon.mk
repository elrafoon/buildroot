#############################################################
#
# falcon
#
#############################################################
MOD_FALCON_VERSION = 1
MOD_FALCON_SITE = package/mod/mod-falcon
MOD_FALCON_SITE_METHOD = local
MOD_FALCON_INSTALL_STAGING = NO
MOD_FALCON_INSTALL_TARGET = YES
MOD_FALCON_DEPENDENCIES = astroclock dcron crontab-cgi mod-rtu

define MOD_FALCON_INSTALL_TARGET_CMDS
	rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/common/ $(TARGET_DIR)/
	[ ! -z $(BR2_MACHINE) ] && [ -d $(@D)/overlay/machine/$(BR2_MACHINE)/ ] && rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/machine/$(BR2_MACHINE)/ $(TARGET_DIR)/ || true
	INSTALL="$(INSTALL)" MOD="$(@D)/artifacts" TARGET_DIR="$(TARGET_DIR)" MACHINE=$(BR2_MACHINE) package/mod/mod-falcon/mod-falcon.sh
endef

$(eval $(generic-package))

