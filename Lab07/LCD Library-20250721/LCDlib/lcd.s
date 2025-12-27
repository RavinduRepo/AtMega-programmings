	.file	"lcd.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.type	toggle_e, @function
toggle_e:
.LFB7:
	.file 1 "lcd.c"
	.loc 1 102 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 103 0
	sbi 0x8,2
.LVL0:
.LBB28:
.LBB29:
	.file 2 "/usr/lib/avr/include/util/delay.h"
	.loc 2 276 0
	ldi r24,lo8(5)
1:	dec r24
	brne 1b
	nop
.LVL1:
.LBE29:
.LBE28:
	.loc 1 105 0
	cbi 0x8,2
/* epilogue start */
	.loc 1 106 0
	ret
	.cfi_endproc
.LFE7:
	.size	toggle_e, .-toggle_e
	.type	lcd_write, @function
lcd_write:
.LFB8:
	.loc 1 119 0
	.cfi_startproc
.LVL2:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 123 0
	tst r22
	breq .L3
	.loc 1 124 0
	sbi 0x8,0
.L4:
	.loc 1 128 0
	cbi 0x8,1
	.loc 1 151 0
	sbi 0xa,2
	.loc 1 152 0
	sbi 0xa,3
	.loc 1 153 0
	sbi 0xa,4
	.loc 1 154 0
	sbi 0xa,5
	.loc 1 157 0
	cbi 0xb,5
	.loc 1 158 0
	cbi 0xb,4
	.loc 1 159 0
	cbi 0xb,3
	.loc 1 160 0
	cbi 0xb,2
	.loc 1 161 0
	sbrc r28,7
	.loc 1 161 0 discriminator 1
	sbi 0xb,5
.L5:
	.loc 1 162 0
	sbrc r28,6
	.loc 1 162 0 discriminator 1
	sbi 0xb,4
.L6:
	.loc 1 163 0
	sbrc r28,5
	.loc 1 163 0 discriminator 1
	sbi 0xb,3
.L7:
	.loc 1 164 0
	sbrc r28,4
	.loc 1 164 0 discriminator 1
	sbi 0xb,2
.L8:
	.loc 1 165 0
	call toggle_e
.LVL3:
	.loc 1 168 0
	cbi 0xb,5
	.loc 1 169 0
	cbi 0xb,4
	.loc 1 170 0
	cbi 0xb,3
	.loc 1 171 0
	cbi 0xb,2
	.loc 1 172 0
	sbrc r28,3
	.loc 1 172 0 discriminator 1
	sbi 0xb,5
.L9:
	.loc 1 173 0
	sbrc r28,2
	.loc 1 173 0 discriminator 1
	sbi 0xb,4
.L10:
	.loc 1 174 0
	sbrc r28,1
	.loc 1 174 0 discriminator 1
	sbi 0xb,3
.L11:
	.loc 1 175 0
	sbrc r28,0
	.loc 1 175 0 discriminator 1
	sbi 0xb,2
.L12:
	.loc 1 176 0
	call toggle_e
.LVL4:
	.loc 1 179 0
	sbi 0xb,2
	.loc 1 180 0
	sbi 0xb,3
	.loc 1 181 0
	sbi 0xb,4
	.loc 1 182 0
	sbi 0xb,5
/* epilogue start */
	.loc 1 184 0
	pop r28
.LVL5:
	ret
.LVL6:
.L3:
	.loc 1 126 0
	cbi 0x8,0
	rjmp .L4
	.cfi_endproc
.LFE8:
	.size	lcd_write, .-lcd_write
	.type	lcd_read.constprop.0, @function
lcd_read.constprop.0:
.LFB22:
	.loc 1 199 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL7:
	.loc 1 207 0
	cbi 0x8,0
	.loc 1 208 0
	sbi 0x8,1
	.loc 1 230 0
	cbi 0xa,2
	.loc 1 231 0
	cbi 0xa,3
	.loc 1 232 0
	cbi 0xa,4
	.loc 1 233 0
	cbi 0xa,5
	.loc 1 236 0
	sbi 0x8,2
.LVL8:
.LBB30:
.LBB31:
	.loc 2 276 0
	ldi r24,lo8(5)
1:	dec r24
	brne 1b
	nop
.LVL9:
.LBE31:
.LBE30:
	.loc 1 239 0
	sbis 0x9,2
	rjmp .L43
	.loc 1 239 0
	ldi r24,lo8(16)
.L35:
.LVL10:
	.loc 1 240 0
	sbic 0x9,3
	.loc 1 240 0
	ori r24,lo8(32)
.LVL11:
.L36:
	.loc 1 241 0
	sbic 0x9,4
	.loc 1 241 0
	ori r24,lo8(64)
.LVL12:
.L37:
	.loc 1 242 0
	sbic 0x9,5
	.loc 1 242 0
	ori r24,lo8(-128)
