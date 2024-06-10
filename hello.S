
  # global alloc
  .data
  .globl g_0
g_0:
  .word 1
  .word 2
  .word 4
  .word 8
  .word 16
  .word 32
  .word 64
  .word 128
  .word 256
  .word 512
  .word 1024
  .word 2048
  .word 4096
  .word 8192
  .word 16384
  .word 32768

  .text
  .globl long_func
long_func:

  # prologue
  li t0, -8816
  add sp, sp, t0
  li t0, 8812
  add t0, t0, sp
  sw ra, 0(t0)
_entry_long_func:

  # alloc

  # alloc

  # alloc

  # alloc

  # alloc

  # alloc

  # store
  li t0, 2
  sw t0, 20(sp)

  # alloc

  # store
  sw x0, 24(sp)

  # alloc

  # store
  li t0, 1
  sw t0, 28(sp)

  # jump
  la t0, _while_entry_0
  jr t0
_while_entry_0:

  # load
  lw t0, 24(sp)
  sw t0, 32(sp)

  # binary
  lw t0, 32(sp)
  sgt t1, t0, x0
  sw t1, 36(sp)

  # branch
  lw t0, 36(sp)
  bnez  t0, inter_label0
  la t1, _end_0
  jr t1
inter_label0:
  la t2, _while_body_0
  jr t2
