fun @main(): i32 {
%entry:
  @x = alloc i32
  store 3, @x
  %0 = load @x
  %1 = add %0, 1
  ret %1
}
