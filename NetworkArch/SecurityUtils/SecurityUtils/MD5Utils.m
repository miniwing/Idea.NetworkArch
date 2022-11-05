//
//  MD5Utils.m
//  SecurityUtils
//
//  Created by p on 2019/7/15.
//  Copyright © 2019 Reese. All rights reserved.
//

#if OPEN_SSL
#  import <OpenSSL/md5.h>
#else
#  import <CommonCrypto/CommonDigest.h>
#endif /* !OPEN_SSL */

#import "MD5Utils.h"

@implementation MD5Utils

#if OPEN_SSL
+ (NSString *)getMD5StringWithString:(NSString *)string {
   
   if (nil == string) {
      
      return nil;
   }
   
//    if(s.length == 32) {
//        return s;
//    }
   
   const    char  *buf                    = [string cStringUsingEncoding:NSUTF8StringEncoding];
   unsigned char   md[MD5_DIGEST_LENGTH]  = {0};
   unsigned long   n                      = strlen(buf);
   
   MD5(buf, n, md);
   
#if __Debug__
   printf("%s md5: ", buf);
#endif /* __Debug__ */
   
   char   t[50]   = {0};
   char   p[50]   = {0};

//   int i;
   for (int H = 0; H < MD5_DIGEST_LENGTH; H++) {
      
      sprintf(t, "%02x", md[H]);
      strcat(p, t);
      
#if __Debug__
      printf("%02x", md[H]);
#endif /* __Debug__ */

   } /* End for () */

   string = [NSString stringWithCString:p encoding:NSUTF8StringEncoding];
   
#if __Debug__
   printf("\n");
   //    NSLog(@"%@",s);
#endif /* __Debug__ */
   
   return string;
}

+ (NSData *)getMD5DataWithData:(NSData *)data {
   
   if(nil == data) {
      
      return nil;
   }
   
//    if(s.length == 32) {
//        return s;
//    }
   
   const    char  *buf                    = [data bytes];
   unsigned char   md[MD5_DIGEST_LENGTH]  = {0};
   unsigned long   n                      = strlen(buf);
   
   MD5(buf, n, md);
   
#if __Debug__
   printf("%s md5: ", buf);
#endif /* __Debug__ */
   
   char   t[50]   = {0};
   char   p[50]   = {0};
   
//   int i;
   for (int H = 0; H < MD5_DIGEST_LENGTH; H++) {
      
      sprintf(t, "%02x", md[H]);
      strcat(p, t);
      
#if __Debug__
      printf("%02x", md[H]);
#endif /* __Debug__ */
      
   } /* End for () */
   
//   Byte     *byteData   = malloc(sizeof(p) * 16);
   NSData   *content    = [NSData dataWithBytes:md length:sizeof(md)];
   
#if __Debug__
   printf("\n");
#endif /* __Debug__ */
//    NSLog(@"%@",s);
   
//   FREE_IF(byteData);
   
   return content;
}

+ (NSData *)getMD5DataWithString:(NSString *)string {
   
   if (nil == string) {
      
      return nil;
   }
   
   //    if(s.length == 32){
   //        return s;
   //    }
   
   const    char  *buf                    = [string cStringUsingEncoding:NSUTF8StringEncoding];
   unsigned char   md[MD5_DIGEST_LENGTH]  = {0};
   unsigned long   n                      = strlen(buf);
   
   MD5(buf, n, md);
   
#if __Debug__
   printf("%s md5: ", buf);
#endif /* __Debug__ */
   
   char   t[50]   = {0};
   char   p[50]   = {0};
   
//   int i;
   for (int H = 0; H < MD5_DIGEST_LENGTH; H++) {
      
      sprintf(t, "%02x", md[H]);
      strcat(p, t);
#if __Debug__
      printf("%02x", md[H]);
#endif /* __Debug__ */
      
   } /* End for () */
   
//   Byte     *byteData   = malloc(sizeof(p));
//   memset(byteData, 0, sizeof(p));
   
   NSData   *content    = [NSData dataWithBytes:md length:sizeof(md)];
   
#if __Debug__
   printf("\n");
   //    NSLog(@"%@",s);
#endif /* __Debug__ */
   
//   FREE_IF(byteData);

   return content;
}

+ (NSString *)getMD5StringWithData:(NSData *)data {
   
   if(nil == data) {
      
      return nil;
   }
   
   //    if(s.length == 32){
   //        return s;
   //    }
   
   const    char  *buf                    = [data bytes];
   unsigned char   md[MD5_DIGEST_LENGTH]  = {0};
   unsigned long   n                      = [data length];
   
   MD5(buf, n, md);
   
#if __Debug__
   printf("%s md5: ", buf);
#endif /* __Debug__ */

   char   t[50]   = {0};
   char   p[50]   = {0};

//   int H;
   for (int H = 0; H< MD5_DIGEST_LENGTH; H++) {
      
      sprintf(t, "%02x", md[H]);
      strcat(p, t);
#if __Debug__
      printf("%02x", md[H]);
#endif /* __Debug__ */
      
   } /* End for () */
   
   NSString *s = [NSString stringWithCString:p encoding:NSUTF8StringEncoding];

#if __Debug__
   printf("\n");
#endif /* __Debug__ */

   return s;
}

#else

+ (NSData *)getMD5DataWithData:(NSData *)data {
   
   return [MD5Utils getMD5DataWithString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

+ (NSData *)getMD5DataWithString:(NSString *)string {
   
   // 要进行UTF8的转码
   const    char  *input                        = [string UTF8String];
   unsigned char   result[CC_MD5_DIGEST_LENGTH] = {0};
   
   CC_MD5(input, (CC_LONG)strlen(input), result);
   
   NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
   
   for (NSInteger H = 0; H < CC_MD5_DIGEST_LENGTH; H++) {
      
      [digest appendFormat:@"%02x", result[H]];
      
   } /* End for () */
   
   return [digest dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)getMD5StringWithString:(NSString *)string {
   
   // 要进行UTF8的转码
   const    char  *input                        = [string UTF8String];
   unsigned char   result[CC_MD5_DIGEST_LENGTH] = {0};
   
   CC_MD5(input, (CC_LONG)strlen(input), result);
   
   NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
   
   for (NSInteger H = 0; H < CC_MD5_DIGEST_LENGTH; H++) {
      
      [digest appendFormat:@"%02x", result[H]];
      
   } /* End for () */
   
   return digest;
}

+ (NSString *)getMD5StringWithData:(NSData *)data {
   
   return [MD5Utils getMD5StringWithString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

#endif /* !OPEN_SSL */

@end
