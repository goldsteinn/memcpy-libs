#include "../libc-asm-common.h"



	.section .text.ssse3, "ax", @progbits

	PAGE_ALIGN_CODE

ENTRY(__mempcpy_chk)
	cmpq	%rdx, %rcx
	jb	chk_failed
	leaq	(%rdi, %rdx), %rax
	jmp	L(start_erms)
END(__mempcpy_chk)


ENTRY(chk_failed)
	/* Exit.  */
	movl	$60, %eax
	movl	$-1, %edi
	syscall
END(chk_failed)


ENTRY(mempcpy)
	leaq	(%rdi, %rdx), %rax
	jmp	L(start_erms)
END(mempcpy)

ENTRY(bcopy)
	xchg	%rdi, %rsi
	jmp	L(start_memmove)
END(bcopy)

ENTRY(__bcopy_chk)
	cmpq	%rdx, %rcx
	jb	chk_failed
	xchg	%rdi, %rsi
	jmp	L(start_memmove)
END(__bcopy_chk)

ENTRY(__memcpy_chk)
END(__memcpy_chk)
ENTRY_DEF(__memmove_chk)
	cmpq	%rdx, %rcx
	jb	chk_failed
	jmp	L(start_memmove)
END(__memmove_chk)

ENTRY_P2ALIGN(memcpy, 6)
END(memcpy)
ENTRY_DEF(memmove)
	movq	%rdi, %rax
L(start_memmove):
L(start_erms):
	// Range       : [0, 18446744073709551615]
	// % Of Calls  : 100.0
	// branch      : T = 25.24, NT = 74.76
	cmpq	$16, %rdx
	jb	L(LB0_UB15)

	// Range       : [16, 18446744073709551615]
	// % Of Calls  : 74.76
	// branch      : T = 31.0, NT = 69.0
	movups	0(%rsi), %xmm0
	movups	-16(%rsi, %rdx), %xmm7
	cmpq	$32, %rdx
	ja	L(LB33_UBinf_H1_16)

	// Range       : [16, 32]
	// % Of Calls  : 51.58
	// copy        :
	movups	%xmm0, 0(%rdi)
	movups	%xmm7, -16(%rdi, %rdx)
	ret

	// Range       : [0, 15]
	// % Of Calls  : 25.24
	// branch      : T = 17.68, NT = 82.32
	.p2align 4,, 4
L(LB0_UB15):
	cmpl	$8, %edx
	ja	L(LB9_UB15)

	// Range       : [0, 8]
	// % Of Calls  : 20.78
	// branch      : T = 9.36, NT = 90.64
	cmpl	$4, %edx
	jb	L(LB0_UB3)

	// Range       : [4, 8]
	// % Of Calls  : 18.84
	// copy        :
	movl	0(%rsi), %ecx
	movl	-4(%rsi, %rdx), %esi
	movl	%ecx, 0(%rdi)
	movl	%esi, -4(%rdi, %rdx)
	ret

	// Range       : [0, 1]
	// % Of Calls  : 0.46
	// branch      : T = 0.33, NT = 99.67
	.p2align 4,, 4
L(LB0_UB1):
	jnz	L(LB0_UB0)

	// Range       : [1, 1]
	// % Of Calls  : 0.45
	// copy        :
	movzbl	0(%rsi), %ecx
	movb	%cl, 0(%rdi)
L(LB0_UB0):
	ret

	// Range       : [9, 15]
	// % Of Calls  : 4.46
	// copy        :
	.p2align 4,, 4
L(LB9_UB15):
	movq	0(%rsi), %rcx
	movq	-8(%rsi, %rdx), %rsi
	movq	%rcx, 0(%rdi)
	movq	%rsi, -8(%rdi, %rdx)
	ret

	// Range       : [0, 3]
	// % Of Calls  : 1.94
	// branch      : T = 23.47, NT = 76.53
	.p2align 4,, 4
L(LB0_UB3):
	decl	%edx
	jle	L(LB0_UB1)

	// Range       : [2, 3]
	// % Of Calls  : 1.49
	// copy        :
	movzwl	0(%rsi), %ecx
	movzbl	(%rsi, %rdx), %esi
	movw	%cx, 0(%rdi)
	movb	%sil, (%rdi, %rdx)
	ret

	// Range       : [33, 64]
	// % Of Calls  : 0.86
	// copy        :
	.p2align 4,, 4
L(LB33_UB64_H1_16):
	movups	16(%rsi), %xmm1
	movups	-32(%rsi, %rdx), %xmm2

	movups	%xmm0, 0(%rdi)
	movups	%xmm1, 16(%rdi)
	movups	%xmm2, -32(%rdi, %rdx)
	movups	%xmm7, -16(%rdi, %rdx)
	ret

	// Range       : [33, 18446744073709551615]
	// % Of Calls  : 23.17
	// branch      : T = 3.72, NT = 96.28
	.p2align 4,, 4
