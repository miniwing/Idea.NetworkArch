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

@property (nonatomic, weak)   IBOutlet       UILabel                             * trackingTitleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * trackingSummaryLabel;

@property (nonatomic, strong) IBOutletCollection(UIView)       NSArray<UIView *> * trackingViews;
@property (nonatomic, strong) IBOutletCollection(UIImageView)  NSArray<UIImageView *>* trackingImageViews;
@property (nonatomic, strong) IBOutletCollection(UILabel)      NSArray<UILabel *>* trackingLabels;

@property (nonatomic, weak)   IBOutlet       UIButton                            * continueButton;

@end

@interface HomeSettingAlertController ()

@end

NS_ASSUME_NONNULL_END
