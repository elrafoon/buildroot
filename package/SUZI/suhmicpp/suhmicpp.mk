#############################################################
#
# suhmicpp
#
#############################################################
SUHMICPP_VERSION = HEAD
SUHMICPP_SOURCE = suhmicpp.tar.gz
SUHMICPP_SITE = file://./package/SUZI/suhmicpp

#SUHMICPP_SITE = git://merlin.swind.sk/suzi/suhmi-cpp.git
#SUHMICPP_SITE_METHOD = git
SUHMICPP_DEPENDENCIES =  qt ACE scl python libtar simpledb libconfig
SUHMICPP_INSTALL_STAGING = YES
SUHCMIPP_INSTALL_TARGET = YES
SUHMICPP_CONF_OPT += -DINSTALL_CONF_RUNIT=OFF -DINSTALL_CONF_RSYSLOG=OFF -DINSTALL_CONF_LOGROTATE=OFF -DINSTALL_CONF_SUHMICPP=OFF -DINSTALL_CONF_LD_SO=OFF -DSWIG_EXECUTABLE=/usr/bin/swig -DSWIG_DIR=/usr/share/swig1.3 -DPYTHON_VERSION="2.7" -DSUHMICPP_BUILD_TESTS=OFF -DFRAMELESS=ON

define SUHMICPP_PI_ADD_LD_SO
	echo /usr/lib/suhmicpp >> $(TARGET_DIR)/etc/ld.so.conf
endef

SUHMICPP_POST_INSTALL_TARGET_HOOKS += SUHMICPP_PI_ADD_LD_SO

define SUHMICPP_INSTALL_TARGET_CMDS
	 	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/suhmicpp $(TARGET_DIR)/usr/bin/suhmicpp
	 	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libsuhmicppCore.so $(TARGET_DIR)/usr/lib/libsuhmicppCore.so
	 	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libwidgetkeyboard.so $(TARGET_DIR)/usr/lib/libwidgetkeyboard.so
	 	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/libconfig++.so $(TARGET_DIR)/usr/lib/libconfig++.so
	 	$(INSTALL) -D -m 0755 $(@D)/python_modules/hmi.py $(TARGET_DIR)/usr/lib/python2.7/hmi/hmi.py
		$(INSTALL) -D -m 0755 $(@D)/python_modules/_hmi.so $(TARGET_DIR)/usr/lib/python2.7/hmi/_hmi.so && \
		$(INSTALL) -D -m 0755 $(@D)/python_modules/hmi.py $(TARGET_DIR)/usr/lib/python2.7/hmi/hmi.py && \
		$(INSTALL) -D -m 0755 $(@D)/python_modules/hmi/__init__.py $(TARGET_DIR)/usr/lib/python2.7/hmi/__init__.py && \
		$(INSTALL) -D -m 0755 $(@D)/python_modules/suhmi_cpp/__init__.py $(TARGET_DIR)/usr/lib/python2.7/suhmi_cpp/__init__.py  && \
		$(INSTALL) -D -m 0755 $(@D)/python_modules/suhmi_cpp/constants.py $(TARGET_DIR)/usr/lib/python2.7/suhmi_cpp/constants.py  && \
		$(INSTALL) -D -m 0755 $(@D)/python_modules/suhmi_cpp/suhmi_cpp.py $(TARGET_DIR)/usr/lib/python2.7/suhmi_cpp/suhmi_cpp.py 
		$(INSTALL) -D -m 0644 $(@D)/etc/ld.so.conf.d/suhmicpp.conf $(TARGET_DIR)/etc/ld.so.conf.d/suhmicpp.conf
		$(INSTALL) -D -m 0644 $(@D)/etc/logrotate.d/suhmicpp $(TARGET_DIR)/etc/logrotate.d/suhmicpp
		$(INSTALL) -D -m 0644 $(@D)/etc/rsyslog.d/suhmicpp.conf $(TARGET_DIR)/etc/rsyslog.d/suhmicpp.conf
		$(INSTALL) -D -m 0644 $(@D)/etc/runit/run $(TARGET_DIR)/etc/runit/run
		$(INSTALL) -D -m 0644 $(@D)/etc/suhmicpp/svc.conf $(TARGET_DIR)/etc/suhmicpp/svc.conf
		$(INSTALL) -D -m 0644 $(@D)/etc/suhmicpp/suhmi-cpp.conf $(TARGET_DIR)/etc/suhmicpp/suhmi-cpp.conf
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/alarmwindow.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/alarmwindow.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/event.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/event.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/hmi.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/hmi.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/links.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/links.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/objectbase.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/objectbase.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/onlinegraph.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/onlinegraph.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/script.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/script.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/symbol.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/symbol.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/tags.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/tags.xsd
		$(INSTALL) -D -m 0644 $(STAGING_DIR)/usr/share/suhmicpp/schemas/window.xsd $(TARGET_DIR)/usr/share/suhmicpp/schemas/window.xsd
endef

$(eval $(call cmake-package))

