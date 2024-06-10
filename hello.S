  .text
  .globl f
f:

  # prologue
  addi sp, sp, -32
_entry_f:

  # alloc

  # store
  sw a0, 0(sp)

  # load
  lw t0, 0(sp)
  sw t0, 4(sp)

  # get ptr
  lw t0, 4(sp)
  li t1, 1
  li t2, 8
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 8(sp)

  # get elem ptr
  lw t0, 8(sp)
  li t1, 4
  mul t1, t1, x0
  add t0, t0, t1
  sw t0, 12(sp)

  # load
  lw t0, 12(sp)
  lw t1, (t0)
  sw t1, 16(sp)

  # ret
  lw t0, 16(sp)
  mv a0, t0

  # epilogue
  addi sp, sp, 32
  ret

  .globl main
main:

  # prologue
  addi sp, sp, -96
  sw ra, 92(sp)
_entry_main:

  # alloc

  # get elem ptr
  addi t0, sp, 0
  li t1, 16
  mul t1, t1, x0
  add t0, t0, t1
  sw t0, 32(sp)

  # get elem ptr
  lw t0, 32(sp)
  li t1, 8
  mul t1, t1, x0
  add t0, t0, t1
  sw t0, 36(sp)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 4
  mul t1, t1, x0
  add t0, t0, t1
  sw t0, 40(sp)

  # store
  li t0, 3
  lw t1, 40(sp)
  sw t0, (t1)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 1
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 44(sp)

  # store
  li t0, 2
  lw t1, 44(sp)
  sw t0, (t1)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 2
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 48(sp)

  # store
  li t0, 3
  lw t1, 48(sp)
  sw t0, (t1)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 3
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 52(sp)

  # store
  li t0, 4
  lw t1, 52(sp)
  sw t0, (t1)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 4
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 56(sp)

  # store
  lw t0, 56(sp)
  sw x0, (t0)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 5
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 60(sp)

  # store
  lw t0, 60(sp)
  sw x0, (t0)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 6
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 64(sp)

  # store
  lw t0, 64(sp)
  sw x0, (t0)

  # get elem ptr
  lw t0, 36(sp)
  li t1, 7
  li t2, 4
  mul t2, t2, t1
  add t0, t0, t2
  sw t0, 68(sp)

  # store
  lw t0, 68(sp)
  sw x0, (t0)

  # alloc

  # get elem ptr
  addi t0, sp, 0
  li t1, 16
  mul t1, t1, x0
  add t0, t0, t1
  sw t0, 76(sp)

  # get elem ptr
  lw t0, 76(sp)
  li t1, 8
  mul t1, t1, x0
  add t0, t0, t1
  sw t0, 80(sp)

  # func
  lw t0, 80(sp)
  mv a0, t0
  call f
  sw a0, 84(sp)

  # store
  lw t0, 84(sp)
  sw t0, 72(sp)

  # load
  lw t0, 72(sp)
  sw t0, 88(sp)

  # func
  lw t0, 88(sp)
  mv a0, t0
  call putint

  # func
  li t0, 10
  mv a0, t0
  call putch

  # ret
  mv a0, x0

  # epilogue
  lw ra, 92(sp)
  addi sp, sp, 96
  ret

