#include "ruby.h"
#include <stdint.h>
#include <inttypes.h>

// Defining a space for information and references about the module to be stored internally
VALUE FletcherChecksum = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_fletcherchecksum();

// Prototype for our method 'test1' - methods are prefixed by 'method_' here
static VALUE method_check16(VALUE self, VALUE filepath);

// // The initialization method for this module
void Init_fletcherchecksum() {
	FletcherChecksum = rb_define_module("FletcherChecksum");
  rb_define_module_function(FletcherChecksum, "check16", method_check16, 1);
}

//uint16_t method_fletcher16( uint16_t const *data, size_t words )
static VALUE method_check16( VALUE self, VALUE filepath ) {
  FILE *fp = fopen(RSTRING_PTR(filepath), "rb");
  uint8_t buffer[1];
  uint8_t c0 = 0;
  uint8_t c1 = 0;
  int modulo = 0xFF;
  uint16_t csum;

  while ( fread( buffer, 1, 1, fp ) == 1 ) {
    c0 = (c0 + *buffer) % modulo;
    c1 = (c1 + c0) % modulo;
  }
  fclose(fp);

  if ( c0 == 0 ) {
    c0 = 0xFF;
  }
  if ( c1 == 0 ) {
    c1 = 0xFF;
  }

  csum = (c1 << 8) | c0;
  return UINT2NUM(csum);
}