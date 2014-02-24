################################################################################
#
# ptpd
#
################################################################################

LINUXPTP_VERSION = 1.4
LINUXPTP_SITE = http://downloads.sourceforge.net/project/linuxptp/v$(LINUXPTP_VERSION)
LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
LINUXPTP_LICENSE = GPLv2

define LINUXPTP_BUILD_CMDS
	KBUILD_OUTPUT="$(STAGING_DIR)" $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define LINUXPTP_INSTALL_TARGET_CMDS
	KBUILD_OUTPUT="$(STAGING_DIR)" $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" prefix="$(TARGET_DIR)" -C $(@D) install
endef

#define LINUXPTP_INSTALL_INIT_SYSV
#	$(INSTALL) -m 755 -D package/ptpd/S65ptpd \
#		$(TARGET_DIR)/etc/init.d/S65ptpd
#endef

$(eval $(generic-package))