.LVL13:
.L38:
	.loc 1 243 0
	cbi 0x8,2
.LVL14:
.LBB32:
.LBB33:
	.loc 2 276 0
	ldi r25,lo8(5)
1:	dec r25
	brne 1b
	nop
.LVL15:
.LBE33:
.LBE32:
	.loc 1 248 0
	sbi 0x8,2
.LVL16:
.LBB34:
.LBB35:
	.loc 2 276 0
	ldi r25,lo8(5)
1:	dec r25
	brne 1b
	nop
.LVL17:
.LBE35:
.LBE34:
	.loc 1 250 0
	sbic 0x9,2
	.loc 1 250 0
	ori r24,lo8(1)
.LVL18:
.L39:
	.loc 1 251 0
	sbic 0x9,3
	.loc 1 251 0
	ori r24,lo8(2)
.LVL19:
.L40:
	.loc 1 252 0
	sbic 0x9,4
	.loc 1 252 0
	ori r24,lo8(4)
.LVL20:
.L41:
	.loc 1 253 0
	sbic 0x9,5
	.loc 1 253 0
	ori r24,lo8(8)
.LVL21:
.L42:
	.loc 1 254 0
	cbi 0x8,2
/* epilogue start */
	.loc 1 257 0
	ret
.LVL22:
.L43:
	.loc 1 238 0
	ldi r24,0
	rjmp .L35
	.cfi_endproc
.LFE22:
	.size	lcd_read.constprop.0, .-lcd_read.constprop.0
	.type	lcd_waitbusy, @function
lcd_waitbusy:
.LFB10:
	.loc 1 270 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.L66:
	.loc 1 274 0 discriminator 1
	call lcd_read.constprop.0
.LVL23:
	sbrc r24,7
	rjmp .L66
.LVL24:
.LBB36:
.LBB37:
	.loc 2 276 0
	ldi r24,lo8(21)
1:	dec r24
	brne 1b
.LVL25:
	nop
.LVL26:
.LBE37:
.LBE36:
	.loc 1 280 0
	jmp lcd_read.constprop.0
.LVL27:
	.cfi_endproc
.LFE10:
	.size	lcd_waitbusy, .-lcd_waitbusy
.global	lcd_command
	.type	lcd_command, @function
lcd_command:
.LFB12:
	.loc 1 339 0
	.cfi_startproc
.LVL28:
	push r28
.LCFI1:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 340 0
	call lcd_waitbusy
.LVL29:
	.loc 1 341 0
	ldi r22,0
	mov r24,r28
/* epilogue start */
	.loc 1 342 0
	pop r28
.LVL30:
	.loc 1 341 0
	jmp lcd_write
.LVL31:
	.cfi_endproc
.LFE12:
	.size	lcd_command, .-lcd_command
.global	lcd_data
	.type	lcd_data, @function
lcd_data:
.LFB13:
	.loc 1 351 0
	.cfi_startproc
.LVL32:
	push r28
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 352 0
	call lcd_waitbusy
.LVL33:
	.loc 1 353 0
	ldi r22,lo8(1)
	mov r24,r28
/* epilogue start */
	.loc 1 354 0
	pop r28
.LVL34:
	.loc 1 353 0
	jmp lcd_write
.LVL35:
	.cfi_endproc
.LFE13:
	.size	lcd_data, .-lcd_data
.global	lcd_gotoxy
	.type	lcd_gotoxy, @function
lcd_gotoxy:
.LFB14:
	.loc 1 365 0
	.cfi_startproc
.LVL36:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 370 0
	cpse r22,__zero_reg__
	rjmp .L71
	.loc 1 371 0
	subi r24,lo8(-(-128))
.LVL37:
.L72:
	.loc 1 373 0
	jmp lcd_command
.LVL38:
.L71:
	subi r24,lo8(-(-64))
.LVL39:
	rjmp .L72
	.cfi_endproc
.LFE14:
	.size	lcd_gotoxy, .-lcd_gotoxy
.global	lcd_getxy
	.type	lcd_getxy, @function
lcd_getxy:
.LFB15:
	.loc 1 392 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 393 0
	call lcd_waitbusy
.LVL40:
	.loc 1 394 0
	ldi r25,0
/* epilogue start */
	ret
	.cfi_endproc
.LFE15:
	.size	lcd_getxy, .-lcd_getxy
.global	lcd_clrscr
	.type	lcd_clrscr, @function
lcd_clrscr:
.LFB16:
	.loc 1 401 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 402 0
	ldi r24,lo8(1)
	jmp lcd_command
.LVL41:
	.cfi_endproc
.LFE16:
	.size	lcd_clrscr, .-lcd_clrscr
.global	lcd_home
	.type	lcd_home, @function
lcd_home:
.LFB17:
	.loc 1 410 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 411 0
	ldi r24,lo8(2)
	jmp lcd_command
