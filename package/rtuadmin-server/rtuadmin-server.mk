#############################################################
#
# RTUADMIN_SERVER
#
#############################################################
RTUADMIN_SERVER_VERSION = master
RTUADMIN_SERVER_SITE_METHOD = git
RTUADMIN_SERVER_SITE = ssh://gitolite@merlin/rtuadmin-server
RTUADMIN_SERVER_INSTALL_STAGING = NO
RTUADMIN_SERVER_INSTALL_TARGET = YES
RTUADMIN_SERVER_DEPENDENCIES = cjson lua luacosmo sqlite
RTUADMIN_SERVER_CONF_OPT += -DHTTPD_VERSION_HASH=$(RTUADMIN_SERVER_VERSION) -DOPENDAF_TEMPLATES="/usr/share/opendaf/templates/"

define RTUADMIN_SERVER_INSTALL_INITSCRIPT
    $(INSTALL) -D -m 0755 package/rtuadmin-server/S95rtuadmin-server $(TARGET_DIR)/etc/init.d/S95rtuadmin-server
endef

# setup target installation hooks
RTUADMIN_SERVER_POST_INSTALL_TARGET_HOOKS += RTUADMIN_SERVER_INSTALL_INITSCRIPT

$(eval $(cmake-package))
