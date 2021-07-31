//
//  APPDelegate+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate+Inner.h"

@implementation APPDelegate (Inner)

- (void)networkMonitoring {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   @weakify(self);
   //2:获取网络状态
   /*
    AFNetworkReachabilityStatusUnknown          = 未知网络，
    AFNetworkReachabilityStatusNotReachable     = 没有联网
    AFNetworkReachabilityStatusReachableViaWWAN = 蜂窝数据
    AFNetworkReachabilityStatusReachableViaWiFi = 无线网
    */
   [self.networkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      
      @strongify(self);
      switch (status) {
         case AFNetworkReachabilityStatusUnknown:
            LogDebug((@"-[APPDelegate networkMonitoring] : 未知网络"));
            break;
         case AFNetworkReachabilityStatusNotReachable:
            LogDebug((@"-[APPDelegate networkMonitoring] : 没有联网"));
            break;
         case AFNetworkReachabilityStatusReachableViaWWAN:
            LogDebug((@"-[APPDelegate networkMonitoring] : 蜂窝数据"));
            break;
         case AFNetworkReachabilityStatusReachableViaWiFi:
            LogDebug((@"-[APPDelegate networkMonitoring] : 无线网"));
            break;
         default:
            break;
      } /* End switch () */

   }];
   
   //开启网络监听
   [self.networkReachabilityManager startMonitoring];
   
   __CATCH(nErr);
   
   return;
}

@end
