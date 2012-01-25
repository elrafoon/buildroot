#############################################################
#
# ddg
#
#############################################################
DDG_VERSION = HEAD
DDG_SITE = svn://merlin.swind.sk/svn/oms/dls/trunk/dls-device-gui/dls-device-gui
DDG_SITE_METHOD = svn
DDG_DEPENDENCIES = ACE boost qt ddgd icm
#DDG_CONF_ENV += QTDIR=`$(QT_QMAKE) -query QT_INSTALL_PREFIX`
DDG_CONF_ENV += QTDIR=$(HOST_DIR)/usr/bin
DDG_CONF_OPT += -DCMAKE_CXX_FLAGS="-DQ_WS_QWS -DNO_BORDERS"
DDG_INSTALL_STAGING = NO
DDG_INSTALL_TARGET = YES

define DDG_PI_INSTALL_DB
	$(INSTALL) -D -m 0644 package/DLS/ddg/db.sqlite3 $(TARGET_DIR)/srv/db.sqlite3 && \
        echo /usr/lib/suquation >> $(TARGET_DIR)/etc/ld.so.conf
endef

DDG_POST_INSTALL_TARGET_HOOKS += DDG_PI_INSTALL_DB

$(eval $(call CMAKETARGETS))

