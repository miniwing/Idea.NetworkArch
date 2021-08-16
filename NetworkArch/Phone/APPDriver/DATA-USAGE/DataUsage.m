//
//  DataUsage.m
//  NetworkArch
//
//  Created by Harry on 2021/8/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DataUsage.h"

@implementation DataUsageInfo

- (void)updateInfoByAdding:(DataUsageInfo *)aDataUsageInfo {
   
   _wifiSent      += aDataUsageInfo.wifiSent;
   _wifiReceived  += aDataUsageInfo.wifiReceived;
   _wirelessWanDataSent       += aDataUsageInfo.wirelessWanDataSent;
   _wirelessWanDataReceived   += aDataUsageInfo.wirelessWanDataReceived;
   
   return;
}

@end

@interface DataUsage ()

//@property (nonatomic, strong)                NSString                            * wwanInterfacePrefix;
//@property (nonatomic, strong)                NSString                            * wifiInterfacePrefix;

@end

@implementation DataUsage

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)init {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (DataUsageInfo *)getDataUsage {
   
   int                            nErr                                     = EFAULT;
   
   DataUsageInfo                 *stDataUsageInfo                          = nil;

   struct ifaddrs                *pstIfaddrs                               = NULL;
//   struct sockaddr               *pstAddr                                  = NULL;

   __TRY;

   nErr  = getifaddrs(&pstIfaddrs);
   if (noErr != nErr) {
      
      break;
      
   } /* End if () */

   stDataUsageInfo   = [DataUsageInfo new];
   
   for (struct ifaddrs *pstIfAddrTemp = pstIfaddrs; NULL != pstIfAddrTemp; pstIfAddrTemp = pstIfAddrTemp->ifa_next) {
      
      DataUsageInfo  *stDataUsageInfoTemp = [self getDataUsageInfo:pstIfAddrTemp];
            
      [stDataUsageInfo updateInfoByAdding:stDataUsageInfoTemp];
      
   } /* End for () */

   __CATCH(nErr);
   
   if (NULL != pstIfaddrs) {
      
      freeifaddrs(pstIfaddrs);
      
   } /* End if () */

   return stDataUsageInfo;
}

- (DataUsageInfo *)getDataUsageInfo:(struct ifaddrs *)aIfAddrs {
   
   int                            nErr                                     = EFAULT;
   
   DataUsageInfo                 *stDataUsageInfo                          = nil;

   struct sockaddr               *pstAddr                                  = NULL;
   NSString                      *szName                                   = nil;

   __TRY;
   
   if ((NULL == aIfAddrs) || (0 == strlen(aIfAddrs->ifa_name))) {
      
      nErr  = EINVAL;
      
      break;
      
   } /* End if () */
      
   szName   = [NSString stringWithCString:aIfAddrs->ifa_name encoding:NSUTF8StringEncoding];
   pstAddr  = aIfAddrs->ifa_addr;

   if (pstAddr->sa_family != (uint8_t)AF_LINK) {
      
      nErr  = EINVAL;
      
      break;
      
   } /* End if () */
   
   stDataUsageInfo   = [self dataUsageInfoForIfAddrs:aIfAddrs withName:szName];
   
   __CATCH(nErr);
   
   return stDataUsageInfo;
}

- (DataUsageInfo *)dataUsageInfoForIfAddrs:(struct ifaddrs *)aIfAddrs withName:(NSString *)aName {
   
   int                            nErr                                     = EFAULT;
   
   DataUsageInfo                 *stDataUsageInfo                          = nil;
   
   struct if_data                *stIfData                                 = nil;
   
   __TRY;

   if (nil == aIfAddrs || kStringIsEmpty(aName)) {
      
      nErr  = EINVAL;
      
      break;
      
   } /* End if () */
   
   stDataUsageInfo   = [DataUsageInfo new];
   
   if ([aName hasPrefix:[DataUsage wifiInterfacePrefix]]) {

      stIfData = (struct if_data *)aIfAddrs->ifa_data;
      
      stDataUsageInfo.wifiSent      += stIfData->ifi_obytes;
      stDataUsageInfo.wifiReceived  += stIfData->ifi_ibytes;

   } /* End if () */
   else if ([aName hasPrefix:[DataUsage wwanInterfacePrefix]]) {

      stIfData = (struct if_data *)aIfAddrs->ifa_data;
      
      stDataUsageInfo.wirelessWanDataSent       += stIfData->ifi_obytes;
      stDataUsageInfo.wirelessWanDataReceived   += stIfData->ifi_ibytes;

   } /* End else if () */

   __CATCH(nErr);
   
   return stDataUsageInfo;
}

#pragma mark - Interface Name
+ (NSString *)wwanInterfacePrefix {
   
   return @"pdp_ip";
}

+ (NSString *)wifiInterfacePrefix {
   
   return @"en";
}

@end

@implementation DataUsage (Singleton)

@def_singleton( DataUsage );

@end