_while_body_0:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 24(sp)
  sw t0, 40(sp)

  # store
  lw t0, 40(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_1
  jr t0
_end_0:

  # load
  lw t0, 28(sp)
  sw t0, 44(sp)

  # store
  lw t0, 44(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 48(sp)

  # func
  lw t0, 48(sp)
  mv a0, t0
  call putint

  # func
  li t0, 10
  mv a0, t0
  call putch

  # alloc

  # store
  li t0, 2
  sw t0, 52(sp)

  # alloc

  # store
  li t0, 1
  sw t0, 56(sp)

  # alloc

  # store
  li t0, 1
  sw t0, 60(sp)

  # jump
  la t0, _while_entry_75
  jr t0
_while_entry_1:

  # load
  lw t0, 4(sp)
  sw t0, 64(sp)

  # binary
  lw t0, 64(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 68(sp)

  # branch
  lw t0, 68(sp)
  bnez  t0, inter_label1
  la t1, _end_1
  jr t1
inter_label1:
  la t2, _while_body_1
  jr t2
_while_entry_75:

  # load
  lw t0, 56(sp)
  sw t0, 72(sp)

  # binary
  lw t0, 72(sp)
  sgt t1, t0, x0
  sw t1, 76(sp)

  # branch
  lw t0, 76(sp)
  bnez  t0, inter_label2
  la t1, _end_75
  jr t1
inter_label2:
  la t2, _while_body_75
  jr t2
_while_body_1:

  # load
  lw t0, 8(sp)
  sw t0, 80(sp)

  # binary
  lw t0, 80(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 84(sp)

  # alloc

  # binary
  lw t0, 84(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 92(sp)

  # branch
  lw t0, 92(sp)
  bnez  t0, inter_label3
  la t1, _else_3
  jr t1
inter_label3:
  la t2, _then_3
  jr t2
_end_1:

  # load
  lw t0, 0(sp)
  sw t0, 96(sp)

  # branch
  lw t0, 96(sp)
  bnez  t0, inter_label4
  la t1, _end_4
  jr t1
inter_label4:
  la t2, _then_4
  jr t2
_while_body_75:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 56(sp)
  sw t0, 100(sp)

  # store
  lw t0, 100(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_76
  jr t0
_end_75:

  # load
  lw t0, 60(sp)
  sw t0, 104(sp)

  # store
  lw t0, 104(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 108(sp)

  # func
  lw t0, 108(sp)
  mv a0, t0
  call putint

  # func
  li t0, 10
  mv a0, t0
  call putch

  # store
  li t0, 2
  sw t0, 16(sp)

  # jump
  la t0, _while_entry_150
  jr t0
_then_3:

  # load
  lw t0, 12(sp)
  sw t0, 112(sp)

  # binary
  lw t0, 112(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 116(sp)

  # binary
  lw t0, 116(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 120(sp)

  # store
  lw t0, 120(sp)
  sw t0, 88(sp)

  # jump
  la t0, _end_3
  jr t0
_else_3:

  # store
  sw x0, 88(sp)

  # jump
  la t0, _end_3
  jr t0
_then_4:

  # alloc

  # load
  lw t0, 28(sp)
  sw t0, 128(sp)

  # store
  lw t0, 128(sp)
  sw t0, 124(sp)

  # alloc

  # load
  lw t0, 20(sp)
  sw t0, 136(sp)

  # store
  lw t0, 136(sp)
  sw t0, 132(sp)

  # alloc

  # store
  sw x0, 140(sp)

  # jump
  la t0, _while_entry_5
  jr t0
_end_4:

  # alloc

  # load
  lw t0, 20(sp)
  sw t0, 148(sp)

  # store
  lw t0, 148(sp)
  sw t0, 144(sp)

  # alloc

  # load
  lw t0, 20(sp)
  sw t0, 156(sp)

  # store
  lw t0, 156(sp)
  sw t0, 152(sp)

  # alloc

  # store
  sw x0, 160(sp)

  # jump
  la t0, _while_entry_38
  jr t0
_while_entry_76:

  # load
  lw t0, 4(sp)
  sw t0, 164(sp)

  # binary
  lw t0, 164(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 168(sp)

  # branch
  lw t0, 168(sp)
  bnez  t0, inter_label5
  la t1, _end_76
  jr t1
inter_label5:
  la t2, _while_body_76
  jr t2
_while_entry_150:

  # load
  lw t0, 16(sp)
  sw t0, 172(sp)

  # binary
  lw t0, 172(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 176(sp)

  # branch
  lw t0, 176(sp)
  bnez  t0, inter_label6
  la t1, _end_150
  jr t1
inter_label6:
  la t2, _while_body_150
  jr t2
_end_3:

  # load
  lw t0, 88(sp)
  sw t0, 180(sp)

  # branch
  lw t0, 180(sp)
  bnez  t0, inter_label7
  la t1, _end_2
  jr t1
inter_label7:
  la t2, _then_2
  jr t2
_while_entry_5:

  # load
  lw t0, 132(sp)
  sw t0, 184(sp)

  # branch
  lw t0, 184(sp)
  bnez  t0, inter_label8
  la t1, _end_5
  jr t1
inter_label8:
  la t2, _while_body_5
  jr t2
_while_entry_38:

  # load
  lw t0, 152(sp)
  sw t0, 188(sp)

  # branch
  lw t0, 188(sp)
  bnez  t0, inter_label9
  la t1, _end_38
  jr t1
inter_label9:
  la t2, _while_body_38
  jr t2
_while_body_76:

  # load
  lw t0, 8(sp)
  sw t0, 192(sp)

  # binary
  lw t0, 192(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 196(sp)

  # alloc

  # binary
  lw t0, 196(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 204(sp)

  # branch
  lw t0, 204(sp)
  bnez  t0, inter_label10
  la t1, _else_78
  jr t1
inter_label10:
  la t2, _then_78
  jr t2
_end_76:

  # load
  lw t0, 0(sp)
  sw t0, 208(sp)

  # branch
  lw t0, 208(sp)
  bnez  t0, inter_label11
  la t1, _end_79
  jr t1
inter_label11:
  la t2, _then_79
  jr t2
_while_body_150:

  # alloc

  # store
  li t0, 2
  sw t0, 212(sp)

  # alloc

  # load
  lw t0, 16(sp)
  sw t0, 220(sp)

  # store
  lw t0, 220(sp)
  sw t0, 216(sp)

  # alloc

  # store
  li t0, 1
  sw t0, 224(sp)

  # jump
  la t0, _while_entry_151
  jr t0
_end_150:

  # store
  sw x0, 16(sp)

  # jump
  la t0, _while_entry_226
  jr t0
_then_2:

  # load
  lw t0, 0(sp)
  sw t0, 228(sp)

  # load
  lw t0, 4(sp)
  sw t0, 232(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 232(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 236(sp)

  # load
  lw t0, 236(sp)
  lw t1, (t0)
  sw t1, 240(sp)

  # binary
  li t0, 1
  lw t1, 240(sp)
  mul t2, t0, t1
  sw t2, 244(sp)

  # binary
  lw t0, 228(sp)
  lw t1, 244(sp)
  add t2, t0, t1
  sw t2, 248(sp)

  # store
  lw t0, 248(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_2
  jr t0
_end_2:

  # load
  lw t0, 8(sp)
  sw t0, 252(sp)

  # binary
  lw t0, 252(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 256(sp)

  # store
  lw t0, 256(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 260(sp)

  # binary
  lw t0, 260(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 264(sp)

  # store
  lw t0, 264(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 268(sp)

  # binary
  lw t0, 268(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 272(sp)

  # store
  lw t0, 272(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_1
  jr t0
_while_body_5:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 132(sp)
  sw t0, 276(sp)

  # store
  lw t0, 276(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_6
  jr t0
_end_5:

  # load
  lw t0, 140(sp)
  sw t0, 280(sp)

  # store
  lw t0, 280(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 284(sp)

  # store
  lw t0, 284(sp)
  sw t0, 28(sp)

  # jump
  la t0, _end_4
  jr t0
_while_body_38:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 152(sp)
  sw t0, 288(sp)

  # store
  lw t0, 288(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_39
  jr t0
_end_38:

  # load
  lw t0, 160(sp)
  sw t0, 292(sp)

  # store
  lw t0, 292(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 296(sp)

  # store
  lw t0, 296(sp)
  sw t0, 20(sp)

  # load
  lw t0, 24(sp)
  sw t0, 300(sp)

  # store
  lw t0, 300(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 304(sp)

  # binary
  lw t0, 304(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 308(sp)

  # branch
  lw t0, 308(sp)
  bnez  t0, inter_label12
  la t1, _else_71
  jr t1
inter_label12:
  la t2, _then_71
  jr t2
_then_78:

  # load
  lw t0, 12(sp)
  sw t0, 312(sp)

  # binary
  lw t0, 312(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 316(sp)

  # binary
  lw t0, 316(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 320(sp)

  # store
  lw t0, 320(sp)
  sw t0, 200(sp)

  # jump
  la t0, _end_78
  jr t0
_else_78:

  # store
  sw x0, 200(sp)

  # jump
  la t0, _end_78
  jr t0
_then_79:

  # alloc

  # load
  lw t0, 60(sp)
  sw t0, 328(sp)

  # store
  lw t0, 328(sp)
  sw t0, 324(sp)

  # alloc

  # load
  lw t0, 52(sp)
  sw t0, 336(sp)

  # store
  lw t0, 336(sp)
  sw t0, 332(sp)

  # alloc

  # store
  sw x0, 340(sp)

  # jump
  la t0, _while_entry_80
  jr t0
_end_79:

  # alloc

  # load
  lw t0, 52(sp)
  sw t0, 348(sp)

  # store
  lw t0, 348(sp)
  sw t0, 344(sp)

  # alloc

  # load
  lw t0, 52(sp)
  sw t0, 356(sp)

  # store
  lw t0, 356(sp)
  sw t0, 352(sp)

  # alloc

  # store
  sw x0, 360(sp)

  # jump
  la t0, _while_entry_113
  jr t0
_while_entry_151:

  # load
  lw t0, 216(sp)
  sw t0, 364(sp)

  # binary
  lw t0, 364(sp)
  sgt t1, t0, x0
  sw t1, 368(sp)

  # branch
  lw t0, 368(sp)
  bnez  t0, inter_label13
  la t1, _end_151
  jr t1
inter_label13:
  la t2, _while_body_151
  jr t2
_while_entry_226:

  # load
  lw t0, 16(sp)
  sw t0, 372(sp)

  # binary
  lw t0, 372(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 376(sp)

  # branch
  lw t0, 376(sp)
  bnez  t0, inter_label14
  la t1, _end_226
  jr t1
inter_label14:
  la t2, _while_body_226
  jr t2
_while_entry_6:

  # load
  lw t0, 4(sp)
  sw t0, 380(sp)

  # binary
  lw t0, 380(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 384(sp)

  # branch
  lw t0, 384(sp)
  bnez  t0, inter_label15
  la t1, _end_6
  jr t1
inter_label15:
  la t2, _while_body_6
  jr t2
_while_entry_39:

  # load
  lw t0, 4(sp)
  sw t0, 388(sp)

  # binary
  lw t0, 388(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 392(sp)

  # branch
  lw t0, 392(sp)
  bnez  t0, inter_label16
  la t1, _end_39
  jr t1
inter_label16:
  la t2, _while_body_39
  jr t2
_then_71:

  # load
  lw t0, 8(sp)
  sw t0, 396(sp)

  # binary
  lw t0, 396(sp)
  slt t1, t0, x0
  sw t1, 400(sp)

  # branch
  lw t0, 400(sp)
  bnez  t0, inter_label17
  la t1, _else_72
  jr t1
inter_label17:
  la t2, _then_72
  jr t2
_else_71:

  # load
  lw t0, 12(sp)
  sw t0, 404(sp)

  # binary
  lw t0, 404(sp)
  sgt t1, t0, x0
  sw t1, 408(sp)

  # branch
  lw t0, 408(sp)
  bnez  t0, inter_label18
  la t1, _else_73
  jr t1
inter_label18:
  la t2, _then_73
  jr t2
_end_78:

  # load
  lw t0, 200(sp)
  sw t0, 412(sp)

  # branch
  lw t0, 412(sp)
  bnez  t0, inter_label19
  la t1, _end_77
  jr t1
inter_label19:
  la t2, _then_77
  jr t2
_while_entry_80:

  # load
  lw t0, 332(sp)
  sw t0, 416(sp)

  # branch
  lw t0, 416(sp)
  bnez  t0, inter_label20
  la t1, _end_80
  jr t1
inter_label20:
  la t2, _while_body_80
  jr t2
_while_entry_113:

  # load
  lw t0, 352(sp)
  sw t0, 420(sp)

  # branch
  lw t0, 420(sp)
  bnez  t0, inter_label21
  la t1, _end_113
  jr t1
inter_label21:
  la t2, _while_body_113
  jr t2
_while_body_151:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 216(sp)
  sw t0, 424(sp)

  # store
  lw t0, 424(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_152
  jr t0
_end_151:

  # load
  lw t0, 224(sp)
  sw t0, 428(sp)

  # store
  lw t0, 428(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 432(sp)

  # func
  lw t0, 432(sp)
  mv a0, t0
  call putint

  # func
  li t0, 10
  mv a0, t0
  call putch

  # load
  lw t0, 16(sp)
  sw t0, 436(sp)

  # binary
  lw t0, 436(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 440(sp)

  # store
  lw t0, 440(sp)
  sw t0, 16(sp)

  # jump
  la t0, _while_entry_150
  jr t0
_while_body_226:

  # alloc

  # store
  li t0, 2
  sw t0, 444(sp)

  # alloc

  # load
  lw t0, 16(sp)
  sw t0, 452(sp)

  # store
  lw t0, 452(sp)
  sw t0, 448(sp)

  # alloc

  # store
  li t0, 1
  sw t0, 456(sp)

  # jump
  la t0, _while_entry_227
  jr t0
_end_226:

  # ret
  mv a0, x0

  # epilogue
  li t0, 8812
  add t0, t0, sp
  lw ra, 0(t0)
  li t0, 8816
  add sp, sp, t0
  ret
_while_body_6:

  # load
  lw t0, 8(sp)
  sw t0, 460(sp)

  # binary
  lw t0, 460(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 464(sp)

  # alloc

  # binary
  lw t0, 464(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 472(sp)

  # branch
  lw t0, 472(sp)
  bnez  t0, inter_label22
  la t1, _else_8
  jr t1
inter_label22:
  la t2, _then_8
  jr t2
_end_6:

  # load
  lw t0, 0(sp)
  sw t0, 476(sp)

  # branch
  lw t0, 476(sp)
  bnez  t0, inter_label23
  la t1, _end_9
  jr t1
inter_label23:
  la t2, _then_9
  jr t2
_while_body_39:

  # load
  lw t0, 8(sp)
  sw t0, 480(sp)

  # binary
  lw t0, 480(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 484(sp)

  # alloc

  # binary
  lw t0, 484(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 492(sp)

  # branch
  lw t0, 492(sp)
  bnez  t0, inter_label24
  la t1, _else_41
  jr t1
inter_label24:
  la t2, _then_41
  jr t2
_end_39:

  # load
  lw t0, 0(sp)
  sw t0, 496(sp)

  # branch
  lw t0, 496(sp)
  bnez  t0, inter_label25
  la t1, _end_42
  jr t1
inter_label25:
  la t2, _then_42
  jr t2
_then_72:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_72
  jr t0
_else_72:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_72
  jr t0
_then_73:

  # load
  lw t0, 8(sp)
  sw t0, 500(sp)

  # binary
  lw t0, 500(sp)
  li t1, 32767
  sgt t2, t0, t1
  sw t2, 504(sp)

  # branch
  lw t0, 504(sp)
  bnez  t0, inter_label26
  la t1, _else_74
  jr t1
inter_label26:
  la t2, _then_74
  jr t2
_else_73:

  # load
  lw t0, 8(sp)
  sw t0, 508(sp)

  # store
  lw t0, 508(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_73
  jr t0
_then_77:

  # load
  lw t0, 0(sp)
  sw t0, 512(sp)

  # load
  lw t0, 4(sp)
  sw t0, 516(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 516(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 520(sp)

  # load
  lw t0, 520(sp)
  lw t1, (t0)
  sw t1, 524(sp)

  # binary
  li t0, 1
  lw t1, 524(sp)
  mul t2, t0, t1
  sw t2, 528(sp)

  # binary
  lw t0, 512(sp)
  lw t1, 528(sp)
  add t2, t0, t1
  sw t2, 532(sp)

  # store
  lw t0, 532(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_77
  jr t0
_end_77:

  # load
  lw t0, 8(sp)
  sw t0, 536(sp)

  # binary
  lw t0, 536(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 540(sp)

  # store
  lw t0, 540(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 544(sp)

  # binary
  lw t0, 544(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 548(sp)

  # store
  lw t0, 548(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 552(sp)

  # binary
  lw t0, 552(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 556(sp)

  # store
  lw t0, 556(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_76
  jr t0
_while_body_80:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 332(sp)
  sw t0, 560(sp)

  # store
  lw t0, 560(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_81
  jr t0
_end_80:

  # load
  lw t0, 340(sp)
  sw t0, 564(sp)

  # store
  lw t0, 564(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 568(sp)

  # store
  lw t0, 568(sp)
  sw t0, 60(sp)

  # jump
  la t0, _end_79
  jr t0
_while_body_113:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 352(sp)
  sw t0, 572(sp)

  # store
  lw t0, 572(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_114
  jr t0
_end_113:

  # load
  lw t0, 360(sp)
  sw t0, 576(sp)

  # store
  lw t0, 576(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 580(sp)

  # store
  lw t0, 580(sp)
  sw t0, 52(sp)

  # load
  lw t0, 56(sp)
  sw t0, 584(sp)

  # store
  lw t0, 584(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 588(sp)

  # binary
  lw t0, 588(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 592(sp)

  # branch
  lw t0, 592(sp)
  bnez  t0, inter_label27
  la t1, _else_146
  jr t1
inter_label27:
  la t2, _then_146
  jr t2
_while_entry_152:

  # load
  lw t0, 4(sp)
  sw t0, 596(sp)

  # binary
  lw t0, 596(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 600(sp)

  # branch
  lw t0, 600(sp)
  bnez  t0, inter_label28
  la t1, _end_152
  jr t1
inter_label28:
  la t2, _while_body_152
  jr t2
_while_entry_227:

  # load
  lw t0, 448(sp)
  sw t0, 604(sp)

  # binary
  lw t0, 604(sp)
  sgt t1, t0, x0
  sw t1, 608(sp)

  # branch
  lw t0, 608(sp)
  bnez  t0, inter_label29
  la t1, _end_227
  jr t1
inter_label29:
  la t2, _while_body_227
  jr t2
_then_8:

  # load
  lw t0, 12(sp)
  sw t0, 612(sp)

  # binary
  lw t0, 612(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 616(sp)

  # binary
  lw t0, 616(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 620(sp)

  # store
  lw t0, 620(sp)
  sw t0, 468(sp)

  # jump
  la t0, _end_8
  jr t0
_else_8:

  # store
  sw x0, 468(sp)

  # jump
  la t0, _end_8
  jr t0
_then_9:

  # alloc

  # load
  lw t0, 140(sp)
  sw t0, 628(sp)

  # store
  lw t0, 628(sp)
  sw t0, 624(sp)

  # alloc

  # load
  lw t0, 124(sp)
  sw t0, 636(sp)

  # store
  lw t0, 636(sp)
  sw t0, 632(sp)

  # alloc

  # jump
  la t0, _while_entry_10
  jr t0
_end_9:

  # alloc

  # load
  lw t0, 124(sp)
  sw t0, 648(sp)

  # store
  lw t0, 648(sp)
  sw t0, 644(sp)

  # alloc

  # load
  lw t0, 124(sp)
  sw t0, 656(sp)

  # store
  lw t0, 656(sp)
  sw t0, 652(sp)

  # alloc

  # jump
  la t0, _while_entry_22
  jr t0
_then_41:

  # load
  lw t0, 12(sp)
  sw t0, 664(sp)

  # binary
  lw t0, 664(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 668(sp)

  # binary
  lw t0, 668(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 672(sp)

  # store
  lw t0, 672(sp)
  sw t0, 488(sp)

  # jump
  la t0, _end_41
  jr t0
_else_41:

  # store
  sw x0, 488(sp)

  # jump
  la t0, _end_41
  jr t0
_then_42:

  # alloc

  # load
  lw t0, 160(sp)
  sw t0, 680(sp)

  # store
  lw t0, 680(sp)
  sw t0, 676(sp)

  # alloc

  # load
  lw t0, 144(sp)
  sw t0, 688(sp)

  # store
  lw t0, 688(sp)
  sw t0, 684(sp)

  # alloc

  # jump
  la t0, _while_entry_43
  jr t0
_end_42:

  # alloc

  # load
  lw t0, 144(sp)
  sw t0, 700(sp)

  # store
  lw t0, 700(sp)
  sw t0, 696(sp)

  # alloc

  # load
  lw t0, 144(sp)
  sw t0, 708(sp)

  # store
  lw t0, 708(sp)
  sw t0, 704(sp)

  # alloc

  # jump
  la t0, _while_entry_55
  jr t0
_end_72:

  # jump
  la t0, _end_71
  jr t0
_then_74:

  # load
  lw t0, 8(sp)
  sw t0, 716(sp)

  # load
  lw t0, 12(sp)
  sw t0, 720(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 720(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 724(sp)

  # load
  lw t0, 724(sp)
  lw t1, (t0)
  sw t1, 728(sp)

  # binary
  lw t0, 716(sp)
  lw t1, 728(sp)
  div t2, t0, t1
  sw t2, 732(sp)

  # store
  lw t0, 732(sp)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  sw t0, 736(sp)

  # binary
  lw t0, 736(sp)
  li t1, 65536
  add t2, t0, t1
  sw t2, 740(sp)

  # load
  lw t0, 12(sp)
  sw t0, 744(sp)

  # binary
  li t0, 15
  lw t1, 744(sp)
  sub t2, t0, t1
  sw t2, 748(sp)

  # binary
  lw t0, 748(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 752(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 752(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 756(sp)

  # load
  lw t0, 756(sp)
  lw t1, (t0)
  sw t1, 760(sp)

  # binary
  lw t0, 740(sp)
  lw t1, 760(sp)
  sub t2, t0, t1
  sw t2, 764(sp)

  # store
  lw t0, 764(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_74
  jr t0
_else_74:

  # load
  lw t0, 8(sp)
  sw t0, 768(sp)

  # load
  lw t0, 12(sp)
  sw t0, 772(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 772(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 776(sp)

  # load
  lw t0, 776(sp)
  lw t1, (t0)
  sw t1, 780(sp)

  # binary
  lw t0, 768(sp)
  lw t1, 780(sp)
  div t2, t0, t1
  sw t2, 784(sp)

  # store
  lw t0, 784(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_74
  jr t0
_end_73:

  # jump
  la t0, _end_71
  jr t0
_while_entry_81:

  # load
  lw t0, 4(sp)
  sw t0, 788(sp)

  # binary
  lw t0, 788(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 792(sp)

  # branch
  lw t0, 792(sp)
  bnez  t0, inter_label30
  la t1, _end_81
  jr t1
inter_label30:
  la t2, _while_body_81
  jr t2
_while_entry_114:

  # load
  lw t0, 4(sp)
  sw t0, 796(sp)

  # binary
  lw t0, 796(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 800(sp)

  # branch
  lw t0, 800(sp)
  bnez  t0, inter_label31
  la t1, _end_114
  jr t1
inter_label31:
  la t2, _while_body_114
  jr t2
_then_146:

  # load
  lw t0, 8(sp)
  sw t0, 804(sp)

  # binary
  lw t0, 804(sp)
  slt t1, t0, x0
  sw t1, 808(sp)

  # branch
  lw t0, 808(sp)
  bnez  t0, inter_label32
  la t1, _else_147
  jr t1
inter_label32:
  la t2, _then_147
  jr t2
_else_146:

  # load
  lw t0, 12(sp)
  sw t0, 812(sp)

  # binary
  lw t0, 812(sp)
  sgt t1, t0, x0
  sw t1, 816(sp)

  # branch
  lw t0, 816(sp)
  bnez  t0, inter_label33
  la t1, _else_148
  jr t1
inter_label33:
  la t2, _then_148
  jr t2
_while_body_152:

  # load
  lw t0, 8(sp)
  sw t0, 820(sp)

  # binary
  lw t0, 820(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 824(sp)

  # alloc

  # binary
  lw t0, 824(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 832(sp)

  # branch
  lw t0, 832(sp)
  bnez  t0, inter_label34
  la t1, _else_154
  jr t1
inter_label34:
  la t2, _then_154
  jr t2
_end_152:

  # load
  lw t0, 0(sp)
  sw t0, 836(sp)

  # branch
  lw t0, 836(sp)
  bnez  t0, inter_label35
  la t1, _end_155
  jr t1
inter_label35:
  la t2, _then_155
  jr t2
_while_body_227:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 448(sp)
  sw t0, 840(sp)

  # store
  lw t0, 840(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_228
  jr t0
_end_227:

  # load
  lw t0, 456(sp)
  sw t0, 844(sp)

  # store
  lw t0, 844(sp)
  sw t0, 0(sp)

  # load
  lw t0, 16(sp)
  sw t0, 848(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 848(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 852(sp)

  # load
  lw t0, 852(sp)
  lw t1, (t0)
  sw t1, 856(sp)

  # load
  lw t0, 0(sp)
  sw t0, 860(sp)

  # binary
  lw t0, 856(sp)
  lw t1, 860(sp)
  xor t2, t0, t1
  snez t2, t2
  sw t2, 864(sp)

  # branch
  lw t0, 864(sp)
  bnez  t0, inter_label36
  la t1, _end_302
  jr t1
inter_label36:
  la t2, _then_302
  jr t2
_end_8:

  # load
  lw t0, 468(sp)
  sw t0, 868(sp)

  # branch
  lw t0, 868(sp)
  bnez  t0, inter_label37
  la t1, _end_7
  jr t1
inter_label37:
  la t2, _then_7
  jr t2
_while_entry_10:

  # load
  lw t0, 632(sp)
  sw t0, 872(sp)

  # branch
  lw t0, 872(sp)
  bnez  t0, inter_label38
  la t1, _end_10
  jr t1
inter_label38:
  la t2, _while_body_10
  jr t2
_while_entry_22:

  # load
  lw t0, 652(sp)
  sw t0, 876(sp)

  # branch
  lw t0, 876(sp)
  bnez  t0, inter_label39
  la t1, _end_22
  jr t1
inter_label39:
  la t2, _while_body_22
  jr t2
_end_41:

  # load
  lw t0, 488(sp)
  sw t0, 880(sp)

  # branch
  lw t0, 880(sp)
  bnez  t0, inter_label40
  la t1, _end_40
  jr t1
inter_label40:
  la t2, _then_40
  jr t2
_while_entry_43:

  # load
  lw t0, 684(sp)
  sw t0, 884(sp)

  # branch
  lw t0, 884(sp)
  bnez  t0, inter_label41
  la t1, _end_43
  jr t1
inter_label41:
  la t2, _while_body_43
  jr t2
_while_entry_55:

  # load
  lw t0, 704(sp)
  sw t0, 888(sp)

  # branch
  lw t0, 888(sp)
  bnez  t0, inter_label42
  la t1, _end_55
  jr t1
inter_label42:
  la t2, _while_body_55
  jr t2
_end_71:

  # load
  lw t0, 0(sp)
  sw t0, 892(sp)

  # store
  lw t0, 892(sp)
  sw t0, 24(sp)

  # jump
  la t0, _while_entry_0
  jr t0
_end_74:

  # jump
  la t0, _end_73
  jr t0
_while_body_81:

  # load
  lw t0, 8(sp)
  sw t0, 896(sp)

  # binary
  lw t0, 896(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 900(sp)

  # alloc

  # binary
  lw t0, 900(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 908(sp)

  # branch
  lw t0, 908(sp)
  bnez  t0, inter_label43
  la t1, _else_83
  jr t1
inter_label43:
  la t2, _then_83
  jr t2
_end_81:

  # load
  lw t0, 0(sp)
  sw t0, 912(sp)

  # branch
  lw t0, 912(sp)
  bnez  t0, inter_label44
  la t1, _end_84
  jr t1
inter_label44:
  la t2, _then_84
  jr t2
_while_body_114:

  # load
  lw t0, 8(sp)
  sw t0, 916(sp)

  # binary
  lw t0, 916(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 920(sp)

  # alloc

  # binary
  lw t0, 920(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 928(sp)

  # branch
  lw t0, 928(sp)
  bnez  t0, inter_label45
  la t1, _else_116
  jr t1
inter_label45:
  la t2, _then_116
  jr t2
_end_114:

  # load
  lw t0, 0(sp)
  sw t0, 932(sp)

  # branch
  lw t0, 932(sp)
  bnez  t0, inter_label46
  la t1, _end_117
  jr t1
inter_label46:
  la t2, _then_117
  jr t2
_then_147:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_147
  jr t0
_else_147:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_147
  jr t0
_then_148:

  # load
  lw t0, 8(sp)
  sw t0, 936(sp)

  # binary
  lw t0, 936(sp)
  li t1, 32767
  sgt t2, t0, t1
  sw t2, 940(sp)

  # branch
  lw t0, 940(sp)
  bnez  t0, inter_label47
  la t1, _else_149
  jr t1
inter_label47:
  la t2, _then_149
  jr t2
_else_148:

  # load
  lw t0, 8(sp)
  sw t0, 944(sp)

  # store
  lw t0, 944(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_148
  jr t0
_then_154:

  # load
  lw t0, 12(sp)
  sw t0, 948(sp)

  # binary
  lw t0, 948(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 952(sp)

  # binary
  lw t0, 952(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 956(sp)

  # store
  lw t0, 956(sp)
  sw t0, 828(sp)

  # jump
  la t0, _end_154
  jr t0
_else_154:

  # store
  sw x0, 828(sp)

  # jump
  la t0, _end_154
  jr t0
_then_155:

  # alloc

  # load
  lw t0, 224(sp)
  sw t0, 964(sp)

  # store
  lw t0, 964(sp)
  sw t0, 960(sp)

  # alloc

  # load
  lw t0, 212(sp)
  sw t0, 972(sp)

  # store
  lw t0, 972(sp)
  sw t0, 968(sp)

  # alloc

  # store
  sw x0, 976(sp)

  # jump
  la t0, _while_entry_156
  jr t0
_end_155:

  # alloc

  # load
  lw t0, 212(sp)
  sw t0, 984(sp)

  # store
  lw t0, 984(sp)
  sw t0, 980(sp)

  # alloc

  # load
  lw t0, 212(sp)
  sw t0, 992(sp)

  # store
  lw t0, 992(sp)
  sw t0, 988(sp)

  # alloc

  # store
  sw x0, 996(sp)

  # jump
  la t0, _while_entry_189
  jr t0
_while_entry_228:

  # load
  lw t0, 4(sp)
  sw t0, 1000(sp)

  # binary
  lw t0, 1000(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1004(sp)

  # branch
  lw t0, 1004(sp)
  bnez  t0, inter_label48
  la t1, _end_228
  jr t1
inter_label48:
  la t2, _while_body_228
  jr t2
_then_302:

  # ret
  li t0, 1
  mv a0, t0

  # epilogue
  li t1, 8812
  add t1, t1, sp
  lw ra, 0(t1)
  li t0, 8816
  add sp, sp, t0
  ret
_end_302:

  # load
  lw t0, 16(sp)
  sw t0, 1008(sp)

  # binary
  lw t0, 1008(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1012(sp)

  # store
  lw t0, 1012(sp)
  sw t0, 16(sp)

  # jump
  la t0, _while_entry_226
  jr t0
_then_7:

  # load
  lw t0, 0(sp)
  sw t0, 1016(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1020(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1020(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1024(sp)

  # load
  lw t0, 1024(sp)
  lw t1, (t0)
  sw t1, 1028(sp)

  # binary
  li t0, 1
  lw t1, 1028(sp)
  mul t2, t0, t1
  sw t2, 1032(sp)

  # binary
  lw t0, 1016(sp)
  lw t1, 1032(sp)
  add t2, t0, t1
  sw t2, 1036(sp)

  # store
  lw t0, 1036(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_7
  jr t0
_end_7:

  # load
  lw t0, 8(sp)
  sw t0, 1040(sp)

  # binary
  lw t0, 1040(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1044(sp)

  # store
  lw t0, 1044(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1048(sp)

  # binary
  lw t0, 1048(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1052(sp)

  # store
  lw t0, 1052(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1056(sp)

  # binary
  lw t0, 1056(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1060(sp)

  # store
  lw t0, 1060(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_6
  jr t0
_while_body_10:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 624(sp)
  sw t0, 1064(sp)

  # store
  lw t0, 1064(sp)
  sw t0, 8(sp)

  # load
  lw t0, 632(sp)
  sw t0, 1068(sp)

  # store
  lw t0, 1068(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_11
  jr t0
_end_10:

  # load
  lw t0, 624(sp)
  sw t0, 1072(sp)

  # store
  lw t0, 1072(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1076(sp)

  # store
  lw t0, 1076(sp)
  sw t0, 140(sp)

  # jump
  la t0, _end_9
  jr t0
_while_body_22:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 644(sp)
  sw t0, 1080(sp)

  # store
  lw t0, 1080(sp)
  sw t0, 8(sp)

  # load
  lw t0, 652(sp)
  sw t0, 1084(sp)

  # store
  lw t0, 1084(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_23
  jr t0
_end_22:

  # load
  lw t0, 644(sp)
  sw t0, 1088(sp)

  # store
  lw t0, 1088(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1092(sp)

  # store
  lw t0, 1092(sp)
  sw t0, 124(sp)

  # load
  lw t0, 132(sp)
  sw t0, 1096(sp)

  # store
  lw t0, 1096(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1100(sp)

  # binary
  lw t0, 1100(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 1104(sp)

  # branch
  lw t0, 1104(sp)
  bnez  t0, inter_label49
  la t1, _else_34
  jr t1
inter_label49:
  la t2, _then_34
  jr t2
_then_40:

  # load
  lw t0, 0(sp)
  sw t0, 1108(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1112(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1112(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1116(sp)

  # load
  lw t0, 1116(sp)
  lw t1, (t0)
  sw t1, 1120(sp)

  # binary
  li t0, 1
  lw t1, 1120(sp)
  mul t2, t0, t1
  sw t2, 1124(sp)

  # binary
  lw t0, 1108(sp)
  lw t1, 1124(sp)
  add t2, t0, t1
  sw t2, 1128(sp)

  # store
  lw t0, 1128(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_40
  jr t0
_end_40:

  # load
  lw t0, 8(sp)
  sw t0, 1132(sp)

  # binary
  lw t0, 1132(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1136(sp)

  # store
  lw t0, 1136(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1140(sp)

  # binary
  lw t0, 1140(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1144(sp)

  # store
  lw t0, 1144(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1148(sp)

  # binary
  lw t0, 1148(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1152(sp)

  # store
  lw t0, 1152(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_39
  jr t0
_while_body_43:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 676(sp)
  sw t0, 1156(sp)

  # store
  lw t0, 1156(sp)
  sw t0, 8(sp)

  # load
  lw t0, 684(sp)
  sw t0, 1160(sp)

  # store
  lw t0, 1160(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_44
  jr t0
_end_43:

  # load
  lw t0, 676(sp)
  sw t0, 1164(sp)

  # store
  lw t0, 1164(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1168(sp)

  # store
  lw t0, 1168(sp)
  sw t0, 160(sp)

  # jump
  la t0, _end_42
  jr t0
_while_body_55:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 696(sp)
  sw t0, 1172(sp)

  # store
  lw t0, 1172(sp)
  sw t0, 8(sp)

  # load
  lw t0, 704(sp)
  sw t0, 1176(sp)

  # store
  lw t0, 1176(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_56
  jr t0
_end_55:

  # load
  lw t0, 696(sp)
  sw t0, 1180(sp)

  # store
  lw t0, 1180(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1184(sp)

  # store
  lw t0, 1184(sp)
  sw t0, 144(sp)

  # load
  lw t0, 152(sp)
  sw t0, 1188(sp)

  # store
  lw t0, 1188(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1192(sp)

  # binary
  lw t0, 1192(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 1196(sp)

  # branch
  lw t0, 1196(sp)
  bnez  t0, inter_label50
  la t1, _else_67
  jr t1
inter_label50:
  la t2, _then_67
  jr t2
_then_83:

  # load
  lw t0, 12(sp)
  sw t0, 1200(sp)

  # binary
  lw t0, 1200(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1204(sp)

  # binary
  lw t0, 1204(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 1208(sp)

  # store
  lw t0, 1208(sp)
  sw t0, 904(sp)

  # jump
  la t0, _end_83
  jr t0
_else_83:

  # store
  sw x0, 904(sp)

  # jump
  la t0, _end_83
  jr t0
_then_84:

  # alloc

  # load
  lw t0, 340(sp)
  sw t0, 1216(sp)

  # store
  lw t0, 1216(sp)
  sw t0, 1212(sp)

  # alloc

  # load
  lw t0, 324(sp)
  sw t0, 1224(sp)

  # store
  lw t0, 1224(sp)
  sw t0, 1220(sp)

  # alloc

  # jump
  la t0, _while_entry_85
  jr t0
_end_84:

  # alloc

  # load
  lw t0, 324(sp)
  sw t0, 1236(sp)

  # store
  lw t0, 1236(sp)
  sw t0, 1232(sp)

  # alloc

  # load
  lw t0, 324(sp)
  sw t0, 1244(sp)

  # store
  lw t0, 1244(sp)
  sw t0, 1240(sp)

  # alloc

  # jump
  la t0, _while_entry_97
  jr t0
_then_116:

  # load
  lw t0, 12(sp)
  sw t0, 1252(sp)

  # binary
  lw t0, 1252(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1256(sp)

  # binary
  lw t0, 1256(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 1260(sp)

  # store
  lw t0, 1260(sp)
  sw t0, 924(sp)

  # jump
  la t0, _end_116
  jr t0
_else_116:

  # store
  sw x0, 924(sp)

  # jump
  la t0, _end_116
  jr t0
_then_117:

  # alloc

  # load
  lw t0, 360(sp)
  sw t0, 1268(sp)

  # store
  lw t0, 1268(sp)
  sw t0, 1264(sp)

  # alloc

  # load
  lw t0, 344(sp)
  sw t0, 1276(sp)

  # store
  lw t0, 1276(sp)
  sw t0, 1272(sp)

  # alloc

  # jump
  la t0, _while_entry_118
  jr t0
_end_117:

  # alloc

  # load
  lw t0, 344(sp)
  sw t0, 1288(sp)

  # store
  lw t0, 1288(sp)
  sw t0, 1284(sp)

  # alloc

  # load
  lw t0, 344(sp)
  sw t0, 1296(sp)

  # store
  lw t0, 1296(sp)
  sw t0, 1292(sp)

  # alloc

  # jump
  la t0, _while_entry_130
  jr t0
_end_147:

  # jump
  la t0, _end_146
  jr t0
_then_149:

  # load
  lw t0, 8(sp)
  sw t0, 1304(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1308(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1308(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1312(sp)

  # load
  lw t0, 1312(sp)
  lw t1, (t0)
  sw t1, 1316(sp)

  # binary
  lw t0, 1304(sp)
  lw t1, 1316(sp)
  div t2, t0, t1
  sw t2, 1320(sp)

  # store
  lw t0, 1320(sp)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  sw t0, 1324(sp)

  # binary
  lw t0, 1324(sp)
  li t1, 65536
  add t2, t0, t1
  sw t2, 1328(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1332(sp)

  # binary
  li t0, 15
  lw t1, 1332(sp)
  sub t2, t0, t1
  sw t2, 1336(sp)

  # binary
  lw t0, 1336(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1340(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1340(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1344(sp)

  # load
  lw t0, 1344(sp)
  lw t1, (t0)
  sw t1, 1348(sp)

  # binary
  lw t0, 1328(sp)
  lw t1, 1348(sp)
  sub t2, t0, t1
  sw t2, 1352(sp)

  # store
  lw t0, 1352(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_149
  jr t0
_else_149:

  # load
  lw t0, 8(sp)
  sw t0, 1356(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1360(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1360(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1364(sp)

  # load
  lw t0, 1364(sp)
  lw t1, (t0)
  sw t1, 1368(sp)

  # binary
  lw t0, 1356(sp)
  lw t1, 1368(sp)
  div t2, t0, t1
  sw t2, 1372(sp)

  # store
  lw t0, 1372(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_149
  jr t0
_end_148:

  # jump
  la t0, _end_146
  jr t0
_end_154:

  # load
  lw t0, 828(sp)
  sw t0, 1376(sp)

  # branch
  lw t0, 1376(sp)
  bnez  t0, inter_label51
  la t1, _end_153
  jr t1
inter_label51:
  la t2, _then_153
  jr t2
_while_entry_156:

  # load
  lw t0, 968(sp)
  sw t0, 1380(sp)

  # branch
  lw t0, 1380(sp)
  bnez  t0, inter_label52
  la t1, _end_156
  jr t1
inter_label52:
  la t2, _while_body_156
  jr t2
_while_entry_189:

  # load
  lw t0, 988(sp)
  sw t0, 1384(sp)

  # branch
  lw t0, 1384(sp)
  bnez  t0, inter_label53
  la t1, _end_189
  jr t1
inter_label53:
  la t2, _while_body_189
  jr t2
_while_body_228:

  # load
  lw t0, 8(sp)
  sw t0, 1388(sp)

  # binary
  lw t0, 1388(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1392(sp)

  # alloc

  # binary
  lw t0, 1392(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 1400(sp)

  # branch
  lw t0, 1400(sp)
  bnez  t0, inter_label54
  la t1, _else_230
  jr t1
inter_label54:
  la t2, _then_230
  jr t2
_end_228:

  # load
  lw t0, 0(sp)
  sw t0, 1404(sp)

  # branch
  lw t0, 1404(sp)
  bnez  t0, inter_label55
  la t1, _end_231
  jr t1
inter_label55:
  la t2, _then_231
  jr t2
_while_entry_11:

  # load
  lw t0, 4(sp)
  sw t0, 1408(sp)

  # binary
  lw t0, 1408(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1412(sp)

  # branch
  lw t0, 1412(sp)
  bnez  t0, inter_label56
  la t1, _end_11
  jr t1
inter_label56:
  la t2, _while_body_11
  jr t2
_while_entry_23:

  # load
  lw t0, 4(sp)
  sw t0, 1416(sp)

  # binary
  lw t0, 1416(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1420(sp)

  # branch
  lw t0, 1420(sp)
  bnez  t0, inter_label57
  la t1, _end_23
  jr t1
inter_label57:
  la t2, _while_body_23
  jr t2
_then_34:

  # load
  lw t0, 8(sp)
  sw t0, 1424(sp)

  # binary
  lw t0, 1424(sp)
  slt t1, t0, x0
  sw t1, 1428(sp)

  # branch
  lw t0, 1428(sp)
  bnez  t0, inter_label58
  la t1, _else_35
  jr t1
inter_label58:
  la t2, _then_35
  jr t2
_else_34:

  # load
  lw t0, 12(sp)
  sw t0, 1432(sp)

  # binary
  lw t0, 1432(sp)
  sgt t1, t0, x0
  sw t1, 1436(sp)

  # branch
  lw t0, 1436(sp)
  bnez  t0, inter_label59
  la t1, _else_36
  jr t1
inter_label59:
  la t2, _then_36
  jr t2
_while_entry_44:

  # load
  lw t0, 4(sp)
  sw t0, 1440(sp)

  # binary
  lw t0, 1440(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1444(sp)

  # branch
  lw t0, 1444(sp)
  bnez  t0, inter_label60
  la t1, _end_44
  jr t1
inter_label60:
  la t2, _while_body_44
  jr t2
_while_entry_56:

  # load
  lw t0, 4(sp)
  sw t0, 1448(sp)

  # binary
  lw t0, 1448(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1452(sp)

  # branch
  lw t0, 1452(sp)
  bnez  t0, inter_label61
  la t1, _end_56
  jr t1
inter_label61:
  la t2, _while_body_56
  jr t2
_then_67:

  # load
  lw t0, 8(sp)
  sw t0, 1456(sp)

  # binary
  lw t0, 1456(sp)
  slt t1, t0, x0
  sw t1, 1460(sp)

  # branch
  lw t0, 1460(sp)
  bnez  t0, inter_label62
  la t1, _else_68
  jr t1
inter_label62:
  la t2, _then_68
  jr t2
_else_67:

  # load
  lw t0, 12(sp)
  sw t0, 1464(sp)

  # binary
  lw t0, 1464(sp)
  sgt t1, t0, x0
  sw t1, 1468(sp)

  # branch
  lw t0, 1468(sp)
  bnez  t0, inter_label63
  la t1, _else_69
  jr t1
inter_label63:
  la t2, _then_69
  jr t2
_end_83:

  # load
  lw t0, 904(sp)
  sw t0, 1472(sp)

  # branch
  lw t0, 1472(sp)
  bnez  t0, inter_label64
  la t1, _end_82
  jr t1
inter_label64:
  la t2, _then_82
  jr t2
_while_entry_85:

  # load
  lw t0, 1220(sp)
  sw t0, 1476(sp)

  # branch
  lw t0, 1476(sp)
  bnez  t0, inter_label65
  la t1, _end_85
  jr t1
inter_label65:
  la t2, _while_body_85
  jr t2
_while_entry_97:

  # load
  lw t0, 1240(sp)
  sw t0, 1480(sp)

  # branch
  lw t0, 1480(sp)
  bnez  t0, inter_label66
  la t1, _end_97
  jr t1
inter_label66:
  la t2, _while_body_97
  jr t2
_end_116:

  # load
  lw t0, 924(sp)
  sw t0, 1484(sp)

  # branch
  lw t0, 1484(sp)
  bnez  t0, inter_label67
  la t1, _end_115
  jr t1
inter_label67:
  la t2, _then_115
  jr t2
_while_entry_118:

  # load
  lw t0, 1272(sp)
  sw t0, 1488(sp)

  # branch
  lw t0, 1488(sp)
  bnez  t0, inter_label68
  la t1, _end_118
  jr t1
inter_label68:
  la t2, _while_body_118
  jr t2
_while_entry_130:

  # load
  lw t0, 1292(sp)
  sw t0, 1492(sp)

  # branch
  lw t0, 1492(sp)
  bnez  t0, inter_label69
  la t1, _end_130
  jr t1
inter_label69:
  la t2, _while_body_130
  jr t2
_end_146:

  # load
  lw t0, 0(sp)
  sw t0, 1496(sp)

  # store
  lw t0, 1496(sp)
  sw t0, 56(sp)

  # jump
  la t0, _while_entry_75
  jr t0
_end_149:

  # jump
  la t0, _end_148
  jr t0
_then_153:

  # load
  lw t0, 0(sp)
  sw t0, 1500(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1504(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1504(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1508(sp)

  # load
  lw t0, 1508(sp)
  lw t1, (t0)
  sw t1, 1512(sp)

  # binary
  li t0, 1
  lw t1, 1512(sp)
  mul t2, t0, t1
  sw t2, 1516(sp)

  # binary
  lw t0, 1500(sp)
  lw t1, 1516(sp)
  add t2, t0, t1
  sw t2, 1520(sp)

  # store
  lw t0, 1520(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_153
  jr t0
_end_153:

  # load
  lw t0, 8(sp)
  sw t0, 1524(sp)

  # binary
  lw t0, 1524(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1528(sp)

  # store
  lw t0, 1528(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1532(sp)

  # binary
  lw t0, 1532(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1536(sp)

  # store
  lw t0, 1536(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1540(sp)

  # binary
  lw t0, 1540(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1544(sp)

  # store
  lw t0, 1544(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_152
  jr t0
_while_body_156:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 968(sp)
  sw t0, 1548(sp)

  # store
  lw t0, 1548(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_157
  jr t0
_end_156:

  # load
  lw t0, 976(sp)
  sw t0, 1552(sp)

  # store
  lw t0, 1552(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1556(sp)

  # store
  lw t0, 1556(sp)
  sw t0, 224(sp)

  # jump
  la t0, _end_155
  jr t0
_while_body_189:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 988(sp)
  sw t0, 1560(sp)

  # store
  lw t0, 1560(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_190
  jr t0
_end_189:

  # load
  lw t0, 996(sp)
  sw t0, 1564(sp)

  # store
  lw t0, 1564(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1568(sp)

  # store
  lw t0, 1568(sp)
  sw t0, 212(sp)

  # load
  lw t0, 216(sp)
  sw t0, 1572(sp)

  # store
  lw t0, 1572(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1576(sp)

  # binary
  lw t0, 1576(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 1580(sp)

  # branch
  lw t0, 1580(sp)
  bnez  t0, inter_label70
  la t1, _else_222
  jr t1
inter_label70:
  la t2, _then_222
  jr t2
_then_230:

  # load
  lw t0, 12(sp)
  sw t0, 1584(sp)

  # binary
  lw t0, 1584(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1588(sp)

  # binary
  lw t0, 1588(sp)
  xor t1, t0, x0
  snez t1, t1
  sw t1, 1592(sp)

  # store
  lw t0, 1592(sp)
  sw t0, 1396(sp)

  # jump
  la t0, _end_230
  jr t0
_else_230:

  # store
  sw x0, 1396(sp)

  # jump
  la t0, _end_230
  jr t0
_then_231:

  # alloc

  # load
  lw t0, 456(sp)
  sw t0, 1600(sp)

  # store
  lw t0, 1600(sp)
  sw t0, 1596(sp)

  # alloc

  # load
  lw t0, 444(sp)
  sw t0, 1608(sp)

  # store
  lw t0, 1608(sp)
  sw t0, 1604(sp)

  # alloc

  # store
  sw x0, 1612(sp)

  # jump
  la t0, _while_entry_232
  jr t0
_end_231:

  # alloc

  # load
  lw t0, 444(sp)
  sw t0, 1620(sp)

  # store
  lw t0, 1620(sp)
  sw t0, 1616(sp)

  # alloc

  # load
  lw t0, 444(sp)
  sw t0, 1628(sp)

  # store
  lw t0, 1628(sp)
  sw t0, 1624(sp)

  # alloc

  # store
  sw x0, 1632(sp)

  # jump
  la t0, _while_entry_265
  jr t0
_while_body_11:

  # load
  lw t0, 8(sp)
  sw t0, 1636(sp)

  # binary
  lw t0, 1636(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1640(sp)

  # branch
  lw t0, 1640(sp)
  bnez  t0, inter_label71
  la t1, _else_12
  jr t1
inter_label71:
  la t2, _then_12
  jr t2
_end_11:

  # load
  lw t0, 0(sp)
  sw t0, 1644(sp)

  # store
  lw t0, 1644(sp)
  sw t0, 640(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 624(sp)
  sw t0, 1648(sp)

  # store
  lw t0, 1648(sp)
  sw t0, 8(sp)

  # load
  lw t0, 632(sp)
  sw t0, 1652(sp)

  # store
  lw t0, 1652(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_15
  jr t0
_while_body_23:

  # load
  lw t0, 8(sp)
  sw t0, 1656(sp)

  # binary
  lw t0, 1656(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1660(sp)

  # branch
  lw t0, 1660(sp)
  bnez  t0, inter_label72
  la t1, _else_24
  jr t1
inter_label72:
  la t2, _then_24
  jr t2
_end_23:

  # load
  lw t0, 0(sp)
  sw t0, 1664(sp)

  # store
  lw t0, 1664(sp)
  sw t0, 660(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 644(sp)
  sw t0, 1668(sp)

  # store
  lw t0, 1668(sp)
  sw t0, 8(sp)

  # load
  lw t0, 652(sp)
  sw t0, 1672(sp)

  # store
  lw t0, 1672(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_27
  jr t0
_then_35:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_35
  jr t0
_else_35:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_35
  jr t0
_then_36:

  # load
  lw t0, 8(sp)
  sw t0, 1676(sp)

  # binary
  lw t0, 1676(sp)
  li t1, 32767
  sgt t2, t0, t1
  sw t2, 1680(sp)

  # branch
  lw t0, 1680(sp)
  bnez  t0, inter_label73
  la t1, _else_37
  jr t1
inter_label73:
  la t2, _then_37
  jr t2
_else_36:

  # load
  lw t0, 8(sp)
  sw t0, 1684(sp)

  # store
  lw t0, 1684(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_36
  jr t0
_while_body_44:

  # load
  lw t0, 8(sp)
  sw t0, 1688(sp)

  # binary
  lw t0, 1688(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1692(sp)

  # branch
  lw t0, 1692(sp)
  bnez  t0, inter_label74
  la t1, _else_45
  jr t1
inter_label74:
  la t2, _then_45
  jr t2
_end_44:

  # load
  lw t0, 0(sp)
  sw t0, 1696(sp)

  # store
  lw t0, 1696(sp)
  sw t0, 692(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 676(sp)
  sw t0, 1700(sp)

  # store
  lw t0, 1700(sp)
  sw t0, 8(sp)

  # load
  lw t0, 684(sp)
  sw t0, 1704(sp)

  # store
  lw t0, 1704(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_48
  jr t0
_while_body_56:

  # load
  lw t0, 8(sp)
  sw t0, 1708(sp)

  # binary
  lw t0, 1708(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1712(sp)

  # branch
  lw t0, 1712(sp)
  bnez  t0, inter_label75
  la t1, _else_57
  jr t1
inter_label75:
  la t2, _then_57
  jr t2
_end_56:

  # load
  lw t0, 0(sp)
  sw t0, 1716(sp)

  # store
  lw t0, 1716(sp)
  sw t0, 712(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 696(sp)
  sw t0, 1720(sp)

  # store
  lw t0, 1720(sp)
  sw t0, 8(sp)

  # load
  lw t0, 704(sp)
  sw t0, 1724(sp)

  # store
  lw t0, 1724(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_60
  jr t0
_then_68:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_68
  jr t0
_else_68:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_68
  jr t0
_then_69:

  # load
  lw t0, 8(sp)
  sw t0, 1728(sp)

  # binary
  lw t0, 1728(sp)
  li t1, 32767
  sgt t2, t0, t1
  sw t2, 1732(sp)

  # branch
  lw t0, 1732(sp)
  bnez  t0, inter_label76
  la t1, _else_70
  jr t1
inter_label76:
  la t2, _then_70
  jr t2
_else_69:

  # load
  lw t0, 8(sp)
  sw t0, 1736(sp)

  # store
  lw t0, 1736(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_69
  jr t0
_then_82:

  # load
  lw t0, 0(sp)
  sw t0, 1740(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1744(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1744(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1748(sp)

  # load
  lw t0, 1748(sp)
  lw t1, (t0)
  sw t1, 1752(sp)

  # binary
  li t0, 1
  lw t1, 1752(sp)
  mul t2, t0, t1
  sw t2, 1756(sp)

  # binary
  lw t0, 1740(sp)
  lw t1, 1756(sp)
  add t2, t0, t1
  sw t2, 1760(sp)

  # store
  lw t0, 1760(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_82
  jr t0
_end_82:

  # load
  lw t0, 8(sp)
  sw t0, 1764(sp)

  # binary
  lw t0, 1764(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1768(sp)

  # store
  lw t0, 1768(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1772(sp)

  # binary
  lw t0, 1772(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1776(sp)

  # store
  lw t0, 1776(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1780(sp)

  # binary
  lw t0, 1780(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1784(sp)

  # store
  lw t0, 1784(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_81
  jr t0
_while_body_85:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1212(sp)
  sw t0, 1788(sp)

  # store
  lw t0, 1788(sp)
  sw t0, 8(sp)

  # load
  lw t0, 1220(sp)
  sw t0, 1792(sp)

  # store
  lw t0, 1792(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_86
  jr t0
_end_85:

  # load
  lw t0, 1212(sp)
  sw t0, 1796(sp)

  # store
  lw t0, 1796(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1800(sp)

  # store
  lw t0, 1800(sp)
  sw t0, 340(sp)

  # jump
  la t0, _end_84
  jr t0
_while_body_97:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1232(sp)
  sw t0, 1804(sp)

  # store
  lw t0, 1804(sp)
  sw t0, 8(sp)

  # load
  lw t0, 1240(sp)
  sw t0, 1808(sp)

  # store
  lw t0, 1808(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_98
  jr t0
_end_97:

  # load
  lw t0, 1232(sp)
  sw t0, 1812(sp)

  # store
  lw t0, 1812(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1816(sp)

  # store
  lw t0, 1816(sp)
  sw t0, 324(sp)

  # load
  lw t0, 332(sp)
  sw t0, 1820(sp)

  # store
  lw t0, 1820(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1824(sp)

  # binary
  lw t0, 1824(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 1828(sp)

  # branch
  lw t0, 1828(sp)
  bnez  t0, inter_label77
  la t1, _else_109
  jr t1
inter_label77:
  la t2, _then_109
  jr t2
_then_115:

  # load
  lw t0, 0(sp)
  sw t0, 1832(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1836(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 1836(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 1840(sp)

  # load
  lw t0, 1840(sp)
  lw t1, (t0)
  sw t1, 1844(sp)

  # binary
  li t0, 1
  lw t1, 1844(sp)
  mul t2, t0, t1
  sw t2, 1848(sp)

  # binary
  lw t0, 1832(sp)
  lw t1, 1848(sp)
  add t2, t0, t1
  sw t2, 1852(sp)

  # store
  lw t0, 1852(sp)
  sw t0, 0(sp)

  # jump
  la t0, _end_115
  jr t0
_end_115:

  # load
  lw t0, 8(sp)
  sw t0, 1856(sp)

  # binary
  lw t0, 1856(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1860(sp)

  # store
  lw t0, 1860(sp)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1864(sp)

  # binary
  lw t0, 1864(sp)
  li t1, 2
  div t2, t0, t1
  sw t2, 1868(sp)

  # store
  lw t0, 1868(sp)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  sw t0, 1872(sp)

  # binary
  lw t0, 1872(sp)
  li t1, 1
  add t2, t0, t1
  sw t2, 1876(sp)

  # store
  lw t0, 1876(sp)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_114
  jr t0
_while_body_118:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1264(sp)
  sw t0, 1880(sp)

  # store
  lw t0, 1880(sp)
  sw t0, 8(sp)

  # load
  lw t0, 1272(sp)
  sw t0, 1884(sp)

  # store
  lw t0, 1884(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_119
  jr t0
_end_118:

  # load
  lw t0, 1264(sp)
  sw t0, 1888(sp)

  # store
  lw t0, 1888(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1892(sp)

  # store
  lw t0, 1892(sp)
  sw t0, 360(sp)

  # jump
  la t0, _end_117
  jr t0
_while_body_130:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1284(sp)
  sw t0, 1896(sp)

  # store
  lw t0, 1896(sp)
  sw t0, 8(sp)

  # load
  lw t0, 1292(sp)
  sw t0, 1900(sp)

  # store
  lw t0, 1900(sp)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_131
  jr t0
_end_130:

  # load
  lw t0, 1284(sp)
  sw t0, 1904(sp)

  # store
  lw t0, 1904(sp)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 1908(sp)

  # store
  lw t0, 1908(sp)
  sw t0, 344(sp)

  # load
  lw t0, 352(sp)
  sw t0, 1912(sp)

  # store
  lw t0, 1912(sp)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  sw t0, 1916(sp)

  # binary
  lw t0, 1916(sp)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  sw t2, 1920(sp)

  # branch
  lw t0, 1920(sp)
  bnez  t0, inter_label78
  la t1, _else_142
  jr t1
inter_label78:
  la t2, _then_142
  jr t2
_while_entry_157:

  # load
  lw t0, 4(sp)
  sw t0, 1924(sp)

  # binary
  lw t0, 1924(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1928(sp)

  # branch
  lw t0, 1928(sp)
  bnez  t0, inter_label79
  la t1, _end_157
  jr t1
inter_label79:
  la t2, _while_body_157
  jr t2
_while_entry_190:

  # load
  lw t0, 4(sp)
  sw t0, 1932(sp)

  # binary
  lw t0, 1932(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1936(sp)

  # branch
  lw t0, 1936(sp)
  bnez  t0, inter_label80
  la t1, _end_190
  jr t1
inter_label80:
  la t2, _while_body_190
  jr t2
_then_222:

  # load
  lw t0, 8(sp)
  sw t0, 1940(sp)

  # binary
  lw t0, 1940(sp)
  slt t1, t0, x0
  sw t1, 1944(sp)

  # branch
  lw t0, 1944(sp)
  bnez  t0, inter_label81
  la t1, _else_223
  jr t1
inter_label81:
  la t2, _then_223
  jr t2
_else_222:

  # load
  lw t0, 12(sp)
  sw t0, 1948(sp)

  # binary
  lw t0, 1948(sp)
  sgt t1, t0, x0
  sw t1, 1952(sp)

  # branch
  lw t0, 1952(sp)
  bnez  t0, inter_label82
  la t1, _else_224
  jr t1
inter_label82:
  la t2, _then_224
  jr t2
_end_230:

  # load
  lw t0, 1396(sp)
  sw t0, 1956(sp)

  # branch
  lw t0, 1956(sp)
  bnez  t0, inter_label83
  la t1, _end_229
  jr t1
inter_label83:
  la t2, _then_229
  jr t2
_while_entry_232:

  # load
  lw t0, 1604(sp)
  sw t0, 1960(sp)

  # branch
  lw t0, 1960(sp)
  bnez  t0, inter_label84
  la t1, _end_232
  jr t1
inter_label84:
  la t2, _while_body_232
  jr t2
_while_entry_265:

  # load
  lw t0, 1624(sp)
  sw t0, 1964(sp)

  # branch
  lw t0, 1964(sp)
  bnez  t0, inter_label85
  la t1, _end_265
  jr t1
inter_label85:
  la t2, _while_body_265
  jr t2
_then_12:

  # load
  lw t0, 12(sp)
  sw t0, 1968(sp)

  # binary
  lw t0, 1968(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1972(sp)

  # binary
  lw t0, 1972(sp)
  xor t1, t0, x0
  seqz t1, t1
  sw t1, 1976(sp)

  # branch
  lw t0, 1976(sp)
  bnez  t0, inter_label86
  la t1, _end_13
  jr t1
inter_label86:
  la t2, _then_13
  jr t2
_else_12:

  # load
  lw t0, 12(sp)
  sw t0, 1980(sp)

  # binary
  lw t0, 1980(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 1984(sp)

  # branch
  lw t0, 1984(sp)
  bnez  t0, inter_label87
  la t1, _end_14
  jr t1
inter_label87:
  la t2, _then_14
  jr t2
_while_entry_15:

  # load
  lw t0, 4(sp)
  sw t0, 1988(sp)

  # binary
  lw t0, 1988(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 1992(sp)

  # branch
  lw t0, 1992(sp)
  bnez  t0, inter_label88
  la t1, _end_15
  jr t1
inter_label88:
  la t2, _while_body_15
  jr t2
_then_24:

  # load
  lw t0, 12(sp)
  sw t0, 1996(sp)

  # binary
  lw t0, 1996(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 2000(sp)

  # binary
  lw t0, 2000(sp)
  xor t1, t0, x0
  seqz t1, t1
  sw t1, 2004(sp)

  # branch
  lw t0, 2004(sp)
  bnez  t0, inter_label89
  la t1, _end_25
  jr t1
inter_label89:
  la t2, _then_25
  jr t2
_else_24:

  # load
  lw t0, 12(sp)
  sw t0, 2008(sp)

  # binary
  lw t0, 2008(sp)
  li t1, 2
  rem t2, t0, t1
  sw t2, 2012(sp)

  # branch
  lw t0, 2012(sp)
  bnez  t0, inter_label90
  la t1, _end_26
  jr t1
inter_label90:
  la t2, _then_26
  jr t2
_while_entry_27:

  # load
  lw t0, 4(sp)
  sw t0, 2016(sp)

  # binary
  lw t0, 2016(sp)
  li t1, 16
  slt t2, t0, t1
  sw t2, 2020(sp)

  # branch
  lw t0, 2020(sp)
  bnez  t0, inter_label91
  la t1, _end_27
  jr t1
inter_label91:
  la t2, _while_body_27
  jr t2
_end_35:

  # jump
  la t0, _end_34
  jr t0
_then_37:

  # load
  lw t0, 8(sp)
  sw t0, 2024(sp)

  # load
  lw t0, 12(sp)
  sw t0, 2028(sp)

  # get elem ptr
  la t0, g_0
  lw t1, 2028(sp)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 2032(sp)

  # load
  lw t0, 2032(sp)
  lw t1, (t0)
  sw t1, 2036(sp)

  # binary
  lw t0, 2024(sp)
  lw t1, 2036(sp)
  div t2, t0, t1
  sw t2, 2040(sp)

  # store
  lw t0, 2040(sp)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  sw t0, 2044(sp)

  # binary
  lw t0, 2044(sp)
  li t1, 65536
  add t2, t0, t1
  li t3, 2048
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 2052
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 2052
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 2056
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2056
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 2060
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 2060
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2064
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2064
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2068
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2048
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2068
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 2072
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2072
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_37
  jr t0
_else_37:

  # load
  lw t0, 8(sp)
  li t1, 2076
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 2080
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2080
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2084
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2084
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2088
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2076
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2088
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 2092
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2092
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_37
  jr t0
_end_36:

  # jump
  la t0, _end_34
  jr t0
_then_45:

  # load
  lw t0, 12(sp)
  li t1, 2096
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2096
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2100
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2100
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 2104
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2104
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label92
  la t1, _end_46
  jr t1
inter_label92:
  la t2, _then_46
  jr t2
_else_45:

  # load
  lw t0, 12(sp)
  li t1, 2108
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2108
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2112
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2112
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label93
  la t1, _end_47
  jr t1
inter_label93:
  la t2, _then_47
  jr t2
_while_entry_48:

  # load
  lw t0, 4(sp)
  li t1, 2116
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2116
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2120
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2120
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label94
  la t1, _end_48
  jr t1
inter_label94:
  la t2, _while_body_48
  jr t2
_then_57:

  # load
  lw t0, 12(sp)
  li t1, 2124
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2124
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2128
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2128
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 2132
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2132
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label95
  la t1, _end_58
  jr t1
inter_label95:
  la t2, _then_58
  jr t2
_else_57:

  # load
  lw t0, 12(sp)
  li t1, 2136
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2136
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2140
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2140
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label96
  la t1, _end_59
  jr t1
inter_label96:
  la t2, _then_59
  jr t2
_while_entry_60:

  # load
  lw t0, 4(sp)
  li t1, 2144
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2148
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2148
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label97
  la t1, _end_60
  jr t1
inter_label97:
  la t2, _while_body_60
  jr t2
_end_68:

  # jump
  la t0, _end_67
  jr t0
_then_70:

  # load
  lw t0, 8(sp)
  li t1, 2152
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 2156
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2156
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2160
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2160
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2164
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2152
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2164
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 2168
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2168
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 2172
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2172
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 2176
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 2180
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 2180
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 2184
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2184
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 2188
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 2188
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2192
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2192
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2196
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2176
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2196
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 2200
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2200
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_70
  jr t0
_else_70:

  # load
  lw t0, 8(sp)
  li t1, 2204
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 2208
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2208
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2212
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2212
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2216
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2204
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2216
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 2220
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2220
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_70
  jr t0
_end_69:

  # jump
  la t0, _end_67
  jr t0
_while_entry_86:

  # load
  lw t0, 4(sp)
  li t1, 2224
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2224
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2228
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2228
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label98
  la t1, _end_86
  jr t1
inter_label98:
  la t2, _while_body_86
  jr t2
_while_entry_98:

  # load
  lw t0, 4(sp)
  li t1, 2232
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2232
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2236
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2236
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label99
  la t1, _end_98
  jr t1
inter_label99:
  la t2, _while_body_98
  jr t2
_then_109:

  # load
  lw t0, 8(sp)
  li t1, 2240
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2240
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 2244
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2244
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label100
  la t1, _else_110
  jr t1
inter_label100:
  la t2, _then_110
  jr t2
_else_109:

  # load
  lw t0, 12(sp)
  li t1, 2248
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2248
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 2252
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2252
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label101
  la t1, _else_111
  jr t1
inter_label101:
  la t2, _then_111
  jr t2
_while_entry_119:

  # load
  lw t0, 4(sp)
  li t1, 2256
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2256
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2260
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2260
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label102
  la t1, _end_119
  jr t1
inter_label102:
  la t2, _while_body_119
  jr t2
_while_entry_131:

  # load
  lw t0, 4(sp)
  li t1, 2264
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2264
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2268
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2268
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label103
  la t1, _end_131
  jr t1
inter_label103:
  la t2, _while_body_131
  jr t2
_then_142:

  # load
  lw t0, 8(sp)
  li t1, 2272
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2272
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 2276
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2276
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label104
  la t1, _else_143
  jr t1
inter_label104:
  la t2, _then_143
  jr t2
_else_142:

  # load
  lw t0, 12(sp)
  li t1, 2280
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2280
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 2284
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2284
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label105
  la t1, _else_144
  jr t1
inter_label105:
  la t2, _then_144
  jr t2
_while_body_157:

  # load
  lw t0, 8(sp)
  li t1, 2288
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2288
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2292
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 2292
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2300
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2300
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label106
  la t1, _else_159
  jr t1
inter_label106:
  la t2, _then_159
  jr t2
_end_157:

  # load
  lw t0, 0(sp)
  li t1, 2304
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 2304
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label107
  la t1, _end_160
  jr t1
inter_label107:
  la t2, _then_160
  jr t2
_while_body_190:

  # load
  lw t0, 8(sp)
  li t1, 2308
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2308
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2312
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 2312
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2320
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2320
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label108
  la t1, _else_192
  jr t1
inter_label108:
  la t2, _then_192
  jr t2
_end_190:

  # load
  lw t0, 0(sp)
  li t1, 2324
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 2324
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label109
  la t1, _end_193
  jr t1
inter_label109:
  la t2, _then_193
  jr t2
_then_223:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_223
  jr t0
_else_223:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_223
  jr t0
_then_224:

  # load
  lw t0, 8(sp)
  li t1, 2328
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2328
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 2332
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2332
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label110
  la t1, _else_225
  jr t1
inter_label110:
  la t2, _then_225
  jr t2
_else_224:

  # load
  lw t0, 8(sp)
  li t1, 2336
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2336
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_224
  jr t0
_then_229:

  # load
  lw t0, 0(sp)
  li t1, 2340
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2344
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2344
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2348
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2348
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2352
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2352
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2356
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2340
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2356
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2360
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2360
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_229
  jr t0
_end_229:

  # load
  lw t0, 8(sp)
  li t1, 2364
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2364
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 2368
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2368
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 2372
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2372
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 2376
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2376
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 2380
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2380
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 2384
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2384
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_228
  jr t0
_while_body_232:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1604(sp)
  li t1, 2388
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2388
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_233
  jr t0
_end_232:

  # load
  lw t0, 1612(sp)
  li t1, 2392
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2392
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 2396
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2396
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 456(sp)

  # jump
  la t0, _end_231
  jr t0
_while_body_265:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1624(sp)
  li t1, 2400
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2400
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_266
  jr t0
_end_265:

  # load
  lw t0, 1632(sp)
  li t1, 2404
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2404
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 2408
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2408
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 444(sp)

  # load
  lw t0, 448(sp)
  li t1, 2412
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2412
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  li t1, 2416
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2416
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  li t3, 2420
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2420
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label111
  la t1, _else_298
  jr t1
inter_label111:
  la t2, _then_298
  jr t2
_then_13:

  # load
  lw t0, 0(sp)
  li t1, 2424
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2428
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2428
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2432
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2432
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2436
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2436
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2440
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2424
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2440
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2444
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2444
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_13
  jr t0
_end_13:

  # jump
  la t0, _end_12
  jr t0
_then_14:

  # load
  lw t0, 0(sp)
  li t1, 2448
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2452
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2452
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2456
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2456
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2460
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2460
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2464
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2448
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2464
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2468
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2468
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_14
  jr t0
_end_14:

  # jump
  la t0, _end_12
  jr t0
_while_body_15:

  # load
  lw t0, 8(sp)
  li t1, 2472
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2472
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2476
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 2476
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2484
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2484
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label112
  la t1, _else_17
  jr t1
inter_label112:
  la t2, _then_17
  jr t2
_end_15:

  # load
  lw t0, 0(sp)
  li t1, 2488
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2488
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 632(sp)

  # branch
  bnez  x0, inter_label113
  la t0, _else_18
  jr t0
inter_label113:
  la t1, _then_18
  jr t1
_then_25:

  # load
  lw t0, 0(sp)
  li t1, 2492
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2496
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2496
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2500
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2500
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2504
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2504
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2508
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2492
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2508
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2512
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2512
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_25
  jr t0
_end_25:

  # jump
  la t0, _end_24
  jr t0
_then_26:

  # load
  lw t0, 0(sp)
  li t1, 2516
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2520
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2520
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2524
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2524
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2528
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2528
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2532
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2516
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2532
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2536
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2536
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_26
  jr t0
_end_26:

  # jump
  la t0, _end_24
  jr t0
_while_body_27:

  # load
  lw t0, 8(sp)
  li t1, 2540
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2540
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2544
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 2544
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2552
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2552
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label114
  la t1, _else_29
  jr t1
inter_label114:
  la t2, _then_29
  jr t2
_end_27:

  # load
  lw t0, 0(sp)
  li t1, 2556
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2556
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 652(sp)

  # branch
  bnez  x0, inter_label115
  la t0, _else_30
  jr t0
inter_label115:
  la t1, _then_30
  jr t1
_end_34:

  # load
  lw t0, 0(sp)
  li t1, 2560
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2560
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 132(sp)

  # jump
  la t0, _while_entry_5
  jr t0
_end_37:

  # jump
  la t0, _end_36
  jr t0
_then_46:

  # load
  lw t0, 0(sp)
  li t1, 2564
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2568
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2568
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2572
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2572
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2576
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2576
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2580
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2564
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2580
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2584
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2584
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_46
  jr t0
_end_46:

  # jump
  la t0, _end_45
  jr t0
_then_47:

  # load
  lw t0, 0(sp)
  li t1, 2588
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2592
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2592
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2596
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2596
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2600
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2600
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2604
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2588
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2604
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2608
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2608
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_47
  jr t0
_end_47:

  # jump
  la t0, _end_45
  jr t0
_while_body_48:

  # load
  lw t0, 8(sp)
  li t1, 2612
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2612
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2616
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 2616
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2624
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2624
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label116
  la t1, _else_50
  jr t1
inter_label116:
  la t2, _then_50
  jr t2
_end_48:

  # load
  lw t0, 0(sp)
  li t1, 2628
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2628
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 684(sp)

  # branch
  bnez  x0, inter_label117
  la t0, _else_51
  jr t0
inter_label117:
  la t1, _then_51
  jr t1
_then_58:

  # load
  lw t0, 0(sp)
  li t1, 2632
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2636
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2636
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2640
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2640
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2644
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2644
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2648
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2632
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2648
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2652
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2652
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_58
  jr t0
_end_58:

  # jump
  la t0, _end_57
  jr t0
_then_59:

  # load
  lw t0, 0(sp)
  li t1, 2656
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 2660
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2660
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2664
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2664
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2668
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 2668
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 2672
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2656
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2672
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 2676
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2676
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_59
  jr t0
_end_59:

  # jump
  la t0, _end_57
  jr t0
_while_body_60:

  # load
  lw t0, 8(sp)
  li t1, 2680
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2680
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2684
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 2684
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2692
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 2692
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label118
  la t1, _else_62
  jr t1
inter_label118:
  la t2, _then_62
  jr t2
_end_60:

  # load
  lw t0, 0(sp)
  li t1, 2696
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2696
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 704(sp)

  # branch
  bnez  x0, inter_label119
  la t0, _else_63
  jr t0
inter_label119:
  la t1, _then_63
  jr t1
_end_67:

  # load
  lw t0, 0(sp)
  li t1, 2700
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2700
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 152(sp)

  # jump
  la t0, _while_entry_38
  jr t0
_end_70:

  # jump
  la t0, _end_69
  jr t0
_while_body_86:

  # load
  lw t0, 8(sp)
  li t1, 2704
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2704
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2708
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2708
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label120
  la t1, _else_87
  jr t1
inter_label120:
  la t2, _then_87
  jr t2
_end_86:

  # load
  lw t0, 0(sp)
  li t1, 2712
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2712
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1228(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1212(sp)
  li t1, 2716
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2716
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 1220(sp)
  li t1, 2720
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2720
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_90
  jr t0
_while_body_98:

  # load
  lw t0, 8(sp)
  li t1, 2724
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2724
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2728
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2728
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label121
  la t1, _else_99
  jr t1
inter_label121:
  la t2, _then_99
  jr t2
_end_98:

  # load
  lw t0, 0(sp)
  li t1, 2732
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2732
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1248(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1232(sp)
  li t1, 2736
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2736
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 1240(sp)
  li t1, 2740
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2740
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_102
  jr t0
_then_110:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_110
  jr t0
_else_110:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_110
  jr t0
_then_111:

  # load
  lw t0, 8(sp)
  li t1, 2744
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2744
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 2748
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2748
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label122
  la t1, _else_112
  jr t1
inter_label122:
  la t2, _then_112
  jr t2
_else_111:

  # load
  lw t0, 8(sp)
  li t1, 2752
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2752
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_111
  jr t0
_while_body_119:

  # load
  lw t0, 8(sp)
  li t1, 2756
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2756
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2760
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2760
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label123
  la t1, _else_120
  jr t1
inter_label123:
  la t2, _then_120
  jr t2
_end_119:

  # load
  lw t0, 0(sp)
  li t1, 2764
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2764
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1280(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1264(sp)
  li t1, 2768
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2768
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 1272(sp)
  li t1, 2772
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2772
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_123
  jr t0
_while_body_131:

  # load
  lw t0, 8(sp)
  li t1, 2776
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2776
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2780
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2780
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label124
  la t1, _else_132
  jr t1
inter_label124:
  la t2, _then_132
  jr t2
_end_131:

  # load
  lw t0, 0(sp)
  li t1, 2784
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2784
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1300(sp)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1284(sp)
  li t1, 2788
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2788
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 1292(sp)
  li t1, 2792
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2792
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_135
  jr t0
_then_143:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_143
  jr t0
_else_143:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_143
  jr t0
_then_144:

  # load
  lw t0, 8(sp)
  li t1, 2796
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2796
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 2800
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2800
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label125
  la t1, _else_145
  jr t1
inter_label125:
  la t2, _then_145
  jr t2
_else_144:

  # load
  lw t0, 8(sp)
  li t1, 2804
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2804
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_144
  jr t0
_then_159:

  # load
  lw t0, 12(sp)
  li t1, 2808
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2808
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2812
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2812
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2816
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 2816
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2296
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_159
  jr t0
_else_159:

  # store
  li t0, 2296
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_159
  jr t0
_then_160:

  # alloc

  # load
  lw t0, 976(sp)
  li t1, 2824
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2824
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2820
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 960(sp)
  li t1, 2832
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2832
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2828
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_161
  jr t0
_end_160:

  # alloc

  # load
  lw t0, 960(sp)
  li t1, 2844
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2844
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2840
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 960(sp)
  li t1, 2852
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2852
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2848
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_173
  jr t0
_then_192:

  # load
  lw t0, 12(sp)
  li t1, 2860
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2860
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 2864
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2864
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 2868
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 2868
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2316
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_192
  jr t0
_else_192:

  # store
  li t0, 2316
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_192
  jr t0
_then_193:

  # alloc

  # load
  lw t0, 996(sp)
  li t1, 2876
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2876
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2872
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 980(sp)
  li t1, 2884
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2884
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2880
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_194
  jr t0
_end_193:

  # alloc

  # load
  lw t0, 980(sp)
  li t1, 2896
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2896
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2892
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 980(sp)
  li t1, 2904
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 2904
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2900
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_206
  jr t0
_end_223:

  # jump
  la t0, _end_222
  jr t0
_then_225:

  # load
  lw t0, 8(sp)
  li t1, 2912
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 2916
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2916
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2920
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2920
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2924
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2912
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2924
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 2928
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2928
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 2932
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2932
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 2936
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 2940
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 2940
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 2944
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 2944
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 2948
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 2948
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2952
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2952
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2956
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2936
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2956
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 2960
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2960
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_225
  jr t0
_else_225:

  # load
  lw t0, 8(sp)
  li t1, 2964
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 2968
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 2968
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 2972
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 2972
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 2976
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 2964
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 2976
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 2980
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 2980
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_225
  jr t0
_end_224:

  # jump
  la t0, _end_222
  jr t0
_while_entry_233:

  # load
  lw t0, 4(sp)
  li t1, 2984
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2984
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2988
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2988
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label126
  la t1, _end_233
  jr t1
inter_label126:
  la t2, _while_body_233
  jr t2
_while_entry_266:

  # load
  lw t0, 4(sp)
  li t1, 2992
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 2992
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 2996
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 2996
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label127
  la t1, _end_266
  jr t1
inter_label127:
  la t2, _while_body_266
  jr t2
_then_298:

  # load
  lw t0, 8(sp)
  li t1, 3000
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3000
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 3004
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3004
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label128
  la t1, _else_299
  jr t1
inter_label128:
  la t2, _then_299
  jr t2
_else_298:

  # load
  lw t0, 12(sp)
  li t1, 3008
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3008
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 3012
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3012
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label129
  la t1, _else_300
  jr t1
inter_label129:
  la t2, _then_300
  jr t2
_end_12:

  # load
  lw t0, 8(sp)
  li t1, 3016
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3016
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3020
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3020
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 3024
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3024
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3028
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3028
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 3032
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3032
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3036
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3036
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_11
  jr t0
_then_17:

  # load
  lw t0, 12(sp)
  li t1, 3040
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3040
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3044
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3044
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3048
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 3048
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2480
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_17
  jr t0
_else_17:

  # store
  li t0, 2480
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_17
  jr t0
_then_18:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_18
  jr t0
_else_18:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 632(sp)
  li t1, 3052
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3056
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3056
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3060
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3052
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3060
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3064
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3064
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_19
  jr t0
_end_24:

  # load
  lw t0, 8(sp)
  li t1, 3068
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3068
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3072
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3072
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 3076
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3076
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3080
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3080
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 3084
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3084
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3088
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3088
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_23
  jr t0
_then_29:

  # load
  lw t0, 12(sp)
  li t1, 3092
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3092
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3096
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3096
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3100
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 3100
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2548
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_29
  jr t0
_else_29:

  # store
  li t0, 2548
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_29
  jr t0
_then_30:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_30
  jr t0
_else_30:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 652(sp)
  li t1, 3104
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3108
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3108
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3112
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3104
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3112
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3116
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3116
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_31
  jr t0
_end_45:

  # load
  lw t0, 8(sp)
  li t1, 3120
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3120
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3124
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3124
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 3128
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3128
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3132
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3132
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 3136
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3136
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3140
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3140
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_44
  jr t0
_then_50:

  # load
  lw t0, 12(sp)
  li t1, 3144
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3148
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3148
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3152
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 3152
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2620
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_50
  jr t0
_else_50:

  # store
  li t0, 2620
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_50
  jr t0
_then_51:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_51
  jr t0
_else_51:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 684(sp)
  li t1, 3156
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3160
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3160
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3164
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3156
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3164
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3168
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3168
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_52
  jr t0
_end_57:

  # load
  lw t0, 8(sp)
  li t1, 3172
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3172
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3176
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3176
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 3180
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3180
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3184
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3184
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 3188
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3188
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3192
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3192
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_56
  jr t0
_then_62:

  # load
  lw t0, 12(sp)
  li t1, 3196
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3196
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3200
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3200
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3204
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 3204
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2688
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_62
  jr t0
_else_62:

  # store
  li t0, 2688
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_62
  jr t0
_then_63:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_63
  jr t0
_else_63:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 704(sp)
  li t1, 3208
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3212
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3212
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3216
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3208
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3216
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3220
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3220
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_64
  jr t0
_then_87:

  # load
  lw t0, 12(sp)
  li t1, 3224
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3224
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3228
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3228
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 3232
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3232
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label130
  la t1, _end_88
  jr t1
inter_label130:
  la t2, _then_88
  jr t2
_else_87:

  # load
  lw t0, 12(sp)
  li t1, 3236
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3236
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3240
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3240
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label131
  la t1, _end_89
  jr t1
inter_label131:
  la t2, _then_89
  jr t2
_while_entry_90:

  # load
  lw t0, 4(sp)
  li t1, 3244
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3244
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3248
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3248
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label132
  la t1, _end_90
  jr t1
inter_label132:
  la t2, _while_body_90
  jr t2
_then_99:

  # load
  lw t0, 12(sp)
  li t1, 3252
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3252
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3256
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3256
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 3260
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3260
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label133
  la t1, _end_100
  jr t1
inter_label133:
  la t2, _then_100
  jr t2
_else_99:

  # load
  lw t0, 12(sp)
  li t1, 3264
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3264
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3268
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3268
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label134
  la t1, _end_101
  jr t1
inter_label134:
  la t2, _then_101
  jr t2
_while_entry_102:

  # load
  lw t0, 4(sp)
  li t1, 3272
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3272
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3276
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3276
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label135
  la t1, _end_102
  jr t1
inter_label135:
  la t2, _while_body_102
  jr t2
_end_110:

  # jump
  la t0, _end_109
  jr t0
_then_112:

  # load
  lw t0, 8(sp)
  li t1, 3280
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 3284
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3284
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3288
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3288
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3292
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3280
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3292
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 3296
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3296
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 3300
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3300
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 3304
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 3308
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 3308
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 3312
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3312
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3316
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 3316
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3320
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3320
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3324
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3304
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3324
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 3328
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3328
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_112
  jr t0
_else_112:

  # load
  lw t0, 8(sp)
  li t1, 3332
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 3336
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3336
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3340
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3340
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3344
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3332
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3344
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 3348
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3348
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_112
  jr t0
_end_111:

  # jump
  la t0, _end_109
  jr t0
_then_120:

  # load
  lw t0, 12(sp)
  li t1, 3352
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3352
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3356
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3356
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 3360
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3360
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label136
  la t1, _end_121
  jr t1
inter_label136:
  la t2, _then_121
  jr t2
_else_120:

  # load
  lw t0, 12(sp)
  li t1, 3364
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3364
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3368
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3368
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label137
  la t1, _end_122
  jr t1
inter_label137:
  la t2, _then_122
  jr t2
_while_entry_123:

  # load
  lw t0, 4(sp)
  li t1, 3372
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3372
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3376
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3376
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label138
  la t1, _end_123
  jr t1
inter_label138:
  la t2, _while_body_123
  jr t2
_then_132:

  # load
  lw t0, 12(sp)
  li t1, 3380
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3380
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3384
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3384
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 3388
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3388
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label139
  la t1, _end_133
  jr t1
inter_label139:
  la t2, _then_133
  jr t2
_else_132:

  # load
  lw t0, 12(sp)
  li t1, 3392
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3392
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3396
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3396
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label140
  la t1, _end_134
  jr t1
inter_label140:
  la t2, _then_134
  jr t2
_while_entry_135:

  # load
  lw t0, 4(sp)
  li t1, 3400
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3400
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3404
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3404
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label141
  la t1, _end_135
  jr t1
inter_label141:
  la t2, _while_body_135
  jr t2
_end_143:

  # jump
  la t0, _end_142
  jr t0
_then_145:

  # load
  lw t0, 8(sp)
  li t1, 3408
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 3412
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3412
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3416
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3416
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3420
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3408
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3420
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 3424
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3424
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 3428
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3428
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 3432
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 3436
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 3436
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 3440
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3440
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3444
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 3444
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3448
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3448
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3452
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3432
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3452
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 3456
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3456
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_145
  jr t0
_else_145:

  # load
  lw t0, 8(sp)
  li t1, 3460
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 3464
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3464
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3468
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3468
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3472
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 3460
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3472
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 3476
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3476
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_145
  jr t0
_end_144:

  # jump
  la t0, _end_142
  jr t0
_end_159:

  # load
  li t1, 2296
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3480
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3480
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label142
  la t1, _end_158
  jr t1
inter_label142:
  la t2, _then_158
  jr t2
_while_entry_161:

  # load
  li t1, 2828
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3484
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3484
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label143
  la t1, _end_161
  jr t1
inter_label143:
  la t2, _while_body_161
  jr t2
_while_entry_173:

  # load
  li t1, 2848
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3488
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3488
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label144
  la t1, _end_173
  jr t1
inter_label144:
  la t2, _while_body_173
  jr t2
_end_192:

  # load
  li t1, 2316
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3492
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3492
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label145
  la t1, _end_191
  jr t1
inter_label145:
  la t2, _then_191
  jr t2
_while_entry_194:

  # load
  li t1, 2880
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3496
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3496
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label146
  la t1, _end_194
  jr t1
inter_label146:
  la t2, _while_body_194
  jr t2
_while_entry_206:

  # load
  li t1, 2900
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3500
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3500
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label147
  la t1, _end_206
  jr t1
inter_label147:
  la t2, _while_body_206
  jr t2
_end_222:

  # load
  lw t0, 0(sp)
  li t1, 3504
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3504
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 216(sp)

  # jump
  la t0, _while_entry_151
  jr t0
_end_225:

  # jump
  la t0, _end_224
  jr t0
_while_body_233:

  # load
  lw t0, 8(sp)
  li t1, 3508
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3508
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3512
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 3512
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3520
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3520
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label148
  la t1, _else_235
  jr t1
inter_label148:
  la t2, _then_235
  jr t2
_end_233:

  # load
  lw t0, 0(sp)
  li t1, 3524
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3524
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label149
  la t1, _end_236
  jr t1
inter_label149:
  la t2, _then_236
  jr t2
_while_body_266:

  # load
  lw t0, 8(sp)
  li t1, 3528
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3528
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3532
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 3532
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3540
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3540
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label150
  la t1, _else_268
  jr t1
inter_label150:
  la t2, _then_268
  jr t2
_end_266:

  # load
  lw t0, 0(sp)
  li t1, 3544
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3544
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label151
  la t1, _end_269
  jr t1
inter_label151:
  la t2, _then_269
  jr t2
_then_299:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_299
  jr t0
_else_299:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_299
  jr t0
_then_300:

  # load
  lw t0, 8(sp)
  li t1, 3548
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3548
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 3552
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3552
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label152
  la t1, _else_301
  jr t1
inter_label152:
  la t2, _then_301
  jr t2
_else_300:

  # load
  lw t0, 8(sp)
  li t1, 3556
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3556
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_300
  jr t0
_end_17:

  # load
  li t1, 2480
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3560
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3560
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label153
  la t1, _end_16
  jr t1
inter_label153:
  la t2, _then_16
  jr t2
_end_18:

  # load
  lw t0, 0(sp)
  li t1, 3564
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3564
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 632(sp)

  # load
  lw t0, 640(sp)
  li t1, 3568
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3568
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 624(sp)

  # jump
  la t0, _while_entry_10
  jr t0
_while_entry_19:

  # load
  lw t0, 4(sp)
  li t1, 3572
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3572
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3576
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3576
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label154
  la t1, _end_19
  jr t1
inter_label154:
  la t2, _while_body_19
  jr t2
_end_29:

  # load
  li t1, 2548
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3580
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3580
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label155
  la t1, _end_28
  jr t1
inter_label155:
  la t2, _then_28
  jr t2
_end_30:

  # load
  lw t0, 0(sp)
  li t1, 3584
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3584
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 652(sp)

  # load
  lw t0, 660(sp)
  li t1, 3588
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3588
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 644(sp)

  # jump
  la t0, _while_entry_22
  jr t0
_while_entry_31:

  # load
  lw t0, 4(sp)
  li t1, 3592
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3592
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3596
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3596
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label156
  la t1, _end_31
  jr t1
inter_label156:
  la t2, _while_body_31
  jr t2
_end_50:

  # load
  li t1, 2620
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3600
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3600
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label157
  la t1, _end_49
  jr t1
inter_label157:
  la t2, _then_49
  jr t2
_end_51:

  # load
  lw t0, 0(sp)
  li t1, 3604
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3604
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 684(sp)

  # load
  lw t0, 692(sp)
  li t1, 3608
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3608
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 676(sp)

  # jump
  la t0, _while_entry_43
  jr t0
_while_entry_52:

  # load
  lw t0, 4(sp)
  li t1, 3612
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3612
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3616
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3616
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label158
  la t1, _end_52
  jr t1
inter_label158:
  la t2, _while_body_52
  jr t2
_end_62:

  # load
  li t1, 2688
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3620
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 3620
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label159
  la t1, _end_61
  jr t1
inter_label159:
  la t2, _then_61
  jr t2
_end_63:

  # load
  lw t0, 0(sp)
  li t1, 3624
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3624
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 704(sp)

  # load
  lw t0, 712(sp)
  li t1, 3628
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3628
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 696(sp)

  # jump
  la t0, _while_entry_55
  jr t0
_while_entry_64:

  # load
  lw t0, 4(sp)
  li t1, 3632
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3632
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 3636
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 3636
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label160
  la t1, _end_64
  jr t1
inter_label160:
  la t2, _while_body_64
  jr t2
_then_88:

  # load
  lw t0, 0(sp)
  li t1, 3640
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3644
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3644
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3648
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3648
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3652
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3652
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3656
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3640
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3656
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3660
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3660
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_88
  jr t0
_end_88:

  # jump
  la t0, _end_87
  jr t0
_then_89:

  # load
  lw t0, 0(sp)
  li t1, 3664
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3668
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3668
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3672
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3672
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3676
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3676
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3680
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3664
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3680
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3684
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3684
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_89
  jr t0
_end_89:

  # jump
  la t0, _end_87
  jr t0
_while_body_90:

  # load
  lw t0, 8(sp)
  li t1, 3688
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3688
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3692
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 3692
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3700
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3700
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label161
  la t1, _else_92
  jr t1
inter_label161:
  la t2, _then_92
  jr t2
_end_90:

  # load
  lw t0, 0(sp)
  li t1, 3704
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3704
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1220(sp)

  # branch
  bnez  x0, inter_label162
  la t0, _else_93
  jr t0
inter_label162:
  la t1, _then_93
  jr t1
_then_100:

  # load
  lw t0, 0(sp)
  li t1, 3708
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3712
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3712
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3716
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3716
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3720
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3720
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3724
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3708
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3724
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3728
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3728
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_100
  jr t0
_end_100:

  # jump
  la t0, _end_99
  jr t0
_then_101:

  # load
  lw t0, 0(sp)
  li t1, 3732
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3736
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3736
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3740
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3740
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3744
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3744
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3748
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3732
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3748
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3752
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3752
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_101
  jr t0
_end_101:

  # jump
  la t0, _end_99
  jr t0
_while_body_102:

  # load
  lw t0, 8(sp)
  li t1, 3756
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3756
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3760
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 3760
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3768
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3768
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label163
  la t1, _else_104
  jr t1
inter_label163:
  la t2, _then_104
  jr t2
_end_102:

  # load
  lw t0, 0(sp)
  li t1, 3772
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3772
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1240(sp)

  # branch
  bnez  x0, inter_label164
  la t0, _else_105
  jr t0
inter_label164:
  la t1, _then_105
  jr t1
_end_109:

  # load
  lw t0, 0(sp)
  li t1, 3776
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3776
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 332(sp)

  # jump
  la t0, _while_entry_80
  jr t0
_end_112:

  # jump
  la t0, _end_111
  jr t0
_then_121:

  # load
  lw t0, 0(sp)
  li t1, 3780
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3784
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3784
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3788
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3788
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3792
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3792
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3796
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3780
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3796
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3800
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3800
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_121
  jr t0
_end_121:

  # jump
  la t0, _end_120
  jr t0
_then_122:

  # load
  lw t0, 0(sp)
  li t1, 3804
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3808
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3808
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3812
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3812
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3816
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3816
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3820
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3804
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3820
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3824
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3824
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_122
  jr t0
_end_122:

  # jump
  la t0, _end_120
  jr t0
_while_body_123:

  # load
  lw t0, 8(sp)
  li t1, 3828
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3828
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3832
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 3832
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3840
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3840
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label165
  la t1, _else_125
  jr t1
inter_label165:
  la t2, _then_125
  jr t2
_end_123:

  # load
  lw t0, 0(sp)
  li t1, 3844
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3844
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1272(sp)

  # branch
  bnez  x0, inter_label166
  la t0, _else_126
  jr t0
inter_label166:
  la t1, _then_126
  jr t1
_then_133:

  # load
  lw t0, 0(sp)
  li t1, 3848
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3852
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3852
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3856
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3856
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3860
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3860
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3864
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3848
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3864
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3868
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3868
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_133
  jr t0
_end_133:

  # jump
  la t0, _end_132
  jr t0
_then_134:

  # load
  lw t0, 0(sp)
  li t1, 3872
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3876
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3876
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3880
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3880
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3884
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3884
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3888
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3872
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3888
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3892
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3892
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_134
  jr t0
_end_134:

  # jump
  la t0, _end_132
  jr t0
_while_body_135:

  # load
  lw t0, 8(sp)
  li t1, 3896
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3896
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 3900
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 3900
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 3908
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 3908
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label167
  la t1, _else_137
  jr t1
inter_label167:
  la t2, _then_137
  jr t2
_end_135:

  # load
  lw t0, 0(sp)
  li t1, 3912
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3912
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1292(sp)

  # branch
  bnez  x0, inter_label168
  la t0, _else_138
  jr t0
inter_label168:
  la t1, _then_138
  jr t1
_end_142:

  # load
  lw t0, 0(sp)
  li t1, 3916
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3916
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 352(sp)

  # jump
  la t0, _while_entry_113
  jr t0
_end_145:

  # jump
  la t0, _end_144
  jr t0
_then_158:

  # load
  lw t0, 0(sp)
  li t1, 3920
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 3924
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 3924
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 3928
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 3928
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 3932
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 3932
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 3936
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 3920
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 3936
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 3940
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3940
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_158
  jr t0
_end_158:

  # load
  lw t0, 8(sp)
  li t1, 3944
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3944
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3948
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3948
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 3952
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3952
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 3956
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3956
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 3960
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 3960
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 3964
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 3964
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_157
  jr t0
_while_body_161:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2820
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3968
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3968
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2828
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3972
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3972
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_162
  jr t0
_end_161:

  # load
  li t1, 2820
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3976
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3976
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 3980
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3980
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 976(sp)

  # jump
  la t0, _end_160
  jr t0
_while_body_173:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2840
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3984
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3984
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2848
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3988
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3988
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_174
  jr t0
_end_173:

  # load
  li t1, 2840
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3992
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3992
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 3996
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 3996
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 960(sp)

  # load
  lw t0, 968(sp)
  li t1, 4000
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4000
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  li t1, 4004
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4004
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  li t3, 4008
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4008
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label169
  la t1, _else_185
  jr t1
inter_label169:
  la t2, _then_185
  jr t2
_then_191:

  # load
  lw t0, 0(sp)
  li t1, 4012
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 4016
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4016
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4020
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4020
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4024
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 4024
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4028
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4012
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4028
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 4032
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4032
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_191
  jr t0
_end_191:

  # load
  lw t0, 8(sp)
  li t1, 4036
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4036
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4040
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4040
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4044
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4044
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4048
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4048
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4052
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4052
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4056
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4056
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_190
  jr t0
_while_body_194:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2872
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4060
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4060
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2880
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4064
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4064
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_195
  jr t0
_end_194:

  # load
  li t1, 2872
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4068
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4068
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 4072
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4072
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 996(sp)

  # jump
  la t0, _end_193
  jr t0
_while_body_206:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2892
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4076
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4076
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2900
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4080
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4080
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_207
  jr t0
_end_206:

  # load
  li t1, 2892
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4084
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4084
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 4088
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4088
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 980(sp)

  # load
  lw t0, 988(sp)
  li t1, 4092
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4092
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  li t1, 4096
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4096
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  li t3, 4100
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4100
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label170
  la t1, _else_218
  jr t1
inter_label170:
  la t2, _then_218
  jr t2
_then_235:

  # load
  lw t0, 12(sp)
  li t1, 4104
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4104
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4108
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4108
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4112
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4112
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3516
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_235
  jr t0
_else_235:

  # store
  li t0, 3516
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_235
  jr t0
_then_236:

  # alloc

  # load
  lw t0, 1612(sp)
  li t1, 4120
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4120
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4116
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 1596(sp)
  li t1, 4128
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4128
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4124
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_237
  jr t0
_end_236:

  # alloc

  # load
  lw t0, 1596(sp)
  li t1, 4140
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4140
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4136
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 1596(sp)
  li t1, 4148
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4148
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4144
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_249
  jr t0
_then_268:

  # load
  lw t0, 12(sp)
  li t1, 4156
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4156
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4160
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4160
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4164
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4164
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3536
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_268
  jr t0
_else_268:

  # store
  li t0, 3536
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_268
  jr t0
_then_269:

  # alloc

  # load
  lw t0, 1632(sp)
  li t1, 4172
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4172
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4168
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 1616(sp)
  li t1, 4180
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4180
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4176
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_270
  jr t0
_end_269:

  # alloc

  # load
  lw t0, 1616(sp)
  li t1, 4192
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4192
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4188
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # load
  lw t0, 1616(sp)
  li t1, 4200
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4200
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4196
  add t1, t1, sp
  sw t0, 0(t1)

  # alloc

  # jump
  la t0, _while_entry_282
  jr t0
_end_299:

  # jump
  la t0, _end_298
  jr t0
_then_301:

  # load
  lw t0, 8(sp)
  li t1, 4208
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 4212
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4212
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4216
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4216
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4220
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4208
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4220
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 4224
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4224
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 4228
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4228
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 4232
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 4236
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 4236
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 4240
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4240
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4244
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 4244
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4248
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4248
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4252
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4232
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4252
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 4256
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4256
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_301
  jr t0
_else_301:

  # load
  lw t0, 8(sp)
  li t1, 4260
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 4264
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4264
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4268
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4268
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4272
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4260
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4272
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 4276
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4276
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_301
  jr t0
_end_300:

  # jump
  la t0, _end_298
  jr t0
_then_16:

  # load
  lw t0, 0(sp)
  li t1, 4280
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 4284
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4284
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4288
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4288
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4292
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 4292
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4296
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4280
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4296
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 4300
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4300
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_16
  jr t0
_end_16:

  # load
  lw t0, 8(sp)
  li t1, 4304
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4304
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4308
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4308
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4312
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4312
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4316
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4316
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4320
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4320
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4324
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4324
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_15
  jr t0
_while_body_19:

  # load
  lw t0, 8(sp)
  li t1, 4328
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4328
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4332
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 4332
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4340
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4340
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label171
  la t1, _else_21
  jr t1
inter_label171:
  la t2, _then_21
  jr t2
_end_19:

  # jump
  la t0, _end_18
  jr t0
_then_28:

  # load
  lw t0, 0(sp)
  li t1, 4344
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 4348
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4348
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4352
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4352
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4356
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 4356
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4360
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4344
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4360
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 4364
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4364
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_28
  jr t0
_end_28:

  # load
  lw t0, 8(sp)
  li t1, 4368
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4368
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4372
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4372
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4376
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4376
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4380
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4380
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4384
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4384
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4388
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4388
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_27
  jr t0
_while_body_31:

  # load
  lw t0, 8(sp)
  li t1, 4392
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4392
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4396
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 4396
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4404
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4404
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label172
  la t1, _else_33
  jr t1
inter_label172:
  la t2, _then_33
  jr t2
_end_31:

  # jump
  la t0, _end_30
  jr t0
_then_49:

  # load
  lw t0, 0(sp)
  li t1, 4408
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 4412
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4412
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4416
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4416
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4420
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 4420
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4424
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4408
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4424
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 4428
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4428
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_49
  jr t0
_end_49:

  # load
  lw t0, 8(sp)
  li t1, 4432
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4432
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4436
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4436
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4440
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4440
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4444
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4444
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4448
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4448
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4452
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4452
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_48
  jr t0
_while_body_52:

  # load
  lw t0, 8(sp)
  li t1, 4456
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4456
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4460
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 4460
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4468
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4468
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label173
  la t1, _else_54
  jr t1
inter_label173:
  la t2, _then_54
  jr t2
_end_52:

  # jump
  la t0, _end_51
  jr t0
_then_61:

  # load
  lw t0, 0(sp)
  li t1, 4472
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 4476
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 4476
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4480
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4480
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4484
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 4484
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4488
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4472
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4488
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 4492
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4492
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_61
  jr t0
_end_61:

  # load
  lw t0, 8(sp)
  li t1, 4496
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4496
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4500
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4500
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4504
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4504
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4508
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4508
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4512
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4512
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4516
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4516
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_60
  jr t0
_while_body_64:

  # load
  lw t0, 8(sp)
  li t1, 4520
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4520
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4524
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 4524
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4532
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4532
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label174
  la t1, _else_66
  jr t1
inter_label174:
  la t2, _then_66
  jr t2
_end_64:

  # jump
  la t0, _end_63
  jr t0
_end_87:

  # load
  lw t0, 8(sp)
  li t1, 4536
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4536
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4540
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4540
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4544
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4544
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4548
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4548
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4552
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4552
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4556
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4556
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_86
  jr t0
_then_92:

  # load
  lw t0, 12(sp)
  li t1, 4560
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4560
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4564
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4564
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4568
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4568
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3696
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_92
  jr t0
_else_92:

  # store
  li t0, 3696
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_92
  jr t0
_then_93:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_93
  jr t0
_else_93:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1220(sp)
  li t1, 4572
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4576
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4576
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4580
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4572
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4580
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4584
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4584
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_94
  jr t0
_end_99:

  # load
  lw t0, 8(sp)
  li t1, 4588
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4588
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4592
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4592
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4596
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4596
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4600
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4600
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4604
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4604
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4608
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4608
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_98
  jr t0
_then_104:

  # load
  lw t0, 12(sp)
  li t1, 4612
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4612
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4616
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4616
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4620
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4620
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3764
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_104
  jr t0
_else_104:

  # store
  li t0, 3764
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_104
  jr t0
_then_105:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_105
  jr t0
_else_105:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1240(sp)
  li t1, 4624
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4628
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4628
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4632
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4624
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4632
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4636
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4636
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_106
  jr t0
_end_120:

  # load
  lw t0, 8(sp)
  li t1, 4640
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4640
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4644
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4644
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4648
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4648
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4652
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4652
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4656
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4656
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4660
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4660
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_119
  jr t0
_then_125:

  # load
  lw t0, 12(sp)
  li t1, 4664
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4664
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4668
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4668
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4672
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4672
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3836
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_125
  jr t0
_else_125:

  # store
  li t0, 3836
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_125
  jr t0
_then_126:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_126
  jr t0
_else_126:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1272(sp)
  li t1, 4676
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4680
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4680
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4684
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4676
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4684
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4688
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4688
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_127
  jr t0
_end_132:

  # load
  lw t0, 8(sp)
  li t1, 4692
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4692
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4696
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4696
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 4700
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4700
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 4704
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4704
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 4708
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4708
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 4712
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4712
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_131
  jr t0
_then_137:

  # load
  lw t0, 12(sp)
  li t1, 4716
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4716
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4720
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4720
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4724
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4724
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 3904
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_137
  jr t0
_else_137:

  # store
  li t0, 3904
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_137
  jr t0
_then_138:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_138
  jr t0
_else_138:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  lw t0, 1292(sp)
  li t1, 4728
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 4732
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 4732
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 4736
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 4728
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 4736
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 4740
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 4740
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_139
  jr t0
_while_entry_162:

  # load
  lw t0, 4(sp)
  li t1, 4744
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4744
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4748
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4748
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label175
  la t1, _end_162
  jr t1
inter_label175:
  la t2, _while_body_162
  jr t2
_while_entry_174:

  # load
  lw t0, 4(sp)
  li t1, 4752
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4752
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4756
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4756
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label176
  la t1, _end_174
  jr t1
inter_label176:
  la t2, _while_body_174
  jr t2
_then_185:

  # load
  lw t0, 8(sp)
  li t1, 4760
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4760
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 4764
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4764
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label177
  la t1, _else_186
  jr t1
inter_label177:
  la t2, _then_186
  jr t2
_else_185:

  # load
  lw t0, 12(sp)
  li t1, 4768
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4768
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 4772
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4772
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label178
  la t1, _else_187
  jr t1
inter_label178:
  la t2, _then_187
  jr t2
_while_entry_195:

  # load
  lw t0, 4(sp)
  li t1, 4776
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4776
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4780
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4780
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label179
  la t1, _end_195
  jr t1
inter_label179:
  la t2, _while_body_195
  jr t2
_while_entry_207:

  # load
  lw t0, 4(sp)
  li t1, 4784
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4784
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4788
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4788
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label180
  la t1, _end_207
  jr t1
inter_label180:
  la t2, _while_body_207
  jr t2
_then_218:

  # load
  lw t0, 8(sp)
  li t1, 4792
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4792
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 4796
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4796
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label181
  la t1, _else_219
  jr t1
inter_label181:
  la t2, _then_219
  jr t2
_else_218:

  # load
  lw t0, 12(sp)
  li t1, 4800
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4800
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 4804
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 4804
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label182
  la t1, _else_220
  jr t1
inter_label182:
  la t2, _then_220
  jr t2
_end_235:

  # load
  li t1, 3516
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4808
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4808
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label183
  la t1, _end_234
  jr t1
inter_label183:
  la t2, _then_234
  jr t2
_while_entry_237:

  # load
  li t1, 4124
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4812
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4812
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label184
  la t1, _end_237
  jr t1
inter_label184:
  la t2, _while_body_237
  jr t2
_while_entry_249:

  # load
  li t1, 4144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4816
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4816
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label185
  la t1, _end_249
  jr t1
inter_label185:
  la t2, _while_body_249
  jr t2
_end_268:

  # load
  li t1, 3536
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4820
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4820
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label186
  la t1, _end_267
  jr t1
inter_label186:
  la t2, _then_267
  jr t2
_while_entry_270:

  # load
  li t1, 4176
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4824
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4824
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label187
  la t1, _end_270
  jr t1
inter_label187:
  la t2, _while_body_270
  jr t2
_while_entry_282:

  # load
  li t1, 4196
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4828
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4828
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label188
  la t1, _end_282
  jr t1
inter_label188:
  la t2, _while_body_282
  jr t2
_end_298:

  # load
  lw t0, 0(sp)
  li t1, 4832
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4832
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 448(sp)

  # jump
  la t0, _while_entry_227
  jr t0
_end_301:

  # jump
  la t0, _end_300
  jr t0
_then_21:

  # load
  lw t0, 12(sp)
  li t1, 4836
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4836
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4840
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4840
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4844
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4844
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4336
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_21
  jr t0
_else_21:

  # store
  li t0, 4336
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_21
  jr t0
_then_33:

  # load
  lw t0, 12(sp)
  li t1, 4848
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4848
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4852
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4852
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4856
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4856
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4400
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_33
  jr t0
_else_33:

  # store
  li t0, 4400
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_33
  jr t0
_then_54:

  # load
  lw t0, 12(sp)
  li t1, 4860
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4860
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4864
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4864
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4868
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4868
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4464
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_54
  jr t0
_else_54:

  # store
  li t0, 4464
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_54
  jr t0
_then_66:

  # load
  lw t0, 12(sp)
  li t1, 4872
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4872
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4876
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 4876
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 4880
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 4880
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4528
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_66
  jr t0
_else_66:

  # store
  li t0, 4528
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_66
  jr t0
_end_92:

  # load
  li t1, 3696
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4884
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4884
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label189
  la t1, _end_91
  jr t1
inter_label189:
  la t2, _then_91
  jr t2
_end_93:

  # load
  lw t0, 0(sp)
  li t1, 4888
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4888
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1220(sp)

  # load
  lw t0, 1228(sp)
  li t1, 4892
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4892
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1212(sp)

  # jump
  la t0, _while_entry_85
  jr t0
_while_entry_94:

  # load
  lw t0, 4(sp)
  li t1, 4896
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4896
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4900
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4900
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label190
  la t1, _end_94
  jr t1
inter_label190:
  la t2, _while_body_94
  jr t2
_end_104:

  # load
  li t1, 3764
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4904
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4904
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label191
  la t1, _end_103
  jr t1
inter_label191:
  la t2, _then_103
  jr t2
_end_105:

  # load
  lw t0, 0(sp)
  li t1, 4908
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4908
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1240(sp)

  # load
  lw t0, 1248(sp)
  li t1, 4912
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4912
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1232(sp)

  # jump
  la t0, _while_entry_97
  jr t0
_while_entry_106:

  # load
  lw t0, 4(sp)
  li t1, 4916
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4916
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4920
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4920
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label192
  la t1, _end_106
  jr t1
inter_label192:
  la t2, _while_body_106
  jr t2
_end_125:

  # load
  li t1, 3836
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4924
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4924
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label193
  la t1, _end_124
  jr t1
inter_label193:
  la t2, _then_124
  jr t2
_end_126:

  # load
  lw t0, 0(sp)
  li t1, 4928
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4928
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1272(sp)

  # load
  lw t0, 1280(sp)
  li t1, 4932
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4932
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1264(sp)

  # jump
  la t0, _while_entry_118
  jr t0
_while_entry_127:

  # load
  lw t0, 4(sp)
  li t1, 4936
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4936
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4940
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4940
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label194
  la t1, _end_127
  jr t1
inter_label194:
  la t2, _while_body_127
  jr t2
_end_137:

  # load
  li t1, 3904
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4944
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 4944
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label195
  la t1, _end_136
  jr t1
inter_label195:
  la t2, _then_136
  jr t2
_end_138:

  # load
  lw t0, 0(sp)
  li t1, 4948
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4948
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1292(sp)

  # load
  lw t0, 1300(sp)
  li t1, 4952
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4952
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1284(sp)

  # jump
  la t0, _while_entry_130
  jr t0
_while_entry_139:

  # load
  lw t0, 4(sp)
  li t1, 4956
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4956
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 4960
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4960
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label196
  la t1, _end_139
  jr t1
inter_label196:
  la t2, _while_body_139
  jr t2
_while_body_162:

  # load
  lw t0, 8(sp)
  li t1, 4964
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4964
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4968
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4968
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label197
  la t1, _else_163
  jr t1
inter_label197:
  la t2, _then_163
  jr t2
_end_162:

  # load
  lw t0, 0(sp)
  li t1, 4972
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4972
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2836
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2820
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4976
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4976
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2828
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4980
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4980
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_166
  jr t0
_while_body_174:

  # load
  lw t0, 8(sp)
  li t1, 4984
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 4984
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 4988
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 4988
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label198
  la t1, _else_175
  jr t1
inter_label198:
  la t2, _then_175
  jr t2
_end_174:

  # load
  lw t0, 0(sp)
  li t1, 4992
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4992
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2856
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2840
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4996
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 4996
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2848
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5000
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5000
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_178
  jr t0
_then_186:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_186
  jr t0
_else_186:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_186
  jr t0
_then_187:

  # load
  lw t0, 8(sp)
  li t1, 5004
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5004
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 5008
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5008
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label199
  la t1, _else_188
  jr t1
inter_label199:
  la t2, _then_188
  jr t2
_else_187:

  # load
  lw t0, 8(sp)
  li t1, 5012
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5012
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_187
  jr t0
_while_body_195:

  # load
  lw t0, 8(sp)
  li t1, 5016
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5016
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5020
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5020
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label200
  la t1, _else_196
  jr t1
inter_label200:
  la t2, _then_196
  jr t2
_end_195:

  # load
  lw t0, 0(sp)
  li t1, 5024
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5024
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2888
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2872
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5028
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5028
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2880
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5032
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5032
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_199
  jr t0
_while_body_207:

  # load
  lw t0, 8(sp)
  li t1, 5036
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5036
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5040
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5040
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label201
  la t1, _else_208
  jr t1
inter_label201:
  la t2, _then_208
  jr t2
_end_207:

  # load
  lw t0, 0(sp)
  li t1, 5044
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5044
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2908
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2892
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5048
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5048
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 2900
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5052
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5052
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_211
  jr t0
_then_219:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_219
  jr t0
_else_219:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_219
  jr t0
_then_220:

  # load
  lw t0, 8(sp)
  li t1, 5056
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5056
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 5060
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5060
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label202
  la t1, _else_221
  jr t1
inter_label202:
  la t2, _then_221
  jr t2
_else_220:

  # load
  lw t0, 8(sp)
  li t1, 5064
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5064
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_220
  jr t0
_then_234:

  # load
  lw t0, 0(sp)
  li t1, 5068
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5072
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5072
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5076
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5076
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5080
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5080
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5084
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5068
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5084
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5088
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5088
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_234
  jr t0
_end_234:

  # load
  lw t0, 8(sp)
  li t1, 5092
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5092
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5096
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5096
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5100
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5100
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5104
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5104
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5108
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5108
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5112
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5112
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_233
  jr t0
_while_body_237:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4116
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5116
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5116
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4124
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5120
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5120
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_238
  jr t0
_end_237:

  # load
  li t1, 4116
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5124
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5124
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 5128
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5128
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1612(sp)

  # jump
  la t0, _end_236
  jr t0
_while_body_249:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4136
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5132
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5132
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5136
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5136
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_250
  jr t0
_end_249:

  # load
  li t1, 4136
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5140
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5140
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 5144
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5144
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1596(sp)

  # load
  lw t0, 1604(sp)
  li t1, 5148
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5148
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  li t1, 5152
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5152
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  li t3, 5156
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5156
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label203
  la t1, _else_261
  jr t1
inter_label203:
  la t2, _then_261
  jr t2
_then_267:

  # load
  lw t0, 0(sp)
  li t1, 5160
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5164
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5164
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5168
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5168
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5172
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5172
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5176
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5160
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5176
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5180
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5180
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_267
  jr t0
_end_267:

  # load
  lw t0, 8(sp)
  li t1, 5184
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5184
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5188
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5188
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5192
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5192
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5196
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5196
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5200
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5200
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5204
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5204
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_266
  jr t0
_while_body_270:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4168
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5208
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5208
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4176
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5212
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5212
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_271
  jr t0
_end_270:

  # load
  li t1, 4168
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5216
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5216
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 5220
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5220
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1632(sp)

  # jump
  la t0, _end_269
  jr t0
_while_body_282:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4188
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5224
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5224
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4196
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5228
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5228
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_283
  jr t0
_end_282:

  # load
  li t1, 4188
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5232
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5232
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # load
  lw t0, 0(sp)
  li t1, 5236
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5236
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1616(sp)

  # load
  lw t0, 1624(sp)
  li t1, 5240
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 5240
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  li t1, 5244
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5244
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 15
  slt t2, t0, t1
  xori t2, t2, 1
  li t3, 5248
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5248
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label204
  la t1, _else_294
  jr t1
inter_label204:
  la t2, _then_294
  jr t2
_end_21:

  # load
  li t1, 4336
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5252
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 5252
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label205
  la t1, _end_20
  jr t1
inter_label205:
  la t2, _then_20
  jr t2
_end_33:

  # load
  li t1, 4400
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5256
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 5256
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label206
  la t1, _end_32
  jr t1
inter_label206:
  la t2, _then_32
  jr t2
_end_54:

  # load
  li t1, 4464
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5260
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 5260
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label207
  la t1, _end_53
  jr t1
inter_label207:
  la t2, _then_53
  jr t2
_end_66:

  # load
  li t1, 4528
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5264
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 5264
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label208
  la t1, _end_65
  jr t1
inter_label208:
  la t2, _then_65
  jr t2
_then_91:

  # load
  lw t0, 0(sp)
  li t1, 5268
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5272
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5272
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5276
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5276
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5280
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5280
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5284
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5268
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5284
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5288
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5288
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_91
  jr t0
_end_91:

  # load
  lw t0, 8(sp)
  li t1, 5292
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5292
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5296
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5296
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5300
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5300
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5304
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5304
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5308
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5308
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5312
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5312
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_90
  jr t0
_while_body_94:

  # load
  lw t0, 8(sp)
  li t1, 5316
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5316
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5320
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 5320
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 5328
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5328
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label209
  la t1, _else_96
  jr t1
inter_label209:
  la t2, _then_96
  jr t2
_end_94:

  # jump
  la t0, _end_93
  jr t0
_then_103:

  # load
  lw t0, 0(sp)
  li t1, 5332
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5336
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5336
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5340
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5340
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5344
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5344
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5348
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5332
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5348
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5352
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5352
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_103
  jr t0
_end_103:

  # load
  lw t0, 8(sp)
  li t1, 5356
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5356
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5360
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5360
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5364
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5364
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5368
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5368
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5372
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5372
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5376
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5376
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_102
  jr t0
_while_body_106:

  # load
  lw t0, 8(sp)
  li t1, 5380
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5380
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5384
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 5384
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 5392
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5392
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label210
  la t1, _else_108
  jr t1
inter_label210:
  la t2, _then_108
  jr t2
_end_106:

  # jump
  la t0, _end_105
  jr t0
_then_124:

  # load
  lw t0, 0(sp)
  li t1, 5396
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5400
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5400
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5404
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5404
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5408
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5408
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5412
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5396
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5412
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5416
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5416
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_124
  jr t0
_end_124:

  # load
  lw t0, 8(sp)
  li t1, 5420
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5420
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5424
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5424
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5428
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5428
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5432
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5432
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5436
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5436
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5440
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5440
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_123
  jr t0
_while_body_127:

  # load
  lw t0, 8(sp)
  li t1, 5444
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5444
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5448
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 5448
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 5456
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5456
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label211
  la t1, _else_129
  jr t1
inter_label211:
  la t2, _then_129
  jr t2
_end_127:

  # jump
  la t0, _end_126
  jr t0
_then_136:

  # load
  lw t0, 0(sp)
  li t1, 5460
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5464
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5464
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5468
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5468
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5472
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5472
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5476
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5460
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5476
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5480
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5480
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_136
  jr t0
_end_136:

  # load
  lw t0, 8(sp)
  li t1, 5484
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5484
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5488
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5488
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5492
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5492
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5496
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5496
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5500
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5500
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5504
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5504
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_135
  jr t0
_while_body_139:

  # load
  lw t0, 8(sp)
  li t1, 5508
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5508
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5512
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 5512
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 5520
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5520
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label212
  la t1, _else_141
  jr t1
inter_label212:
  la t2, _then_141
  jr t2
_end_139:

  # jump
  la t0, _end_138
  jr t0
_then_163:

  # load
  lw t0, 12(sp)
  li t1, 5524
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5524
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5528
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5528
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 5532
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5532
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label213
  la t1, _end_164
  jr t1
inter_label213:
  la t2, _then_164
  jr t2
_else_163:

  # load
  lw t0, 12(sp)
  li t1, 5536
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5536
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5540
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5540
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label214
  la t1, _end_165
  jr t1
inter_label214:
  la t2, _then_165
  jr t2
_while_entry_166:

  # load
  lw t0, 4(sp)
  li t1, 5544
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5544
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5548
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5548
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label215
  la t1, _end_166
  jr t1
inter_label215:
  la t2, _while_body_166
  jr t2
_then_175:

  # load
  lw t0, 12(sp)
  li t1, 5552
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5552
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5556
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5556
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 5560
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5560
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label216
  la t1, _end_176
  jr t1
inter_label216:
  la t2, _then_176
  jr t2
_else_175:

  # load
  lw t0, 12(sp)
  li t1, 5564
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5564
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5568
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5568
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label217
  la t1, _end_177
  jr t1
inter_label217:
  la t2, _then_177
  jr t2
_while_entry_178:

  # load
  lw t0, 4(sp)
  li t1, 5572
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5572
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5576
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5576
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label218
  la t1, _end_178
  jr t1
inter_label218:
  la t2, _while_body_178
  jr t2
_end_186:

  # jump
  la t0, _end_185
  jr t0
_then_188:

  # load
  lw t0, 8(sp)
  li t1, 5580
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 5584
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5584
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5588
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5588
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5592
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 5580
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5592
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 5596
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5596
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 5600
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5600
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 5604
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 5608
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 5608
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 5612
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5612
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5616
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 5616
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5620
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5620
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5624
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 5604
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5624
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 5628
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5628
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_188
  jr t0
_else_188:

  # load
  lw t0, 8(sp)
  li t1, 5632
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 5636
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5636
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5640
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5640
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5644
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 5632
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5644
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 5648
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5648
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_188
  jr t0
_end_187:

  # jump
  la t0, _end_185
  jr t0
_then_196:

  # load
  lw t0, 12(sp)
  li t1, 5652
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5652
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5656
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5656
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 5660
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5660
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label219
  la t1, _end_197
  jr t1
inter_label219:
  la t2, _then_197
  jr t2
_else_196:

  # load
  lw t0, 12(sp)
  li t1, 5664
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5664
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5668
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5668
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label220
  la t1, _end_198
  jr t1
inter_label220:
  la t2, _then_198
  jr t2
_while_entry_199:

  # load
  lw t0, 4(sp)
  li t1, 5672
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5672
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5676
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5676
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label221
  la t1, _end_199
  jr t1
inter_label221:
  la t2, _while_body_199
  jr t2
_then_208:

  # load
  lw t0, 12(sp)
  li t1, 5680
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5680
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5684
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5684
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 5688
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5688
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label222
  la t1, _end_209
  jr t1
inter_label222:
  la t2, _then_209
  jr t2
_else_208:

  # load
  lw t0, 12(sp)
  li t1, 5692
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5692
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 5696
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5696
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label223
  la t1, _end_210
  jr t1
inter_label223:
  la t2, _then_210
  jr t2
_while_entry_211:

  # load
  lw t0, 4(sp)
  li t1, 5700
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5700
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5704
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5704
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label224
  la t1, _end_211
  jr t1
inter_label224:
  la t2, _while_body_211
  jr t2
_end_219:

  # jump
  la t0, _end_218
  jr t0
_then_221:

  # load
  lw t0, 8(sp)
  li t1, 5708
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 5712
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5712
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5716
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5716
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5720
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 5708
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5720
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 5724
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5724
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 5728
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5728
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 5732
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 5736
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 5736
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 5740
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5740
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5744
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 5744
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5748
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5748
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5752
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 5732
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5752
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 5756
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5756
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_221
  jr t0
_else_221:

  # load
  lw t0, 8(sp)
  li t1, 5760
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 5764
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5764
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5768
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5768
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5772
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 5760
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5772
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 5776
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5776
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_221
  jr t0
_end_220:

  # jump
  la t0, _end_218
  jr t0
_while_entry_238:

  # load
  lw t0, 4(sp)
  li t1, 5780
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5780
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5784
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5784
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label225
  la t1, _end_238
  jr t1
inter_label225:
  la t2, _while_body_238
  jr t2
_while_entry_250:

  # load
  lw t0, 4(sp)
  li t1, 5788
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5788
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5792
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5792
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label226
  la t1, _end_250
  jr t1
inter_label226:
  la t2, _while_body_250
  jr t2
_then_261:

  # load
  lw t0, 8(sp)
  li t1, 5796
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5796
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 5800
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5800
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label227
  la t1, _else_262
  jr t1
inter_label227:
  la t2, _then_262
  jr t2
_else_261:

  # load
  lw t0, 12(sp)
  li t1, 5804
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5804
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 5808
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5808
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label228
  la t1, _else_263
  jr t1
inter_label228:
  la t2, _then_263
  jr t2
_while_entry_271:

  # load
  lw t0, 4(sp)
  li t1, 5812
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5812
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5816
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5816
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label229
  la t1, _end_271
  jr t1
inter_label229:
  la t2, _while_body_271
  jr t2
_while_entry_283:

  # load
  lw t0, 4(sp)
  li t1, 5820
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5820
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 5824
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 5824
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label230
  la t1, _end_283
  jr t1
inter_label230:
  la t2, _while_body_283
  jr t2
_then_294:

  # load
  lw t0, 8(sp)
  li t1, 5828
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5828
  add t1, t1, sp
  lw t0, 0(t1)
  slt t1, t0, x0
  li t2, 5832
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5832
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label231
  la t1, _else_295
  jr t1
inter_label231:
  la t2, _then_295
  jr t2
_else_294:

  # load
  lw t0, 12(sp)
  li t1, 5836
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5836
  add t1, t1, sp
  lw t0, 0(t1)
  sgt t1, t0, x0
  li t2, 5840
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 5840
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label232
  la t1, _else_296
  jr t1
inter_label232:
  la t2, _then_296
  jr t2
_then_20:

  # load
  lw t0, 0(sp)
  li t1, 5844
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5848
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5848
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5852
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5852
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5856
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5856
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5860
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5844
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5860
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5864
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5864
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_20
  jr t0
_end_20:

  # load
  lw t0, 8(sp)
  li t1, 5868
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5868
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5872
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5872
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5876
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5876
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5880
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5880
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5884
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5884
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5888
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5888
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_19
  jr t0
_then_32:

  # load
  lw t0, 0(sp)
  li t1, 5892
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5896
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5896
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5900
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5900
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5904
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5904
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5908
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5892
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5908
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5912
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5912
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_32
  jr t0
_end_32:

  # load
  lw t0, 8(sp)
  li t1, 5916
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5916
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5920
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5920
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5924
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5924
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5928
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5928
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5932
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5932
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5936
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5936
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_31
  jr t0
_then_53:

  # load
  lw t0, 0(sp)
  li t1, 5940
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5944
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5944
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5948
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5948
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 5952
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 5952
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 5956
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5940
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 5956
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 5960
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5960
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_53
  jr t0
_end_53:

  # load
  lw t0, 8(sp)
  li t1, 5964
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5964
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5968
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5968
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 5972
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5972
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 5976
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5976
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 5980
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 5980
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 5984
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 5984
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_52
  jr t0
_then_65:

  # load
  lw t0, 0(sp)
  li t1, 5988
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 5992
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 5992
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 5996
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 5996
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6000
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6000
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6004
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 5988
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6004
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6008
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6008
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_65
  jr t0
_end_65:

  # load
  lw t0, 8(sp)
  li t1, 6012
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6012
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6016
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6016
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 6020
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6020
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6024
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6024
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 6028
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6028
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6032
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6032
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_64
  jr t0
_then_96:

  # load
  lw t0, 12(sp)
  li t1, 6036
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6036
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6040
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6040
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6044
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6044
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5324
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_96
  jr t0
_else_96:

  # store
  li t0, 5324
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_96
  jr t0
_then_108:

  # load
  lw t0, 12(sp)
  li t1, 6048
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6048
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6052
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6052
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6056
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6056
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5388
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_108
  jr t0
_else_108:

  # store
  li t0, 5388
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_108
  jr t0
_then_129:

  # load
  lw t0, 12(sp)
  li t1, 6060
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6060
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6064
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6064
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6068
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6068
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5452
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_129
  jr t0
_else_129:

  # store
  li t0, 5452
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_129
  jr t0
_then_141:

  # load
  lw t0, 12(sp)
  li t1, 6072
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6072
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6076
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6076
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6080
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6080
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 5516
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_141
  jr t0
_else_141:

  # store
  li t0, 5516
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_141
  jr t0
_then_164:

  # load
  lw t0, 0(sp)
  li t1, 6084
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6088
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6088
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6092
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6092
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6096
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6096
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6100
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6084
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6100
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6104
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6104
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_164
  jr t0
_end_164:

  # jump
  la t0, _end_163
  jr t0
_then_165:

  # load
  lw t0, 0(sp)
  li t1, 6108
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6112
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6112
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6116
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6116
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6120
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6120
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6124
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6108
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6124
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6128
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6128
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_165
  jr t0
_end_165:

  # jump
  la t0, _end_163
  jr t0
_while_body_166:

  # load
  lw t0, 8(sp)
  li t1, 6132
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6132
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6136
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 6136
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6144
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6144
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label233
  la t1, _else_168
  jr t1
inter_label233:
  la t2, _then_168
  jr t2
_end_166:

  # load
  lw t0, 0(sp)
  li t1, 6148
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6148
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2828
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label234
  la t0, _else_169
  jr t0
inter_label234:
  la t1, _then_169
  jr t1
_then_176:

  # load
  lw t0, 0(sp)
  li t1, 6152
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6156
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6156
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6160
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6160
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6164
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6164
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6168
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6152
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6168
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6172
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6172
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_176
  jr t0
_end_176:

  # jump
  la t0, _end_175
  jr t0
_then_177:

  # load
  lw t0, 0(sp)
  li t1, 6176
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6180
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6180
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6184
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6184
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6188
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6188
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6192
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6176
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6192
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6196
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6196
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_177
  jr t0
_end_177:

  # jump
  la t0, _end_175
  jr t0
_while_body_178:

  # load
  lw t0, 8(sp)
  li t1, 6200
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6200
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6204
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 6204
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6212
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6212
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label235
  la t1, _else_180
  jr t1
inter_label235:
  la t2, _then_180
  jr t2
_end_178:

  # load
  lw t0, 0(sp)
  li t1, 6216
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6216
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2848
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label236
  la t0, _else_181
  jr t0
inter_label236:
  la t1, _then_181
  jr t1
_end_185:

  # load
  lw t0, 0(sp)
  li t1, 6220
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6220
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 968(sp)

  # jump
  la t0, _while_entry_156
  jr t0
_end_188:

  # jump
  la t0, _end_187
  jr t0
_then_197:

  # load
  lw t0, 0(sp)
  li t1, 6224
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6228
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6228
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6232
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6232
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6236
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6236
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6240
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6224
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6240
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6244
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6244
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_197
  jr t0
_end_197:

  # jump
  la t0, _end_196
  jr t0
_then_198:

  # load
  lw t0, 0(sp)
  li t1, 6248
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6252
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6252
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6256
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6256
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6260
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6260
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6264
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6248
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6264
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6268
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6268
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_198
  jr t0
_end_198:

  # jump
  la t0, _end_196
  jr t0
_while_body_199:

  # load
  lw t0, 8(sp)
  li t1, 6272
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6272
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6276
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 6276
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6284
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6284
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label237
  la t1, _else_201
  jr t1
inter_label237:
  la t2, _then_201
  jr t2
_end_199:

  # load
  lw t0, 0(sp)
  li t1, 6288
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6288
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2880
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label238
  la t0, _else_202
  jr t0
inter_label238:
  la t1, _then_202
  jr t1
_then_209:

  # load
  lw t0, 0(sp)
  li t1, 6292
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6296
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6296
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6300
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6300
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6304
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6304
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6308
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6292
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6308
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6312
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6312
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_209
  jr t0
_end_209:

  # jump
  la t0, _end_208
  jr t0
_then_210:

  # load
  lw t0, 0(sp)
  li t1, 6316
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6320
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6320
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6324
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6324
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6328
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6328
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6332
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6316
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6332
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6336
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6336
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_210
  jr t0
_end_210:

  # jump
  la t0, _end_208
  jr t0
_while_body_211:

  # load
  lw t0, 8(sp)
  li t1, 6340
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6340
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6344
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 6344
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6352
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6352
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label239
  la t1, _else_213
  jr t1
inter_label239:
  la t2, _then_213
  jr t2
_end_211:

  # load
  lw t0, 0(sp)
  li t1, 6356
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6356
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2900
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label240
  la t0, _else_214
  jr t0
inter_label240:
  la t1, _then_214
  jr t1
_end_218:

  # load
  lw t0, 0(sp)
  li t1, 6360
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6360
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 988(sp)

  # jump
  la t0, _while_entry_189
  jr t0
_end_221:

  # jump
  la t0, _end_220
  jr t0
_while_body_238:

  # load
  lw t0, 8(sp)
  li t1, 6364
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6364
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6368
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6368
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label241
  la t1, _else_239
  jr t1
inter_label241:
  la t2, _then_239
  jr t2
_end_238:

  # load
  lw t0, 0(sp)
  li t1, 6372
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6372
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4132
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4116
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6376
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6376
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4124
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6380
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6380
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_242
  jr t0
_while_body_250:

  # load
  lw t0, 8(sp)
  li t1, 6384
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6384
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6388
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6388
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label242
  la t1, _else_251
  jr t1
inter_label242:
  la t2, _then_251
  jr t2
_end_250:

  # load
  lw t0, 0(sp)
  li t1, 6392
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6392
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4152
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4136
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6396
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6396
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6400
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6400
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_254
  jr t0
_then_262:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_262
  jr t0
_else_262:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_262
  jr t0
_then_263:

  # load
  lw t0, 8(sp)
  li t1, 6404
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6404
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 6408
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6408
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label243
  la t1, _else_264
  jr t1
inter_label243:
  la t2, _then_264
  jr t2
_else_263:

  # load
  lw t0, 8(sp)
  li t1, 6412
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6412
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_263
  jr t0
_while_body_271:

  # load
  lw t0, 8(sp)
  li t1, 6416
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6416
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6420
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6420
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label244
  la t1, _else_272
  jr t1
inter_label244:
  la t2, _then_272
  jr t2
_end_271:

  # load
  lw t0, 0(sp)
  li t1, 6424
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6424
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4184
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4168
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6428
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6428
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4176
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6432
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6432
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_275
  jr t0
_while_body_283:

  # load
  lw t0, 8(sp)
  li t1, 6436
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6436
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6440
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6440
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label245
  la t1, _else_284
  jr t1
inter_label245:
  la t2, _then_284
  jr t2
_end_283:

  # load
  lw t0, 0(sp)
  li t1, 6444
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6444
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4204
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4188
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6448
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6448
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  li t1, 4196
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6452
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6452
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_287
  jr t0
_then_295:

  # store
  li t0, 65535
  sw t0, 0(sp)

  # jump
  la t0, _end_295
  jr t0
_else_295:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_295
  jr t0
_then_296:

  # load
  lw t0, 8(sp)
  li t1, 6456
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6456
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 32767
  sgt t2, t0, t1
  li t3, 6460
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6460
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label246
  la t1, _else_297
  jr t1
inter_label246:
  la t2, _then_297
  jr t2
_else_296:

  # load
  lw t0, 8(sp)
  li t1, 6464
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 6464
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_296
  jr t0
_end_96:

  # load
  li t1, 5324
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6468
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 6468
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label247
  la t1, _end_95
  jr t1
inter_label247:
  la t2, _then_95
  jr t2
_end_108:

  # load
  li t1, 5388
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6472
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 6472
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label248
  la t1, _end_107
  jr t1
inter_label248:
  la t2, _then_107
  jr t2
_end_129:

  # load
  li t1, 5452
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6476
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 6476
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label249
  la t1, _end_128
  jr t1
inter_label249:
  la t2, _then_128
  jr t2
_end_141:

  # load
  li t1, 5516
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6480
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 6480
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label250
  la t1, _end_140
  jr t1
inter_label250:
  la t2, _then_140
  jr t2
_end_163:

  # load
  lw t0, 8(sp)
  li t1, 6484
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6484
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6488
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6488
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 6492
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6492
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6496
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6496
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 6500
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6500
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6504
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6504
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_162
  jr t0
_then_168:

  # load
  lw t0, 12(sp)
  li t1, 6508
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6508
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6512
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6512
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6516
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6516
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6140
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_168
  jr t0
_else_168:

  # store
  li t0, 6140
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_168
  jr t0
_then_169:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_169
  jr t0
_else_169:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2828
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6520
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6524
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6524
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6528
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6520
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6528
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6532
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6532
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_170
  jr t0
_end_175:

  # load
  lw t0, 8(sp)
  li t1, 6536
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6536
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6540
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6540
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 6544
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6544
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6548
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6548
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 6552
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6552
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6556
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6556
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_174
  jr t0
_then_180:

  # load
  lw t0, 12(sp)
  li t1, 6560
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6560
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6564
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6564
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6568
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6568
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6208
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_180
  jr t0
_else_180:

  # store
  li t0, 6208
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_180
  jr t0
_then_181:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_181
  jr t0
_else_181:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2848
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6572
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6576
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6576
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6580
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6572
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6580
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6584
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6584
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_182
  jr t0
_end_196:

  # load
  lw t0, 8(sp)
  li t1, 6588
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6588
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6592
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6592
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 6596
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6596
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6600
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6600
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 6604
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6604
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6608
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6608
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_195
  jr t0
_then_201:

  # load
  lw t0, 12(sp)
  li t1, 6612
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6612
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6616
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6616
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6620
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6620
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6280
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_201
  jr t0
_else_201:

  # store
  li t0, 6280
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_201
  jr t0
_then_202:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_202
  jr t0
_else_202:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2880
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6624
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6628
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6628
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6632
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6624
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6632
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6636
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6636
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_203
  jr t0
_end_208:

  # load
  lw t0, 8(sp)
  li t1, 6640
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6640
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6644
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6644
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 6648
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6648
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6652
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6652
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 6656
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6656
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6660
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6660
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_207
  jr t0
_then_213:

  # load
  lw t0, 12(sp)
  li t1, 6664
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6664
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6668
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6668
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 6672
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 6672
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6348
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_213
  jr t0
_else_213:

  # store
  li t0, 6348
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_213
  jr t0
_then_214:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_214
  jr t0
_else_214:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 2900
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 6676
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6680
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6680
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6684
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6676
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6684
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6688
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6688
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_215
  jr t0
_then_239:

  # load
  lw t0, 12(sp)
  li t1, 6692
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6692
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6696
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6696
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 6700
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6700
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label251
  la t1, _end_240
  jr t1
inter_label251:
  la t2, _then_240
  jr t2
_else_239:

  # load
  lw t0, 12(sp)
  li t1, 6704
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6704
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6708
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6708
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label252
  la t1, _end_241
  jr t1
inter_label252:
  la t2, _then_241
  jr t2
_while_entry_242:

  # load
  lw t0, 4(sp)
  li t1, 6712
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6712
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 6716
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6716
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label253
  la t1, _end_242
  jr t1
inter_label253:
  la t2, _while_body_242
  jr t2
_then_251:

  # load
  lw t0, 12(sp)
  li t1, 6720
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6720
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6724
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6724
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 6728
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6728
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label254
  la t1, _end_252
  jr t1
inter_label254:
  la t2, _then_252
  jr t2
_else_251:

  # load
  lw t0, 12(sp)
  li t1, 6732
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6732
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6736
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6736
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label255
  la t1, _end_253
  jr t1
inter_label255:
  la t2, _then_253
  jr t2
_while_entry_254:

  # load
  lw t0, 4(sp)
  li t1, 6740
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6740
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 6744
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6744
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label256
  la t1, _end_254
  jr t1
inter_label256:
  la t2, _while_body_254
  jr t2
_end_262:

  # jump
  la t0, _end_261
  jr t0
_then_264:

  # load
  lw t0, 8(sp)
  li t1, 6748
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 6752
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6752
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6756
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6756
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6760
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6748
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6760
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 6764
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6764
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 6768
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6768
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 6772
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 6776
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 6776
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 6780
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6780
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6784
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 6784
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6788
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6788
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6792
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6772
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6792
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 6796
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6796
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_264
  jr t0
_else_264:

  # load
  lw t0, 8(sp)
  li t1, 6800
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 6804
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6804
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6808
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6808
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6812
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6800
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6812
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 6816
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6816
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_264
  jr t0
_end_263:

  # jump
  la t0, _end_261
  jr t0
_then_272:

  # load
  lw t0, 12(sp)
  li t1, 6820
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6820
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6824
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6824
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 6828
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6828
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label257
  la t1, _end_273
  jr t1
inter_label257:
  la t2, _then_273
  jr t2
_else_272:

  # load
  lw t0, 12(sp)
  li t1, 6832
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6832
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6836
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6836
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label258
  la t1, _end_274
  jr t1
inter_label258:
  la t2, _then_274
  jr t2
_while_entry_275:

  # load
  lw t0, 4(sp)
  li t1, 6840
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6840
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 6844
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6844
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label259
  la t1, _end_275
  jr t1
inter_label259:
  la t2, _while_body_275
  jr t2
_then_284:

  # load
  lw t0, 12(sp)
  li t1, 6848
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6848
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6852
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6852
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  seqz t1, t1
  li t2, 6856
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 6856
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label260
  la t1, _end_285
  jr t1
inter_label260:
  la t2, _then_285
  jr t2
_else_284:

  # load
  lw t0, 12(sp)
  li t1, 6860
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6860
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 6864
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6864
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label261
  la t1, _end_286
  jr t1
inter_label261:
  la t2, _then_286
  jr t2
_while_entry_287:

  # load
  lw t0, 4(sp)
  li t1, 6868
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6868
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 6872
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 6872
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label262
  la t1, _end_287
  jr t1
inter_label262:
  la t2, _while_body_287
  jr t2
_end_295:

  # jump
  la t0, _end_294
  jr t0
_then_297:

  # load
  lw t0, 8(sp)
  li t1, 6876
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 6880
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6880
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6884
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6884
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6888
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6876
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6888
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 6892
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6892
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 8(sp)
  li t1, 6896
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6896
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 65536
  add t2, t0, t1
  li t3, 6900
  add t3, t3, sp
  sw t2, 0(t3)

  # load
  lw t0, 12(sp)
  li t1, 6904
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t0, 15
  li t2, 6904
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 6908
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6908
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6912
  add t3, t3, sp
  sw t2, 0(t3)

  # get elem ptr
  la t0, g_0
  li t2, 6912
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6916
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6916
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6920
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6900
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6920
  add t2, t2, sp
  lw t1, 0(t2)
  sub t2, t0, t1
  li t3, 6924
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6924
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_297
  jr t0
_else_297:

  # load
  lw t0, 8(sp)
  li t1, 6928
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 12(sp)
  li t1, 6932
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6932
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6936
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6936
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6940
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 6928
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6940
  add t2, t2, sp
  lw t1, 0(t2)
  div t2, t0, t1
  li t3, 6944
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6944
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_297
  jr t0
_end_296:

  # jump
  la t0, _end_294
  jr t0
_then_95:

  # load
  lw t0, 0(sp)
  li t1, 6948
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 6952
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 6952
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 6956
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 6956
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 6960
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 6960
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 6964
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6948
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 6964
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 6968
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6968
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_95
  jr t0
_end_95:

  # load
  lw t0, 8(sp)
  li t1, 6972
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6972
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6976
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6976
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 6980
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6980
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 6984
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6984
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 6988
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 6988
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 6992
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 6992
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_94
  jr t0
_then_107:

  # load
  lw t0, 0(sp)
  li t1, 6996
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7000
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7000
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7004
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7004
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7008
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7008
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7012
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 6996
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7012
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7016
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7016
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_107
  jr t0
_end_107:

  # load
  lw t0, 8(sp)
  li t1, 7020
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7020
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7024
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7024
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7028
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7028
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7032
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7032
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7036
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7036
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7040
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7040
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_106
  jr t0
_then_128:

  # load
  lw t0, 0(sp)
  li t1, 7044
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7048
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7048
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7052
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7052
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7056
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7056
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7060
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7044
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7060
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7064
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7064
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_128
  jr t0
_end_128:

  # load
  lw t0, 8(sp)
  li t1, 7068
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7068
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7072
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7072
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7076
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7076
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7080
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7080
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7084
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7084
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7088
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7088
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_127
  jr t0
_then_140:

  # load
  lw t0, 0(sp)
  li t1, 7092
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7096
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7096
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7100
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7100
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7104
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7104
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7108
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7092
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7108
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7112
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7112
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_140
  jr t0
_end_140:

  # load
  lw t0, 8(sp)
  li t1, 7116
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7116
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7120
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7120
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7124
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7124
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7128
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7128
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7132
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7132
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7136
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7136
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_139
  jr t0
_end_168:

  # load
  li t1, 6140
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7140
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 7140
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label263
  la t1, _end_167
  jr t1
inter_label263:
  la t2, _then_167
  jr t2
_end_169:

  # load
  lw t0, 0(sp)
  li t1, 7144
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2828
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 2836
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7148
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7148
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2820
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_161
  jr t0
_while_entry_170:

  # load
  lw t0, 4(sp)
  li t1, 7152
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7152
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 7156
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 7156
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label264
  la t1, _end_170
  jr t1
inter_label264:
  la t2, _while_body_170
  jr t2
_end_180:

  # load
  li t1, 6208
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7160
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 7160
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label265
  la t1, _end_179
  jr t1
inter_label265:
  la t2, _then_179
  jr t2
_end_181:

  # load
  lw t0, 0(sp)
  li t1, 7164
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7164
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2848
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 2856
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7168
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7168
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2840
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_173
  jr t0
_while_entry_182:

  # load
  lw t0, 4(sp)
  li t1, 7172
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7172
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 7176
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 7176
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label266
  la t1, _end_182
  jr t1
inter_label266:
  la t2, _while_body_182
  jr t2
_end_201:

  # load
  li t1, 6280
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7180
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 7180
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label267
  la t1, _end_200
  jr t1
inter_label267:
  la t2, _then_200
  jr t2
_end_202:

  # load
  lw t0, 0(sp)
  li t1, 7184
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7184
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2880
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 2888
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7188
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7188
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2872
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_194
  jr t0
_while_entry_203:

  # load
  lw t0, 4(sp)
  li t1, 7192
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7192
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 7196
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 7196
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label268
  la t1, _end_203
  jr t1
inter_label268:
  la t2, _while_body_203
  jr t2
_end_213:

  # load
  li t1, 6348
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7200
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 7200
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label269
  la t1, _end_212
  jr t1
inter_label269:
  la t2, _then_212
  jr t2
_end_214:

  # load
  lw t0, 0(sp)
  li t1, 7204
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7204
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2900
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 2908
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7208
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7208
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2892
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_206
  jr t0
_while_entry_215:

  # load
  lw t0, 4(sp)
  li t1, 7212
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7212
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 7216
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 7216
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label270
  la t1, _end_215
  jr t1
inter_label270:
  la t2, _while_body_215
  jr t2
_then_240:

  # load
  lw t0, 0(sp)
  li t1, 7220
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7224
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7224
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7228
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7228
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7232
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7232
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7236
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7220
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7236
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7240
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7240
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_240
  jr t0
_end_240:

  # jump
  la t0, _end_239
  jr t0
_then_241:

  # load
  lw t0, 0(sp)
  li t1, 7244
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7248
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7248
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7252
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7252
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7256
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7256
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7260
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7244
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7260
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7264
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7264
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_241
  jr t0
_end_241:

  # jump
  la t0, _end_239
  jr t0
_while_body_242:

  # load
  lw t0, 8(sp)
  li t1, 7268
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7268
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7272
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7272
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7280
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7280
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label271
  la t1, _else_244
  jr t1
inter_label271:
  la t2, _then_244
  jr t2
_end_242:

  # load
  lw t0, 0(sp)
  li t1, 7284
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7284
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4124
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label272
  la t0, _else_245
  jr t0
inter_label272:
  la t1, _then_245
  jr t1
_then_252:

  # load
  lw t0, 0(sp)
  li t1, 7288
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7292
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7292
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7296
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7296
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7300
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7300
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7304
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7288
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7304
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7308
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7308
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_252
  jr t0
_end_252:

  # jump
  la t0, _end_251
  jr t0
_then_253:

  # load
  lw t0, 0(sp)
  li t1, 7312
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7316
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7316
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7320
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7320
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7324
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7324
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7328
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7312
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7328
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7332
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7332
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_253
  jr t0
_end_253:

  # jump
  la t0, _end_251
  jr t0
_while_body_254:

  # load
  lw t0, 8(sp)
  li t1, 7336
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7336
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7340
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7340
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7348
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7348
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label273
  la t1, _else_256
  jr t1
inter_label273:
  la t2, _then_256
  jr t2
_end_254:

  # load
  lw t0, 0(sp)
  li t1, 7352
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7352
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4144
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label274
  la t0, _else_257
  jr t0
inter_label274:
  la t1, _then_257
  jr t1
_end_261:

  # load
  lw t0, 0(sp)
  li t1, 7356
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7356
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1604(sp)

  # jump
  la t0, _while_entry_232
  jr t0
_end_264:

  # jump
  la t0, _end_263
  jr t0
_then_273:

  # load
  lw t0, 0(sp)
  li t1, 7360
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7364
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7364
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7368
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7368
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7372
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7372
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7376
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7360
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7376
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7380
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7380
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_273
  jr t0
_end_273:

  # jump
  la t0, _end_272
  jr t0
_then_274:

  # load
  lw t0, 0(sp)
  li t1, 7384
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7388
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7388
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7392
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7392
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7396
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7396
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7400
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7384
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7400
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7404
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7404
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_274
  jr t0
_end_274:

  # jump
  la t0, _end_272
  jr t0
_while_body_275:

  # load
  lw t0, 8(sp)
  li t1, 7408
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7408
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7412
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7412
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7420
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7420
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label275
  la t1, _else_277
  jr t1
inter_label275:
  la t2, _then_277
  jr t2
_end_275:

  # load
  lw t0, 0(sp)
  li t1, 7424
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7424
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4176
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label276
  la t0, _else_278
  jr t0
inter_label276:
  la t1, _then_278
  jr t1
_then_285:

  # load
  lw t0, 0(sp)
  li t1, 7428
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7432
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7432
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7436
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7436
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7440
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7440
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7444
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7428
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7444
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7448
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7448
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_285
  jr t0
_end_285:

  # jump
  la t0, _end_284
  jr t0
_then_286:

  # load
  lw t0, 0(sp)
  li t1, 7452
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7456
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7456
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7460
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7460
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7464
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7464
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7468
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7452
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7468
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7472
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7472
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_286
  jr t0
_end_286:

  # jump
  la t0, _end_284
  jr t0
_while_body_287:

  # load
  lw t0, 8(sp)
  li t1, 7476
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7476
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7480
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7480
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7488
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7488
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label277
  la t1, _else_289
  jr t1
inter_label277:
  la t2, _then_289
  jr t2
_end_287:

  # load
  lw t0, 0(sp)
  li t1, 7492
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7492
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4196
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  bnez  x0, inter_label278
  la t0, _else_290
  jr t0
inter_label278:
  la t1, _then_290
  jr t1
_end_294:

  # load
  lw t0, 0(sp)
  li t1, 7496
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 7496
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 1624(sp)

  # jump
  la t0, _while_entry_265
  jr t0
_end_297:

  # jump
  la t0, _end_296
  jr t0
_then_167:

  # load
  lw t0, 0(sp)
  li t1, 7500
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7504
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7504
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7508
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7508
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7512
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7512
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7516
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7500
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7516
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7520
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7520
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_167
  jr t0
_end_167:

  # load
  lw t0, 8(sp)
  li t1, 7524
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7524
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7528
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7528
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7532
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7532
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7536
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7536
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7540
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7540
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7544
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7544
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_166
  jr t0
_while_body_170:

  # load
  lw t0, 8(sp)
  li t1, 7548
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7548
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7552
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7552
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7560
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7560
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label279
  la t1, _else_172
  jr t1
inter_label279:
  la t2, _then_172
  jr t2
_end_170:

  # jump
  la t0, _end_169
  jr t0
_then_179:

  # load
  lw t0, 0(sp)
  li t1, 7564
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7568
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7568
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7572
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7572
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7576
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7576
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7580
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7564
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7580
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7584
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7584
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_179
  jr t0
_end_179:

  # load
  lw t0, 8(sp)
  li t1, 7588
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7588
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7592
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7592
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7596
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7596
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7600
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7600
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7604
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7604
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7608
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7608
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_178
  jr t0
_while_body_182:

  # load
  lw t0, 8(sp)
  li t1, 7612
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7612
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7616
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7616
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7624
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7624
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label280
  la t1, _else_184
  jr t1
inter_label280:
  la t2, _then_184
  jr t2
_end_182:

  # jump
  la t0, _end_181
  jr t0
_then_200:

  # load
  lw t0, 0(sp)
  li t1, 7628
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7632
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7632
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7636
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7636
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7640
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7640
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7644
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7628
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7644
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7648
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7648
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_200
  jr t0
_end_200:

  # load
  lw t0, 8(sp)
  li t1, 7652
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7652
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7656
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7656
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7660
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7660
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7664
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7664
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7668
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7668
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7672
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7672
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_199
  jr t0
_while_body_203:

  # load
  lw t0, 8(sp)
  li t1, 7676
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7676
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7680
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7680
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7688
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7688
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label281
  la t1, _else_205
  jr t1
inter_label281:
  la t2, _then_205
  jr t2
_end_203:

  # jump
  la t0, _end_202
  jr t0
_then_212:

  # load
  lw t0, 0(sp)
  li t1, 7692
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 7696
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 7696
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7700
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7700
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7704
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 7704
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7708
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7692
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7708
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 7712
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7712
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_212
  jr t0
_end_212:

  # load
  lw t0, 8(sp)
  li t1, 7716
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7716
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7720
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7720
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7724
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7724
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7728
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7728
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7732
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7732
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7736
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7736
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_211
  jr t0
_while_body_215:

  # load
  lw t0, 8(sp)
  li t1, 7740
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7740
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7744
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 7744
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7752
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 7752
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label282
  la t1, _else_217
  jr t1
inter_label282:
  la t2, _then_217
  jr t2
_end_215:

  # jump
  la t0, _end_214
  jr t0
_end_239:

  # load
  lw t0, 8(sp)
  li t1, 7756
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7756
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7760
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7760
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7764
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7764
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7768
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7768
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7772
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7772
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7776
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7776
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_238
  jr t0
_then_244:

  # load
  lw t0, 12(sp)
  li t1, 7780
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7780
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7784
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7784
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7788
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7788
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7276
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_244
  jr t0
_else_244:

  # store
  li t0, 7276
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_244
  jr t0
_then_245:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_245
  jr t0
_else_245:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4124
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7792
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7796
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7796
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7800
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 7792
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7800
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7804
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7804
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_246
  jr t0
_end_251:

  # load
  lw t0, 8(sp)
  li t1, 7808
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7808
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7812
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7812
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7816
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7816
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7820
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7820
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7824
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7824
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7828
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7828
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_250
  jr t0
_then_256:

  # load
  lw t0, 12(sp)
  li t1, 7832
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7832
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7836
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7836
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7840
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7840
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7344
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_256
  jr t0
_else_256:

  # store
  li t0, 7344
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_256
  jr t0
_then_257:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_257
  jr t0
_else_257:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4144
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7844
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7848
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7848
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7852
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 7844
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7852
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7856
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7856
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_258
  jr t0
_end_272:

  # load
  lw t0, 8(sp)
  li t1, 7860
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7860
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7864
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7864
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7868
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7868
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7872
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7872
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7876
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7876
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7880
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7880
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_271
  jr t0
_then_277:

  # load
  lw t0, 12(sp)
  li t1, 7884
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7884
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7888
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7888
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7892
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7892
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7416
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_277
  jr t0
_else_277:

  # store
  li t0, 7416
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_277
  jr t0
_then_278:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_278
  jr t0
_else_278:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4176
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7896
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7900
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7900
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7904
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 7896
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7904
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7908
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7908
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_279
  jr t0
_end_284:

  # load
  lw t0, 8(sp)
  li t1, 7912
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7912
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7916
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7916
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 7920
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7920
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 7924
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7924
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 7928
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7928
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 7932
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7932
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_283
  jr t0
_then_289:

  # load
  lw t0, 12(sp)
  li t1, 7936
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7936
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7940
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7940
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7944
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7944
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7484
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_289
  jr t0
_else_289:

  # store
  li t0, 7484
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_289
  jr t0
_then_290:

  # store
  sw x0, 0(sp)

  # jump
  la t0, _end_290
  jr t0
_else_290:

  # store
  sw x0, 0(sp)

  # store
  sw x0, 4(sp)

  # load
  li t1, 4196
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7948
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 7952
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 7952
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 7956
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t1, 7948
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 7956
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 7960
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 7960
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # store
  li t0, 65535
  sw t0, 12(sp)

  # jump
  la t0, _while_entry_291
  jr t0
_then_172:

  # load
  lw t0, 12(sp)
  li t1, 7964
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7964
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7968
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7968
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7972
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7972
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7556
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_172
  jr t0
_else_172:

  # store
  li t0, 7556
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_172
  jr t0
_then_184:

  # load
  lw t0, 12(sp)
  li t1, 7976
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7976
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7980
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7980
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7984
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7984
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7620
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_184
  jr t0
_else_184:

  # store
  li t0, 7620
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_184
  jr t0
_then_205:

  # load
  lw t0, 12(sp)
  li t1, 7988
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 7988
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 7992
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 7992
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 7996
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 7996
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7684
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_205
  jr t0
_else_205:

  # store
  li t0, 7684
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_205
  jr t0
_then_217:

  # load
  lw t0, 12(sp)
  li t1, 8000
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8000
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8004
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8004
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8008
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 8008
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 7748
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_217
  jr t0
_else_217:

  # store
  li t0, 7748
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_217
  jr t0
_end_244:

  # load
  li t1, 7276
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8012
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8012
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label283
  la t1, _end_243
  jr t1
inter_label283:
  la t2, _then_243
  jr t2
_end_245:

  # load
  lw t0, 0(sp)
  li t1, 8016
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8016
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4124
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 4132
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8020
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8020
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4116
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_237
  jr t0
_while_entry_246:

  # load
  lw t0, 4(sp)
  li t1, 8024
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8024
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 8028
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 8028
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label284
  la t1, _end_246
  jr t1
inter_label284:
  la t2, _while_body_246
  jr t2
_end_256:

  # load
  li t1, 7344
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8032
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8032
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label285
  la t1, _end_255
  jr t1
inter_label285:
  la t2, _then_255
  jr t2
_end_257:

  # load
  lw t0, 0(sp)
  li t1, 8036
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8036
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4144
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 4152
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8040
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8040
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4136
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_249
  jr t0
_while_entry_258:

  # load
  lw t0, 4(sp)
  li t1, 8044
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8044
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 8048
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 8048
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label286
  la t1, _end_258
  jr t1
inter_label286:
  la t2, _while_body_258
  jr t2
_end_277:

  # load
  li t1, 7416
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8052
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8052
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label287
  la t1, _end_276
  jr t1
inter_label287:
  la t2, _then_276
  jr t2
_end_278:

  # load
  lw t0, 0(sp)
  li t1, 8056
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8056
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4176
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 4184
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8060
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8060
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4168
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_270
  jr t0
_while_entry_279:

  # load
  lw t0, 4(sp)
  li t1, 8064
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8064
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 8068
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 8068
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label288
  la t1, _end_279
  jr t1
inter_label288:
  la t2, _while_body_279
  jr t2
_end_289:

  # load
  li t1, 7484
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8072
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8072
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label289
  la t1, _end_288
  jr t1
inter_label289:
  la t2, _then_288
  jr t2
_end_290:

  # load
  lw t0, 0(sp)
  li t1, 8076
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8076
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4196
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  li t1, 4204
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8080
  add t1, t1, sp
  sw t0, 0(t1)

  # store
  li t1, 8080
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 4188
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _while_entry_282
  jr t0
_while_entry_291:

  # load
  lw t0, 4(sp)
  li t1, 8084
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8084
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 16
  slt t2, t0, t1
  li t3, 8088
  add t3, t3, sp
  sw t2, 0(t3)

  # branch
  li t1, 8088
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label290
  la t1, _end_291
  jr t1
inter_label290:
  la t2, _while_body_291
  jr t2
_end_172:

  # load
  li t1, 7556
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8092
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8092
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label291
  la t1, _end_171
  jr t1
inter_label291:
  la t2, _then_171
  jr t2
_end_184:

  # load
  li t1, 7620
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8096
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8096
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label292
  la t1, _end_183
  jr t1
inter_label292:
  la t2, _then_183
  jr t2
_end_205:

  # load
  li t1, 7684
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8100
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8100
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label293
  la t1, _end_204
  jr t1
inter_label293:
  la t2, _then_204
  jr t2
_end_217:

  # load
  li t1, 7748
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8104
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8104
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label294
  la t1, _end_216
  jr t1
inter_label294:
  la t2, _then_216
  jr t2
_then_243:

  # load
  lw t0, 0(sp)
  li t1, 8108
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8112
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8112
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8116
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8116
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8120
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8120
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8124
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8108
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8124
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8128
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8128
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_243
  jr t0
_end_243:

  # load
  lw t0, 8(sp)
  li t1, 8132
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8132
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8136
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8136
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8140
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8140
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8144
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8144
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8148
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8148
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8152
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8152
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_242
  jr t0
_while_body_246:

  # load
  lw t0, 8(sp)
  li t1, 8156
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8156
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8160
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 8160
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8168
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 8168
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label295
  la t1, _else_248
  jr t1
inter_label295:
  la t2, _then_248
  jr t2
_end_246:

  # jump
  la t0, _end_245
  jr t0
_then_255:

  # load
  lw t0, 0(sp)
  li t1, 8172
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8176
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8176
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8180
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8180
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8184
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8184
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8188
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8172
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8188
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8192
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8192
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_255
  jr t0
_end_255:

  # load
  lw t0, 8(sp)
  li t1, 8196
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8196
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8200
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8200
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8204
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8204
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8208
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8208
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8212
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8212
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8216
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8216
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_254
  jr t0
_while_body_258:

  # load
  lw t0, 8(sp)
  li t1, 8220
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8220
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8224
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 8224
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8232
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 8232
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label296
  la t1, _else_260
  jr t1
inter_label296:
  la t2, _then_260
  jr t2
_end_258:

  # jump
  la t0, _end_257
  jr t0
_then_276:

  # load
  lw t0, 0(sp)
  li t1, 8236
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8240
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8240
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8244
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8244
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8248
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8248
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8252
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8236
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8252
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8256
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8256
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_276
  jr t0
_end_276:

  # load
  lw t0, 8(sp)
  li t1, 8260
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8260
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8264
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8264
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8268
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8268
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8272
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8272
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8276
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8276
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8280
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8280
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_275
  jr t0
_while_body_279:

  # load
  lw t0, 8(sp)
  li t1, 8284
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8284
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8288
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 8288
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8296
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 8296
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label297
  la t1, _else_281
  jr t1
inter_label297:
  la t2, _then_281
  jr t2
_end_279:

  # jump
  la t0, _end_278
  jr t0
_then_288:

  # load
  lw t0, 0(sp)
  li t1, 8300
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8304
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8304
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8308
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8308
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8312
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8312
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8316
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8300
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8316
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8320
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8320
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_288
  jr t0
_end_288:

  # load
  lw t0, 8(sp)
  li t1, 8324
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8324
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8328
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8328
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8332
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8332
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8336
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8336
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8340
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8340
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8344
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8344
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_287
  jr t0
_while_body_291:

  # load
  lw t0, 8(sp)
  li t1, 8348
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8348
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8352
  add t3, t3, sp
  sw t2, 0(t3)

  # alloc

  # binary
  li t1, 8352
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8360
  add t2, t2, sp
  sw t1, 0(t2)

  # branch
  li t1, 8360
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label298
  la t1, _else_293
  jr t1
inter_label298:
  la t2, _then_293
  jr t2
_end_291:

  # jump
  la t0, _end_290
  jr t0
_then_171:

  # load
  lw t0, 0(sp)
  li t1, 8364
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8368
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8368
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8372
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8372
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8376
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8376
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8380
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8364
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8380
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8384
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8384
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_171
  jr t0
_end_171:

  # load
  lw t0, 8(sp)
  li t1, 8388
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8388
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8392
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8392
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8396
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8396
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8400
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8400
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8404
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8404
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8408
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8408
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_170
  jr t0
_then_183:

  # load
  lw t0, 0(sp)
  li t1, 8412
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8416
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8416
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8420
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8420
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8424
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8424
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8428
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8412
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8428
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8432
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8432
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_183
  jr t0
_end_183:

  # load
  lw t0, 8(sp)
  li t1, 8436
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8436
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8440
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8440
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8444
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8444
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8448
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8448
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8452
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8452
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8456
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8456
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_182
  jr t0
_then_204:

  # load
  lw t0, 0(sp)
  li t1, 8460
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8464
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8464
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8468
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8468
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8472
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8472
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8476
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8460
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8476
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8480
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8480
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_204
  jr t0
_end_204:

  # load
  lw t0, 8(sp)
  li t1, 8484
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8484
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8488
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8488
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8492
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8492
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8496
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8496
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8500
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8500
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8504
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8504
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_203
  jr t0
_then_216:

  # load
  lw t0, 0(sp)
  li t1, 8508
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8512
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8512
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8516
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8516
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8520
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8520
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8524
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8508
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8524
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8528
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8528
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_216
  jr t0
_end_216:

  # load
  lw t0, 8(sp)
  li t1, 8532
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8532
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8536
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8536
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8540
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8540
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8544
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8544
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8548
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8548
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8552
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8552
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_215
  jr t0
_then_248:

  # load
  lw t0, 12(sp)
  li t1, 8556
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8556
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8560
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8560
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8564
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 8564
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8164
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_248
  jr t0
_else_248:

  # store
  li t0, 8164
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_248
  jr t0
_then_260:

  # load
  lw t0, 12(sp)
  li t1, 8568
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8568
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8572
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8572
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8576
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 8576
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8228
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_260
  jr t0
_else_260:

  # store
  li t0, 8228
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_260
  jr t0
_then_281:

  # load
  lw t0, 12(sp)
  li t1, 8580
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8580
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8584
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8584
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8588
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 8588
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8292
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_281
  jr t0
_else_281:

  # store
  li t0, 8292
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_281
  jr t0
_then_293:

  # load
  lw t0, 12(sp)
  li t1, 8592
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8592
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  rem t2, t0, t1
  li t3, 8596
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8596
  add t1, t1, sp
  lw t0, 0(t1)
  xor t1, t0, x0
  snez t1, t1
  li t2, 8600
  add t2, t2, sp
  sw t1, 0(t2)

  # store
  li t1, 8600
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8356
  add t1, t1, sp
  sw t0, 0(t1)

  # jump
  la t0, _end_293
  jr t0
_else_293:

  # store
  li t0, 8356
  add t0, t0, sp
  sw x0, 0(t0)

  # jump
  la t0, _end_293
  jr t0
_end_248:

  # load
  li t1, 8164
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8604
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8604
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label299
  la t1, _end_247
  jr t1
inter_label299:
  la t2, _then_247
  jr t2
_end_260:

  # load
  li t1, 8228
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8608
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8608
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label300
  la t1, _end_259
  jr t1
inter_label300:
  la t2, _then_259
  jr t2
_end_281:

  # load
  li t1, 8292
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8612
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8612
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label301
  la t1, _end_280
  jr t1
inter_label301:
  la t2, _then_280
  jr t2
_end_293:

  # load
  li t1, 8356
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 8616
  add t1, t1, sp
  sw t0, 0(t1)

  # branch
  li t1, 8616
  add t1, t1, sp
  lw t0, 0(t1)
  bnez  t0, inter_label302
  la t1, _end_292
  jr t1
inter_label302:
  la t2, _then_292
  jr t2
_then_247:

  # load
  lw t0, 0(sp)
  li t1, 8620
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8624
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8624
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8628
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8628
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8632
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8632
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8636
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8620
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8636
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8640
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8640
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_247
  jr t0
_end_247:

  # load
  lw t0, 8(sp)
  li t1, 8644
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8644
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8648
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8648
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8652
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8652
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8656
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8656
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8660
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8660
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8664
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8664
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_246
  jr t0
_then_259:

  # load
  lw t0, 0(sp)
  li t1, 8668
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8672
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8672
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8676
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8676
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8680
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8680
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8684
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8668
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8684
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8688
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8688
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_259
  jr t0
_end_259:

  # load
  lw t0, 8(sp)
  li t1, 8692
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8692
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8696
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8696
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8700
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8700
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8704
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8704
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8708
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8708
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8712
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8712
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_258
  jr t0
_then_280:

  # load
  lw t0, 0(sp)
  li t1, 8716
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8720
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8720
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8724
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8724
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8728
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8728
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8732
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8716
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8732
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8736
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8736
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_280
  jr t0
_end_280:

  # load
  lw t0, 8(sp)
  li t1, 8740
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8740
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8744
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8744
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8748
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8748
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8752
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8752
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8756
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8756
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8760
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8760
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_279
  jr t0
_then_292:

  # load
  lw t0, 0(sp)
  li t1, 8764
  add t1, t1, sp
  sw t0, 0(t1)

  # load
  lw t0, 4(sp)
  li t1, 8768
  add t1, t1, sp
  sw t0, 0(t1)

  # get elem ptr
  la t0, g_0
  li t2, 8768
  add t2, t2, sp
  lw t1, 0(t2)
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  li t3, 8772
  add t3, t3, sp
  sw t0, 0(t3)

  # load
  li t1, 8772
  add t1, t1, sp
  lw t0, 0(t1)
  lw t1, (t0)
  li t2, 8776
  add t2, t2, sp
  sw t1, 0(t2)

  # binary
  li t0, 1
  li t2, 8776
  add t2, t2, sp
  lw t1, 0(t2)
  mul t2, t0, t1
  li t3, 8780
  add t3, t3, sp
  sw t2, 0(t3)

  # binary
  li t1, 8764
  add t1, t1, sp
  lw t0, 0(t1)
  li t2, 8780
  add t2, t2, sp
  lw t1, 0(t2)
  add t2, t0, t1
  li t3, 8784
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8784
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 0(sp)

  # jump
  la t0, _end_292
  jr t0
_end_292:

  # load
  lw t0, 8(sp)
  li t1, 8788
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8788
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8792
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8792
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 8(sp)

  # load
  lw t0, 12(sp)
  li t1, 8796
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8796
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 2
  div t2, t0, t1
  li t3, 8800
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8800
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 12(sp)

  # load
  lw t0, 4(sp)
  li t1, 8804
  add t1, t1, sp
  sw t0, 0(t1)

  # binary
  li t1, 8804
  add t1, t1, sp
  lw t0, 0(t1)
  li t1, 1
  add t2, t0, t1
  li t3, 8808
  add t3, t3, sp
  sw t2, 0(t3)

  # store
  li t1, 8808
  add t1, t1, sp
  lw t0, 0(t1)
  sw t0, 4(sp)

  # jump
  la t0, _while_entry_291
  jr t0

  .globl main
main:

  # prologue
  addi sp, sp, -16
  sw ra, 12(sp)
_entry_main:

  # func
  call long_func
  sw a0, 0(sp)

  # ret
  lw t0, 0(sp)
  mv a0, t0

  # epilogue
  lw ra, 12(sp)
  addi sp, sp, 16
  ret

