	.file	"main.c"
	.text
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 262144
# массив a
a:
	.zero	262144
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 262144
# массив b
b:
	.zero	262144
	.globl	ind
	.align 4
	.type	ind, @object
	.size	ind, 4
# переменная индекса
ind:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
# переменная n
n:
	.zero	4
	.globl	ind_of_first_positive
	.data
	.align 4
	.type	ind_of_first_positive, @object
	.size	ind_of_first_positive, 4
# индекс полож. числа
ind_of_first_positive:
	.long	-1
	.globl	ind_of_last_negative
	.align 4
	.type	ind_of_last_negative, @object
	.size	ind_of_last_negative, 4
# индекс отрицательного числа
ind_of_last_negative:
	.long	-1
	.globl	c
	.bss
	.align 4
	.type	c, @object
	.size	c, 4
# переменная c
c:
	.zero	4
	.section	.rodata
.LC0:
# параметр для scanf
	.string	"%d"
	.align 8
.LC1:
# параметр для вывода строки (сама строка)
	.string	"\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265 \320\264\320\273\320\270\320\275\321\213 \320\274\320\260\321\201\321\201\320\270\320\262\320\260 \320\264\320\276\320\273\320\266\320\275\320\276 \320\261\321\213\321\202\321\214 \320\261\320\276\320\273\321\214\321\210\320\265 \320\273\320\270\320\261\320\276 \321\200\320\260\320\262\320\275\320\276 \320\275\321\203\320\273\321\217!"
.LC2:
# параметр для printf
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
# запуск программы
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	n(%rip), %eax
	testl	%eax, %eax
	jns	.L2
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$0, ind(%rip)
	jmp	.L4
.L5:
	movl	ind(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	ind(%rip), %eax
	addl	$1, %eax
	movl	%eax, ind(%rip)
.L4:
	movl	ind(%rip), %edx
	movl	n(%rip), %eax
	cmpl	%eax, %edx
	jl	.L5
	movl	$0, ind(%rip)
	jmp	.L6
.L9:
	movl	ind(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jle	.L7
	movl	ind_of_first_positive(%rip), %eax
	cmpl	$-1, %eax
	jne	.L7
	movl	ind(%rip), %eax
	movl	%eax, ind_of_first_positive(%rip)
.L7:
	movl	ind(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jns	.L8
	movl	ind(%rip), %eax
	movl	%eax, ind_of_last_negative(%rip)
.L8:
	movl	ind(%rip), %eax
	addl	$1, %eax
	movl	%eax, ind(%rip)
.L6:
	movl	ind(%rip), %edx
	movl	n(%rip), %eax
	cmpl	%eax, %edx
	jl	.L9
	movl	$0, ind(%rip)
	jmp	.L10
.L14:
	movl	ind(%rip), %edx
	movl	ind_of_first_positive(%rip), %eax
	cmpl	%eax, %edx
	je	.L11
	movl	ind(%rip), %edx
	movl	ind_of_last_negative(%rip), %eax
	cmpl	%eax, %edx
	jne	.L12
.L11:
	movl	c(%rip), %eax
	addl	$1, %eax
	movl	%eax, c(%rip)
	jmp	.L13
.L12:
	movl	ind(%rip), %eax
	movl	ind(%rip), %edx
	movl	c(%rip), %esi
	movl	%edx, %ecx
	subl	%esi, %ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%ecx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	b(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
.L13:
	movl	ind(%rip), %eax
	addl	$1, %eax
	movl	%eax, ind(%rip)
.L10:
	movl	ind(%rip), %edx
	movl	n(%rip), %eax
	cmpl	%eax, %edx
	jl	.L14
	movl	$0, ind(%rip)
	jmp	.L15
.L16:
	movl	ind(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	ind(%rip), %eax
	addl	$1, %eax
	movl	%eax, ind(%rip)
.L15:
	movl	n(%rip), %eax
	movl	c(%rip), %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	ind(%rip), %eax
	cmpl	%eax, %edx
	jg	.L16
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
