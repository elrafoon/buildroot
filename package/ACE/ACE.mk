#############################################################
#
# ace
#
#############################################################
ACE_VERSION = 6.1.7
ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
ACE_SITE = ftp://download.dre.vanderbilt.edu/previous_versions
ACE_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_ACE_SSL),y)
	ACE_DEPENDENCIES = openssl
	ACE_SSL = 1
else
	ACE_SSL = 0
endif

define ACE_BUILD_CMDS
	cp package/ACE/config.h $(@D)/ace/config.h
	cp package/ACE/platform_macros.GNU $(@D)/include/makeinclude/platform_macros.GNU
	$(MAKE) ACE_ROOT=$(@D) ACE_SSL=$(ACE_SSL) CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) -C $(@D)
endef

define ACE_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/include/ace
	mkdir -p $(STAGING_DIR)/usr/share/ace
	$(MAKE) INSTALL_PREFIX=$(STAGING_DIR)/usr ACE_ROOT=$(@D) ACE_SSL=$(ACE_SSL) CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) -C $(@D) install
endef

ACE_INSTALL_TARGETS_y := libACE.so

ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_ETCL) += libACE_ETCL_Parser.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_ETCL) += libACE_ETCL.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_HTBP) += libACE_HTBP.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_INET) += libACE_INet.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_INET_SSL) += libACE_INet_SSL.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_MONITOR_CONTROL) += libACE_Monitor_Control.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_RMCAST) += libACE_RMCast.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_SSL) += libACE_SSL.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_TMCAST) += libACE_TMCast.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_XML) += libACEXML_Parser.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_XML) += libACEXML.so
ACE_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_XML) += libACEXML_XML_Svc_Conf_Parser.so

define ACE_INSTALL_TARGET_CMDS
	for t in $(ACE_INSTALL_TARGETS_y) ; do \
		$(INSTALL) -D -m 0755 $(@D)/lib/$$t $(TARGET_DIR)/usr/lib ; \
	done
endef

$(eval $(generic-package))

