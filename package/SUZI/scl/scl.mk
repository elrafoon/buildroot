#############################################################
#
# scl
#
#############################################################
SCL_VERSION = HEAD
#SCL_SOURCE = SCL-$(SCL_VERSION).tar.gz
#SCL_SITE = ftp://download.dre.vanderbilt.edu/previous_versions
SCL_SITE = git://merlin.swind.sk/suzi/suhub-connector-light.git
SCL_SITE_METHOD = git
SCL_DEPENDENCIES = ACE boost 
SCL_INSTALL_STAGING = YES
SCL_INSTALL_TARGET = YES
SCL_CONF_OPT += -DINSTALL_HEADERS=ON
#SCL_INSTALL_TARGET_OPT += -DINSTALL_HEADERS=OFF

define SCL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libscl.so $(TARGET_DIR)/usr/lib
endef

$(eval $(call CMAKETARGETS))

