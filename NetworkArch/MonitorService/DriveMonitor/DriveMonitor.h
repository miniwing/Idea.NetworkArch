//
//  DriveMonitor.h
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DriveMonitor : NSObject

@property (nonatomic, readonly)              int64_t                               space;
@property (nonatomic, readonly)              int64_t                               spaceFree;
@property (nonatomic, readonly)              int64_t                               spaceUsed;

@end

@interface DriveMonitor ()

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

@interface DriveMonitor ()

- (void)startMonitor;
- (void)stopMonitor;

@end

NS_ASSUME_NONNULL_END
