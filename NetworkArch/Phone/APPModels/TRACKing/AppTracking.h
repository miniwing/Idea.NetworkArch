//
//  AppTracking.h
//  NetworkArch
//
//  Created by Harry on 2021/6/26.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tracking : NSObject

@property (nonatomic, strong)                NSString                            * icon;
@property (nonatomic, strong)                NSString                            * content;

@end

@interface AppTracking : NSObject

@property (nonatomic, strong)                NSString                            * title;
@property (nonatomic, strong)                NSString                            * summary;
@property (nonatomic, strong)                NSArray<Tracking *>                 * trackings;

@end

@interface AppTracking ()

+ (instancetype)appTracking;

@end

NS_ASSUME_NONNULL_END
