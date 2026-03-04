	.file	"formatstring.c"
	.text
	.globl	flag
	.bss
	.align 32
	.type	flag, @object
	.size	flag, 64
flag:
	.zero	64
	.section	.rodata
.LC0:
	.string	"\n%s\n"
	.text
	.globl	sigsegv_handler
	.type	sigsegv_handler, @function
sigsegv_handler:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	leaq	flag(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	sigsegv_handler, .-sigsegv_handler
	.globl	on_menu
	.type	on_menu, @function
on_menu:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L3
.L6:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	$1, %eax
	jmp	.L5
.L4:
	addl	$1, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L6
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	on_menu, .-on_menu
	.section	.rodata
.LC1:
	.string	"r"
.LC2:
	.string	"flag.txt"
.LC3:
	.string	"own debugging flag.\n"
	.align 8
.LC4:
	.string	"Please create 'flag.txt' in this directory with your"
.LC5:
	.string	"%s %s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L8
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %edi
	call	exit@PLT
.L8:
	movq	-8(%rbp), %rax
	movq	%rax, %rdx
	movl	$64, %esi
	leaq	flag(%rip), %rax
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	sigsegv_handler(%rip), %rax
	movq	%rax, %rsi
	movl	$11, %edi
	call	signal@PLT
	call	getegid@PLT
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edx
	movl	-12(%rbp), %ecx
	movl	-12(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	setresgid@PLT
	movl	$0, %eax
	call	serve_patrick
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC6:
	.string	"Breakf@st_Burger, Gr%114d_Cheese, Bac0n_D3luxe"
	.align 8
.LC7:
	.string	"Please choose from the following burgers:"
	.align 8
.LC8:
	.string	"Here comes the first customer Patrick who wants a giant bite."
	.align 8
.LC9:
	.string	"Can you help the picky customers find their favorite burger?"
	.align 8
.LC10:
	.string	"Welcome to our newly-opened burger place Pico 'n Patty!"
.LC11:
	.string	"%s %s\n%s\n%s %s\n%s"
.LC12:
	.string	"Enter your recommendation: "
.LC13:
	.string	"%s"
.LC14:
	.string	"Breakf@st_Burger"
.LC15:
	.string	"Gr%114d_Cheese"
.LC16:
	.string	"Bac0n_D3luxe"
.LC17:
	.string	"There is no such burger yet!"
	.align 8
.LC18:
	.string	"Try to serve him something of larger size!"
.LC19:
	.string	"Patrick is still hungry!"
.LC20:
	.string	"%s\n%s\n"
	.text
	.globl	serve_patrick
	.type	serve_patrick, @function
serve_patrick:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	subq	$8, %rsp
	leaq	.LC12(%rip), %rax
	pushq	%rax
	leaq	.LC6(%rip), %r9
	leaq	.LC7(%rip), %r8
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, -80(%rbp)
	leaq	.LC15(%rip), %rax
	movq	%rax, -72(%rbp)
	leaq	.LC16(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	-80(%rbp), %rcx
	leaq	-48(%rbp), %rax
	movl	$3, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	on_menu
	testl	%eax, %eax
	jne	.L11
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	jmp	.L15
.L11:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	%eax, -84(%rbp)
	cmpl	$64, -84(%rbp)
	jle	.L13
	movl	$0, %eax
	call	serve_bob@PLT
	jmp	.L15
.L13:
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
.L15:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	serve_patrick, .-serve_patrick
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
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
