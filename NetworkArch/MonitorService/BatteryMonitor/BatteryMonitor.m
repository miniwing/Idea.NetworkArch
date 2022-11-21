//
//  BatteryMonitor.m
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "BatteryMonitor.h"

@implementation BatteryMonitor

+ (instancetype)sharedInstance {
   
   static BatteryMonitor   *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[BatteryMonitor alloc] __init];
         LogDebug((@"+[BatteryMonitor sharedInstance] : INSTANCE : %@", g_INSTANCE));
         
      } /* End if () */
   });
   
   return g_INSTANCE;
}

- (void)dealloc {
   
   __LOG_FUNCTION;

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

- (void)startMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // 开启监控
   [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
   
   // 监听电池低电量模式变化
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(didChangePowerMode:)
                                                name:NSProcessInfoPowerStateDidChangeNotification
                                              object:nil];
   
   // 监听电池状态
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(batteryState:)
                                                name:UIDeviceBatteryStateDidChangeNotification
                                              object:nil];
   
   // 电量发生变化
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(batteryLevel:)
                                                name:UIDeviceBatteryLevelDidChangeNotification
                                              object:nil];
   
   __CATCH(nErr);
   
   return;
}

- (void)stopMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   [[NSNotificationCenter defaultCenter] removeNotificationName:UIDeviceBatteryLevelDidChangeNotification
                                                         object:nil];

   [[NSNotificationCenter defaultCenter] removeNotificationName:UIDeviceBatteryStateDidChangeNotification
                                                         object:nil];

   [[NSNotificationCenter defaultCenter] removeNotificationName:NSProcessInfoPowerStateDidChangeNotification
                                                         object:nil];

   [[UIDevice currentDevice] setBatteryMonitoringEnabled:NO];

   __CATCH(nErr);
   
   return;
}

@end
