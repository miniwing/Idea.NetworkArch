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

@property (nonatomic, readonly)              NSString                            * networkStatusNotification;

// 服务器当前时间
@property (nonatomic, readonly)              NSTimeInterval                        serverCurrentTime;

// 服务器时间与本地时间的时间差
@property (nonatomic, readonly)              NSTimeInterval                        timeDifference;

/**
 * 网络状态
 */
- (void)startMonitor;
- (void)stopMonitor;

@end

NS_ASSUME_NONNULL_END
