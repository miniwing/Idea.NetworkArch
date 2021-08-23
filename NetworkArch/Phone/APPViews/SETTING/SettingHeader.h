//
//  SettingHeader.h
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingHeader : UITableViewHeaderFooterView

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * showAllLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * iconImageView;

@end

@interface SettingHeader ()

+ (NSString *)nibName;

@end

NS_ASSUME_NONNULL_END
