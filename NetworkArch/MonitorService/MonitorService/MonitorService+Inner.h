//
//  MonitorService+Inner.h
//  MonitorService
//
//  Created by Harry on 2022/10/21.
//

#import "MonitorService.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorService ()

@end

@interface MonitorService ()

- (void)startMonitor;
- (void)stopMonitor;

@end

@interface MonitorService ()

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

@interface MonitorService (Inner)

@end

NS_ASSUME_NONNULL_END
