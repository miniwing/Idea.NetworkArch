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
   
   /// Rate Cells
   for (UITableViewCell *stCell in self.cellRates) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
   for (UITableViewCell *stCell in self.cellAbouts) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
   // Header Footer
   [self.lightBGView setBackgroundColor:UIColor.clearColor];
   [self.nightBGView setBackgroundColor:UIColor.clearColor];
   [self.lightButton setBackgroundColor:UIColor.clearColor];
   [self.nightButton setBackgroundColor:UIColor.clearColor];
   
   [self.lightButton.titleLabel setText:__LOCALIZED_STRING(self.class, @"Light")];
   [self.lightButton.titleLabel setFont:[UIFont systemFontOfSize:self.lightButton.titleLabel.font.pointSize
                                                          weight:UIFontWeightLight]];

   [self.lightButton.imageView setImage:__IMAGE_NAMED_IN_BUNDLE(@"UI-Light", self.class)];
   
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
   [self.cellRateTitle setFont:[UIFont systemFontOfSize:self.cellRateTitle.font.pointSize
                                                 weight:UIFontWeightLight]];
   
   /**
    About
    */
   [self.cellWeiboTitle setText:__LOCALIZED_STRING(self.class, @"Follow on Weibo")];
   [self.cellWeiboTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellWeiboTitle setFont:[UIFont systemFontOfSize:self.cellWeiboTitle.font.pointSize
                                                  weight:UIFontWeightLight]];

   [self.cellWeiboName setText:@"@MINIWING"];
   [self.cellWeiboName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellWeiboName setFont:[UIFont systemFontOfSize:self.cellWeiboName.font.pointSize
                                                 weight:UIFontWeightLight]];
   
   [self.cellTwitterTitle setText:__LOCALIZED_STRING(self.class, @"Follow on Twitter")];
   [self.cellTwitterTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellTwitterTitle setFont:[UIFont systemFontOfSize:self.cellTwitterTitle.font.pointSize
                                                    weight:UIFontWeightLight]];

   [self.cellTwitterName setText:__LOCALIZED_STRING(self.class, @"@MINIWING")];
   [self.cellTwitterName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellTwitterName setFont:[UIFont systemFontOfSize:self.cellTwitterName.font.pointSize
                                                   weight:UIFontWeightLight]];
   
   [self.cellFacebookTitle setText:__LOCALIZED_STRING(self.class, @"Follow on Facebook")];
   [self.cellFacebookTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellFacebookTitle setFont:[UIFont systemFontOfSize:self.cellFacebookTitle.font.pointSize
                                                     weight:UIFontWeightLight]];

   [self.cellFacebookName setText:__LOCALIZED_STRING(self.class, @"@MINIWING")];
   [self.cellFacebookName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellFacebookName setFont:[UIFont systemFontOfSize:self.cellFacebookName.font.pointSize
                                                    weight:UIFontWeightLight]];
   
   [self.cellAboutTitle setText:__LOCALIZED_STRING(self.class, @"About")];
   [self.cellAboutTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellAboutTitle setFont:[UIFont systemFontOfSize:self.cellAboutTitle.font.pointSize
                                                  weight:UIFontWeightLight]];

//   [self.cellVerBuild setText:[NSString stringWithFormat:@"%@ (%@)", [UIApplication sharedApplication].appVersion, [UIApplication sharedApplication].appBuildVersion]];
   [self.cellAboutVersion setText:[UIApplication sharedApplication].appVersion];
   [self.cellAboutVersion setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellAboutVersion setFont:[UIFont systemFontOfSize:self.cellAboutVersion.font.pointSize
                                                    weight:UIFontWeightLight]];

   for (UIImageView *stRightImage in self.cellRightImages) {
            
      [stRightImage setBackgroundColor:UIColor.clearColor];
      [stRightImage setImage:[ImageProvider imageNamed:@"UIButtonBarArrowRight"]];
//      [stRightImage setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [stRightImage setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
            
            return [IDEAColor colorWithKey:[IDEAColor lightText]];
            
         } /* End if () */
         
         return [IDEAColor colorWithKey:[IDEAColor darkGray]];
      }];

   } /* End for () */

   LogDebug((@"-[UISettingTableController viewDidLoad] : Section : %d", [self.tableView numberOfSections]));

//   [self.tableView setNeedsLayout];
//   [self.tableView setNeedsUpdateConstraints];
   
   /**
    Copyright
    */
   [self.copyrightView setBackgroundColor:UIColor.clearColor];
   
   [self.copyrightLabel setBackgroundColor:UIColor.clearColor];
   [self.copyrightLabel setTextColor:UIColor.lightGrayColor];
   [self.copyrightLabel setFont:[UIFont systemFontOfSize:self.copyrightLabel.font.pointSize
                                                  weight:UIFontWeightLight]];

   [self.tableView reloadData];
   
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
