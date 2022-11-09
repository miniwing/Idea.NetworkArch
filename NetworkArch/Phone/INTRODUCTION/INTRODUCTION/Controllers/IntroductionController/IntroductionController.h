//
//  IntroductionController.h
//  INTRODUCTION
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface IntroductionController : IDEAViewController <IDEAPresentationControllerDelegate>

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * imageView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * summaryLabel;

@property (nonatomic, strong) IBOutletCollection(UIView)       NSArray<UIView *> * introductionViews;
@property (nonatomic, strong) IBOutletCollection(UIImageView)  NSArray<UIImageView *>  * introductionImageViews;
@property (nonatomic, strong) IBOutletCollection(UILabel)      NSArray<UILabel *>* introductionLabels;
@property (nonatomic, strong) IBOutletCollection(UILabel)      NSArray<UILabel *>* introductionSummaryLabels;

@property (nonatomic, weak)   IBOutlet       UIButton                            * continueButton;

@end

@interface IntroductionController ()

@end

NS_ASSUME_NONNULL_END