.LVL42:
	.cfi_endproc
.LFE17:
	.size	lcd_home, .-lcd_home
.global	lcd_putc
	.type	lcd_putc, @function
lcd_putc:
.LFB18:
	.loc 1 421 0
	.cfi_startproc
.LVL43:
	push r28
.LCFI3:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 425 0
	call lcd_waitbusy
.LVL44:
	.loc 1 426 0
	cpi r28,lo8(10)
	brne .L77
.LVL45:
.LBB40:
.LBB41:
	.loc 1 298 0
	cpi r24,lo8(64)
	brlo .L79
	.loc 1 301 0
	ldi r24,0
.LVL46:
.L78:
	.loc 1 324 0
	subi r24,lo8(-(-128))
.LVL47:
/* epilogue start */
.LBE41:
.LBE40:
	.loc 1 459 0
	pop r28
.LVL48:
.LBB43:
.LBB42:
	.loc 1 324 0
	jmp lcd_command
.LVL49:
.L79:
	.loc 1 299 0
	ldi r24,lo8(64)
.LVL50:
	rjmp .L78
.LVL51:
.L77:
.LBE42:
.LBE43:
	.loc 1 456 0
	ldi r22,lo8(1)
	mov r24,r28
.LVL52:
/* epilogue start */
	.loc 1 459 0
	pop r28
.LVL53:
	.loc 1 456 0
	jmp lcd_write
.LVL54:
	.cfi_endproc
.LFE18:
	.size	lcd_putc, .-lcd_putc
.global	lcd_puts
	.type	lcd_puts, @function
lcd_puts:
.LFB19:
	.loc 1 469 0
	.cfi_startproc
.LVL55:
	push r28
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI5:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
.LVL56:
.L81:
	.loc 1 472 0
	ld r24,Y+
.LVL57:
	cpse r24,__zero_reg__
	rjmp .L82
/* epilogue start */
	.loc 1 476 0
	pop r29
	pop r28
.LVL58:
	ret
.LVL59:
.L82:
	.loc 1 473 0
	call lcd_putc
.LVL60:
	rjmp .L81
	.cfi_endproc
.LFE19:
	.size	lcd_puts, .-lcd_puts
.global	lcd_puts_p
	.type	lcd_puts_p, @function
lcd_puts_p:
.LFB20:
	.loc 1 486 0
	.cfi_startproc
.LVL61:
	push r28
.LCFI6:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI7:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	movw r28,r24
.LVL62:
.L84:
.LBB44:
	.loc 1 489 0
	movw r30,r28
/* #APP */
 ;  489 "lcd.c" 1
	lpm r24, Z
	
 ;  0 "" 2
.LVL63:
/* #NOAPP */
	adiw r28,1
.LVL64:
.LBE44:
	.loc 1 489 0
	cpse r24,__zero_reg__
	rjmp .L85
/* epilogue start */
	.loc 1 493 0
	pop r29
	pop r28
.LVL65:
	ret
.LVL66:
.L85:
	.loc 1 490 0
	call lcd_putc
.LVL67:
	rjmp .L84
	.cfi_endproc
.LFE20:
	.size	lcd_puts_p, .-lcd_puts_p
.global	lcd_init
	.type	lcd_init, @function
lcd_init:
.LFB21:
	.loc 1 505 0
	.cfi_startproc
.LVL68:
	push r28
.LCFI8:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
/* prologue: function */
/* frame size = 0 */
/* stack size = 1 */
.L__stack_usage = 1
	mov r28,r24
	.loc 1 531 0
	sbi 0x7,0
	.loc 1 532 0
	sbi 0x7,1
	.loc 1 533 0
	sbi 0x7,2
	.loc 1 534 0
	sbi 0xa,2
	.loc 1 535 0
	sbi 0xa,3
	.loc 1 536 0
	sbi 0xa,4
	.loc 1 537 0
	sbi 0xa,5
.LVL69:
.LBB45:
.LBB46:
	.loc 2 276 0
	ldi r24,lo8(-1537)
	ldi r25,hi8(-1537)
1:	sbiw r24,1
	brne 1b
.LVL70:
	rjmp .
	nop
.LVL71:
.LBE46:
.LBE45:
	.loc 1 542 0
	sbi 0xb,3
	.loc 1 543 0
	sbi 0xb,2
	.loc 1 544 0
	call toggle_e
.LVL72:
.LBB47:
.LBB48:
	.loc 2 276 0
	ldi r24,lo8(19999)
	ldi r25,hi8(19999)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL73:
.LBE48:
.LBE47:
	.loc 1 548 0
	call toggle_e
.LVL74:
.LBB49:
.LBB50:
	.loc 2 276 0
	ldi r24,lo8(255)
	ldi r25,hi8(255)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL75:
.LBE50:
.LBE49:
	.loc 1 552 0
	call toggle_e
