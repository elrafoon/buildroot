#############################################################
#
# RTUADMIN_CLIENT
#
#############################################################
RTUADMIN_CLIENT_VERSION = master
RTUADMIN_CLIENT_SITE = http://merlin/packages/r
RTUADMIN_CLIENT_SOURCE = rtuadmin-client.tar.bz2
RTUADMIN_CLIENT_INSTALL_STAGING = NO
RTUADMIN_CLIENT_INSTALL_TARGET = YES

define RTUADMIN_CLIENT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/rtuadmin-client
	tar xf $(@D)/build.tar.bz2 --strip-components=1 -C $(TARGET_DIR)/usr/share/rtuadmin-client
	ln -sf /usr/share/rtuadmin-client/ $(TARGET_DIR)/var/www/rtuadmin-client
endef

$(eval $(generic-package))
