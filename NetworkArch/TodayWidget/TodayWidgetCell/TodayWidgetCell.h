//
//  TodayWidgetCell.h
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodayWidgetCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * selectedColorView;

@end

@interface TodayWidgetCell ()

@property (nonatomic, assign)                BOOL                                 canSelected;

@end

NS_ASSUME_NONNULL_END
