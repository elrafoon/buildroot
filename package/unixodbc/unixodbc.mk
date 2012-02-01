#############################################################
#
# unixodbc
#
#############################################################

UNIXODBC_VERSION = 2.3.1
UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
UNIXODBC_INSTALL_STAGING = YES
UNIXODBC_INSTALL_TARGET = YES
#UNIXODBC_CONF_OPT = --disable-readline

#ifeq ($(BR2_PACKAGE_UNIXODBC_READLINE),y)
#UNIXODBC_DEPENDENCIES += ncurses readline
#UNIXODBC_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
#else
#UNIXODBC_CONF_OPT += --disable-readline
#endif
UNIXODBC_INSTALL_TARGETS_y := libodbc.so
UNIXODBC_INSTALL_TARGETS_y += libodbcinst.so
#UNIXODBC_INSTALL_TARGETS_$(BR2_PACKAGE_ACE_ETCL) += libACE_ETCL_Parser.so

define UNIXODBC_INSTALL_TARGET_CMDS
	for t in $(UNIXODBC_INSTALL_TARGETS_y) ; do \
                $(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/$$t $(TARGET_DIR)/usr/lib ; \
        done
endef

$(eval $(call AUTOTARGETS))

