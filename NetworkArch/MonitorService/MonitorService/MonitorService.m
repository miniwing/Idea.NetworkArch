//
//  NetworkService.m
//  NetworkService
//
//  Created by Harry on 2022/3/18.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorService.h"
#import "MonitorService+Inner.h"

@implementation MonitorService

+ (instancetype)sharedInstance {
   
   static MonitorService   *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      /**
       * 多framework引用可能会多次创建, 对象会不一样, 因此托管给一个系统对象。
       */
#if FRAMEWORK_DUPLICATE
      g_INSTANCE  = (MonitorService *)objc_getAssociatedObject([NSUserDefaults standardUserDefaults],
                                                               (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x10);
#endif /* FRAMEWORK_DUPLICATE */
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[MonitorService alloc] __init];
         LogDebug((@"+[MonitorService sharedInstance] : INSTANCE : %@", g_INSTANCE));

#if FRAMEWORK_DUPLICATE
         objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                                  (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x10,
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
                            (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x10,
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
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

/// 获取网络状态
- (void)startMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   __CATCH(nErr);
   
   return;
}

- (void)stopMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   __CATCH(nErr);
   
   return;
}

/**
 * 电池
 */
- (UIDeviceBatteryState)batteryState {
   
   return [BatteryMonitor sharedInstance].state;
}

- (float)batteryLevel {
   
   return [BatteryMonitor sharedInstance].level;
}

- (BOOL)batteryLowPowerModeEnabled {
   
   return [BatteryMonitor sharedInstance].isLowPowerModeEnabled;
}

- (BOOL)batteryIsCharging {
   
   return [BatteryMonitor sharedInstance].isCharging;
}

@end
