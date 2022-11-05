//
//  UISettingTableController+Inner.m
//  UISETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISettingTableController.h"
#import "UISettingTableController+Inner.h"
#import "UISettingTableController+Action.h"
#import "UISettingTableController+Signal.h"
#import "UISettingTableController+Notification.h"
#import "UISettingTableController+Theme.h"
#import "UISettingTableController+Debug.h"

@implementation UISettingTableController (Inner)

#pragma mark - Follow
- (void)followWeibo {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://weibo.com/u/1709110023"]
                                      options: nil // @{  UIApplicationOpenURLOptionUniversalLinksOnly : @YES }
                            completionHandler:^(BOOL success) {
      
      LogDebug((@"UISettingTableController::followWeibo"));
   }];
   
   __CATCH(nErr);
   
   return;
}

- (void)followTwitter {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/miniwinghz"]
                                      options: nil // @{  UIApplicationOpenURLOptionUniversalLinksOnly : @YES }
                            completionHandler:^(BOOL success) {
      
      LogDebug((@"UISettingTableController::followWeibo"));
   }];
   
   __CATCH(nErr);
   
   return;
}

- (void)followFacebook {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://facebook.com/miniwing.hz"]
                                      options: nil // @{  UIApplicationOpenURLOptionUniversalLinksOnly : @YES }
                            completionHandler:^(BOOL success) {
      
      LogDebug((@"UISettingTableController::followWeibo"));
   }];
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UITableViewDataSource
@implementation UISettingTableController (UITableViewDataSource)

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
   else if (SettingHaptics == aSection) {
      
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
      
      szTitle  = __LOCALIZED_STRING(self.class, @"Appearance");
      
   } /* End if () */
   if (SettingAnimation == aSection) {
      
//      szTitle  = __LOCALIZED_STRING(self.class, @"Animation");
      
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
   if (SettingHaptics == aIndexPath.section) {
      
      stTableViewCell   = self.cellHapticses[aIndexPath.row];
      
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
@implementation UISettingTableController (UITableViewDelegate)

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)aSection
//{
//   return 32.0;
//}

- (UIView *)tableView:(UITableView *)aTableView viewForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   UISettingHeader               *stSettingHeader                          = nil;
   
   __TRY;
   
   stSettingHeader   = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[UISettingHeader reuseIdentifier]];
   
   [stSettingHeader setHeight:20];
   
   [stSettingHeader.textLabel setHidden:YES];
//   [stSettingHeader.textLabel setFont:[APPFont lightFontOfSize:stSettingHeader.textLabel.font.pointSize]];
   [stSettingHeader.textLabel setText:[self tableView:self.tableView titleForHeaderInSection:aSection]];
   [stSettingHeader.textLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   
//   [stSettingHeader.titleLabel setHidden:YES];
//   [stSettingHeader.titleLabel setFont:[APPFont lightFontOfSize:stSettingHeader.titleLabel.font.pointSize]];
   [stSettingHeader.titleLabel setText:[self tableView:self.tableView titleForHeaderInSection:aSection]];
   [stSettingHeader.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor text])];
   
   __CATCH(nErr);
   
   return stSettingHeader;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (SettingAppearance == aIndexPath.section) {
      
      LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAppearance"));
      
   } /* End if () */
   else if (SettingAnimation == aIndexPath.section) {
      
      LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAnimation"));
      
   } /* End if () */
   else if (SettingHaptics == aIndexPath.section) {
      
      LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingHaptics"));
      
   } /* End if () */
   else if (SettingRate == aIndexPath.section) {
      
      [self postNotify:SettingProvider.appRateOnStore
               onQueue:DISPATCH_GET_MAIN_QUEUE()];
            
   } /* End if () */
   else if (SettingAbout == aIndexPath.section) {
      
      if (SettingAboutWeibo == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutWeibo"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^(void)
                                      {
            [self followWeibo];
         });
      } /* End if () */
      else if (SettingAboutTwitter == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutTwitter"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^(void)
                                      {
            [self followTwitter];
         });
      } /* End if () */
      else if (SettingAboutFacebook == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutFacebook"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^(void)
                                      {
            [self followFacebook];
         });
      } /* End if () */
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end


#pragma mark - UIStoryboard
@implementation UISettingTableController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @(MODULE);
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end