.LVL76:
.LBB51:
.LBB52:
	.loc 2 276 0
	ldi r24,lo8(255)
	ldi r25,hi8(255)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL77:
.LBE52:
.LBE51:
	.loc 1 556 0
	cbi 0xb,2
	.loc 1 557 0
	call toggle_e
.LVL78:
.LBB53:
.LBB54:
	.loc 2 276 0
	ldi r24,lo8(255)
	ldi r25,hi8(255)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL79:
.LBE54:
.LBE53:
	.loc 1 585 0
	ldi r24,lo8(40)
	call lcd_command
.LVL80:
	.loc 1 587 0
	ldi r24,lo8(8)
	call lcd_command
.LVL81:
	.loc 1 588 0
	call lcd_clrscr
.LVL82:
	.loc 1 589 0
	ldi r24,lo8(6)
	call lcd_command
.LVL83:
	.loc 1 590 0
	mov r24,r28
/* epilogue start */
	.loc 1 592 0
	pop r28
.LVL84:
	.loc 1 590 0
	jmp lcd_command
.LVL85:
	.cfi_endproc
.LFE21:
	.size	lcd_init, .-lcd_init
.Letext0:
	.file 3 "/usr/lib/avr/include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x76f
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF35
	.byte	0xc
	.long	.LASF36
	.long	.LASF37
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x7e
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x80
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x3
	.byte	0x82
	.long	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x5
	.byte	0x1
	.long	.LASF10
	.byte	0x1
	.word	0x1f8
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST39
	.byte	0x1
	.long	0x245
	.uleb128 0x6
	.long	.LASF12
	.byte	0x1
	.word	0x1f8
	.long	0x2c
	.long	.LLST40
	.uleb128 0x7
	.long	0x660
	.long	.LBB45
	.long	.LBE45
	.byte	0x1
	.word	0x21b
	.long	0xe3
	.uleb128 0x8
	.long	0x66d
	.long	.LLST41
	.uleb128 0x9
	.long	.LBB46
	.long	.LBE46
	.uleb128 0xa
	.long	0x678
	.long	.LLST42
	.uleb128 0xa
	.long	0x684
	.long	.LLST43
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x660
	.long	.LBB47
	.long	.LBE47
	.byte	0x1
	.word	0x221
	.long	0x11d
	.uleb128 0x8
	.long	0x66d
	.long	.LLST44
	.uleb128 0x9
	.long	.LBB48
	.long	.LBE48
	.uleb128 0xa
	.long	0x678
	.long	.LLST45
	.uleb128 0xa
	.long	0x684
	.long	.LLST46
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x660
	.long	.LBB49
	.long	.LBE49
	.byte	0x1
	.word	0x225
	.long	0x157
	.uleb128 0x8
	.long	0x66d
	.long	.LLST47
	.uleb128 0x9
	.long	.LBB50
	.long	.LBE50
	.uleb128 0xa
	.long	0x678
	.long	.LLST48
	.uleb128 0xa
	.long	0x684
	.long	.LLST49
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x660
	.long	.LBB51
	.long	.LBE51
	.byte	0x1
	.word	0x229
	.long	0x191
	.uleb128 0x8
	.long	0x66d
	.long	.LLST50
	.uleb128 0x9
	.long	.LBB52
	.long	.LBE52
	.uleb128 0xa
	.long	0x678
	.long	.LLST51
	.uleb128 0xa
	.long	0x684
	.long	.LLST52
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	0x660
	.long	.LBB53
	.long	.LBE53
	.byte	0x1
	.word	0x22e
	.long	0x1cb
	.uleb128 0x8
	.long	0x66d
	.long	.LLST53
	.uleb128 0x9
	.long	.LBB54
	.long	.LBE54
	.uleb128 0xa
	.long	0x678
	.long	.LLST54
	.uleb128 0xa
	.long	0x684
	.long	.LLST55
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LVL72
	.long	0x611
	.uleb128 0xb
	.long	.LVL74
	.long	0x611
	.uleb128 0xb
	.long	.LVL76
	.long	0x611
	.uleb128 0xb
	.long	.LVL78
	.long	0x611
	.uleb128 0xc
	.long	.LVL80
	.long	0x4a9
	.long	0x203
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.uleb128 0xc
	.long	.LVL81
	.long	0x4a9
	.long	0x216
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0xb
	.long	.LVL82
	.long	0x3c6
	.uleb128 0xc
	.long	.LVL83
	.long	0x4a9
	.long	0x232
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x36
	.byte	0
	.uleb128 0xe
	.long	.LVL85
	.byte	0x1
	.long	0x4a9
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.word	0x1e4
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST34
	.byte	0x1
	.long	0x2b6
	.uleb128 0x6
	.long	.LASF13
	.byte	0x1
	.word	0x1e4
	.long	0x2b6
	.long	.LLST35
	.uleb128 0xf
	.string	"c"
	.byte	0x1
	.word	0x1e7
	.long	0x2bc
	.long	.LLST36
	.uleb128 0x10
	.long	.LBB44
	.long	.LBE44
	.long	0x2ac
	.uleb128 0x11
	.long	.LASF14
	.byte	0x1
	.word	0x1e9
	.long	0x45
	.long	.LLST37
	.uleb128 0x11
	.long	.LASF15
	.byte	0x1
	.word	0x1e9
	.long	0x2c
	.long	.LLST36
	.byte	0
	.uleb128 0xb
	.long	.LVL67
	.long	0x309
	.byte	0
	.uleb128 0x12
	.byte	0x2
	.long	0x2c3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF16
	.uleb128 0x13
	.long	0x2bc
	.uleb128 0x5
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.word	0x1d3
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.long	.LLST31
	.byte	0x1
	.long	0x309
	.uleb128 0x14
	.string	"s"
	.byte	0x1
	.word	0x1d3
	.long	0x2b6
	.long	.LLST32
	.uleb128 0xf
	.string	"c"
	.byte	0x1
	.word	0x1d6
	.long	0x2bc
	.long	.LLST33
	.uleb128 0xb
	.long	.LVL60
	.long	0x309
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.word	0x1a4
	.byte	0x1
	.long	.LFB18
	.long	.LFE18
	.long	.LLST26
	.byte	0x1
	.long	0x39a
	.uleb128 0x14
	.string	"c"
	.byte	0x1
	.word	0x1a4
	.long	0x2bc
	.long	.LLST27
	.uleb128 0xf
	.string	"pos"
	.byte	0x1
	.word	0x1a6
	.long	0x2c
	.long	.LLST28
	.uleb128 0x15
	.long	0x4f5
	.long	.LBB40
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.word	0x1ac
	.long	0x379
	.uleb128 0x8
	.long	0x503
	.long	.LLST29
	.uleb128 0x16
	.long	.Ldebug_ranges0+0
	.uleb128 0xa
	.long	0x50f
	.long	.LLST30
	.uleb128 0x17
	.long	.LVL49
	.byte	0x1
	.long	0x4a9
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LVL44
	.long	0x51c
	.uleb128 0xe
	.long	.LVL54
	.byte	0x1
	.long	0x5bd
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0xd
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.word	0x199
	.byte	0x1
	.long	.LFB17
	.long	.LFE17
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x3c6
	.uleb128 0xe
	.long	.LVL42
	.byte	0x1
	.long	0x4a9
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.word	0x190
	.byte	0x1
	.long	.LFB16
	.long	.LFE16
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x3f2
	.uleb128 0xe
	.long	.LVL41
	.byte	0x1
	.long	0x4a9
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.word	0x187
	.byte	0x1
	.long	0x3e
	.long	.LFB15
	.long	.LFE15
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x41b
	.uleb128 0xb
	.long	.LVL40
	.long	0x51c
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.word	0x16c
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x45d
	.uleb128 0x14
	.string	"x"
	.byte	0x1
	.word	0x16c
	.long	0x2c
	.long	.LLST24
	.uleb128 0x14
	.string	"y"
	.byte	0x1
	.word	0x16c
	.long	0x2c
	.long	.LLST25
	.uleb128 0x17
	.long	.LVL38
	.byte	0x1
	.long	0x4a9
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.word	0x15e
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.long	.LLST22
	.byte	0x1
	.long	0x4a9
	.uleb128 0x6
	.long	.LASF23
	.byte	0x1
	.word	0x15e
	.long	0x2c
	.long	.LLST23
	.uleb128 0xb
	.long	.LVL33
	.long	0x51c
	.uleb128 0xe
	.long	.LVL35
	.byte	0x1
	.long	0x5bd
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0xd
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.word	0x152
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.long	.LLST20
	.byte	0x1
	.long	0x4f5
	.uleb128 0x14
	.string	"cmd"
	.byte	0x1
	.word	0x152
	.long	0x2c
	.long	.LLST21
	.uleb128 0xb
	.long	.LVL29
	.long	0x51c
	.uleb128 0xe
	.long	.LVL31
	.byte	0x1
	.long	0x5bd
	.uleb128 0xd
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.uleb128 0xd
	.byte	0x1
	.byte	0x66
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF29
	.byte	0x1
	.word	0x121
	.byte	0x1
	.byte	0x3
	.long	0x51c
	.uleb128 0x1b
	.string	"pos"
	.byte	0x1
	.word	0x121
	.long	0x2c
	.uleb128 0x1c
	.long	.LASF25
	.byte	0x1
	.word	0x123
	.long	0x2c
	.byte	0
	.uleb128 0x1d
	.long	.LASF39
	.byte	0x1
	.word	0x10c
	.byte	0x1
	.long	0x2c
	.long	.LFB10
	.long	.LFE10
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x596
	.uleb128 0xf
	.string	"c"
	.byte	0x1
	.word	0x10f
	.long	0x2c
	.long	.LLST16
	.uleb128 0x7
	.long	0x660
	.long	.LBB36
	.long	.LBE36
	.byte	0x1
	.word	0x115
	.long	0x582
	.uleb128 0x8
	.long	0x66d
	.long	.LLST17
	.uleb128 0x9
	.long	.LBB37
	.long	.LBE37
	.uleb128 0xa
	.long	0x678
	.long	.LLST18
	.uleb128 0xa
	.long	0x684
	.long	.LLST19
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LVL23
	.long	0x6a9
	.uleb128 0x17
	.long	.LVL27
	.byte	0x1
	.long	0x6a9
	.byte	0
	.uleb128 0x1e
	.long	.LASF40
	.byte	0x1
	.byte	0xc7
	.byte	0x1
	.long	0x2c
	.byte	0x1
	.long	0x5bd
	.uleb128 0x1f
	.string	"rs"
	.byte	0x1
	.byte	0xc7
	.long	0x2c
	.uleb128 0x20
	.long	.LASF23
	.byte	0x1
	.byte	0xc9
	.long	0x2c
	.byte	0
	.uleb128 0x21
	.long	.LASF27
	.byte	0x1
	.byte	0x76
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST3
	.byte	0x1
	.long	0x611
	.uleb128 0x22
	.long	.LASF23
	.byte	0x1
	.byte	0x76
	.long	0x2c
	.long	.LLST4
	.uleb128 0x23
	.string	"rs"
	.byte	0x1
	.byte	0x76
	.long	0x2c
	.long	.LLST5
	.uleb128 0x20
	.long	.LASF26
	.byte	0x1
	.byte	0x78
	.long	0x37
	.uleb128 0xb
	.long	.LVL3
	.long	0x611
	.uleb128 0xb
	.long	.LVL4
	.long	0x611
	.byte	0
	.uleb128 0x24
	.long	.LASF28
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x660
	.uleb128 0x25
	.long	0x660
	.long	.LBB28
	.long	.LBE28
	.byte	0x1
	.byte	0x68
	.uleb128 0x8
	.long	0x66d
	.long	.LLST0
	.uleb128 0x9
	.long	.LBB29
	.long	.LBE29
	.uleb128 0xa
	.long	0x678
	.long	.LLST1
	.uleb128 0xa
	.long	0x684
	.long	.LLST2
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.long	.LASF30
	.byte	0x2
	.byte	0xff
	.byte	0x1
	.byte	0x3
	.long	0x6a2
	.uleb128 0x27
	.long	.LASF31
	.byte	0x2
	.byte	0xff
	.long	0x6a2
	.uleb128 0x1c
	.long	.LASF32
	.byte	0x2
	.word	0x101
	.long	0x6a2
	.uleb128 0x1c
	.long	.LASF33
	.byte	0x2
	.word	0x105
	.long	0x5e
	.uleb128 0x28
	.byte	0x1
	.long	.LASF41
	.byte	0x2
	.word	0x106
	.byte	0x1
	.byte	0x1
	.uleb128 0x29
	.long	0x69
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF34
	.uleb128 0x2a
	.long	0x596
	.long	.LFB22
	.long	.LFE22
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0xa
	.long	0x5b1
	.long	.LLST6
	.uleb128 0x2b
	.long	0x5a7
	.byte	0
	.uleb128 0x2c
	.long	0x660
	.long	.LBB30
	.long	.LBE30
	.byte	0x1
	.byte	0xed
	.long	0x703
	.uleb128 0x8
	.long	0x66d
	.long	.LLST7
	.uleb128 0x9
	.long	.LBB31
	.long	.LBE31
	.uleb128 0xa
	.long	0x678
	.long	.LLST8
	.uleb128 0xa
	.long	0x684
	.long	.LLST9
	.byte	0
	.byte	0
	.uleb128 0x2c
	.long	0x660
	.long	.LBB32
	.long	.LBE32
	.byte	0x1
	.byte	0xf5
	.long	0x73c
	.uleb128 0x8
	.long	0x66d
	.long	.LLST10
	.uleb128 0x9
	.long	.LBB33
	.long	.LBE33
	.uleb128 0xa
	.long	0x678
	.long	.LLST11
	.uleb128 0xa
	.long	0x684
	.long	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x660
	.long	.LBB34
	.long	.LBE34
	.byte	0x1
	.byte	0xf9
	.uleb128 0x8
	.long	0x66d
	.long	.LLST13
	.uleb128 0x9
	.long	.LBB35
	.long	.LBE35
	.uleb128 0xa
	.long	0x678
	.long	.LLST14
	.uleb128 0xa
	.long	0x684
	.long	.LLST15
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST39:
	.long	.LFB21-.Ltext0
	.long	.LCFI8-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI8-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST40:
	.long	.LVL68-.Ltext0
	.long	.LVL70-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL70-.Ltext0
	.long	.LVL84-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL84-.Ltext0
	.long	.LVL85-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL85-1-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST41:
	.long	.LVL69-.Ltext0
	.long	.LVL71-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x467a0000
	.long	0
	.long	0
