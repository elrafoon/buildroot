#############################################################
#
# SuRPC
#
#############################################################
SURPC_VERSION = master
SURPC_SITE = git://merlin.swind.sk/suzi/SuRPC.git
SURPC_SITE_METHOD = git
SURPC_DEPENDENCIES = ACE protobuf
SURPC_INSTALL_STAGING = YES
SURPC_INSTALL_TARGET = YES
SURPC_CONF_OPT += -DBUILD_PYTHON=$(if $(BR2_PACKAGE_SURPC_PYTHON),ON,OFF)

define SURPC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libSuRPC*.so $(TARGET_DIR)/usr/lib
	(cd $(@D)/python; $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(call cmake-package))

