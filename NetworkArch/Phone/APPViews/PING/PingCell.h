//
//  PingCell.h
//  NetworkArch
//
//  Created by Harry on 2021/7/29.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, PingStatistics) {
   
   PingStatisticsMinmum    = 0,
   PingStatisticsAverage   = 1,
   PingStatisticsMaximum   = 2,
   PingStatisticsGraph     = 3,
   PingStatisticsNumber
};

@interface PingCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;

@end

@interface PingCell ()

@end

NS_ASSUME_NONNULL_END
