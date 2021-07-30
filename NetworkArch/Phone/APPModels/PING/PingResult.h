//
//  PingResult.h
//  NetworkArch
//
//  Created by Harry on 2021/7/30.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PingResult : NSObject

@property (nonatomic, strong)                NSError                             * error;
@property (nonatomic, assign)                NSTimeInterval                        duration;

@end

@interface PingResult ()

+ (instancetype)pingResultWithError:(NSError *)aError duration:(NSTimeInterval)aDuration;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
