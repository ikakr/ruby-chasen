/************************************************

 chasen.c -

 $Author: arashi $
 $Log: chasen.c,v $
 Revision 1.3  2000/02/26 14:58:58  arashi
 fix BUG since "Fail method" is obsolete.
 thanks to Nishi san.

 Revision 1.2  1999/09/05 15:12:44  arashi
 for Ruby1.4.0

 Revision 1.1  1999/03/03 06:56:13  ikarashi
 Initial revision


************************************************/

#include "ruby.h"
#include "rubyio.h"

#include <chasen.h>

static VALUE
f_chasen_getopt(int argc, VALUE *argv, VALUE class){
   int i;
   char **opt = ALLOCA_N(char*, argc + 2);

   opt[0] = "chasen.so";
   for (i = 0; i < argc; i++){
      Check_SafeStr(argv[i]);
      opt[i + 1] = RSTRING(argv[i])->ptr;
   }
   opt[argc + 1] = NULL;

   if (chasen_getopt_argv(opt, stdout) != 0){
      rb_raise(rb_eRuntimeError, "chasen_getopt_argv");
   }
}

static VALUE
f_chasen_sparse_tostr(VALUE obj, VALUE str){
   Check_SafeStr(str);
   return rb_str_new2(chasen_sparse_tostr(RSTRING(str)->ptr));
}

static VALUE
f_chasen_fparse_tostr(VALUE obj, VALUE io){
   OpenFile *fp;
   char *buf;
   VALUE dst = Qnil;
  
   Check_Type(io, T_FILE);
   GetOpenFile(io, fp);
   rb_io_check_readable(fp);
   dst = rb_str_new(NULL, 0);
  
   while ((buf = chasen_fparse_tostr(fp->f)) != NULL) {
      rb_str_cat(dst, buf, strlen(buf));
   }
   return dst;
}

VALUE mChasen;

void
Init_chasen(){
   mChasen = rb_define_module("Chasen");
   rb_define_module_function(mChasen, "getopt", f_chasen_getopt, -1);
   rb_define_module_function(mChasen, "sparse", f_chasen_sparse_tostr, 1);
   rb_define_module_function(mChasen, "fparse", f_chasen_fparse_tostr, 1);
}
