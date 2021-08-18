//
//  HomeSettingAlertController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingAlertController : IDEAViewController <IDEAPresentationControllerDelegate>

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * imageView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * contentLabel;

@property (nonatomic, weak)   IBOutlet       UIButton                            * okButton;
@property (nonatomic, weak)   IBOutlet       UIButton                            * cancelButton;

@end

@interface HomeSettingAlertController ()

@end

NS_ASSUME_NONNULL_END
