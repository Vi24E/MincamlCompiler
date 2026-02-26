#include <stdio.h>
#include <stdint.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>

typedef union {
  int32_t i[2];
  double d;
} dbl;

value gethi(value v) {
  dbl d;
  d.d = Double_val(v);
  return caml_copy_int32(d.i[0]);
}

value getlo(value v) {
  dbl d;
  d.d = Double_val(v);
  return caml_copy_int32(d.i[1]);
}

value get_single_bits(value v) {
  float f = (float)(Double_val(v));
  union { float f; int32_t i; } u;
  u.f = f;
  return caml_copy_int32(u.i);
}
