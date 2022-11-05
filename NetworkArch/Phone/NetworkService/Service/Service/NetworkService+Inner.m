//
//  NetworkService+Inner.m
//  NetworkService
//
//  Created by Harry on 2022/10/21.
//

#import "NetworkService.h"
#import "NetworkService+Inner.h"

__EXPORT_SERVICE(INetworkService, NetworkService);

@implementation NetworkService (Inner)

/// Notification
- (NSString *)networkStatusNotification {
   
   return @"Notification.NetworkService.networkStatus";
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"NetworkService::IDEA_MAIN"));

   [(NetworkService *)[NetworkService sharedInstance] startMonitor];
   
   return;
}
