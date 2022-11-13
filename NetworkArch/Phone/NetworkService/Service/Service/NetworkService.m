//
//  NetworkService.m
//  NetworkService
//
//  Created by Harry on 2022/3/18.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "NetworkService.h"
#import "NetworkService+Inner.h"

@implementation NetworkService

+ (instancetype)sharedInstance {
   
   static NetworkService   *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      /**
       * 多framework引用可能会多次创建, 对象会不一样, 因此托管给一个系统对象。
       */
#if FRAMEWORK_DUPLICATE
      g_INSTANCE  = (NetworkService *)objc_getAssociatedObject([NSUserDefaults standardUserDefaults],
                                                               (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x05);
#endif /* FRAMEWORK_DUPLICATE */
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[NetworkService alloc] __init];
         LogDebug((@"+[NetworkService sharedInstance] : INSTANCE : %@", g_INSTANCE));

#if FRAMEWORK_DUPLICATE
         objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                                  (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x05,
                                  g_INSTANCE,
                                  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif /* FRAMEWORK_DUPLICATE */
         
      } /* End if () */
   });
   
   return g_INSTANCE;
}

- (void)dealloc {
   
   __LOG_FUNCTION;

#if FRAMEWORK_DUPLICATE
   objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                            (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x05,
                            nil,
                            OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif /* FRAMEWORK_DUPLICATE */

   // Custom dealloc
   [self stopMonitor];
   
   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)__init {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
      
      self.networkReachabilityManager  = [AFNetworkReachabilityManager manager];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

/// 获取网络状态
- (void)startMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   /*
    AFNetworkReachabilityStatusUnknown          = 未知网络，
    AFNetworkReachabilityStatusNotReachable     = 没有联网
    AFNetworkReachabilityStatusReachableViaWWAN = 蜂窝数据
    AFNetworkReachabilityStatusReachableViaWiFi = 无线网络
    */
   @weakify(self);
   [self.networkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus aStatus) {
      
      @strongify(self);
      switch (aStatus) {
            
         case AFNetworkReachabilityStatusNotReachable:
            LogDebug((@"-[NetworkService monitorReachabilityStatus] : 没有联网 : %d", aStatus));
            break;
         case AFNetworkReachabilityStatusReachableViaWWAN:
            LogDebug((@"-[NetworkService monitorReachabilityStatus] : 蜂窝数据 : %d", aStatus));
            break;
         case AFNetworkReachabilityStatusReachableViaWiFi:
            LogDebug((@"-[NetworkService monitorReachabilityStatus] : 无线网络 : %d", aStatus));
            break;
         case AFNetworkReachabilityStatusUnknown:
         default:
            LogDebug((@"-[NetworkService monitorReachabilityStatus] : 未知网络 : %d", aStatus));
            break;
      } /* End switch () */
      
      [self notify:self.networkStatusNotification withObject:@(aStatus)];
//      [self postNotify:self.networkStatusNotification
//            withObject:@(aStatus)
//               onQueue:DISPATCH_GET_MAIN_QUEUE()];
   }];
   
   //开启网络监听
   [self.networkReachabilityManager startMonitoring];
   
   __CATCH(nErr);
   
   return;
}

- (void)stopMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   /// 开启网络监听
   [self.networkReachabilityManager stopMonitoring];
   [self.networkReachabilityManager setReachabilityStatusChangeBlock:nil];
   
   __CATCH(nErr);
   
   return;
}

@end
