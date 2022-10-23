	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265 \320\264\320\273\320\270\320\275\321\213 \320\274\320\260\321\201\321\201\320\270\320\262\320\260 \320\264\320\276\320\273\320\266\320\275\320\276 \320\261\321\213\321\202\321\214 \320\261\320\276\320\273\321\214\321\210\320\265 \320\273\320\270\320\261\320\276 \321\200\320\260\320\262\320\275\320\276 \320\275\321\203\320\273\321\217!"
.LC2:
	.string	"%d "
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	push	r12
	xor	eax, eax
	lea	rsi, n[rip]
	lea	r12, a[rip]
	push	rbp
	lea	rbp, .LC0[rip]
	push	rbx
	mov	rdi, rbp
	call	__isoc99_scanf@PLT
	xor	eax, eax
	cmp	DWORD PTR n[rip], 0
	jns	.L2
	lea	rsi, .LC1[rip]
	mov	edi, 1
	call	__printf_chk@PLT
	jmp	.L3
.L2:
	mov	esi, DWORD PTR n[rip]
	mov	DWORD PTR ind[rip], eax
	cmp	esi, eax
	jle	.L36
	cdqe
	mov	rdi, rbp
	lea	rsi, [r12+rax*4]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR ind[rip]
	inc	eax
	jmp	.L2
.L36:
	mov	edx, DWORD PTR ind_of_first_positive[rip]
	xor	eax, eax
	xor	ecx, ecx
	xor	edi, edi
	lea	r8, a[rip]
	mov	r9b, 1
.L5:
	cmp	esi, eax
	jle	.L37
	cmp	DWORD PTR [r8+rax*4], 0
	jle	.L6
	cmp	edx, -1
	jne	.L7
	mov	edx, eax
	mov	dil, 1
	jmp	.L7
.L6:
	cmovne	ebx, eax
	cmovne	ecx, r9d
.L7:
	inc	rax
	jmp	.L5
.L37:
	test	cl, cl
	je	.L9
	mov	DWORD PTR ind_of_last_negative[rip], ebx
.L9:
	test	dil, dil
	je	.L10
	mov	DWORD PTR ind_of_first_positive[rip], edx
.L10:
	mov	r8d, DWORD PTR ind_of_first_positive[rip]
	mov	r9d, DWORD PTR ind_of_last_negative[rip]
	xor	eax, eax
	xor	edi, edi
	mov	ecx, DWORD PTR c[rip]
	lea	r10, b[rip]
	lea	r11, a[rip]
.L11:
	mov	edx, eax
	cmp	esi, eax
	jle	.L38
	cmp	r8d, eax
	je	.L12
	cmp	r9d, edx
	jne	.L13
.L12:
	inc	ecx
	mov	dil, 1
	jmp	.L14
.L13:
	mov	ebx, DWORD PTR [r11+rax*4]
	sub	edx, ecx
	movsx	rdx, edx
	mov	DWORD PTR [r10+rdx*4], ebx
.L14:
	inc	rax
	jmp	.L11
.L38:
	test	dil, dil
	je	.L16
	mov	DWORD PTR c[rip], ecx
.L16:
	xor	eax, eax
	lea	rbx, b[rip]
.L17:
	mov	edx, DWORD PTR n[rip]
	sub	edx, DWORD PTR c[rip]
	mov	DWORD PTR ind[rip], eax
	cmp	edx, eax
	jle	.L3
	cdqe
	lea	rsi, .LC2[rip]
	mov	edi, 1
	mov	edx, DWORD PTR [rbx+rax*4]
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR ind[rip]
	inc	eax
	jmp	.L17
.L3:
	pop	rbx
	xor	eax, eax
	pop	rbp
	pop	r12
	ret
	.size	main, .-main
	.globl	c
	.bss
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.globl	ind_of_last_negative
	.data
	.align 4
	.type	ind_of_last_negative, @object
	.size	ind_of_last_negative, 4
ind_of_last_negative:
	.long	-1
	.globl	ind_of_first_positive
	.align 4
	.type	ind_of_first_positive, @object
	.size	ind_of_first_positive, 4
ind_of_first_positive:
	.long	-1
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	ind
	.align 4
	.type	ind, @object
	.size	ind, 4
ind:
	.zero	4
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 262144
b:
	.zero	262144
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 262144
a:
	.zero	262144
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
