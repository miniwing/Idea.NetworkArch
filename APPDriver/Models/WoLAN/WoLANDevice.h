//
//  WoLANDevice.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WoLANDevice : NSObject

@property (nonatomic, strong)                NSString                            * mac;
@property (nonatomic, strong)                NSString                            * broadcastAddr;
@property (nonatomic, assign)                UInt16                                port;

@end

@interface WoLANDevice ()

+ (instancetype)deviceWithMac:(NSString *)aMac broadcastAddr:(NSString *)aBroadcastAddr port:(UInt16)aPort;

@end

NS_ASSUME_NONNULL_END
