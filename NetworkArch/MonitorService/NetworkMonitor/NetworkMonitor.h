//
//  NetworkMonitor.h
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkMonitor : NSObject

/// 网络上行速率
@property (nonatomic, readonly)              CGFloat                               uploadSpeed;

/// 网络下行速率
@property (nonatomic, readonly)              CGFloat                               downloadSpeed;

@end

@interface NetworkMonitor ()

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

@interface NetworkMonitor ()

- (void)startMonitor;
- (void)stopMonitor;

@end

NS_ASSUME_NONNULL_END
