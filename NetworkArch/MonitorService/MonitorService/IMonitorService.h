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
- (UIDeviceBatteryState)batteryState;
- (float)batteryLevel;
- (BOOL)batteryLowPowerModeEnabled;

@end

NS_ASSUME_NONNULL_END
