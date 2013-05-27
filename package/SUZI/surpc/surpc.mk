#############################################################
#
# SuRPC
#
#############################################################
SURPC_VERSION = master
SURPC_SITE = git://merlin.swind.sk/suzi/SuRPC.git
SURPC_SITE_METHOD = git
SURPC_DEPENDENCIES = ACE host-protobuf
SURPC_INSTALL_STAGING = YES
SURPC_INSTALL_TARGET = YES

define SURPC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libSuRPC*.so $(TARGET_DIR)/usr/lib
endef

$(eval $(call cmake-package))

