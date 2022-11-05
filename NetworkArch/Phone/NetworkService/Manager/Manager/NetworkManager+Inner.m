//
//  NetworkManager+Inner.m
//  NetworkService
//
//  Created by Harry on 2022/10/21.
//

#import "NetworkManager.h"
#import "NetworkManager+Inner.h"

__EXPORT_SERVICE(INetworkManager, NetworkManager);

@implementation NetworkManager (Inner)

- (NSString *)downloadStartedNotification {
   
   return @"Notification.NetworkManager.downloadStarted";
}

- (NSString *)downloadFinishedNotification {
   
   return @"Notification.NetworkManager.downloadFinished";
}

- (NSString *)downloadCancelledNotification {
   
   return @"Notification.NetworkManager.downloadCancelled";
}

- (NSString *)downloadPausedNotification {
   
   return @"Notification.NetworkManager.downloadPaused";
}

- (NSString *)downloadFailedNotification {
   
   return @"Notification.NetworkManager.downloadFailed";
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"NetworkManager::IDEA_MAIN"));

   [NetworkManager sharedInstance];
   
   return;
}
