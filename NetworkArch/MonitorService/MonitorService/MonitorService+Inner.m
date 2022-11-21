//
//  MonitorService+Inner.m
//  MonitorService
//
//  Created by Harry on 2022/10/21.
//

#import "MonitorService.h"
#import "MonitorService+Inner.h"

#import "BatteryMonitor+Inner.h"
#import "NetworkMonitor+Inner.h"
#import "CPUMonitor+Inner.h"
#import "MemoryMonitor+Inner.h"
#import "DriveMonitor+Inner.h"

__EXPORT_SERVICE(IMonitorService, MonitorService);

@implementation MonitorService (Inner)

@end

@implementation MonitorService (Battery)

- (NSString *)batteryLowPowerModeNotification {
   
   return @"battery.LowPowerMode.Notification";
}

- (NSString *)batteryLevelNotification {
   
   return @"battery.Level.Notification";
}

- (NSString *)batteryStateNotification {
   
   return @"battery.State.Notification";
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"MonitorService::IDEA_MAIN"));

//   [(MonitorService *)[MonitorService sharedInstance] startMonitor];
   
   [[BatteryMonitor sharedInstance] startMonitor];
   [[NetworkMonitor sharedInstance] startMonitor];
   [[CPUMonitor sharedInstance] startMonitor];
   [[MemoryMonitor sharedInstance] startMonitor];
   [[DriveMonitor sharedInstance] startMonitor];

   return;
}
