//
//  MonitorService+Inner.m
//  MonitorService
//
//  Created by Harry on 2022/10/21.
//

#import "MonitorService.h"
#import "MonitorService+Inner.h"

__EXPORT_SERVICE(IMonitorService, MonitorService);

@implementation MonitorService (Inner)

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"MonitorService::IDEA_MAIN"));

   [(MonitorService *)[MonitorService sharedInstance] startMonitor];
   
   return;
}
