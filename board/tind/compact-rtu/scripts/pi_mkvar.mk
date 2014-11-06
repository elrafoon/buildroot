include $(BR2_CONFIG)

FAKEROOT = $(HOST_DIR)/usr/bin/fakeroot

################################################################################
# UBIFS setup
################################################################################
ifeq ($(BR2_TARGET_ROOTFS_UBIFS),y)
UBIFS_DEP = $(BINARIES_DIR)/var.ubifs
endif

MKFS.UBIFS = $(HOST_DIR)/usr/sbin/mkfs.ubifs
UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)

ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
UBIFS_OPTS += -x zlib
endif
ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_LZO),y)
UBIFS_OPTS += -x lzo
endif
ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_NONE),y)
UBIFS_OPTS += -x none
endif

UBIFS_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OPTS))


################################################################################
# EXT2,3,4 setup
################################################################################
ifeq ($(BR2_TARGET_ROOTFS_EXT2),y)
EXT2_DEP = $(BINARIES_DIR)/var.ext2
endif

GENEXT2FS = $(TOPDIR)/fs/ext2/genext2fs.sh

EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)

################################################################################
# GO!
################################################################################

all: $(BINARIES_DIR)/rootfs-only.tar $(BINARIES_DIR)/rootfs-only.ubifs $(BINARIES_DIR)/var.tar $(UBIFS_DEP) $(EXT2_DEP)


$(BINARIES_DIR)/rootfs-only.tar:	$(BINARIES_DIR)/rootfs.tar
									echo "Creating $@"
									cp $< $@
									tar --delete -f $@ --wildcards ./var/*

$(BINARIES_DIR)/rootfs-only.ubifs:	$(BINARIES_DIR)/rootfs-only.tar
									echo "Creating $@"
									rm -rf $(TMPDIR)/*
									$(FAKEROOT) tar -xf $< -C $(TMPDIR)
									$(FAKEROOT) $(MKFS.UBIFS) -d $(TMPDIR) $(UBIFS_OPTS) -c $(FS_ROOT_SIZE_LEBS) -o $@
									rm -rf $(TMPDIR)/*

$(BINARIES_DIR)/var.tar:	$(BINARIES_DIR)/rootfs.tar
							echo "Creating $@"
							cp $< $@
							tar --delete -f $@ $$(tar -tf $@ | grep -v ^./var | egrep ^./[[:alnum:]]+/*$$)

$(BINARIES_DIR)/var.ubifs:	$(BINARIES_DIR)/var.tar
							echo "Creating $@"
							rm -rf $(TMPDIR)/*
							$(FAKEROOT) tar -xf $< -C $(TMPDIR)
							$(FAKEROOT) $(MKFS.UBIFS) -d $(TMPDIR)/var/ $(UBIFS_OPTS) -c $(FS_VAR_SIZE_LEBS) -o $@
							rm -rf $(TMPDIR)/*

$(BINARIES_DIR)/var.ext2:	$(BINARIES_DIR)/var.tar
							echo "Creating $@"
							rm -rf $(TMPDIR)/*
							$(FAKEROOT) tar -xf $< -C $(TMPDIR)
							$(EXT2_ENV) $(FAKEROOT) $(GENEXT2FS) -d $(TMPDIR)/var/ $@
							rm -rf $(TMPDIR)/*


.PHONY: all

