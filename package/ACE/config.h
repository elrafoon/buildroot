#define _LARGEFILE_SOURCE 1
#define _FILE_OFFSET_BITS 64

#define ACE_LACKS_STROPTS_H 1
#define ACE_HAS_CPU_SET_T 1
#define ACE_LACKS_STRRECVFD 1
//#define ACE_LACKS_WCTYPE_H 1

#include <ace/config-linux.h>
//#undef ACE_HAS_XPG4_MULTIBYTE_CHAR
//#undef ACE_HAS_LSEEK64
#undef ACE_SCANDIR_CMP_USES_VOIDPTR
#undef ACE_SCANDIR_CMP_USES_CONST_VOIDPTR
#undef ACE_HAS_AIO_CALLS
#undef ACE_HAS_STREAMS
#undef ACE_HAS_STREAM_PIPES

#define ACE_HAS_TIMED_MESSAGE_BLOCKS

/*
 *  UCLIBC OPTIONS:

UCLIBC_SUPPORT_AI_ADDRCONFIG=y
UCLIBC_HAS_BACKTRACE=y

*/
