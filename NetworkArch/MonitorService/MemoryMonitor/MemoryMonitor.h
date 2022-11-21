//
//  MemoryMonitor.h
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemoryMonitor : NSObject

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

@interface MemoryMonitor ()

- (void)startMonitor;
- (void)stopMonitor;

@end

NS_ASSUME_NONNULL_END
