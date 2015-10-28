#############################################################
#
# rtu
#
#############################################################
MOD_RTU_SITE = package/mod/mod-rtu
MOD_RTU_SITE_METHOD = local
MOD_RTU_VERSION = 1
MOD_RTU_INSTALL_STAGING = NO
MOD_RTU_INSTALL_TARGET = YES
MOD_RTU_DEPENDENCIES = opendaf opendaf-appconf lighttpd network-manager

define MOD_RTU_INSTALL_TARGET_CMDS
	rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/common/ $(TARGET_DIR)/
	[ ! -z $(BR2_MACHINE) ] && [ -d $(@D)/overlay/machine/$(BR2_MACHINE)/ ] && rsync -a --force --ignore-times --chmod=Du+w --exclude .empty --exclude '*~' $(@D)/overlay/machine/$(BR2_MACHINE)/ $(TARGET_DIR)/ || true
endef

$(eval $(generic-package))

