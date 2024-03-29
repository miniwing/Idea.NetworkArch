//
//  WoLANPacketCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

#import "WoLANPacket.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANPacketCell : UITableViewCellX

@property (nonatomic, weak)   IBOutlet       UILabel                             * macLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * sentLabel;

//@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@end

@interface WoLANPacketCell ()

- (void)setWoLANPacket:(WoLANPacket *)aWoLANPacket;

@end

NS_ASSUME_NONNULL_END
