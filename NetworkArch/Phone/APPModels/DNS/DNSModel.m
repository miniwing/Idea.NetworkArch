//
//  DNSModel.m
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSModel.h"

@interface DNSModel () <YYModel>

@end

@implementation DNSModel

//[stTemp.strings componentsJoinedByString:@"\n"]

- (NSString *)content; {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szContent                                = nil;
   
   __TRY;

   if ([self.dnsType isEqualToString:@"A"]) {
   
//      stDNSModel.address = [stDNSModel.address stringByAppendingFormat:@"%@\n", stTemp.address];

      szContent   = [self.address copy];
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if ([self.dnsType isEqualToString:@"AAAA"]) {

//      stDNSModel.address = [stDNSModel.address stringByAppendingFormat:@"%@\n", stTemp.address];

      szContent   = [self.address copy];

      nErr  = noErr;
      
      break;

   } /* End if () */

   if ([self.dnsType isEqualToString:@"NS"]) {

//      stDNSModel.target = [stDNSModel.address stringByAppendingFormat:@"%@\n", stTemp.target];

      szContent   = [self.target copy];

      nErr  = noErr;
      
      break;

   } /* End if () */
   
   if ([self.dnsType isEqualToString:@"SOA"]) {

//      Text("Admin: \(admin)")
//      Text("Host: \(host)")
//      Text(": \(expire)")
//      Text(": \(minimum)")
//      Text(": \(refresh)")
//      Text("Retry: \(retry)")
//      Text(": \(serial)")
      
      NSMutableString   *stContent  = [NSMutableString string];
      [stContent appendFormat:@"Admin: %@\n", self.admin];
      [stContent appendFormat:@"Host: %@\n", self.host];
      [stContent appendFormat:@"Expire: %@\n", self.expire];
      [stContent appendFormat:@"Minimum: %@\n", self.minimum];
      [stContent appendFormat:@"Refresh: %@\n", self.refresh];
      [stContent appendFormat:@"Retry: %@\n", self.retry];
      [stContent appendFormat:@"Serial: %@\n", self.serial];

      szContent   = stContent;
      
      nErr  = noErr;
      
      break;

   } /* End if () */

   if ([self.dnsType isEqualToString:@"MX"]) {

//      stDNSModel.target = [stDNSModel.target stringByAppendingFormat:@"%@\nPriority:%@\n\n", stTemp.target, stTemp.priority];
      szContent   = [self.target copy];

      nErr  = noErr;
      
      break;

   } /* End if () */

   if ([self.dnsType isEqualToString:@"CNAME"]) {
      
      szContent   = [self.target copy];

      nErr  = noErr;
      
      break;

   } /* End if () */

   if ([self.dnsType isEqualToString:@"TXT"]) {

      szContent   = [self.strings componentsJoinedByString:@"\n"];

      nErr  = noErr;
      
      break;

   } /* End if () */

   __CATCH(nErr);
   
   return szContent;
}

+ (NSDictionary *)modelCustomPropertyMapper {
   
   return @{ };
}

+ (nullable NSDictionary*)modelContainerPropertyGenericClass {
   
   return @{
      @"strings"  : NSString.class,
   };
}

@end
