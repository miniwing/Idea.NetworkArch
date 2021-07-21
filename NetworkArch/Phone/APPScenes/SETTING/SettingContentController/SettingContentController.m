//
//  SettingContentController.m
//  SETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+Kit.h"

#import "SettingController+Notification.h"

#import "SettingContentController.h"
#import "SettingContentController+Theme.h"

#import "SettingHeader.h"

IDEA_ENUM(NSInteger, SettingSection) {
   
   SettingAppearance = 0,
   SettingAnimation  = 1,
   SettingRate       = 2,
   SettingAbout      = 3,
   SettingNumber
};

IDEA_ENUM(NSInteger, SettingAboutRow) {
   
   SettingAboutWeibo    = 0,
   SettingAboutTwitter  = 1,
   SettingAboutFacebook = 2,
   SettingAboutNumber
};

@interface SettingContentController ()

@end

@implementation SettingContentController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   [self removeAllSignalResponders];
   [self unobserveAllNotifications];
   [self removeAllNotification];
   
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
   
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   [self.tableView registerNib:[UINib nibWithNibName:[SettingHeader nibName] bundle:nil] forHeaderFooterViewReuseIdentifier:[SettingHeader reuseIdentifier]];
   
   /// UI Cells
   for (UITableViewCell *stCell in self.cellUIs) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
   for (UIView *stView in self.uiCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   if (@available(iOS 13.0, *)) {
      
      for (UIView *stSeparatorView in self.uiSeparatorViews) {
         
#if __DEBUG_COLOR__
         [stSeparatorView setBackgroundColor:UIColor.whiteColor];
#else /* __DEBUG_COLOR__ */
         [stSeparatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
         
      } /* End for () */
      
   } /* End if () */
   else {
      
      for (UIView *stSeparatorView in self.uiSeparatorViews) {
         
         [stSeparatorView setHidden:YES];
         
      } /* End for () */
      
   } /* End else */
   
   [self.annimateCellContainerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   /// Rate Cells
   for (UITableViewCell *stCell in self.cellRates) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
   for (UITableViewCell *stCell in self.cellAbouts) {
      
      [stCell setBackgroundColor:UIColor.clearColor];
      [stCell.contentView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */
   
   [self.rateCellContainerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   // Header Footer
   [self.lightBGView setBackgroundColor:UIColor.clearColor];
   [self.nightBGView setBackgroundColor:UIColor.clearColor];
   [self.lightButton setBackgroundColor:UIColor.clearColor];
   [self.nightButton setBackgroundColor:UIColor.clearColor];
   
   [self.lightButton.titleLabel setFont:[APPFont lightFontOfSize:self.lightButton.titleLabel.font.pointSize]];
   [self.lightButton.titleLabel setText:APP_STR(@"Light")];
   [self.nightButton.titleLabel setFont:[APPFont lightFontOfSize:self.nightButton.titleLabel.font.pointSize]];
   [self.nightButton.titleLabel setText:APP_STR(@"Night")];
   
   [self.lightButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
   [self.nightButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
   
   if ([DKThemeVersionNight isEqualToString:[DKNightVersionManager sharedManager].themeVersion]) {
      
      [self.lightButton setSelected:NO];
      [self.nightButton setSelected:YES];
      
   } /* End if () */
   else { // Normal
      
      [self.lightButton setSelected:YES];
      [self.nightButton setSelected:NO];
      
   } /* End else */
   
   [self.cellUITitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellUITitle setFont:[APPFont lightFontOfSize:self.cellUITitle.font.pointSize]];
   [self.cellUITitle setText:APP_STR(@"Auto")];
   
   [self.cellUISwitch setOnTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   
   /**
    Theme UI init
    */
   if ([APPDelegate isAutoTheme]) {
      
      [self.cellUISwitch setOn:YES];
      
      if (@available(iOS 13.0, *)) {
         
         [self.lightButton setEnabled:NO];
         [self.nightButton setEnabled:NO];
         
         if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {
            
            [[DKNightVersionManager sharedManager] nightFalling];
            
         } /* End if () */
         else {
            
            [[DKNightVersionManager sharedManager] dawnComing];
            
         } /* End else */
         
      } /* End if (iOS 13) */
      else {
         
         [self.lightButton setEnabled:YES];
         [self.nightButton setEnabled:YES];
         
      } /* End else */
      
   } /* End if () */
   else {
      
      [self.cellUISwitch setOn:NO];
      
   } /* End else */
   
   /**
    Animate
    */
   [self.cellAnimateTitle setText:APP_STR(@"Animation")];
   [self.cellAnimateTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellAnimateTitle setFont:[APPFont lightFontOfSize:self.cellAnimateTitle.font.pointSize]];
   
   [self.cellAnimateSwitch setOnTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   [self.cellAnimateSwitch setOn:[APPDelegate isTabbarAnimation]];
   
   /**
    Rate
    */
   [self.cellRateTitle setText:APP_STR(@"Rate on App Store")];
   [self.cellRateTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellRateTitle setFont:[APPFont lightFontOfSize:self.cellRateTitle.font.pointSize]];
   
   [self.cellRatesRightImage setTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   
   /**
    About
    */
   [self.cellWeiboTitle setText:APP_STR(@"Follow on Weibo")];
   [self.cellWeiboTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellWeiboTitle setFont:[APPFont lightFontOfSize:self.cellWeiboTitle.font.pointSize]];
   
   [self.cellWeiboName setText:@"@MINIWING"];
   [self.cellWeiboName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellWeiboName setFont:[APPFont lightFontOfSize:self.cellWeiboName.font.pointSize]];
   
   [self.cellWeiboRightImage setTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   
   
   [self.cellTwitterTitle setText:APP_STR(@"Follow on Twitter")];
   [self.cellTwitterTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellTwitterTitle setFont:[APPFont lightFontOfSize:self.cellTwitterTitle.font.pointSize]];
   
   [self.cellTwitterName setText:APP_STR(@"@MINIWING")];
   [self.cellTwitterName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellTwitterName setFont:[APPFont lightFontOfSize:self.cellTwitterName.font.pointSize]];
   
   [self.cellTwitterRightImage setTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   
   
   [self.cellFacebookTitle setText:APP_STR(@"Follow on Facebook")];
   [self.cellFacebookTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellFacebookTitle setFont:[APPFont lightFontOfSize:self.cellFacebookTitle.font.pointSize]];
   
   [self.cellFacebookName setText:APP_STR(@"@MINIWING")];
   [self.cellFacebookName setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellFacebookName setFont:[APPFont lightFontOfSize:self.cellFacebookName.font.pointSize]];
   
   [self.cellFacebookRightImage setTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];
   
   
   [self.cellVerTitle setText:APP_STR(@"Version")];
   [self.cellVerTitle setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellVerTitle setFont:[APPFont lightFontOfSize:self.cellVerTitle.font.pointSize]];
   
   [self.cellVerBuild setText:[NSString stringWithFormat:@"%@ (%@)", [UIApplication sharedApplication].appVersion, [UIApplication sharedApplication].appBuildVersion]];
   [self.cellVerBuild setTextColorPicker:DKColorPickerWithKey([IDEAColor darkGray])];
   [self.cellVerBuild setFont:[APPFont lightFontOfSize:self.cellVerBuild.font.pointSize]];
   
   
   for (UIView *stView in self.aboutCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   for (UIView *stSeparatorView in self.aboutSeparatorViews) {
      
      [stSeparatorView setHidden:NO];
      
#if __DEBUG_COLOR__
      [stSeparatorView setBackgroundColor:UIColor.whiteColor];
#else /* __DEBUG_COLOR__ */
      [stSeparatorView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
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
   
   if (@available(iOS 13.0, *)) {
      
      [self.uiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
      [self.uiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
      
   } /* End if () */
   else {
      
      [self.uiCellContainerViews.firstObject setCornerRadius:8 clipsToBounds:YES];
      
   } /* End else */
   
   [self.annimateCellContainerView setCornerRadius:8 clipsToBounds:YES];
   [self.rateCellContainerView setCornerRadius:8 clipsToBounds:YES];
   
   [self.aboutCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.aboutCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
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

- (void)onClick:(ThemeButton *)aThemeButton {
   
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

#pragma mark - IBAction
@implementation SettingContentController (Action)

- (IBAction)onThemeSwitch:(UISwitch *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (aSender.isOn) {
      
      [self.lightButton setEnabled:NO];
      [self.nightButton setEnabled:NO];
      
      [APPDelegate setAutoTheme:YES];
      
      if (@available(iOS 13.0, *)) {
         
         if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {
            
            [self.lightButton setSelected:NO];
            [self.nightButton setSelected:YES];
            
            [[DKNightVersionManager sharedManager] nightFalling];
            
         } /* End if () */
         else {
            
            [self.lightButton setSelected:YES];
            [self.nightButton setSelected:NO];
            
            [[DKNightVersionManager sharedManager] dawnComing];
            
         } /* End else */
         
      } /* End if (iOS 13) */
      
   } /* End if () */
   else {
      
      [APPDelegate setAutoTheme:NO];
      
      [self.lightButton setEnabled:YES];
      [self.nightButton setEnabled:YES];
      
      [self.lightButton setSelected:YES];
      [self.nightButton setSelected:NO];
      
      [[DKNightVersionManager sharedManager] dawnComing];
      
   } /* End else */
   
   [UISelectionFeedbackGenerator selectionChanged];
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onAnimationSwitch:(UISwitch *)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   //   [self postNotify:IDEA_MAKE_NOTIFICATION( Setting, TABBAR, ANIMATE )
   //         withObject:@(aSender.isOn)
   //            onQueue:dispatch_get_main_queue()];
   
   LogDebug((@"-[SettingContentController onAnimationSwitch:] : tabAnimation : %@", SettingController.tabAnimationNotification));
   [self postNotify:SettingController.tabAnimationNotification
         withObject:@(aSender.isOn)
            onQueue:dispatch_get_main_queue()];
   
   [UISelectionFeedbackGenerator selectionChanged];
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - Follow
- (void)followWeibo {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com/MINIWING"]
                                      options: nil // @{  UIApplicationOpenURLOptionUniversalLinksOnly : @YES }
                            completionHandler:^(BOOL success) {
      
      LogDebug((@"SettingContentController::followWeibo"));
   }];
   
   __CATCH(nErr);
   
   return;
}

- (void)followTwitter {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/intent/user?screen_name=MINIWING"]
                                      options: nil // @{  UIApplicationOpenURLOptionUniversalLinksOnly : @YES }
                            completionHandler:^(BOOL success) {
      
      LogDebug((@"SettingContentController::followWeibo"));
   }];
   
   __CATCH(nErr);
   
   return;
}

- (void)followFacebook {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://m.facebook.com"]
                                      options: nil // @{  UIApplicationOpenURLOptionUniversalLinksOnly : @YES }
                            completionHandler:^(BOOL success) {
      
      LogDebug((@"SettingContentController::followWeibo"));
   }];
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UITableViewDataSource
@implementation SettingContentController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return SettingNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   int                            nNumber                                  = 0;
   
   __TRY;
   
   if (SettingAppearance == aSection) {
      
      if (@available(iOS 13.0, *)) {
         
         nNumber  = 2;
         
      } /* End if () */
      else {
         
         nNumber  = 1;
         
      } /* End else */
      
   } /* End if () */
   else if (SettingAnimation == aSection) {
      
      nNumber  = 1;
      
   } /* End if () */
   else if (SettingRate == aSection) {
      
      nNumber  = 1;
      
   } /* End if () */
   else if (SettingAbout == aSection) {
      
      nNumber  = 4;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return nNumber;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szTitle                                  = nil;
   
   __TRY;
   
   if (SettingAppearance == aSection) {
      
      szTitle  = APP_STR(@"Appearance");
      
   } /* End if () */
   if (SettingAnimation == aSection) {
      
      szTitle  = APP_STR(@"Animation");
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   UITableViewCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   if (SettingAppearance == aIndexPath.section) {
      
      stTableViewCell   = self.cellUIs[aIndexPath.row];
      
   } /* End if () */
   if (SettingAnimation == aIndexPath.section) {
      
      stTableViewCell   = self.cellAnimates[aIndexPath.row];
      
   } /* End if () */
   else if (SettingRate == aIndexPath.section) {
      
      stTableViewCell   = self.cellRates[aIndexPath.row];
      
   } /* End if () */
   if (SettingAbout == aIndexPath.section) {
      
      stTableViewCell   = self.cellAbouts[aIndexPath.row];
      
   } /* End if () */
   
   if (nil != stTableViewCell) {
      
      //      [stTableViewCell setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor secondarySystemGroupedBackground])];
      //      [stTableViewCell.contentView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor secondarySystemGroupedBackground])];
      
      [stTableViewCell setBackgroundColor:UIColor.clearColor];
      [stTableViewCell.contentView setBackgroundColor:UIColor.clearColor];
      
      //      [stTableViewCell setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
      //      [stTableViewCell.contentView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

@end

#pragma mark - UITableViewDelegate
@implementation SettingContentController (UITableViewDelegate)

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)aSection {
//
//   return 32.0;
//}

- (UIView *)tableView:(UITableView *)aTableView viewForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   SettingHeader                 *stSettingHeader                          = nil;
   
   __TRY;
   
   stSettingHeader   = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[SettingHeader reuseIdentifier]];
   
   [stSettingHeader setHeight:20];
   
   [stSettingHeader.textLabel setHidden:YES];
   [stSettingHeader.textLabel setFont:[APPFont lightFontOfSize:stSettingHeader.textLabel.font.pointSize]];
   [stSettingHeader.textLabel setText:[self tableView:self.tableView titleForHeaderInSection:aSection]];
   [stSettingHeader.textLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   
   //   [stSettingHeader.titleLabel setHidden:YES];
   [stSettingHeader.titleLabel setFont:[APPFont lightFontOfSize:stSettingHeader.titleLabel.font.pointSize]];
   [stSettingHeader.titleLabel setText:[self tableView:self.tableView titleForHeaderInSection:aSection]];
   [stSettingHeader.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   
   __CATCH(nErr);
   
   return stSettingHeader;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (SettingAppearance == aIndexPath.section) {
      
      LogDebug((@"SettingContentController::tableView:didSelectRowAtIndexPath : SettingAppearance"));
      
   } /* End if () */
   else if (SettingAnimation == aIndexPath.section) {
      
      LogDebug((@"SettingContentController::tableView:didSelectRowAtIndexPath : SettingAnimation"));
      
   } /* End if () */
   else if (SettingRate == aIndexPath.section) {
      
#if APP_RATER
      dispatch_async_on_main_queue(^{
         
         [Appirater rateApp];
      });
#endif /* APP_RATER */
      
   } /* End if () */
   else if (SettingAbout == aIndexPath.section) {
      
      if (SettingAboutWeibo == aIndexPath.row) {
         
         LogDebug((@"SettingContentController::tableView:didSelectRowAtIndexPath : SettingAboutWeibo"));
         
         dispatch_async_on_main_queue(^{
            
            [self followWeibo];
         });
         
      } /* End if () */
      else if (SettingAboutTwitter == aIndexPath.row) {
         
         LogDebug((@"SettingContentController::tableView:didSelectRowAtIndexPath : SettingAboutTwitter"));
         
         dispatch_async_on_main_queue(^{
            
            [self followTwitter];
         });
         
      } /* End if () */
      else if (SettingAboutFacebook == aIndexPath.row) {
         
         LogDebug((@"SettingContentController::tableView:didSelectRowAtIndexPath : SettingAboutFacebook"));
         
         dispatch_async_on_main_queue(^{
            
            [self followFacebook];
         });
         
      } /* End if () */
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation SettingContentController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"SETTING";
}

@end
