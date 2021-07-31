//
//  UIDevice+Network.m
//  NetworkArch
//
//  Created by Harry on 2021/7/31.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UIDevice+Network.h"

@implementation UIDevice (Network)

+ (NSString *)networkName:(Network)aNetwork {
   
//   NetworkWifi       = 0,
//   NetworkCellular   = 1

   if (NetworkWifi == aNetwork) {
      
      return @"en0";
      
   } /* End if () */
   
   return @"pdp_ip0";
}

+ (NSString *)ipv4:(Network)aNetwork {
   
   return [UIDevice addressForFamily:AF_INET network:aNetwork];
}

+ (NSString *)ipv6:(Network)aNetwork {
   
   return [UIDevice addressForFamily:AF_INET6 network:aNetwork];
}

+ (NSString *)addressForFamily:(int32_t)aFamily network:(Network)aNetwork {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szAddress                                = nil;
   
   NSString                      *szNetwork                                = nil;
   struct ifaddrs                *pstIfaddrs                               = NULL;
   char                           acHostName[NI_MAXHOST]                   = {0};
   
   __TRY;

   nErr  = getifaddrs(&pstIfaddrs);
   if (noErr != nErr) {
      
      break;
      
   } /* End if () */
   
   szNetwork   = [UIDevice networkName:aNetwork];
   LogDebug((@"+[UIDevice addressForFamily:network:] : networkName : %s", szNetwork));

   for (struct ifaddrs *pstIfAddrTemp = pstIfaddrs; NULL != pstIfAddrTemp; pstIfAddrTemp = pstIfAddrTemp->ifa_next) {
      
//      if(pstIfAddrTemp->ifa_addr->sa_family == (uint8_t)aFamily) {
//
//         pvAddrTemp = &((struct sockaddr_in *)pstIfAddrTemp->ifa_addr)->sin_addr;
//
//      } /* End if () */
//      else {
//
//         pvAddrTemp = &((struct sockaddr_in6 *)pstIfAddrTemp->ifa_addr)->sin6_addr;
//
//      } /* End else */

      if(pstIfAddrTemp->ifa_addr->sa_family == (uint8_t)aFamily) {
         
         LogDebug((@"+[UIDevice addressForFamily:network:] : ifa_name : %s", pstIfAddrTemp->ifa_name));
         LogDebug((@"+[UIDevice addressForFamily:network:] : ifa_name : %@", @(pstIfAddrTemp->ifa_name)));

         if ([szNetwork isEqualToString:@(pstIfAddrTemp->ifa_name)]) {
            
            getnameinfo(pstIfAddrTemp->ifa_addr,
                        pstIfAddrTemp->ifa_addr->sa_len,
                        acHostName,
                        sizeof(acHostName),
                        NULL,
                        0,
                        NI_NUMERICHOST);
            
//            address = String(cString: hostname)

         } /* End if () */
         
      } /* End if () */

   } /* End for () */
   
   __CATCH(nErr);
   
   if (nil != pstIfaddrs) {
      
      freeifaddrs(pstIfaddrs);
      
   } /* End if () */
   
   return szAddress;
}

@end
