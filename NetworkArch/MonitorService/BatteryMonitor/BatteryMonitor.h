//
//  BatteryMonitor.h
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

#import <YYKit/NSObject+YYModel.h>

#import <IDEAServiceManager/IDEAServiceManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface BatteryMonitor : NSObject <YYModel>

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

@interface BatteryMonitor ()

- (void)startMonitor;
- (void)stopMonitor;

@end

NS_ASSUME_NONNULL_END
