/*
summation from -5 to 5, =x^3+4x^2-13x
*/
  
define(x_r, l0)
define(y_r, l1)
define(s_r, l2)
define(a1, 4)
define(a2, 13)

	.global main
main:
	save %sp,-96,%sp
	clr %s_r		!initialize s_r=0
	mov 0, %y_r		!initialize y_r=0
	ba test			!branch back to the test	
	mov -5, %x_r		!initialize x_r=-5
loop:
	call .mul		
	mov %x_r, %o1		!o0=x^3
	call .mul
	add %x_r, a1, %o1	!o0=x^3+4x^2
	mov %o0, %y_r		!y=x^3+4x^2
	mov %x_r, %o0		!o0=x
	call .mul
	mov a2, %o1		!o0=13x
	sub %y_r, %o0, %y_r	!y=x^3+4x^2-13x
	add %s_r, %y_r, %s_r	!sum +=y
	add %x_r, 1, %x_r	!x++
test:
	cmp %x_r,5		!set condition codes
	ble,a loop		!branch on less or equal to zero
	mov %x_r, %o0		!first instruction of loop
end:	
	mov 1, %g1		!trap dispatch
	ta 0			!trap to system

