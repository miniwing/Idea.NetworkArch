//
//  ThemeButton.h
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//IB_DESIGNABLE
@interface ThemeButton : UIControl

@property (nonatomic, weak)   IBOutlet       UIImageView                         * imageView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * checkImageView;

@property (nonatomic, weak)   IBOutlet       UIView                              * maskView;

@end

@interface ThemeButton (UINib)

@property (class, nonatomic, readonly)       NSString                            * nibName;

@end

NS_ASSUME_NONNULL_END
