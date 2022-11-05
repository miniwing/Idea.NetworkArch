//
//  WoLANPacketCell+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WoLANPacketCell.h"

#import "WoLANPacket.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANPacketCell ()

@property (nonatomic, assign)                UIRectCorner                          rectCorner;

@property (nonatomic, strong)                WoLANPacket                         * packet;

@end

@interface WoLANPacketCell (Inner)

@end

NS_ASSUME_NONNULL_END
