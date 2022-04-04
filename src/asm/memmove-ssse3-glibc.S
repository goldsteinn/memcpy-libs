#define USE_AS_MEMMOVE
#define MEMCPY	memmove
#define MEMCPY_CHK	memmove_chk
#include "core/memcpy-ssse3-head.S"
