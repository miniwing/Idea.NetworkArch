//
//  DataUsage.h
//  NetworkArch
//
//  Created by Harry on 2021/8/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataUsageInfo : NSObject

@property (nonatomic, assign)                NSInteger                             wifiReceived;
@property (nonatomic, assign)                NSInteger                             wifiSent;

@property (nonatomic, assign)                NSInteger                             wirelessWanDataReceived;
@property (nonatomic, assign)                NSInteger                             wirelessWanDataSent;

@end

@interface DataUsage : NSObject

@singleton( DataUsage );

@end

@interface DataUsage ()

- (DataUsageInfo *)getDataUsage;

@end

NS_ASSUME_NONNULL_END
