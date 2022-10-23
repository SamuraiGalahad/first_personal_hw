	.file	"main_param.c"
	.intel_syntax noprefix
	.text
	.globl	make_b
	.type	make_b, @function
# функция для создания массива b	
make_b:
	push	rbp # начало фрейма функции
	mov	rbp, rsp # функция выделила себе память
	mov	QWORD PTR -24[rbp], rdi	# первый массив
	mov	QWORD PTR -32[rbp], rsi	# второй массив
	mov	DWORD PTR -36[rbp], edx	# n
	mov	DWORD PTR -40[rbp], ecx	# ind_last_positive
	mov	DWORD PTR -44[rbp], r8d # ind_last_negative
	mov	DWORD PTR -8[rbp], 0	# ind
	mov	DWORD PTR -4[rbp], 0	# c
	mov	DWORD PTR -8[rbp], 0	# ind в for
	jmp	.L2
.L6:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -40[rbp]
	je	.L3
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jne	.L4
.L3:
	add	DWORD PTR -4[rbp], 1
	jmp	.L5
.L4:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, [rdx+rax]
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR [rcx]
	mov	DWORD PTR [rdx], eax
.L5:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L6
	mov	eax, DWORD PTR -4[rbp]
	pop	rbp
	ret
	.size	make_b, .-make_b
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
	lea	r11, -524288[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 64
	mov	DWORD PTR -524340[rbp], edi #argc
	mov	QWORD PTR -524352[rbp], rsi #argv
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -524316[rbp], -1 # ind_of_first_positive
	mov	DWORD PTR -524312[rbp], -1 # ind_of_last_negative
	mov	DWORD PTR -524308[rbp], 0 # c
	lea	rax, -524324[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -524324[rbp] # запись в n
	test	eax, eax
	jns	.L9
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L19
.L9:
	mov	DWORD PTR -524320[rbp], 0
	jmp	.L11
.L12:
	# заполнение самого элемента в массиве
	lea	rdx, -524304[rbp]
	mov	eax, DWORD PTR -524320[rbp]
	cdqe
	sal	rax, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -524320[rbp], 1
.L11:
	# запись в массив через цикл
	mov	eax, DWORD PTR -524324[rbp] #ind меняем
	cmp	DWORD PTR -524320[rbp], eax
	jl	.L12
	mov	DWORD PTR -524320[rbp], 0
	jmp	.L13
.L16:
	mov	eax, DWORD PTR -524320[rbp]
	cdqe
	mov	eax, DWORD PTR -524304[rbp+rax*4]
	test	eax, eax
	jle	.L14
	cmp	DWORD PTR -524316[rbp], -1
	jne	.L14
	mov	eax, DWORD PTR -524320[rbp]
	mov	DWORD PTR -524316[rbp], eax
.L14:
	mov	eax, DWORD PTR -524320[rbp]
	cdqe
	mov	eax, DWORD PTR -524304[rbp+rax*4]
	test	eax, eax
	jns	.L15
	mov	eax, DWORD PTR -524320[rbp]
	mov	DWORD PTR -524312[rbp], eax
.L15:
	add	DWORD PTR -524320[rbp], 1
.L13:
	mov	eax, DWORD PTR -524324[rbp]
	cmp	DWORD PTR -524320[rbp], eax
	jl	.L16
	mov	edx, DWORD PTR -524324[rbp]
	mov	edi, DWORD PTR -524312[rbp]
	mov	ecx, DWORD PTR -524316[rbp]
	lea	rsi, -262160[rbp]
	lea	rax, -524304[rbp]
	mov	r8d, edi
	mov	rdi, rax
	call	make_b
	mov	DWORD PTR -524308[rbp], eax
	mov	DWORD PTR -524320[rbp], 0
	jmp	.L17
.L18:
	mov	eax, DWORD PTR -524320[rbp]
	cdqe
	mov	eax, DWORD PTR -262160[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -524320[rbp], 1
.L17:
	mov	eax, DWORD PTR -524324[rbp]
	sub	eax, DWORD PTR -524308[rbp]
	cmp	DWORD PTR -524320[rbp], eax
	jl	.L18
	mov	eax, 0
.L19:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
