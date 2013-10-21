#############################################################
#
# OPENSMC
#
#############################################################
HA2_OPENSMC_VERSION = master
#HA2_OPENSMC_SITE_METHOD = local
#HA2_OPENSMC_SITE = /home/stano/ha2/opensmc
HA2_OPENSMC_SITE_METHOD = git
HA2_OPENSMC_SITE = ssh://merlin.swind.sk:29418/ha2-opensmc
HA2_OPENSMC_INSTALL_STAGING = NO
HA2_OPENSMC_INSTALL_TARGET = YES
HA2_OPENSMC_DEPENDENCIES = ACE boost

ifeq ($(BR2_PACKAGE_HA2_OPENSMC_DEVEL),y)
	HA2_OPENSMC_INSTALL_DEVEL_CFG=ON
else
	HA2_OPENSMC_INSTALL_DEVEL_CFG=OFF
endif

HA2_OPENSMC_CONF_OPT += -DINSTALL_DEVEL_CFG=$(HA2_OPENSMC_INSTALL_DEVEL_CFG)

define HA2_OPENSMC_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 0755 package/HA2/ha2_opensmc/S90opensmc $(TARGET_DIR)/etc/init.d/S90opensmc
endef

define HA2_OPENSMC_INSTALL_RUNIT_SERVICE
	$(INSTALL) -D -m 0755 package/HA2/ha2_opensmc/runit-run $(TARGET_DIR)/etc/service/opensmc/run
endef

ifeq ($(BR2_PACKAGE_HA2_OPENSMC_STARTUP_INITSCRIPT),y)
	HA2_OPENSMC_POST_INSTALL_TARGET_HOOKS += HA2_OPENSMC_INSTALL_INITSCRIPT
else ifeq ($(BR2_PACKAGE_HA2_OPENSMC_STARTUP_RUNIT),y)
	HA2_OPENSMC_POST_INSTALL_TARGET_HOOKS += HA2_OPENSMC_INSTALL_RUNIT_SERVICE
endif

$(eval $(cmake-package))

