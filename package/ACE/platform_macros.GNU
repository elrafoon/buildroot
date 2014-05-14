# as of NDK r6 inlining and static libs are required
#inline ?= 1
#static_libs_only ?= 1

debug = 0
no_hidden_visibility = 1

ssl = $(ACE_SSL)
include $(ACE_ROOT)/include/makeinclude/platform_linux_common.GNU

CROSS_COMPILE=arm-linux-

FLAGS_C_CC += -Wno-psabi
ifeq ($(threads),1)
#    CPPFLAGS  += -D_REENTRANT $(PLATFORM_AIO_SUPPORT)
	FLAGS_C_CC += -pthread
	SOFLAGS += -pthread
	LIBS += -lrt
endif # threads

ifeq ($(buildbits),32)
  FLAGS_C_CC += -m32
  LDFLAGS    += -m32
endif
ifeq ($(buildbits),64)
  FLAGS_C_CC += -m64
endif

# DT_RUNPATH is preferred over DT_RPATH, but the linker will only use it when
# this extra flag option (enable-new-dtags) is present
LD_RPATH_FLAGS += -Wl,--enable-new-dtags

# Rely on _GNU_SOURCE to set these defaults defined in /usr/include/features.h
# instead of setting them directly here (older versions of gcc don't set it
# for you): _SVID_SOURCE _BSD_SOURCE _POSIX_SOURCE _POSIX_C_SOURCE=199506L, ...
CPPFLAGS += -D_GNU_SOURCE

DCFLAGS  += -g3
DCCFLAGS += -g3
DLD      = $(CXX)
LD       = $(CXX)
LIBS     += -ldl

ifeq ($(optimize),1)
  SOFLAGS += -Wl,-O2
endif

SOFLAGS += $(CPPFLAGS) -shared
SOBUILD = $(COMPILE.cc) $(PIC) -o $(VSHDIR)$*.so $<; \
          $(SOLINK.cc) -o $@ $(LDFLAGS) $(VSHDIR)$*.o
PRELIB  = @true

# Test for template instantiation, add to SOFLAGS if SONAME set,
# add -E to LDFLAGS if using GNU ld
#
include $(ACE_ROOT)/include/makeinclude/platform_g++_common.GNU

OCFLAGS ?= -O2
OCCFLAGS ?= -O2

# Added line below to support "Executable Shared Object" files (as
# needed by the service configurator).
# Marius Kjeldahl <mariusk@sn.no, marius@funcom.com>
ifeq ($(threads),1)
    ESOBUILD = $(COMPILEESO.cc) $(PIC) -shared -o $(VSHDIR)$*.so $<
    ifndef PRELIB
       PRELIB = @true
    endif # ! PRELIB
endif
