//
//  WoLANPacket.h
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WoLANPacket : NSObject

@property (nonatomic, strong)                NSString                            * mac;
@property (nonatomic, assign)                BOOL                                  sent;

@end

@interface WoLANPacket ()

+ (instancetype)packetWithMac:(NSString *)aMAC sent:(BOOL)aSent;

@end

NS_ASSUME_NONNULL_END
