	.file	"sh.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"runcmd"
	.align	3
.LC1:
	.string	"exec %s failed\n"
	.align	3
.LC2:
	.string	"open %s failed\n"
	.align	3
.LC3:
	.string	"pipe"
	.text
	.align	1
	.globl	runcmd
	.type	runcmd, @function
runcmd:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-72(s0)
	ld	a5,-72(s0)
	bne	a5,zero,.L2
	li	a0,1
	call	exit
.L2:
	ld	a5,-72(s0)
	lw	a5,0(a5)
	mv	a3,a5
	li	a4,5
	bgtu	a3,a4,.L3
	slli	a4,a5,2
	lui	a5,%hi(.L5)
	addi	a5,a5,%lo(.L5)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L5:
	.word	.L3
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
	.text
.L3:
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	panic
.L9:
	ld	a5,-72(s0)
	sd	a5,-56(s0)
	ld	a5,-56(s0)
	ld	a5,8(a5)
	bne	a5,zero,.L10
	li	a0,1
	call	exit
.L10:
	ld	a5,-56(s0)
	ld	a4,8(a5)
	ld	a5,-56(s0)
	addi	a5,a5,8
	mv	a1,a5
	mv	a0,a4
	call	exec
	ld	a5,-56(s0)
	ld	a5,8(a5)
	mv	a2,a5
	lui	a5,%hi(.LC1)
	addi	a1,a5,%lo(.LC1)
	li	a0,2
	call	fprintf
	j	.L11
.L8:
	ld	a5,-72(s0)
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	lw	a5,36(a5)
	mv	a0,a5
	call	close
	ld	a5,-48(s0)
	ld	a4,16(a5)
	ld	a5,-48(s0)
	lw	a5,32(a5)
	mv	a1,a5
	mv	a0,a4
	call	open
	mv	a5,a0
	bge	a5,zero,.L12
	ld	a5,-48(s0)
	ld	a5,16(a5)
	mv	a2,a5
	lui	a5,%hi(.LC2)
	addi	a1,a5,%lo(.LC2)
	li	a0,2
	call	fprintf
	li	a0,1
	call	exit