.LLST42:
	.long	.LVL69-.Ltext0
	.long	.LVL71-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x487a0000
	.long	0
	.long	0
.LLST43:
	.long	.LVL69-.Ltext0
	.long	.LVL71-.Ltext0
	.word	0x5
	.byte	0x8
	.byte	0xfa
	.byte	0x3a
	.byte	0x24
	.byte	0x9f
	.long	0
	.long	0
.LLST44:
	.long	.LVL72-.Ltext0
	.long	.LVL73-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x459c4000
	.long	0
	.long	0
.LLST45:
	.long	.LVL72-.Ltext0
	.long	.LVL73-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x479c4000
	.long	0
	.long	0
.LLST46:
	.long	.LVL72-.Ltext0
	.long	.LVL73-.Ltext0
	.word	0x6
	.byte	0xc
	.long	0x13880
	.byte	0x9f
	.long	0
	.long	0
.LLST47:
	.long	.LVL74-.Ltext0
	.long	.LVL75-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42800000
	.long	0
	.long	0
.LLST48:
	.long	.LVL74-.Ltext0
	.long	.LVL75-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x44800000
	.long	0
	.long	0
.LLST49:
	.long	.LVL74-.Ltext0
	.long	.LVL75-.Ltext0
	.word	0x4
	.byte	0xa
	.word	0x400
	.byte	0x9f
	.long	0
	.long	0
