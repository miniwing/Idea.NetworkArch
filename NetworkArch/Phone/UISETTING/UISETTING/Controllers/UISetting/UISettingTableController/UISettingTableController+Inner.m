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
      
      LogDebug((@"-[UISettingTableController followWeibo]"));
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
      
      LogDebug((@"-[UISettingTableController followTwitter]"));
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
      
      LogDebug((@"-[UISettingTableController followFacebook]"));
   }];
   
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
         
         nNumber  = SettingAppearanceNumber;
         
      } /* End if () */
      else {
         
         nNumber  = SettingAppearanceNumber - 1;
         
      } /* End else */
      
   } /* End if () */
#if TAB_ANIMATE
   else if (SettingAnimation == aSection) {
      
      nNumber  = 1;
      
   } /* End if () */
#endif /* TAB_ANIMATE */
   else if (SettingHaptics == aSection) {
      
      nNumber  = 1;
      
   } /* End if () */
   else if (SettingRate == aSection) {
      
      nNumber  = 1;
      
   } /* End if () */
   else if (SettingAbout == aSection) {
      
      nNumber  = SettingAboutNumber;
      
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
#if TAB_ANIMATE
   else if (SettingAnimation == aSection) {
      
      szTitle  = __LOCALIZED_STRING(self.class, @"Animation");
      
   } /* End if () */
#endif /* TAB_ANIMATE */
   else {
      
      szTitle  = @"";
      
   } /* End else */
   
   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   UITableViewCellX              *stTableViewCell                          = nil;
   
   __TRY;
   
   if (SettingAppearance == aIndexPath.section) {
      
      LogDebug((@"-[UISettingTableController tableView:cellForRowAtIndexPath:] : SettingAppearance : %d, %d", aIndexPath.section, aIndexPath.row));

      stTableViewCell   = self.cellUIs[aIndexPath.row];
      
      if (@available(iOS 13.0, *)) {
         
         if (0 == aIndexPath.row) {
            
            [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
            [stTableViewCell.separatorView setHidden:NO];

         } /* End if () */
         else if (self.cellUIs.count - 1 == aIndexPath.row) {

            [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
            [stTableViewCell.separatorView setHidden:YES];

         } /* End else if () */
         else {

            [stTableViewCell setRectCorner:UIRectCornerNone];
            [stTableViewCell.separatorView setHidden:NO];

         } /* End else */

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];
         [stTableViewCell.separatorView setHidden:YES];

      } /* End else */

   } /* End if () */
#if TAB_ANIMATE
   else if (SettingAnimation == aIndexPath.section) {

      LogDebug((@"-[UISettingTableController tableView:cellForRowAtIndexPath:] : SettingAnimation : %d, %d", aIndexPath.section, aIndexPath.row));

      stTableViewCell   = self.cellAnimates[aIndexPath.row];
      [stTableViewCell setRectCorner:UIRectCornerAllCorners];

   } /* End if () */
#endif /* TAB_ANIMATE */
   else if (SettingHaptics == aIndexPath.section) {

      LogDebug((@"-[UISettingTableController tableView:cellForRowAtIndexPath:] : SettingHaptics : %d, %d", aIndexPath.section, aIndexPath.row));

      stTableViewCell   = self.cellHapticses[aIndexPath.row];
      [stTableViewCell setRectCorner:UIRectCornerAllCorners];

   } /* End if () */
   else if (SettingRate == aIndexPath.section) {
      
      LogDebug((@"-[UISettingTableController tableView:cellForRowAtIndexPath:] : SettingRate : %d, %d", aIndexPath.section, aIndexPath.row));

      stTableViewCell   = self.cellRates[aIndexPath.row];
      [stTableViewCell setRectCorner:UIRectCornerAllCorners];

   } /* End if () */
   else if (SettingAbout == aIndexPath.section) {
      
      LogDebug((@"-[UISettingTableController tableView:cellForRowAtIndexPath:] : SettingAbout : %d, %d", aIndexPath.section, aIndexPath.row));

      stTableViewCell   = self.cellAbouts[aIndexPath.row];
      
      if (0 == aIndexPath.row) {
         
         [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
         [stTableViewCell.separatorView setHidden:NO];

      } /* End if () */
      else if (self.cellAbouts.count - 1 == aIndexPath.row) {

         [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
         [stTableViewCell.separatorView setHidden:YES];

      } /* End else if () */
      else {

         [stTableViewCell setRectCorner:UIRectCornerNone];
         [stTableViewCell.separatorView setHidden:NO];

      } /* End else */

   } /* End if () */
   else {
      
//      stTableViewCell   = self.cellAbouts[0];
      LogDebug((@"-[UISettingTableController tableView:cellForRowAtIndexPath:] : XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"));

   } /* End else */
   
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)aSection {
   
   return 32.0;
}

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

- (UIView *)tableView:(UITableView *)aTableView heightForFooterInSection:(NSInteger)aSection {
   
   return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   if (SettingAppearance == aIndexPath.section) {
      
      if (SettingAppearanceTheme == aIndexPath.row) {
         
         return 210.0;
         
      } /* End if () */
      
   } /* End if () */
   
   return 52.0;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (SettingAppearance == aIndexPath.section) {
      
      LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAppearance"));
      
   } /* End if () */
#if TAB_ANIMATE
   else if (SettingAnimation == aIndexPath.section) {
      
      LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAnimation"));
      
   } /* End if () */
#endif /* TAB_ANIMATE */
   else if (SettingHaptics == aIndexPath.section) {
      
      LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingHaptics"));
      
   } /* End if () */
   else if (SettingRate == aIndexPath.section) {
      
      [self postNotify:SettingProvider.appRateOnStoreNotification
               onQueue:DISPATCH_GET_MAIN_QUEUE()];
            
   } /* End if () */
   else if (SettingAbout == aIndexPath.section) {
      
      if (SettingAboutWeibo == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutWeibo"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^(void) {
            
            [self followWeibo];
         });
      } /* End if () */
      else if (SettingAboutTwitter == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutTwitter"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^(void) {
            
            [self followTwitter];
         });
      } /* End if () */
      else if (SettingAboutFacebook == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutFacebook"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^(void) {
            
            [self followFacebook];
         });
      } /* End if () */
      else if (SettingAboutVersion == aIndexPath.row) {
         
         LogDebug((@"UISettingTableController::tableView:didSelectRowAtIndexPath : SettingAboutVersion"));
         
         [IDEAUIRouter openURL:@"ABOUT/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {
            
            if (nil != aViewController) {
               
               [self.navigationController pushViewController:aViewController
                                                    animated:YES];
               
            } /* End if () */
         }];
      } /* End if () */

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end
