//
//  UISettingTableController.m
//  UISETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "UISettingController+Inner.h"
#import "UISettingController+Notification.h"

#import "UISettingTableController.h"
#import "UISettingTableController+Inner.h"
#import "UISettingTableController+Action.h"
#import "UISettingTableController+Signal.h"
#import "UISettingTableController+Notification.h"
#import "UISettingTableController+Theme.h"
#import "UISettingTableController+Debug.h"

@implementation UISettingTableController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   [self unobserveAllNotifications];
   [self removeAllSignalResponders];
      
   [self removeAllNotifications];

   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
      
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   
   [self.tableView setTableFooterView:self.copyrightView];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

   [self.tableView registerNib:[UINib nibWithNibName:[UISettingHeader nibName]
                                              bundle:[NSBundle bundleForClass:UISettingHeader.class]]
forHeaderFooterViewReuseIdentifier:[UISettingHeader reuseIdentifier]];
   
   /// UI Cells
   for (UITableViewCell *stCell in self.cellUIs) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];

   } /* End for () */
   
   for (UIView *stView in self.uiCellContainerViews) {
                  
//#if __DEBUG_COLOR__
//      [stView setBackgroundColor:UIColor.systemBlueColor];
//#else /* __DEBUG_COLOR__ */
//      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
//#endif /* !__DEBUG_COLOR__ */

      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];

         } /* End if () */

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];

   } /* End for () */
   
   if (@available(iOS 13.0, *)) {
      
      for (UIView *stSeparatorView in self.uiSeparatorViews) {
         
#if __DEBUG_COLOR__
         [stSeparatorView setBackgroundColor:UIColor.whiteColor];
#else /* __DEBUG_COLOR__ */
         [stSeparatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */

//         [stSeparatorView setBackgroundColor:UIColor.redColor];

      } /* End for () */
      
   } /* End if () */
   else {
      
      for (UIView *stSeparatorView in self.uiSeparatorViews) {
         
         [stSeparatorView setHidden:YES];
         
      } /* End for () */
      
   } /* End else */

//   [self.animateCellContainerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.animateCellContainerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   
   [self.hapticsCellContainerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   
   /// Rate Cells
   for (UITableViewCell *stCell in self.cellRates) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
   for (UITableViewCell *stCell in self.cellAbouts) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
//   [self.rateCellContainerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.rateCellContainerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */

      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];

   // Header Footer
   [self.lightBGView setBackgroundColor:UIColor.clearColor];
   [self.nightBGView setBackgroundColor:UIColor.clearColor];
   [self.lightButton setBackgroundColor:UIColor.clearColor];
   [self.nightButton setBackgroundColor:UIColor.clearColor];
   
//   [self.lightButton.titleLabel setFont:[APPFont lightFontOfSize:self.lightButton.titleLabel.font.pointSize]];
   [self.lightButton.titleLabel setText:__LOCALIZED_STRING(self.class, @"Light")];
   [self.lightButton.titleLabel setFont:[UIFont systemFontOfSize:self.lightButton.titleLabel.font.pointSize
                                                          weight:UIFontWeightLight]];

   [self.lightButton.imageView setImage:__IMAGE_NAMED_IN_BUNDLE(@"UI-Light", self.class)];
   
//   [self.nightButton.titleLabel setFont:[APPFont lightFontOfSize:self.nightButton.titleLabel.font.pointSize]];
   [self.nightButton.titleLabel setText:__LOCALIZED_STRING(self.class, @"Night")];
   [self.nightButton.titleLabel setFont:[UIFont systemFontOfSize:self.nightButton.titleLabel.font.pointSize
                                                          weight:UIFontWeightLight]];

   [self.nightButton.imageView setImage:__IMAGE_NAMED_IN_BUNDLE(@"UI-Night", self.class)];
   
   [self.lightButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
   [self.nightButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
   
   if ([DKThemeVersionNight isEqualToString:[DKNightVersionManager sharedManager].themeVersion]) {
      
      [self.lightButton setSelected:NO];
      [self.nightButton setSelected:YES];
      
   } /* End if () */
   else {
      // Normal
      [self.lightButton setSelected:YES];
      [self.nightButton setSelected:NO];
      
   } /* End else */
   
   [self.cellUITitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellUITitle setFont:[APPFont lightFontOfSize:self.cellUITitle.font.pointSize]];
   [self.cellUITitle setText:__LOCALIZED_STRING(self.class, @"Auto")];
   [self.cellUITitle setFont:[UIFont systemFontOfSize:self.cellUITitle.font.pointSize
                                               weight:UIFontWeightLight]];

   [self.cellUISwitch setOnTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   [self.cellUISwitch setOn:[SettingProvider isAutoTheme]];

   /**
    Animate
    */
   [self.cellAnimateTitle setText:__LOCALIZED_STRING(self.class, @"Animation")];
   [self.cellAnimateTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellAnimateTitle setFont:[APPFont lightFontOfSize:self.cellAnimateTitle.font.pointSize]];
   [self.cellAnimateTitle setFont:[UIFont systemFontOfSize:self.cellAnimateTitle.font.pointSize
                                                    weight:UIFontWeightLight]];

   [self.cellAnimateSwitch setOnTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   [self.cellAnimateSwitch setOn:[SettingProvider isTabbarAnimation]];
   
   LogDebug((@"-[UISettingTableController viewDidLoad] : isTabbarAnimation : %d", [SettingProvider isTabbarAnimation]));

   /**
    Haptics
    */
   [self.cellHapticsTitle setText:__LOCALIZED_STRING(self.class, @"Haptics")];
   [self.cellHapticsTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellHapticsTitle setFont:[APPFont lightFontOfSize:self.cellAnimateTitle.font.pointSize]];
   [self.cellHapticsTitle setFont:[UIFont systemFontOfSize:self.cellHapticsTitle.font.pointSize
                                                    weight:UIFontWeightLight]];

   [self.cellHapticsSwitch setOnTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   [self.cellHapticsSwitch setOn:[SettingProvider isHaptics]];

   LogDebug((@"-[UISettingTableController viewDidLoad] : isHaptics : %d", [SettingProvider isHaptics]));

   /**
    Rate
    */
   [self.cellRateTitle setText:__LOCALIZED_STRING(self.class, @"Rate on App Store")];
   [self.cellRateTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellRateTitle setFont:[APPFont lightFontOfSize:self.cellRateTitle.font.pointSize]];
   [self.cellRateTitle setFont:[UIFont systemFontOfSize:self.cellRateTitle.font.pointSize
                                                 weight:UIFontWeightLight]];
   
   /**
    About
    */
   [self.cellWeiboTitle setText:__LOCALIZED_STRING(self.class, @"Follow on Weibo")];
   [self.cellWeiboTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellWeiboTitle setFont:[APPFont lightFontOfSize:self.cellWeiboTitle.font.pointSize]];
   [self.cellWeiboTitle setFont:[UIFont systemFontOfSize:self.cellWeiboTitle.font.pointSize
                                                  weight:UIFontWeightLight]];

   [self.cellWeiboName setText:@"@MINIWING"];
   [self.cellWeiboName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
//   [self.cellWeiboName setFont:[APPFont lightFontOfSize:self.cellWeiboName.font.pointSize]];
   [self.cellWeiboName setFont:[UIFont systemFontOfSize:self.cellWeiboName.font.pointSize
                                                 weight:UIFontWeightLight]];
   
   [self.cellTwitterTitle setText:__LOCALIZED_STRING(self.class, @"Follow on Twitter")];
   [self.cellTwitterTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellTwitterTitle setFont:[APPFont lightFontOfSize:self.cellTwitterTitle.font.pointSize]];
   [self.cellTwitterTitle setFont:[UIFont systemFontOfSize:self.cellTwitterTitle.font.pointSize
                                                    weight:UIFontWeightLight]];

   [self.cellTwitterName setText:__LOCALIZED_STRING(self.class, @"@MINIWING")];
   [self.cellTwitterName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
//   [self.cellTwitterName setFont:[APPFont lightFontOfSize:self.cellTwitterName.font.pointSize]];
   [self.cellTwitterName setFont:[UIFont systemFontOfSize:self.cellTwitterName.font.pointSize
                                                   weight:UIFontWeightLight]];
   
   [self.cellFacebookTitle setText:__LOCALIZED_STRING(self.class, @"Follow on Facebook")];
   [self.cellFacebookTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellFacebookTitle setFont:[APPFont lightFontOfSize:self.cellFacebookTitle.font.pointSize]];
   [self.cellFacebookTitle setFont:[UIFont systemFontOfSize:self.cellFacebookTitle.font.pointSize
                                                     weight:UIFontWeightLight]];

   [self.cellFacebookName setText:__LOCALIZED_STRING(self.class, @"@MINIWING")];
   [self.cellFacebookName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
//   [self.cellFacebookName setFont:[APPFont lightFontOfSize:self.cellFacebookName.font.pointSize]];
   [self.cellFacebookName setFont:[UIFont systemFontOfSize:self.cellFacebookName.font.pointSize
                                                    weight:UIFontWeightLight]];
   
   [self.cellVerTitle setText:__LOCALIZED_STRING(self.class, @"Version")];
   [self.cellVerTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//   [self.cellVerTitle setFont:[APPFont lightFontOfSize:self.cellVerTitle.font.pointSize]];
   [self.cellVerTitle setFont:[UIFont systemFontOfSize:self.cellVerTitle.font.pointSize
                                                weight:UIFontWeightLight]];

   [self.cellVerBuild setText:[NSString stringWithFormat:@"%@ (%@)", [UIApplication sharedApplication].appVersion, [UIApplication sharedApplication].appBuildVersion]];
   [self.cellVerBuild setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
//   [self.cellVerBuild setFont:[APPFont lightFontOfSize:self.cellVerBuild.font.pointSize]];
   [self.cellVerBuild setFont:[UIFont systemFontOfSize:self.cellVerBuild.font.pointSize
                                                weight:UIFontWeightLight]];

   for (UIView *stView in self.aboutCellContainerViews) {
            
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
         
         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
            
            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
            
         } /* End if () */
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];
   } /* End for () */
   
   for (UIImageView *stRightImage in self.cellRightImages) {
            
      [stRightImage setBackgroundColor:UIColor.clearColor];
      [stRightImage setImage:[ImageProvider imageNamed:@"UIButtonBarArrowRightLandscape"]];
      [stRightImage setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   } /* End for () */

   for (UIView *stSeparatorView in self.aboutSeparatorViews) {
      
      [stSeparatorView setHidden:NO];
      
#if __DEBUG_COLOR__
      [stSeparatorView setBackgroundColor:UIColor.whiteColor];
#else /* __DEBUG_COLOR__ */
      [stSeparatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
//   [self.view setNeedsLayout];
//   [self.view layoutIfNeeded];

   LogDebug((@"-[UISettingTableController viewDidLoad] : Section : %d", [self.tableView numberOfSections]));

   [self.tableView setNeedsLayout];
   [self.tableView setNeedsUpdateConstraints];

   if (@available(iOS 13.0, *)) {

//      [self.uiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.uiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];

   } /* End if () */
   else {

      [self.uiCellContainerViews.firstObject setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];

      [self.animateCellContainerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
      [self.hapticsCellContainerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];
      [self.rateCellContainerView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];

      [self.aboutCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight
                                                       radius:[UISetting cornerRadiusBig]];
      [self.aboutCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight
                                                      radius:[UISetting cornerRadiusBig]];

      for (NSLayoutConstraint *stLayout in self.cellContainerLeft) {
         
         [stLayout setConstant:[UITableViewCellX constraintLeftInset]];

      } /* End for () */

      for (NSLayoutConstraint *stLayout in self.cellContainerRight) {
         
         [stLayout setConstant:[UITableViewCellX constraintRightInset]];
         
      } /* End for () */

   } /* End else */
   
   /**
    Copyright
    */
   [self.copyrightView setBackgroundColor:UIColor.clearColor];
   
   [self.copyrightLabel setBackgroundColor:UIColor.clearColor];
   [self.copyrightLabel setTextColor:UIColor.lightGrayColor];
   [self.copyrightLabel setFont:[UIFont systemFontOfSize:self.copyrightLabel.font.pointSize
                                                  weight:UIFontWeightLight]];

//   [self.tableView reloadData];
   
   __CATCH(nErr);
   
   return;
}

- (void)didReceiveMemoryWarning {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillAppear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidAppear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillDisappear:aAnimated];
   
   [self.tableView clearSelectedRowsAnimated:YES];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)onClick:(UIThemeButton *)aThemeButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if ([aThemeButton isEqual:self.lightButton]) {
      
      [self.lightButton setSelected:YES];
      [self.nightButton setSelected:NO];
      
      [[DKNightVersionManager sharedManager] dawnComing];
      
   } /* End if () */
   else {
      
      [self.lightButton setSelected:NO];
      [self.nightButton setSelected:YES];
      
      [[DKNightVersionManager sharedManager] nightFalling];
      
   } /* End else */
   
   [UISelectionFeedbackGenerator selectionChanged];
   
   __CATCH(nErr);
   
   return;
}

@end