L(LB33_UBinf_H1_16):
	cmpq	$64, %rdx
	jbe	L(LB33_UB64_H1_16)



	/* We use rcx later to get alignr value.  */
	movq	%rdi, %rcx

	/* For memmove safety.  */
	subq	%rsi, %rcx
	cmpq	%rdx, %rcx
	jb	L(copy_backward)
	/* -16(%rsi, %rdx) already loaded into xmm7.  */
	movups	-32(%rsi, %rdx), %xmm8
	movups	-48(%rsi, %rdx), %xmm9

	andl	$0xf, %ecx

	movq	%rsi, %r9
	addq	%rcx, %rsi
	andq	$-16, %rsi
	movaps	(%rsi), %xmm1
	movups	%xmm0, (%rdi)

#ifdef SHARED_CACHE_SIZE_HALF
	cmp	$SHARED_CACHE_SIZE_HALF, %RDX_LP
#else
	cmp	__x86_shared_cache_size_half(%rip), %rdx
#endif
	ja	L(large_memcpy)

	leaq	-64(%rdi, %rdx), %r8
	andq	$-16, %rdi
	movl	$48, %edx

	leaq	L(loop_fwd_start)(%rip), %r9
	sall	$6, %ecx
	addq	%r9, %rcx
	jmp	* %rcx


L(large_memcpy):
	movups	-64(%r9, %rdx), %xmm10
	movups	-80(%r9, %rdx), %xmm11

	sall	$5, %ecx
	leal	(%rcx, %rcx, 2), %r8d
	leaq	-96(%rdi, %rdx), %rcx
	andq	$-16, %rdi
	leaq	L(large_loop_fwd_start)(%rip), %rdx
	addq	%r8, %rdx
	jmp	* %rdx

	.p2align 4
L(copy_backward):
	testq	%rcx, %rcx
	jz	L(nop)

	movups	16(%rsi), %xmm5
	movups	32(%rsi), %xmm6

	subq	%rdi, %rsi
	leaq	-49(%rdi, %rdx), %rcx
	andq	$-16, %rcx
	addq	%rcx, %rsi
	.p2align 4
L(loop_backward):
	movups	32(%rsi), %xmm2
	movups	16(%rsi), %xmm3
	movups	0(%rsi), %xmm4
	movaps	%xmm2, 32(%rcx)
	movaps	%xmm3, 16(%rcx)
	movaps	%xmm4, 0(%rcx)
	subq	$48, %rcx
	subq	$48, %rsi
	cmpq	%rcx, %rdi
	jb	L(loop_backward)
	movups	%xmm0, (%rdi)
	movups	%xmm5, 16(%rdi)
	movups	%xmm6, 32(%rdi)
	movups	%xmm7, -16(%rdi, %rdx)
L(nop):
	ret



	/* Instead of a typical jump table all 16 loops are exactly
	   64-bytes in size. So, we can just jump to first loop + r8 *
	   64. Before modifying any loop ensure all their sizes match!
	 */
	.p2align 6
L(loop_fwd_start):
L(loop_fwd_0x0):
	movaps	16(%rsi), %xmm1
	movaps	32(%rsi), %xmm2
	movaps	48(%rsi), %xmm3
	movaps	%xmm1, 16(%rdi)
	movaps	%xmm2, 32(%rdi)
	movaps	%xmm3, 48(%rdi)
	addq	%rdx, %rdi
	addq	%rdx, %rsi
	cmpq	%rdi, %r8
	ja	L(loop_fwd_0x0)
L(end_loop_fwd):
	movups	%xmm9, 16(%r8)
	movups	%xmm8, 32(%r8)
	movups	%xmm7, 48(%r8)
	ret

	/* Extactly 64 bytes if `jmp L(end_loop_fwd)` is long encoding.
	   60 bytes otherwise.  */
#define ALIGNED_LOOP_FWD(align_by);	\
	.p2align 6;	\
