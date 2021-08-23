//
//  APPDelegate+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate+Inner.h"
#import "APPDelegate+Signal.h"

@implementation APPDelegate (Inner)

/// 获取网络状态
- (void)monitorReachabilityStatus {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   /*
    AFNetworkReachabilityStatusUnknown          = 未知网络，
    AFNetworkReachabilityStatusNotReachable     = 没有联网
    AFNetworkReachabilityStatusReachableViaWWAN = 蜂窝数据
    AFNetworkReachabilityStatusReachableViaWiFi = 无线网
    */
   @weakify(self);
   [self.networkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus aStatus) {
      
      @strongify(self);
      switch (aStatus) {
         case AFNetworkReachabilityStatusUnknown:
            LogDebug((@"-[APPDelegate monitorReachabilityStatus] : 未知网络 : %d", aStatus));
            break;
         case AFNetworkReachabilityStatusNotReachable:
            LogDebug((@"-[APPDelegate monitorReachabilityStatus] : 没有联网 : %d", aStatus));
            break;
         case AFNetworkReachabilityStatusReachableViaWWAN:
            LogDebug((@"-[APPDelegate monitorReachabilityStatus] : 蜂窝数据 : %d", aStatus));
            break;
         case AFNetworkReachabilityStatusReachableViaWiFi:
            LogDebug((@"-[APPDelegate monitorReachabilityStatus] : 无线网 : %d", aStatus));
            break;
         default:
            break;
      } /* End switch () */

      [self postSignal:APPDelegate.networkStatusSignal
            withObject:@(aStatus)
               onQueue:dispatch_get_main_queue()];
   }];
   
   //开启网络监听
   [self.networkReachabilityManager startMonitoring];
   
   __CATCH(nErr);
   
   return;
}

@end