.LLST50:
	.long	.LVL76-.Ltext0
	.long	.LVL77-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42800000
	.long	0
	.long	0
.LLST51:
	.long	.LVL76-.Ltext0
	.long	.LVL77-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x44800000
	.long	0
	.long	0
.LLST52:
	.long	.LVL76-.Ltext0
	.long	.LVL77-.Ltext0
	.word	0x4
	.byte	0xa
	.word	0x400
	.byte	0x9f
	.long	0
	.long	0
.LLST53:
	.long	.LVL78-.Ltext0
	.long	.LVL79-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42800000
	.long	0
	.long	0
.LLST54:
	.long	.LVL78-.Ltext0
	.long	.LVL79-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x44800000
	.long	0
	.long	0
.LLST55:
	.long	.LVL78-.Ltext0
	.long	.LVL79-.Ltext0
	.word	0x4
	.byte	0xa
	.word	0x400
	.byte	0x9f
	.long	0
	.long	0
.LLST34:
	.long	.LFB20-.Ltext0
	.long	.LCFI6-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI7-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST35:
	.long	.LVL61-.Ltext0
	.long	.LVL62-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL62-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 1
	.byte	0x9f
	.long	.LVL64-.Ltext0
	.long	.LVL65-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL65-.Ltext0
	.long	.LVL66-.Ltext0
	.word	0x3
	.byte	0x8e
	.sleb128 1
	.byte	0x9f
	.long	.LVL66-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST36:
	.long	.LVL63-.Ltext0
	.long	.LVL67-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST37:
	.long	.LVL62-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL64-.Ltext0
	.long	.LVL67-1-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL67-1-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 -1
	.byte	0x9f
	.long	0
	.long	0
