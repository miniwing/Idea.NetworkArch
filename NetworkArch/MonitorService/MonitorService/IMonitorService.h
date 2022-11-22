//
//  IMonitorService.h
//  MonitorService
//
//  Created by Harry on 2022/3/11.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

#import <YYKit/NSObject+YYModel.h>

#import <IDEAServiceManager/IDEAServiceManager.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IMonitorService <IDEAIService, YYModel>

@property (nonatomic, readonly)              NSString                            * batteryLowPowerModeNotification;
@property (nonatomic, readonly)              NSString                            * batteryLevelNotification;
@property (nonatomic, readonly)              NSString                            * batteryStateNotification;

/**
 * 电池
 */
@property (nonatomic, readonly)              UIDeviceBatteryState                  batteryState;

@property (nonatomic, readonly)              float                                 batteryLevel;
@property (nonatomic, readonly)              BOOL                                  batteryLowPowerModeEnabled;
@property (nonatomic, readonly)              BOOL                                  batteryIsCharging;

/**
 * 存储空间
 */
/// Total disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               diskSpace;

/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               diskSpaceFree;

/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               diskSpaceUsed;

/**
 * 内存
 */
/// Total physical memory in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               memoryTotal;

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               memoryUsed;

/// Free memory in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               memoryFree;

/**
 * CPU
 */
@property (nonatomic, readonly)              NSInteger                             cpuCoreCount;

@property (nonatomic, readonly)              float                                 cpuAppUsage;

@property (nonatomic, readonly)              float                                 cpuSystemUsage;

/**
 * 网络
 */
/// 网络上行速率
@property (nonatomic, readonly)              float                                 uploadSpeed;

/// 网络下行速率
@property (nonatomic, readonly)              float                                 downloadSpeed;

@end

NS_ASSUME_NONNULL_END
