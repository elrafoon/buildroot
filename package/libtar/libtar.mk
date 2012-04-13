#############################################################
#
# libtar
#
#############################################################
LIBTAR_VERSION = 1.2.11
LIBTAR_SOURCE = libtar-$(LIBTAR_VERSION).tar.gz
LIBTAR_SITE = file://./package/libtar
LIBTAR_INSTALL_STAGING_OPT = stripcmd="${STRIPCMD}" DESTDIR="${STAGING_DIR}" install
#LIBTAR_INSTALL_TARGET_OPT = strip="${STRIPCMD}" DESTDIR="${(TARGET_DIR}" install
LIBTAR_INSTALL_STAGING = YES
LIBTAR_INSTALL_TARGET = YES

# Prefer full-blown tar over buybox's version
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
TAR_DEPENDENCIES += busybox
endif

$(eval $(call AUTOTARGETS))
