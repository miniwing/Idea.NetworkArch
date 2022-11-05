//
//  NetworkManager.h
//  NetworkService
//
//  Created by Harry on 2022/3/18.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

#import <NetworkService/INetworkManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject <INetworkManager>

@end

@interface NetworkManager ()

- (NSString *)downloadStartedNotification;
- (NSString *)downloadFinishedNotification;
- (NSString *)downloadCancelledNotification;
- (NSString *)downloadPausedNotification;
- (NSString *)downloadFailedNotification;

@end

NS_ASSUME_NONNULL_END
