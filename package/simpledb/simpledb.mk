#############################################################
#
# simpledb
#
#############################################################
SIMPLEDB_VERSION = 1.14
SIMPLEDB_SOURCE = simpledb-$(SIMPLEDB_VERSION).tar.gz
SIMPLEDB_SITE = http://merlin.swind.sk/packages/s
SIMPLEDB_INSTALL_STAGING = YES
SIMPLEDB_INSTALL_TARGET = YES
SIMPLEDB_DEPENDENCIES = unixodbc

define SIMPLEDB_BUILD_CMDS
	$(MAKE) CXX=$(TARGET_CXX) -C $(@D)
endef

define SIMPLEDB_INSTALL_STAGING_CMDS
	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(@D) install
endef

SIMPLEDB_INSTALL_TARGETS_y := libSimpleDB.so

define SIMPLEDB_INSTALL_TARGET_CMDS
	for t in $(SIMPLEDB_INSTALL_TARGETS_y) ; do \
		$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/lib/$$t $(TARGET_DIR)/usr/lib ; \
	done
endef

$(eval $(call GENTARGETS))

