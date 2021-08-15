//
//  HomeSettingLinkCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingLinkCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@property (nonatomic, weak)   IBOutlet       UIButton                            * addButton;

@end

@interface HomeSettingLinkCell ()

@end

NS_ASSUME_NONNULL_END