.L12:
	ld	a5,-48(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	runcmd
	j	.L11
.L6:
	ld	a5,-72(s0)
	sd	a5,-32(s0)
	call	fork1
	mv	a5,a0
	bne	a5,zero,.L13
	ld	a5,-32(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	runcmd
.L13:
	li	a0,0
	call	wait
	ld	a5,-32(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	runcmd
	j	.L11
.L7:
	ld	a5,-72(s0)
	sd	a5,-40(s0)
	addi	a5,s0,-64
	mv	a0,a5
	call	pipe
	mv	a5,a0
	bge	a5,zero,.L14
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	panic
.L14:
	call	fork1
	mv	a5,a0
	bne	a5,zero,.L15
	li	a0,1
	call	close
	lw	a5,-60(s0)
	mv	a0,a5
	call	dup
	lw	a5,-64(s0)
	mv	a0,a5
	call	close
	lw	a5,-60(s0)
	mv	a0,a5
	call	close
	ld	a5,-40(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	runcmd
.L15:
	call	fork1
	mv	a5,a0
	bne	a5,zero,.L16
	li	a0,0
	call	close
	lw	a5,-64(s0)
	mv	a0,a5
	call	dup
	lw	a5,-64(s0)
	mv	a0,a5
	call	close
	lw	a5,-60(s0)
	mv	a0,a5
	call	close
	ld	a5,-40(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	runcmd
.L16:
	lw	a5,-64(s0)
	mv	a0,a5
	call	close
	lw	a5,-60(s0)
	mv	a0,a5
	call	close
	li	a0,0
	call	wait
	li	a0,0
	call	wait
	j	.L11
.L4:
	ld	a5,-72(s0)
	sd	a5,-24(s0)
	call	fork1
	mv	a5,a0
	bne	a5,zero,.L18
	ld	a5,-24(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	runcmd
.L18:
	nop
.L11:
	li	a0,0
	call	exit
	.size	runcmd, .-runcmd
	.section	.rodata
	.align	3
.LC4:
	.string	"$ "
	.text
	.align	1
	.globl	getcmd
	.type	getcmd, @function
getcmd:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	mv	a5,a1
	sw	a5,-28(s0)
	li	a2,2
	lui	a5,%hi(.LC4)
	addi	a1,a5,%lo(.LC4)
	li	a0,2
	call	write
	lw	a5,-28(s0)
	mv	a2,a5
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	lw	a5,-28(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	gets
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L20
	li	a5,-1
	j	.L21
.L20:
	li	a5,0
.L21:
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	getcmd, .-getcmd
	.section	.rodata
	.align	3
.LC5:
	.string	"console"
	.align	3
.LC6:
	.string	"cannot cd %s\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	j	.L23
.L25:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L23
	lw	a5,-20(s0)
	mv	a0,a5
	call	close
	j	.L24
.L23:
	li	a1,2
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	open
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a5,a5
	bge	a5,zero,.L25
.L24:
	j	.L26
.L30:
	lui	a5,%hi(buf.0)
	addi	a5,a5,%lo(buf.0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,99
	bne	a4,a5,.L27
	lui	a5,%hi(buf.0)
	addi	a5,a5,%lo(buf.0)
	lbu	a5,1(a5)
	mv	a4,a5
	li	a5,100
	bne	a4,a5,.L27
	lui	a5,%hi(buf.0)
	addi	a5,a5,%lo(buf.0)
	lbu	a5,2(a5)
	mv	a4,a5
	li	a5,32
	bne	a4,a5,.L27
	lui	a5,%hi(buf.0)
	addi	a0,a5,%lo(buf.0)
	call	strlen
	mv	a5,a0
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a3,a5
	lui	a5,%hi(buf.0)
	addi	a4,a5,%lo(buf.0)
	slli	a5,a3,32
	srli	a5,a5,32
	add	a5,a4,a5
	sb	zero,0(a5)
	lui	a5,%hi(buf.0+3)
	addi	a5,a5,%lo(buf.0+3)
	mv	a0,a5
	call	chdir
	mv	a5,a0
	bge	a5,zero,.L26
	lui	a5,%hi(buf.0+3)
	addi	a5,a5,%lo(buf.0+3)
	mv	a2,a5
	lui	a5,%hi(.LC6)
	addi	a1,a5,%lo(.LC6)
	li	a0,2
	call	fprintf
	j	.L26
.L27:
	call	fork1
	mv	a5,a0
	bne	a5,zero,.L29
	lui	a5,%hi(buf.0)
	addi	a0,a5,%lo(buf.0)
	call	parsecmd
	mv	a5,a0
	mv	a0,a5
	call	runcmd
.L29:
	li	a0,0
	call	wait
.L26:
	li	a1,100
	lui	a5,%hi(buf.0)
	addi	a0,a5,%lo(buf.0)
	call	getcmd
	mv	a5,a0
	bge	a5,zero,.L30
	li	a0,0
	call	exit
	.size	main, .-main
	.section	.rodata
	.align	3
.LC7:
	.string	"%s\n"
	.text
	.align	1
	.globl	panic
	.type	panic, @function
panic:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a2,-24(s0)
	lui	a5,%hi(.LC7)
	addi	a1,a5,%lo(.LC7)
	li	a0,2
	call	fprintf
	li	a0,1
	call	exit
	.size	panic, .-panic
	.section	.rodata
	.align	3
.LC8:
	.string	"fork"
	.text
	.align	1
	.globl	fork1
	.type	fork1, @function
fork1:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	call	fork
	mv	a5,a0
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,-1
	bne	a4,a5,.L33
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	panic
.L33:
	lw	a5,-20(s0)
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	fork1, .-fork1
	.align	1
	.globl	execcmd
	.type	execcmd, @function
execcmd:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a0,168
	call	malloc
	sd	a0,-24(s0)
	li	a2,168
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	ld	a5,-24(s0)
	li	a4,1
	sw	a4,0(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	execcmd, .-execcmd
	.align	1
	.globl	redircmd
	.type	redircmd, @function
redircmd:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	mv	a5,a3
	sw	a5,-60(s0)
	mv	a5,a4
	sw	a5,-64(s0)
	li	a0,40
	call	malloc
	sd	a0,-24(s0)
	li	a2,40
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	ld	a5,-24(s0)
	li	a4,2
	sw	a4,0(a5)
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,8(a5)
	ld	a5,-24(s0)
	ld	a4,-48(s0)
	sd	a4,16(a5)
	ld	a5,-24(s0)
	ld	a4,-56(s0)
	sd	a4,24(a5)
	ld	a5,-24(s0)
	lw	a4,-60(s0)
	sw	a4,32(a5)
	ld	a5,-24(s0)
	lw	a4,-64(s0)
	sw	a4,36(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	redircmd, .-redircmd
	.align	1
	.globl	pipecmd
	.type	pipecmd, @function
pipecmd:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	li	a0,24
	call	malloc
	sd	a0,-24(s0)
	li	a2,24
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	ld	a5,-24(s0)
	li	a4,3
	sw	a4,0(a5)
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,8(a5)
	ld	a5,-24(s0)
	ld	a4,-48(s0)
	sd	a4,16(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	pipecmd, .-pipecmd
	.align	1
	.globl	listcmd
	.type	listcmd, @function
listcmd:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	li	a0,24
	call	malloc
	sd	a0,-24(s0)
	li	a2,24
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	ld	a5,-24(s0)
	li	a4,4
	sw	a4,0(a5)
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,8(a5)
	ld	a5,-24(s0)
	ld	a4,-48(s0)
	sd	a4,16(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	listcmd, .-listcmd
	.align	1
	.globl	backcmd
	.type	backcmd, @function
backcmd:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	li	a0,16
	call	malloc
	sd	a0,-24(s0)
	li	a2,16
	li	a1,0
	ld	a0,-24(s0)
	call	memset
	ld	a5,-24(s0)
	li	a4,5
	sw	a4,0(a5)
	ld	a5,-24(s0)
	ld	a4,-40(s0)
	sd	a4,8(a5)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	backcmd, .-backcmd
	.globl	whitespace
	.section	.sdata,"aw"
	.align	3
	.type	whitespace, @object
	.size	whitespace, 6
whitespace:
	.string	" \t\r\n\013"
	.globl	symbols
	.align	3
	.type	symbols, @object
	.size	symbols, 8
symbols:
	.string	"<|>&;()"
	.text
	.align	1
	.globl	gettoken
	.type	gettoken, @function
gettoken:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	sd	a3,-64(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
	j	.L46
.L48:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L46:
	ld	a4,-24(s0)
	ld	a5,-48(s0)
	bgeu	a4,a5,.L47
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(whitespace)
	addi	a0,a5,%lo(whitespace)
	call	strchr
	mv	a5,a0
	bne	a5,zero,.L48
.L47:
	ld	a5,-56(s0)
	beq	a5,zero,.L49
	ld	a5,-56(s0)
	ld	a4,-24(s0)
	sd	a4,0(a5)
.L49:
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	mv	a3,a5
	li	a4,124
	beq	a3,a4,.L50
	mv	a3,a5
	li	a4,124
	bgt	a3,a4,.L51
	mv	a3,a5
	li	a4,62
	beq	a3,a4,.L52
	mv	a3,a5
	li	a4,62
	bgt	a3,a4,.L51
	mv	a3,a5
	li	a4,60
	bgt	a3,a4,.L51
	mv	a3,a5
	li	a4,59
	bge	a3,a4,.L50
	mv	a3,a5
	li	a4,41
	bgt	a3,a4,.L51
	mv	a3,a5
	li	a4,40
	bge	a3,a4,.L50
	beq	a5,zero,.L64
	mv	a4,a5
	li	a5,38
	bne	a4,a5,.L51
.L50:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L54
.L52:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	li	a5,62
	bne	a4,a5,.L65
	li	a5,43
	sw	a5,-28(s0)
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L65
.L51:
	li	a5,97
	sw	a5,-28(s0)
	j	.L56
.L58:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L56:
	ld	a4,-24(s0)
	ld	a5,-48(s0)
	bgeu	a4,a5,.L66
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(whitespace)
	addi	a0,a5,%lo(whitespace)
	call	strchr
	mv	a5,a0
	bne	a5,zero,.L66
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(symbols)
	addi	a0,a5,%lo(symbols)
	call	strchr
	mv	a5,a0
	beq	a5,zero,.L58
	j	.L66
.L64:
	nop
	j	.L54
.L65:
	nop
	j	.L54
.L66:
	nop
.L54:
	ld	a5,-64(s0)
	beq	a5,zero,.L60
	ld	a5,-64(s0)
	ld	a4,-24(s0)
	sd	a4,0(a5)
	j	.L60
.L62:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L60:
	ld	a4,-24(s0)
	ld	a5,-48(s0)
	bgeu	a4,a5,.L61
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(whitespace)
	addi	a0,a5,%lo(whitespace)
	call	strchr
	mv	a5,a0
	bne	a5,zero,.L62
.L61:
	ld	a5,-40(s0)
	ld	a4,-24(s0)
	sd	a4,0(a5)
	lw	a5,-28(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	gettoken, .-gettoken
	.align	1
	.globl	peek
	.type	peek, @function
peek:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	ld	a5,-40(s0)
	ld	a5,0(a5)
	sd	a5,-24(s0)
	j	.L68
.L70:
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L68:
	ld	a4,-24(s0)
	ld	a5,-48(s0)
	bgeu	a4,a5,.L69
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(whitespace)
	addi	a0,a5,%lo(whitespace)
	call	strchr
	mv	a5,a0
	bne	a5,zero,.L70
.L69:
	ld	a5,-40(s0)
	ld	a4,-24(s0)
	sd	a4,0(a5)
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	beq	a5,zero,.L71
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	ld	a0,-56(s0)
	call	strchr
	mv	a5,a0
	beq	a5,zero,.L71
	li	a5,1
	j	.L72
.L71:
	li	a5,0
.L72:
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	peek, .-peek
	.section	.rodata
	.align	3
.LC9:
	.string	""
	.align	3
.LC10:
	.string	"leftovers: %s\n"
	.align	3
.LC11:
	.string	"syntax"
	.text
	.align	1
	.globl	parsecmd
	.type	parsecmd, @function
parsecmd:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	ld	s1,-56(s0)
	ld	a5,-56(s0)
	mv	a0,a5
	call	strlen
	mv	a5,a0
	sext.w	a5,a5
	slli	a5,a5,32
	srli	a5,a5,32
	add	a5,s1,a5
	sd	a5,-40(s0)
	addi	a5,s0,-56
	ld	a1,-40(s0)
	mv	a0,a5
	call	parseline
	sd	a0,-48(s0)
	addi	a4,s0,-56
	lui	a5,%hi(.LC9)
	addi	a2,a5,%lo(.LC9)
	ld	a1,-40(s0)
	mv	a0,a4
	call	peek
	ld	a5,-56(s0)
	ld	a4,-40(s0)
	beq	a4,a5,.L75
	ld	a5,-56(s0)
	mv	a2,a5
	lui	a5,%hi(.LC10)
	addi	a1,a5,%lo(.LC10)
	li	a0,2
	call	fprintf
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	panic
.L75:
	ld	a0,-48(s0)
	call	nulterminate
	ld	a5,-48(s0)
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	addi	sp,sp,64
	jr	ra
	.size	parsecmd, .-parsecmd
	.section	.rodata
	.align	3
.LC12:
	.string	"&"
	.align	3
.LC13:
	.string	";"
	.text
	.align	1
	.globl	parseline
	.type	parseline, @function
parseline:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	parsepipe
	sd	a0,-24(s0)
	j	.L78
.L79:
	li	a3,0
	li	a2,0
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	gettoken
	ld	a0,-24(s0)
	call	backcmd
	sd	a0,-24(s0)
.L78:
	lui	a5,%hi(.LC12)
	addi	a2,a5,%lo(.LC12)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	peek
	mv	a5,a0
	bne	a5,zero,.L79
	lui	a5,%hi(.LC13)
	addi	a2,a5,%lo(.LC13)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	peek
	mv	a5,a0
	beq	a5,zero,.L80
	li	a3,0
	li	a2,0
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	gettoken
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	parseline
	mv	a5,a0
	mv	a1,a5
	ld	a0,-24(s0)
	call	listcmd
	sd	a0,-24(s0)
.L80:
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	parseline, .-parseline
	.section	.rodata
	.align	3
.LC14:
	.string	"|"
	.text
	.align	1
	.globl	parsepipe
	.type	parsepipe, @function
parsepipe:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	parseexec
	sd	a0,-24(s0)
	lui	a5,%hi(.LC14)
	addi	a2,a5,%lo(.LC14)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	peek
	mv	a5,a0
	beq	a5,zero,.L83
	li	a3,0
	li	a2,0
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	gettoken
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	parsepipe
	mv	a5,a0
	mv	a1,a5
	ld	a0,-24(s0)
	call	pipecmd
	sd	a0,-24(s0)
.L83:
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	parsepipe, .-parsepipe
	.section	.rodata
	.align	3
.LC15:
	.string	"missing file for redirection"
	.align	3
.LC16:
	.string	"<>"
	.text
	.align	1
	.globl	parseredirs
	.type	parseredirs, @function
parseredirs:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	j	.L86
.L90:
	li	a3,0
	li	a2,0
	ld	a1,-72(s0)
	ld	a0,-64(s0)
	call	gettoken
	mv	a5,a0
	sw	a5,-20(s0)
	addi	a4,s0,-40
	addi	a5,s0,-32
	mv	a3,a4
	mv	a2,a5
	ld	a1,-72(s0)
	ld	a0,-64(s0)
	call	gettoken
	mv	a5,a0
	mv	a4,a5
	li	a5,97
	beq	a4,a5,.L87
	lui	a5,%hi(.LC15)
	addi	a0,a5,%lo(.LC15)
	call	panic
.L87:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,62
	beq	a4,a5,.L88
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,62
	bgt	a4,a5,.L86
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,43
	beq	a4,a5,.L89
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,60
	bne	a4,a5,.L86
	ld	a5,-32(s0)
	ld	a2,-40(s0)
	li	a4,0
	li	a3,0
	mv	a1,a5
	ld	a0,-56(s0)
	call	redircmd
	sd	a0,-56(s0)
	j	.L86
.L88:
	ld	a5,-32(s0)
	ld	a2,-40(s0)
	li	a4,1
	li	a3,1537
	mv	a1,a5
	ld	a0,-56(s0)
	call	redircmd
	sd	a0,-56(s0)
	j	.L86
.L89:
	ld	a5,-32(s0)
	ld	a2,-40(s0)
	li	a4,1
	li	a3,513
	mv	a1,a5
	ld	a0,-56(s0)
	call	redircmd
	sd	a0,-56(s0)
	nop
.L86:
	lui	a5,%hi(.LC16)
	addi	a2,a5,%lo(.LC16)
	ld	a1,-72(s0)
	ld	a0,-64(s0)
	call	peek
	mv	a5,a0
	bne	a5,zero,.L90
	ld	a5,-56(s0)
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	parseredirs, .-parseredirs
	.section	.rodata
	.align	3
.LC17:
	.string	"("
	.align	3
.LC18:
	.string	"parseblock"
	.align	3
.LC19:
	.string	")"
	.align	3
.LC20:
	.string	"syntax - missing )"
	.text
	.align	1
	.globl	parseblock
	.type	parseblock, @function
parseblock:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	lui	a5,%hi(.LC17)
	addi	a2,a5,%lo(.LC17)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	peek
	mv	a5,a0
	bne	a5,zero,.L93
	lui	a5,%hi(.LC18)
	addi	a0,a5,%lo(.LC18)
	call	panic
.L93:
	li	a3,0
	li	a2,0
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	gettoken
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	parseline
	sd	a0,-24(s0)
	lui	a5,%hi(.LC19)
	addi	a2,a5,%lo(.LC19)
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	peek
	mv	a5,a0
	bne	a5,zero,.L94
	lui	a5,%hi(.LC20)
	addi	a0,a5,%lo(.LC20)
	call	panic
.L94:
	li	a3,0
	li	a2,0
	ld	a1,-48(s0)
	ld	a0,-40(s0)
	call	gettoken
	ld	a2,-48(s0)
	ld	a1,-40(s0)
	ld	a0,-24(s0)
	call	parseredirs
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	parseblock, .-parseblock
	.section	.rodata
	.align	3
.LC21:
	.string	"too many args"
	.align	3
.LC22:
	.string	"|)&;"
	.text
	.align	1
	.globl	parseexec
	.type	parseexec, @function
parseexec:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	lui	a5,%hi(.LC17)
	addi	a2,a5,%lo(.LC17)
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	peek
	mv	a5,a0
	beq	a5,zero,.L97
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	parseblock
	mv	a5,a0
	j	.L105
.L97:
	call	execcmd
	sd	a0,-32(s0)
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	sw	zero,-20(s0)
	ld	a2,-80(s0)
	ld	a1,-72(s0)
	ld	a0,-32(s0)
	call	parseredirs
	sd	a0,-32(s0)
	j	.L99
.L104:
	addi	a4,s0,-64
	addi	a5,s0,-56
	mv	a3,a4
	mv	a2,a5
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	gettoken
	mv	a5,a0
	sw	a5,-44(s0)
	lw	a5,-44(s0)
	sext.w	a5,a5
	beq	a5,zero,.L106
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,97
	beq	a4,a5,.L102
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	panic
.L102:
	ld	a4,-56(s0)
	ld	a3,-40(s0)
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a3,a5
	sd	a4,8(a5)
	ld	a4,-64(s0)
	ld	a3,-40(s0)
	lw	a5,-20(s0)
	addi	a5,a5,10
	slli	a5,a5,3
	add	a5,a3,a5
	sd	a4,8(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L103
	lui	a5,%hi(.LC21)
	addi	a0,a5,%lo(.LC21)
	call	panic
.L103:
	ld	a2,-80(s0)
	ld	a1,-72(s0)
	ld	a0,-32(s0)
	call	parseredirs
	sd	a0,-32(s0)
.L99:
	lui	a5,%hi(.LC22)
	addi	a2,a5,%lo(.LC22)
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	peek
	mv	a5,a0
	beq	a5,zero,.L104
	j	.L101
.L106:
	nop
.L101:
	ld	a4,-40(s0)
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	sd	zero,8(a5)
	ld	a4,-40(s0)
	lw	a5,-20(s0)
	addi	a5,a5,10
	slli	a5,a5,3
	add	a5,a4,a5
	sd	zero,8(a5)
	ld	a5,-32(s0)
.L105:
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	parseexec, .-parseexec
	.align	1
	.globl	nulterminate
	.type	nulterminate, @function
nulterminate:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-72(s0)
	ld	a5,-72(s0)
	bne	a5,zero,.L108
	li	a5,0
	j	.L109
.L108:
	ld	a5,-72(s0)
	lw	a5,0(a5)
	mv	a3,a5
	li	a4,5
	bgtu	a3,a4,.L110
	slli	a4,a5,2
	lui	a5,%hi(.L112)
	addi	a5,a5,%lo(.L112)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L112:
	.word	.L110
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L111
	.text
.L116:
	ld	a5,-72(s0)
	sd	a5,-64(s0)
	sw	zero,-20(s0)
	j	.L117
.L118:
	ld	a4,-64(s0)
	lw	a5,-20(s0)
	addi	a5,a5,10
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,8(a5)
	sb	zero,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L117:
	ld	a4,-64(s0)
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,8(a5)
	bne	a5,zero,.L118
	j	.L110
.L115:
	ld	a5,-72(s0)
	sd	a5,-56(s0)
	ld	a5,-56(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	nulterminate
	ld	a5,-56(s0)
	ld	a5,24(a5)
	sb	zero,0(a5)
	j	.L110
.L114:
	ld	a5,-72(s0)
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	nulterminate
	ld	a5,-48(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	nulterminate
	j	.L110
.L113:
	ld	a5,-72(s0)
	sd	a5,-40(s0)
	ld	a5,-40(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	nulterminate
	ld	a5,-40(s0)
	ld	a5,16(a5)
	mv	a0,a5
	call	nulterminate
	j	.L110
.L111:
	ld	a5,-72(s0)
	sd	a5,-32(s0)
	ld	a5,-32(s0)
	ld	a5,8(a5)
	mv	a0,a5
	call	nulterminate
	nop
.L110:
	ld	a5,-72(s0)
.L109:
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	nulterminate, .-nulterminate
	.local	buf.0
	.comm	buf.0,100,8
	.ident	"GCC: () 10.2.0"
