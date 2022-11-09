//
//  PrivacyController+Inner.h
//  PRIVACY
//
//  Created by Harry on 2022/10/14.
//

#import <SettingProvider/SettingProvider.h>

#import "PrivacyAnimation.h"
#import "PrivacyController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PrivacyController ()

@property (nonatomic, weak)   IBOutlet       UIScrollView                        * scrollView;

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * sponsorImageView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * descLabel;

@property (nonatomic, weak)   IBOutlet       UIView                              * itemContainerView;

@property (nonatomic, weak)   IBOutlet       UIView                              * view1;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * imageView1;
@property (nonatomic, weak)   IBOutlet       UILabel                             * label1;

@property (nonatomic, weak)   IBOutlet       UIView                              * view2;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * imageView2;
@property (nonatomic, weak)   IBOutlet       UILabel                             * label2;

@property (nonatomic, weak)   IBOutlet       UIView                              * view3;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * imageView3;
@property (nonatomic, weak)   IBOutlet       UILabel                             * label3;

@property (nonatomic, weak)   IBOutlet       UIButton                            * continueButton;

@end

@interface PrivacyController ()

@property (nonatomic, strong)                PrivacyAnimation                    * privacyAnimation;

@end

@interface PrivacyController (Inner)

- (void)openTracking;

@end

NS_ASSUME_NONNULL_END