.LLST31:
	.long	.LFB19-.Ltext0
	.long	.LCFI4-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI4-.Ltext0
	.long	.LCFI5-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI5-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST32:
	.long	.LVL55-.Ltext0
	.long	.LVL56-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL56-.Ltext0
	.long	.LVL57-.Ltext0
	.word	0x3
	.byte	0x8c
	.sleb128 1
	.byte	0x9f
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL59-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST33:
	.long	.LVL57-.Ltext0
	.long	.LVL60-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST26:
	.long	.LFB18-.Ltext0
	.long	.LCFI3-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI3-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST27:
	.long	.LVL43-.Ltext0
	.long	.LVL44-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL44-1-.Ltext0
	.long	.LVL48-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL48-.Ltext0
	.long	.LVL49-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL49-.Ltext0
	.long	.LVL53-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL53-.Ltext0
	.long	.LVL54-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL54-1-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST28:
	.long	.LVL44-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL51-.Ltext0
	.long	.LVL52-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST29:
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST30:
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL47-.Ltext0
	.long	.LVL49-1-.Ltext0
	.word	0x4
	.byte	0x88
	.sleb128 -128
	.byte	0x9f
	.long	0
	.long	0
.LLST24:
	.long	.LVL36-.Ltext0
	.long	.LVL37-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL38-.Ltext0
	.long	.LVL39-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL39-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x4
	.byte	0x88
	.sleb128 64
	.byte	0x9f
	.long	0
	.long	0
