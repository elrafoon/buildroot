#############################################################
#
# icm
#
#############################################################
ICM_VERSION = HEAD
#ICM_SOURCE = ICM-$(ICM_VERSION).tar.gz
#ICM_SITE = ftp://download.dre.vanderbilt.edu/previous_versions
ICM_SITE = svn://merlin.swind.sk/svn/oms/dls/trunk/integrated-command-module
ICM_SITE_METHOD = svn
ICM_DEPENDENCIES = ACE 
ICM_INSTALL_STAGING = YES
ICM_INSTALL_TARGET = YES
#ICM_INSTALL_TARGET_OPT += -DINSTALL_HEADERS=OFF

define ICM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libicm.so $(TARGET_DIR)/usr/lib
endef

$(eval $(call CMAKETARGETS))

