#include <stdio.h>
#include <stdlib.h>
//int printf(const char *format, ...)
//{
//    return *(int*)format;
//
//}

struct StringStruct {
   int i;
   const char *s;
};

static const struct StringStruct global_struct_string[] = {
   {123, "string in global struct123"},
   {456, "string in global struct456"}
};


char* global_var_string1 = "string in global var1";
char* global_var_string2 = "string in global var2";

char global_array_string[] = "string in global array";
const char const_global_array_string[] = "const string in global array";

// wchar_t* global_unicode_string = L"unicode global string";

int OLLVM_TEST(void) {
   
   printf("%s\n", "unicode arg string");
   //    printf("%s\n", global_unicode_string);
   
   
   
   printf("%s\n", global_array_string);
   printf("%s\n", global_array_string);
   
   printf("%s\n", const_global_array_string);
   printf("%s\n", const_global_array_string);
   
   printf("%s\n", "string in arg1");
   printf("%s, %s\n", "string in arg2", "string in arg2");
   
   printf("%s\n", global_var_string1);
   printf("%s, %s\n", global_var_string2, global_var_string2);
   
   
   
   char* stack_var_string = "string in stack var";
   printf("%s\n", stack_var_string);
   
   
   char* stack_var_string2 = "string in stack var2";
   printf("%s, %s\n", stack_var_string2, stack_var_string2);
   
   
   
   printf("%s\n", global_struct_string[0].s);
   printf("%s, %s\n", global_struct_string[1].s, global_struct_string[1].s);
   
   struct StringStruct stack_struct_string = {
      789,
      "string in stack struct"
   };
   printf("%s\n", stack_struct_string.s);
   printf("%s, %s\n", stack_struct_string.s, stack_struct_string.s);
   
   
   return 0;
}