.LLST25:
	.long	.LVL36-.Ltext0
	.long	.LVL38-1-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL38-1-.Ltext0
	.long	.LVL38-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	.LVL38-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST22:
	.long	.LFB13-.Ltext0
	.long	.LCFI2-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2-.Ltext0
	.long	.LFE13-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST23:
	.long	.LVL32-.Ltext0
	.long	.LVL33-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL33-1-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL34-.Ltext0
	.long	.LVL35-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL35-1-.Ltext0
	.long	.LFE13-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST20:
	.long	.LFB12-.Ltext0
	.long	.LCFI1-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI1-.Ltext0
	.long	.LFE12-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST21:
	.long	.LVL28-.Ltext0
	.long	.LVL29-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL29-1-.Ltext0
	.long	.LVL30-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL30-.Ltext0
	.long	.LVL31-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL31-1-.Ltext0
	.long	.LFE12-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST16:
	.long	.LVL23-.Ltext0
	.long	.LVL25-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST17:
	.long	.LVL24-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x40800000
	.long	0
	.long	0
.LLST18:
	.long	.LVL24-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42800000
	.long	0
	.long	0
.LLST19:
	.long	.LVL24-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x3
	.byte	0x8
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LFB8-.Ltext0
	.long	.LCFI0-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0-.Ltext0
	.long	.LFE8-.Ltext0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	0
	.long	0
.LLST4:
	.long	.LVL2-.Ltext0
	.long	.LVL3-1-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL3-1-.Ltext0
	.long	.LVL5-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL6-.Ltext0
	.long	.LFE8-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST5:
	.long	.LVL2-.Ltext0
	.long	.LVL3-1-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL3-1-.Ltext0
	.long	.LVL6-.Ltext0
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	.LVL6-.Ltext0
	.long	.LFE8-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0
	.long	0
.LLST0:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x3f800000
	.long	0
	.long	0
.LLST1:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41800000
	.long	0
	.long	0
.LLST2:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL10-.Ltext0
	.long	.LVL22-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL22-.Ltext0
	.long	.LFE22-.Ltext0
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST7:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x3f800000
	.long	0
	.long	0
.LLST8:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41800000
	.long	0
	.long	0
.LLST9:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST10:
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x3f800000
	.long	0
	.long	0
.LLST11:
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41800000
	.long	0
	.long	0
.LLST12:
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x3f800000
	.long	0
	.long	0
.LLST14:
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41800000
	.long	0
	.long	0
.LLST15:
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.word	0x2
	.byte	0x40
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB40-.Ltext0
	.long	.LBE40-.Ltext0
	.long	.LBB43-.Ltext0
	.long	.LBE43-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF25:
	.string	"addressCounter"
.LASF14:
	.string	"__addr16"
.LASF17:
	.string	"lcd_puts"
.LASF24:
	.string	"lcd_command"
.LASF35:
	.string	"GNU C99 7.3.0 -mn-flash=1 -mno-skip-bug -mmcu=avr5 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums"
.LASF27:
	.string	"lcd_write"
.LASF31:
	.string	"__us"
.LASF37:
	.string	"/media/ravindu/38D6E9B4D6E97314/My Projects/Atmel AtMega/EmbededLabs/Lab07/LCD Library-20250721/LCDlib"
.LASF23:
	.string	"data"
.LASF28:
	.string	"toggle_e"
.LASF1:
	.string	"unsigned char"
.LASF33:
	.string	"__ticks_dc"
.LASF21:
	.string	"lcd_gotoxy"
.LASF7:
	.string	"long unsigned int"
.LASF10:
	.string	"lcd_init"
.LASF15:
	.string	"__result"
.LASF22:
	.string	"lcd_data"
.LASF34:
	.string	"double"
.LASF20:
	.string	"lcd_clrscr"
.LASF19:
	.string	"lcd_home"
.LASF4:
	.string	"unsigned int"
.LASF30:
	.string	"_delay_us"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF12:
	.string	"dispAttr"
.LASF38:
	.string	"lcd_getxy"
.LASF8:
	.string	"long long int"
.LASF11:
	.string	"lcd_puts_p"
.LASF16:
	.string	"char"
.LASF32:
	.string	"__tmp"
.LASF40:
	.string	"lcd_read"
.LASF13:
	.string	"progmem_s"
.LASF3:
	.string	"uint16_t"
.LASF29:
	.string	"lcd_newline"
.LASF41:
	.string	"__builtin_avr_delay_cycles"
.LASF6:
	.string	"uint32_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF18:
	.string	"lcd_putc"
.LASF39:
	.string	"lcd_waitbusy"
.LASF36:
	.string	"lcd.c"
.LASF26:
	.string	"dataBits"
	.ident	"GCC: (GNU) 7.3.0"
