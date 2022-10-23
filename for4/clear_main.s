	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 262144
a:
	.zero	262144
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 262144
b:
	.zero	262144
	.globl	ind
	.align 4
	.type	ind, @object
	.size	ind, 4
ind:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	ind_of_first_positive
	.data
	.align 4
	.type	ind_of_first_positive, @object
	.size	ind_of_first_positive, 4
ind_of_first_positive:
	.long	-1
	.globl	ind_of_last_negative
	.align 4
	.type	ind_of_last_negative, @object
	.size	ind_of_last_negative, 4
ind_of_last_negative:
	.long	-1
	.globl	c
	.bss
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%d"
	.align 8
.LC1:
	.string	"\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265 \320\264\320\273\320\270\320\275\321\213 \320\274\320\260\321\201\321\201\320\270\320\262\320\260 \320\264\320\276\320\273\320\266\320\275\320\276 \320\261\321\213\321\202\321\214 \320\261\320\276\320\273\321\214\321\210\320\265 \320\273\320\270\320\261\320\276 \321\200\320\260\320\262\320\275\320\276 \320\275\321\203\320\273\321\217!"
.LC2:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	mov	QWORD PTR -16[rbp], rsi
	lea	rax, n[rip]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR n[rip]
	test	eax, eax
	jns	.L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L3
.L2:
	mov	DWORD PTR ind[rip], 0
	jmp	.L4
.L5:
	mov	eax, DWORD PTR ind[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR ind[rip]
	add	eax, 1
	mov	DWORD PTR ind[rip], eax
.L4:
	mov	edx, DWORD PTR ind[rip]
	mov	eax, DWORD PTR n[rip]
	cmp	edx, eax
	jl	.L5
	mov	DWORD PTR ind[rip], 0
	jmp	.L6
.L9:
	mov	eax, DWORD PTR ind[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jle	.L7
	mov	eax, DWORD PTR ind_of_first_positive[rip]
	cmp	eax, -1
	jne	.L7
	mov	eax, DWORD PTR ind[rip]
	mov	DWORD PTR ind_of_first_positive[rip], eax
.L7:
	mov	eax, DWORD PTR ind[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jns	.L8
	mov	eax, DWORD PTR ind[rip]
	mov	DWORD PTR ind_of_last_negative[rip], eax
.L8:
	mov	eax, DWORD PTR ind[rip]
	add	eax, 1
	mov	DWORD PTR ind[rip], eax
.L6:
	mov	edx, DWORD PTR ind[rip]
	mov	eax, DWORD PTR n[rip]
	cmp	edx, eax
	jl	.L9
	mov	DWORD PTR ind[rip], 0
	jmp	.L10
.L14:
	mov	edx, DWORD PTR ind[rip]
	mov	eax, DWORD PTR ind_of_first_positive[rip]
	cmp	edx, eax
	je	.L11
	mov	edx, DWORD PTR ind[rip]
	mov	eax, DWORD PTR ind_of_last_negative[rip]
	cmp	edx, eax
	jne	.L12
.L11:
	mov	eax, DWORD PTR c[rip]
	add	eax, 1
	mov	DWORD PTR c[rip], eax
	jmp	.L13
.L12:
	mov	eax, DWORD PTR ind[rip]
	mov	edx, DWORD PTR ind[rip]
	mov	esi, DWORD PTR c[rip]
	mov	ecx, edx
	sub	ecx, esi
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	movsx	rdx, ecx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, b[rip]
	mov	DWORD PTR [rcx+rdx], eax
.L13:
	mov	eax, DWORD PTR ind[rip]
	add	eax, 1
	mov	DWORD PTR ind[rip], eax
.L10:
	mov	edx, DWORD PTR ind[rip]
	mov	eax, DWORD PTR n[rip]
	cmp	edx, eax
	jl	.L14
	mov	DWORD PTR ind[rip], 0
	jmp	.L15
.L16:
	mov	eax, DWORD PTR ind[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR ind[rip]
	add	eax, 1
	mov	DWORD PTR ind[rip], eax
.L15:
	mov	eax, DWORD PTR n[rip]
	mov	ecx, DWORD PTR c[rip]
	sub	eax, ecx
	mov	edx, eax
	mov	eax, DWORD PTR ind[rip]
	cmp	edx, eax
	jg	.L16
	mov	eax, 0
.L3:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
