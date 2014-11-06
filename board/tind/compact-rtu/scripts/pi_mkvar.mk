include $(BR2_CONFIG)

FAKEROOT = $(HOST_DIR)/usr/bin/fakeroot

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

all: $(BINARIES_DIR)/rootfs-only.tar $(BINARIES_DIR)/rootfs-only.ubifs $(BINARIES_DIR)/var.tar $(BINARIES_DIR)/var.ubifs


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



.PHONY: all

