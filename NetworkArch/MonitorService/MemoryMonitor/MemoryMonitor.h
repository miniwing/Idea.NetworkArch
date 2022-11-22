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

/// Total physical memory in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               total;

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               used;

/// Free memory in byte. (-1 when error occurs)
@property (nonatomic, readonly)              int64_t                               free;

@end

@interface MemoryMonitor ()

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
