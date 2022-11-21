//
//  BatteryMonitor+Inner.m
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//

#import "BatteryMonitor+Inner.h"

@implementation BatteryMonitor (Inner)

- (void)onBatteryState:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;

#if __Debug__
   UIDeviceBatteryState           eBatteryState                            = UIDeviceBatteryStateUnknown;
#endif /* __Debug__ */

   __TRY;
   
#if __Debug__
   eBatteryState  = [UIDevice currentDevice].batteryState;
   
   switch ([UIDevice currentDevice].batteryState) {
      case UIDeviceBatteryStateCharging:
         LogDebug((@"-[BatteryMonitor onBatteryState:] : 电量: 正在充电"));
         break;
      case UIDeviceBatteryStateFull:
         LogDebug((@"-[BatteryMonitor onBatteryState:] : 电量: 已充满"));
         break;
      case UIDeviceBatteryStateUnplugged:
         LogDebug((@"-[BatteryMonitor onBatteryState:] : 电量: 正在放电"));
         break;
      case UIDeviceBatteryStateUnknown:
      default:
         LogDebug((@"-[BatteryMonitor onBatteryState:] : 电量: 未知状态"));
         break;
         
   } /* End switch () */
#endif /* __Debug__ */
   
   [self postNotify:SERVICE(IMonitorService).batteryStateNotification
            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   __CATCH(nErr);

   return;
}

- (void)onBatteryLevel:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[BatteryMonitor onBatteryLevel:] : 电量: 电池电量:%.02lf", [UIDevice currentDevice].batteryLevel * 100));
   
   [self postNotify:SERVICE(IMonitorService).batteryLevelNotification
            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   __CATCH(nErr);

   return;
}

- (void)onBatteryDidChangePowerMode:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[BatteryMonitor onBatteryDidChangePowerMode:] : 电量发生了变化"));
   
#if __Debug__
   if ([[NSProcessInfo processInfo] isLowPowerModeEnabled]) {
      
      // low power mode on
      LogDebug((@"-[BatteryMonitor onBatteryDidChangePowerMode:] : 电量发生了变化: 低电量模式开"));
      
   } /*  End if () */
   else {
      
      // low power mode off
      LogDebug((@"-[BatteryMonitor onBatteryDidChangePowerMode:] : 电量发生了变化: 低电量模式关"));
      
   } /*  End else */
#endif /* __Debug__ */
   
   [self postNotify:SERVICE(IMonitorService).batteryLowPowerModeNotification
            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   __CATCH(nErr);

   return;
}

@end
