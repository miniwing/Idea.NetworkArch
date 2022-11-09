//
//  HomeContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeContentController+Inner.h"
#import "HomeContentController+Action.h"
#import "HomeContentController+Signal.h"
#import "HomeContentController+Notification.h"
#import "HomeContentController+Theme.h"
#import "HomeContentController+Debug.h"

@implementation HomeContentController (Inner)

@end

#pragma mark - UITableViewDataSource
@implementation HomeContentController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return HomeSectionNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfRows                            = 0;
   
   __TRY;
   
   //   HomeSectionWifi      = 0,
   //   HomeSectionCellular  = 1,
   //   HomeSectionUtilities = 2,
   
   if (HomeSectionWifi == aSection) {
      
      nNumberOfRows  = self.wifiCells.count;
      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionWifi : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   if (HomeSectionScan == aSection) {
//
//      nNumberOfRows  = self.scanCells.count;
//      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionWifi : %d", nNumberOfRows));
//
//      nErr  = noErr;
//
//      break;
//
//   } /* End if () */

   if (HomeSectionCellular == aSection) {
      
      nNumberOfRows  = self.cellularCells.count;
      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionCellular : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (HomeSectionUtilities == aSection) {
      
      nNumberOfRows  = self.utilitiesCells.count;
      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionUtilities : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   if (HomeSectionCopyright == aSection) {
//
//      nNumberOfRows  = self.copyrightCells.count;
//      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionCopyright : %d", nNumberOfRows));
//
//      nErr  = noErr;
//
//      break;
//
//   } /* End if () */
   
   __CATCH(nErr);
   
   return nNumberOfRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szTitle                                  = nil;
   
   __TRY;
   
   //   HomeSectionWifi      = 0,
   //   HomeSectionCellular  = 1,
   //   HomeSectionUtilities = 2,
   
   //   "WIFI"                              = "Wi-Fi";
   //   "CELLULAR"                          = "Cellular";
   //   "UTILITIES"                         = "Utilities";
   
   if (HomeSectionWifi == aSection) {
      
      szTitle  = __LOCALIZED_STRING(self.class, @"WIFI");
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   if (HomeSectionScan == aSection) {
//
//      szTitle  = __LOCALIZED_STRING(self.class, @"SCAN");
//
//      nErr  = noErr;
//
//      break;
//
//   } /* End if () */

   if (HomeSectionCellular == aSection) {
      
      szTitle  = __LOCALIZED_STRING(self.class, @"CELLULAR");
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (HomeSectionUtilities == aSection) {
      
      szTitle  = __LOCALIZED_STRING(self.class, @"UTILITIES");
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;

   __TRY;
   
   //   HomeSectionWifi      = 0,
   //   HomeSectionCellular  = 1,
   //   HomeSectionUtilities = 2,
   
   if (HomeSectionWifi == aIndexPath.section) {
      
      stTableViewCell   = self.wifiCells[aIndexPath.row];
      
      if (0 == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

         } /* End else */

         [stTableViewCell.selectedColorView setHidden:YES];
         [stTableViewCell.separatorView setHidden:NO];

      } /* End if () */
      else if ((self.wifiCells.count - 1) == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

         [stTableViewCell.selectedColorView setHidden:NO];
         [stTableViewCell.separatorView setHidden:YES];

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:0];

         [stTableViewCell.selectedColorView setHidden:YES];
         [stTableViewCell.separatorView setHidden:NO];

      } /* End else */

   } /* End if () */
//   else if (HomeSectionScan == aIndexPath.section) {
//
//      stTableViewCell   = self.scanCells[aIndexPath.row];
//
//   } /* End if () */
   else if (HomeSectionCellular == aIndexPath.section) {
      
      stTableViewCell   = self.cellularCells[aIndexPath.row];
      
      if (0 == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

         } /* End else */

         [stTableViewCell.selectedColorView setHidden:YES];
         [stTableViewCell.separatorView setHidden:NO];

      } /* End if () */
      else if ((self.cellularCells.count - 1) == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

         [stTableViewCell.selectedColorView setHidden:NO];
         [stTableViewCell.separatorView setHidden:YES];

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:0];

         [stTableViewCell.selectedColorView setHidden:YES];
         [stTableViewCell.separatorView setHidden:NO];

      } /* End else */

   } /* End else if () */
   else if (HomeSectionUtilities == aIndexPath.section) {
      
      stTableViewCell   = self.utilitiesCells[aIndexPath.row];
      
      [stTableViewCell.selectedColorView setHidden:NO];

      if (0 == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

         } /* End else */

         [stTableViewCell.separatorView setHidden:NO];

      } /* End if () */
      else if ((self.utilitiesCells.count - 1) == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

         [stTableViewCell.separatorView setHidden:YES];

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:0];

         [stTableViewCell.separatorView setHidden:NO];

      } /* End else */

   } /* End else if () */
//   else if (HomeSectionCopyright == aIndexPath.section) {
//
//      stTableViewCell   = self.copyrightCells[aIndexPath.row];
//
//      [stTableViewCell setBackgroundColor:UIColor.clearColor];
//      [stTableViewCell.contentView setBackgroundColor:UIColor.clearColor];
//      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.clearColor];
//
//   } /* End else if () */
      
   __CATCH(nErr);
   
   return stTableViewCell;
}

@end

#pragma mark - UITableViewDelegate
@implementation HomeContentController (UITableViewDelegate)

- (nullable NSIndexPath *)tableView:(UITableView *)aTableView willSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];

   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   [UIView transitionWithView:stTableViewCell.selectedColorView
//                     duration:[UIView animationDefaultDuration]
//                      options:UIViewAnimationOptionTransitionCrossDissolve
//                   animations:^{
//
//      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//   }
//                   completion:nil];
//
//   [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];

   __CATCH(nErr);
   
   return aIndexPath;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
      
   __block UIViewController      *stViewController                         = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];
   
   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

   if (HomeSectionWifi == aIndexPath.section) {

      if (HomeWifiMore == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"WIFI/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];
         
      } /* End if () */
      
   } /* End if () */
//   else if (HomeSectionScan == aIndexPath.section) {
//
//      stWifiScanController = [UIStoryboard loadStoryboard:WifiScanController.storyboard
//                                           viewController:WifiScanController.class];
//
//      stViewController     = stWifiScanController;
//
//   } /* End if () */
   else if (HomeSectionCellular == aIndexPath.section) {
      
      if (HomeCellularMore == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"CELLULAR/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];
         
      } /* End if () */
      
   } /* End else if () */
   else if (HomeSectionUtilities == aIndexPath.section) {
      
      if (HomeUtilitiesPing == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"PING/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {
            
            if (nil != aViewController) {
               
               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));
               
               stViewController  = aViewController;
               
            } /* End if () */
         }];
         
      } /* End if () */
      else if (HomeUtilitiesWoL == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"WoLAN/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];

      } /* End else if () */
      else if (HomeUtilitiesWhois == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"Whois/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];
         
      } /* End else if () */
      else if (HomeUtilitiesDNS == aIndexPath.row) {

         [IDEAUIRouter openURL:@"DNS/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];

      } /* End else if () */
      else if (HomeUtilitiesTraceroute == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"TRACEROUTE/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];
         
      } /* End else if () */
      else if (HomeUtilitiesPortScan == aIndexPath.row) {

         [IDEAUIRouter openURL:@"PORTSCAN/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];

      } /* End else if () */
      else if (HomeUtilitiesLanScan == aIndexPath.row) {
         
         [IDEAUIRouter openURL:@"LANSCAN/create"
                    completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

            if (nil != aViewController) {

               LogDebug((@"-[HomeContentController tableView:didSelectRowAtIndexPath:] : %@ : %@", aURL, aViewController));

               stViewController  = aViewController;
               
            } /* End if () */
         }];

      } /* End else if () */
      else {
//      Error
         
      } /* End else */
      
   } /* End else if () */
   else {
//      Error
      
   } /* End else */
   
   if (nil != stViewController) {
      
      [self.navigationController pushViewController:stViewController
                                           animated:YES
                                         completion:nil];

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

- (nullable NSIndexPath *)tableView:(UITableView *)aTableView willDeselectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];

   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

   __CATCH(nErr);
   
   return aIndexPath;
}

- (CGFloat)tableView:(UITableView *)aTableView heightForFooterInSection:(NSInteger)aSection {

   int                            nErr                                     = EFAULT;
   
   CGFloat                        fHeight                                  = 0.1f;

   __TRY;

   if (HomeSectionUtilities == aSection) {
      
      fHeight  = 20.0f;
      
   } /* End if () */
   
   __CATCH(nErr);

   return fHeight;
}

@end
