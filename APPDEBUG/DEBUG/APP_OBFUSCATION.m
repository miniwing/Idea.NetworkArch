//
//  APPDEBUG.m
//  APPDEBUG
//
//  Created by Harry on 2020/1/14.
//  Copyright © 2020 Harry. All rights reserved.
//

#import "APP_OBFUSCATION.h"

// string-obf ("988300df48c490a664028fe5b37b22a")
static inline __attribute__((always_inline)) char* __DEFAULTEND() {
   
   static char __str_key           = (char) 0x51;
   static char __encrypted_str[33] = {(char) 0xFF,(char) 0x6B, (char) 0x6B, (char) 0x6C, (char) 0x66, (char) 0x66, (char) 0x67, (char) 0x3C, (char) 0x3F, (char) 0x6E, (char) 0x63, (char) 0x3F, (char) 0x69, (char) 0x67, (char) 0x6F, (char) 0x01, (char) 0x57, (char) 0x54, (char) 0x57, (char) 0x54, (char) 0x57, (char) 0x5E, (char) 0x01, (char) 0x0D, (char) 0x5C, (char) 0x08, (char) 0x58, (char) 0x5B, (char) 0x0F, (char) 0x5C, (char) 0x5D, (char) 0x11, (char) 0x71};
   static char __decrypted_str[32] = {0};
   
   if((__encrypted_str[0] % 2) != 0) {
      
      for(int H=1; H<33; H++) {
         
         __decrypted_str[H-1] = __encrypted_str[H] ^ (char) ((__str_key + H) % 256);
         
      } /* End for () */
      
      __encrypted_str[0] = 0;
      
   } /* End if () */
   
   return (char *) __decrypted_str;
}

// string-obf ("1cfb3a74ad8f8c631b7a7a20ca5f4972")
static inline __attribute__((always_inline)) char* __SHA256_KEY() {
   
   static char __str_key_0         = (char) 0xC6;
   static char __encrypted_str[34] = {(char) 0x69,(char) 0xF6, (char) 0xAB, (char) 0xAF, (char) 0xA8, (char) 0xF8, (char) 0xAD, (char) 0xFA, (char) 0xFA, (char) 0xAE, (char) 0xB4, (char) 0xE9, (char) 0xB4, (char) 0xEB, (char) 0xB7, (char) 0xE3, (char) 0xE5, (char) 0xE6, (char) 0xBA, (char) 0xEE, (char) 0xBB, (char) 0xEC, (char) 0xBD, (char) 0xEF, (char) 0xEE, (char) 0xBC, (char) 0x81, (char) 0xD4, (char) 0x84, (char) 0xD7, (char) 0xDD, (char) 0xD2, (char) 0xD4, (char) 0xE7};
   static char __decrypted_str[33] = {0};
   
   if((__encrypted_str[0] % 2) != 0) {
      
      for(int H = 1; H < 34; ++H) {
         
         __decrypted_str[H - 1] = __encrypted_str[H] ^ (char) ((__str_key_0 + H) % 256);
         
      } /* End for () */
      
      __encrypted_str[0] = 106;
      
   } /* End if () */
   
   return (char *) __decrypted_str;
}

@implementation APP_OBFUSCATION

+ (void)OBFUSCATION {
   
   int                            nErr                                     = EFAULT;
   
   char                          *pszOBFUSCATION                           = nil;
   
   __TRY;
   
// 988300df48c490a664028fe5b37b22a
   pszOBFUSCATION = __DEFAULTEND();
   LogDebug((@"__DEFAULTEND : %s", pszOBFUSCATION));
   
// 1cfb3a74ad8f8c631b7a7a20ca5f4972
   pszOBFUSCATION = __SHA256_KEY();
   LogDebug((@"__SHA256_KEY : %s", pszOBFUSCATION));

   __CATCH(nErr);
   
   return;
}

@end
