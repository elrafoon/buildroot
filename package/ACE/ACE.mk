#############################################################
#
# ace
#
#############################################################
ACE_VERSION = 6.0.7
ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
ACE_SITE = ftp://download.dre.vanderbilt.edu/previous_versions
ACE_INSTALL_STAGING = YES
ACE_DEPENDENCIES = openssl

define ACE_BUILD_CMDS
	cp package/ACE/config.h $(@D)/ace/config.h
	cp package/ACE/platform_macros.GNU $(@D)/include/makeinclude/platform_macros.GNU
	$(MAKE) ACE_ROOT=$(@D) CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) -C $(@D)
	#$(MAKE) ACE_ROOT=$(@D) CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) -C $(@D)
endef

define ACE_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/include/ace
	mkdir -p $(STAGING_DIR)/usr/share/ace
	$(MAKE) INSTALL_PREFIX=$(STAGING_DIR)/usr ACE_ROOT=$(@D) CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_CC) -C $(@D) install
	#$(MAKE) INSTALL_PREFIX=$(STAGING_DIR) ACE_ROOT=$(@D) CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) -C $(@D) install
endef

define ACE_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_ETCL_Parser.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_ETCL.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_HTBP.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_INet.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_INet_SSL.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_Monitor_Control.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_RMCast.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_SSL.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACE_TMCast.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACEXML_Parser.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACEXML.so $(TARGET_DIR)/usr/lib
        $(INSTALL) -D -m 0755 $(@D)/lib/libACEXML_XML_Svc_Conf_Parser.so $(TARGET_DIR)/usr/lib
endef

$(eval $(call GENTARGETS))

