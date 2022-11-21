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
#import "BatteryMonitor+Inner.h"

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

      // 开启监控
      [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)startMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   // 监听电池低电量模式变化
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(onBatteryDidChangePowerMode:)
                                                name:NSProcessInfoPowerStateDidChangeNotification
                                              object:nil];
   
   // 监听电池状态
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(onBatteryState:)
                                                name:UIDeviceBatteryStateDidChangeNotification
                                              object:nil];
   
   // 电量发生变化
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(onBatteryLevel:)
                                                name:UIDeviceBatteryLevelDidChangeNotification
                                              object:nil];
   
   DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{
      
      [self postNotify:SERVICE(IMonitorService).batteryLevelNotification
               onQueue:DISPATCH_GET_MAIN_QUEUE()];

      [self postNotify:SERVICE(IMonitorService).batteryStateNotification
               onQueue:DISPATCH_GET_MAIN_QUEUE()];

      [self postNotify:SERVICE(IMonitorService).batteryLowPowerModeNotification
               onQueue:DISPATCH_GET_MAIN_QUEUE()];

      return;
   });
   
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

- (UIDeviceBatteryState)batteryState {
   
   return [UIDevice currentDevice].batteryState;
}

- (float)batteryLevel {
   
   return [UIDevice currentDevice].batteryLevel;
}

- (BOOL)batteryLowPowerModeEnabled {
   
   return [NSProcessInfo processInfo].isLowPowerModeEnabled;
}

@end
