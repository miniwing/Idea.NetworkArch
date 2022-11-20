//
//  PHAuthorizationController+Inner.h
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PHAuthorizationController.h"
#import "PHAuthorizationAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHAuthorizationController () <HWPanModalPresentable>

@property (nonatomic, weak)   IBOutlet       UIView                              * backgroundViewX;

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIImageView                         * iconImageViewX;
@property (nonatomic, weak)   IBOutlet       UILabel                             * tipLabelX;
@property (nonatomic, weak)   IBOutlet       UIButton                            * allowButtonX;

@end

@interface PHAuthorizationController ()

@property (nonatomic, strong)                PHAuthorizationAnimation            * authorizationAnimation;
@property (nonatomic, strong)                NSString                            * permissionTip;

@end

@interface PHAuthorizationController (Inner)

@end

NS_ASSUME_NONNULL_END
