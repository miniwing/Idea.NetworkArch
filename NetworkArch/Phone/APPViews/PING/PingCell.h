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
@property (nonatomic, weak)   IBOutlet       UIView                              * selectedColorView;

@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@end

@interface PingCell ()

@property (nonatomic, assign)                UIRectCorner                          rectCorner;

@end

NS_ASSUME_NONNULL_END
