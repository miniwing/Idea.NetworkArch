//
//  WoLANContentController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WoLANContentController.h"

#import "WoLANDevice.h"
#import "DeviceAwake.h"
#import "WoLANPacket.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANContentController ()

@property (nonatomic, strong)                NSString                            * mac;
@property (nonatomic, strong)                NSString                            * broadcastAddr;
@property (nonatomic, strong)                NSString                            * port;

@property (nonatomic, strong)                NSMutableArray<WoLANPacket *>       * packets;

@end

@interface WoLANContentController (Inner)

@end

NS_ASSUME_NONNULL_END
