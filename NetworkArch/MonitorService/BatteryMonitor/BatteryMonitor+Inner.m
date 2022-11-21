//
//  BatteryMonitor+Inner.m
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//

#import "BatteryMonitor+Inner.h"

@implementation BatteryMonitor (Inner)

- (void)batteryState:(NSNotification *)aNotification {
   
   UIDeviceBatteryState batteryStatu = [UIDevice currentDevice].batteryState;
   
   switch (batteryStatu) {
      case UIDeviceBatteryStateCharging:
         LogDebug((@"电量: 正在充电"));
         break;
      case UIDeviceBatteryStateFull:
         LogDebug((@"电量: 已充满"));
         break;
      case UIDeviceBatteryStateUnplugged:
         LogDebug((@"电量: 正在放电"));
         break;
      default:
         LogDebug((@"电量: 未知状态"));
         break;
   }
   
   return;
}

- (void)batteryLevel:(NSNotification *)aNotification {
   
   LogDebug((@"电量: 电池电量:%.02lf", [UIDevice currentDevice].batteryLevel * 100));
   
   return;
}

- (void)didChangePowerMode:(NSNotification *)aNotification {
   
   LogDebug((@"电量发生了变化"));
   
   if ([[NSProcessInfo processInfo] isLowPowerModeEnabled]) {
      
      // low power mode on
      LogDebug((@"电量发生了变化: 低电量模式开"));
   }
   else {
      // low power mode off
      LogDebug((@"电量发生了变化: 低电量模式关"));
   }
   
   return;
}

@end
