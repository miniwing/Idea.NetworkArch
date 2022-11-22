//
//  MonitorService+Inner.h
//  MonitorService
//
//  Created by Harry on 2022/10/21.
//

#import "MonitorService.h"

#import "BatteryMonitor+Inner.h"
#import "NetworkMonitor+Inner.h"
#import "CPUMonitor+Inner.h"
#import "MemoryMonitor+Inner.h"
#import "DriveMonitor+Inner.h"

NS_ASSUME_NONNULL_BEGIN

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
