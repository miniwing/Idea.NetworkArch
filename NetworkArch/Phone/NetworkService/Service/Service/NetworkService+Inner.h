//
//  NetworkService+Inner.h
//  NetworkService
//
//  Created by Harry on 2022/10/21.
//

#import "NetworkService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService ()

// 服务器当前时间
@property (nonatomic, assign)                NSTimeInterval                        serverCurrentTime;

// 服务器时间与本地时间的时间差
@property (nonatomic, assign)                NSTimeInterval                        timeDifference;

@property (nonatomic, strong)                AFHTTPSessionManager                * httpManager;
@property (nonatomic, strong)                AFNetworkReachabilityManager        * networkReachabilityManager;

@end

@interface NetworkService ()

- (void)startMonitor;
- (void)stopMonitor;

@end

@interface NetworkService ()

+ (instancetype)sharedInstance;

/**
 *  Unavailable initializer
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 *  Unavailable initializer
 */
- (instancetype)init NS_UNAVAILABLE;

@end

@interface NetworkService (Inner)

- (NSString *)networkStatusNotification;

@end

NS_ASSUME_NONNULL_END
