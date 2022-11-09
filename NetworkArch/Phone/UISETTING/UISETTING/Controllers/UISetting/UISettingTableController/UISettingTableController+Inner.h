//
//  UISettingTableController+Inner.h
//  UISETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "UIThemeButton.h"
#import "UISettingHeader.h"
#import "UISettingTableController.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, SettingSection) {
   
   SettingAppearance = 0,
   
#if TAB_ANIMATE
   SettingAnimation,
#endif /* TAB_ANIMATE */
   
   SettingHaptics,
   SettingRate,
   SettingAbout,
   SettingNumber
};

IDEA_ENUM(NSInteger, SettingAppearanceRow) {
   
   SettingAppearanceTheme  = 0,
   SettingAppearanceAuto   = 1,
   SettingAppearanceNumber
};

IDEA_ENUM(NSInteger, SettingAboutRow) {
   
   SettingAboutWeibo    = 0,
   SettingAboutTwitter  = 1,
   SettingAboutFacebook = 2,
   SettingAboutVersion  = 3,
   SettingAboutNumber
};

@interface UISettingTableController ()

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray           * cellUIs;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * uiCellContainerViews;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * uiSeparatorViews;

@property (nonatomic, strong) IBOutletCollection(UIImageView)     NSArray<UIImageView *> * cellRightImages;

@property (nonatomic, weak)   IBOutlet       UILabel                                * cellUITitle;
@property (nonatomic, weak)   IBOutlet       UISwitch                               * cellUISwitch;
@property (nonatomic, weak)   IBOutlet       UIView                                 * uiSeparatorView;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray           * cellAnimates;
@property (nonatomic, weak)   IBOutlet       UIView                                 * animateCellContainerView;
@property (nonatomic, weak)   IBOutlet       UIView                                 * animateSeparatorView;
//@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * animateCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                                * cellAnimateTitle;
@property (nonatomic, weak)   IBOutlet       UISwitch                               * cellAnimateSwitch;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray           * cellHapticses;
@property (nonatomic, weak)   IBOutlet       UIView                                 * hapticsCellContainerView;
@property (nonatomic, weak)   IBOutlet       UIView                                 * hapticsSeparatorView;

@property (nonatomic, weak)   IBOutlet       UILabel                                * cellHapticsTitle;
@property (nonatomic, weak)   IBOutlet       UISwitch                               * cellHapticsSwitch;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray           * cellRates;
@property (nonatomic, weak)   IBOutlet       UIView                                 * rateCellContainerView;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * rateSeparatorViews;
//@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * rateCellContainerViews;

@property (nonatomic, weak)   IBOutlet       UILabel                                * cellRateTitle;
@property (nonatomic, weak)   IBOutlet       UIImageView                            * cellRatesRightImage;

@property (nonatomic, strong) IBOutletCollection(UITableViewCell) NSArray           * cellAbouts;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * aboutCellContainerViews;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<UIView *> * aboutSeparatorViews;

@property (nonatomic, weak)   IBOutlet       UILabel                                * cellWeiboTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellWeiboName;
@property (nonatomic, weak)   IBOutlet       UIImageView                            * cellWeiboRightImage;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellTwitterTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellTwitterName;
@property (nonatomic, weak)   IBOutlet       UIImageView                            * cellTwitterRightImage;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellFacebookTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellFacebookName;
@property (nonatomic, weak)   IBOutlet       UIImageView                            * cellFacebookRightImage;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellVerTitle;
@property (nonatomic, weak)   IBOutlet       UILabel                                * cellVerBuild;

@property (nonatomic, weak)   IBOutlet       UIView                                 * lightBGView;
@property (nonatomic, weak)   IBOutlet       UIView                                 * nightBGView;

@property (nonatomic, weak)   IBOutlet       UIThemeButton                          * lightButton;
@property (nonatomic, weak)   IBOutlet       UIThemeButton                          * nightButton;

@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<NSLayoutConstraint *> * cellContainerLeft;
@property (nonatomic, strong) IBOutletCollection(UIView)          NSArray<NSLayoutConstraint *> * cellContainerRight;

@end

@interface UISettingTableController (Inner)

@end

NS_ASSUME_NONNULL_END
