//
//  PingGraphCell.h
//  NetworkArch
//
//  Created by Harry on 2021/7/29.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

#import "PingCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingGraphCell : PingCell

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * iconImageView;

@end

@interface PingGraphCell ()

@end

NS_ASSUME_NONNULL_END
