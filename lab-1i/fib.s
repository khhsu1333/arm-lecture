	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3, r4, r5, r6, lr}

	mov r3, #0			@ sum
	mov r4, #1			@ result
	mov r5 ,#-1			@ previous
	mov r6, #0			@ i

@ loop start
.L3:
	cmp r6, r0			@ i <= x ?
	bgt .L4

	add r3, r5, r4			@ sum = previous + result
	mov r5, r4			@ previous = result
	mov r4, r3			@ result = sum

	add r6, r6, #1			@ i++
	b .L3

@ loop end
.L4:
	mov r0, r4 			@ return result
	pop {r3, r4, r5, r6, pc}

	.size fibonacci, .-fibonacci
	.end