L(loop_fwd_ ## align_by):	\
	movaps	16(%rsi), %xmm0;	\
	movaps	32(%rsi), %xmm2;	\
	movaps	48(%rsi), %xmm3;	\
	movaps	%xmm3, %xmm4;	\
	palignr	$align_by, %xmm2, %xmm3;	\
	palignr	$align_by, %xmm0, %xmm2;	\
	palignr	$align_by, %xmm1, %xmm0;	\
	movaps	%xmm4, %xmm1;	\
	movaps	%xmm0, 16(%rdi);	\
	movaps	%xmm2, 32(%rdi);	\
	movaps	%xmm3, 48(%rdi);	\
	addq	%rdx, %rdi;	\
	addq	%rdx, %rsi;	\
	cmpq	%rdi, %r8;	\
	ja	L(loop_fwd_ ## align_by);	\
	jmp	L(end_loop_fwd);

	ALIGNED_LOOP_FWD (0xf)
	ALIGNED_LOOP_FWD (0xe)
	ALIGNED_LOOP_FWD (0xd)
	ALIGNED_LOOP_FWD (0xc)
	ALIGNED_LOOP_FWD (0xb)
	ALIGNED_LOOP_FWD (0xa)
	ALIGNED_LOOP_FWD (0x9)
	ALIGNED_LOOP_FWD (0x8)
	ALIGNED_LOOP_FWD (0x7)
	ALIGNED_LOOP_FWD (0x6)
	ALIGNED_LOOP_FWD (0x5)
	ALIGNED_LOOP_FWD (0x4)
	ALIGNED_LOOP_FWD (0x3)
	ALIGNED_LOOP_FWD (0x2)
	ALIGNED_LOOP_FWD (0x1)

	.p2align 6
L(large_loop_fwd_start):
L(large_loop_fwd_0x0):
	movaps	16(%rsi), %xmm1
	movaps	32(%rsi), %xmm2
	movaps	48(%rsi), %xmm3
	movaps	64(%rsi), %xmm4
	movaps	80(%rsi), %xmm5
	movntps	%xmm1, 16(%rdi)
	movntps	%xmm2, 32(%rdi)
	movntps	%xmm3, 48(%rdi)
	movntps	%xmm4, 64(%rdi)
	movntps	%xmm5, 80(%rdi)
	addq	$80, %rdi
	addq	$80, %rsi
	cmpq	%rdi, %rcx
	ja	L(large_loop_fwd_0x0)

	/* Ensure no cache line split on tail.  */
	.p2align 4
L(end_large_loop_fwd):
	sfence
	movups	%xmm11, 16(%rcx)
	movups	%xmm10, 32(%rcx)
	movups	%xmm9, 48(%rcx)
	movups	%xmm8, 64(%rcx)
	movups	%xmm7, 80(%rcx)
	ret


	/* Size > 64 bytes and <= 96 bytes. 32-byte align between ensure
	   96-byte spacing between each.  */
#define ALIGNED_LARGE_LOOP_FWD(align_by);	\
	.p2align 5;	\
L(large_loop_fwd_ ## align_by):	\
	movaps	16(%rsi), %xmm0;	\
	movaps	32(%rsi), %xmm2;	\
	movaps	48(%rsi), %xmm3;	\
	movaps	64(%rsi), %xmm4;	\
	movaps	80(%rsi), %xmm5;	\
	movaps	%xmm5, %xmm6;	\
	palignr	$align_by, %xmm4, %xmm5;	\
	palignr	$align_by, %xmm3, %xmm4;	\
	palignr	$align_by, %xmm2, %xmm3;	\
	palignr	$align_by, %xmm0, %xmm2;	\
	palignr	$align_by, %xmm1, %xmm0;	\
	movaps	%xmm6, %xmm1;	\
	movntps	%xmm0, 16(%rdi);	\
	movntps	%xmm2, 32(%rdi);	\
	movntps	%xmm3, 48(%rdi);	\
	movntps	%xmm4, 64(%rdi);	\
	movntps	%xmm5, 80(%rdi);	\
	addq	$80, %rdi;	\
	addq	$80, %rsi;	\
	cmpq	%rdi, %rcx;	\
	ja	L(large_loop_fwd_ ## align_by);	\
	jmp	L(end_large_loop_fwd);



	ALIGNED_LARGE_LOOP_FWD (0xf)
	ALIGNED_LARGE_LOOP_FWD (0xe)
	ALIGNED_LARGE_LOOP_FWD (0xd)
	ALIGNED_LARGE_LOOP_FWD (0xc)
	ALIGNED_LARGE_LOOP_FWD (0xb)
	ALIGNED_LARGE_LOOP_FWD (0xa)
	ALIGNED_LARGE_LOOP_FWD (0x9)
	ALIGNED_LARGE_LOOP_FWD (0x8)
	ALIGNED_LARGE_LOOP_FWD (0x7)
	ALIGNED_LARGE_LOOP_FWD (0x6)
	ALIGNED_LARGE_LOOP_FWD (0x5)
	ALIGNED_LARGE_LOOP_FWD (0x4)
	ALIGNED_LARGE_LOOP_FWD (0x3)
	ALIGNED_LARGE_LOOP_FWD (0x2)
	ALIGNED_LARGE_LOOP_FWD (0x1)


	.section .rodata.ssse3, "a", @progbits
	.p2align 4
__x86_shared_cache_size_half:
	.quad	((8192 * 1024) / 2)
__x86_data_cache_size_half:
	.quad	(32768 / 2)
	.previous
	PAGE_ALIGN_CODE
END(memmove)
