//
//  PingStatisticsCell.h
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

@interface PingStatisticsCell : PingCell

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * timeLabel;

@end

@interface PingStatisticsCell ()

- (void)setStatistics:(PingStatistics)aPingStatistics value:(NSTimeInterval)aValue;

@end

NS_ASSUME_NONNULL_END
