//
//  WiFiMoreContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WiFiMoreContentController+Inner.h"
#import "WiFiMoreContentController+Action.h"
#import "WiFiMoreContentController+Signal.h"
#import "WiFiMoreContentController+Notification.h"
#import "WiFiMoreContentController+Theme.h"
#import "WiFiMoreContentController+Debug.h"

#import "WiFiMoreContentController+AD.h"

#import "WifiInterfacesController+Inner.h"

@implementation WiFiMoreContentController (Inner)

- (void)getExternalIPv4 {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   self.externalIPv4ing = YES;
   
   DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{
      
      NSURL    *stURL   = [NSURL URLWithString:@"https://api.ipify.org"];
      
      self.externalIPv4 = [NSString stringWithContentsOfURL:stURL];
      
      if (NO == kStringIsEmpty(self.externalIPv4)) {
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
            
            self.externalIPv4ing = NO;
            
            [UIView transitionWithView:self.detailCells[WifiDetailExternalIPV4]
                              duration:[UIView animationDefaultDuration]
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
               
               [self.detailCells[WifiDetailExternalIPV4].infoLabel setText:self.externalIPv4];
               
            }
                            completion:^(BOOL finished) {
               
            }];
         });
         
      } /* End if () */
   });

   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation WiFiMoreContentController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"WIFI";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end


#pragma mark - UITableViewDataSource
@implementation WiFiMoreContentController (UITableViewDataSource)

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
//
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
//
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   WifiMoreCell                  *stTableViewCell                          = nil;
   
   NSArray<NSString *>           *stTitles                                 = @[
      @"Status",
      @"SSID",
      @"BSSID",
      @"Default Gateway",
      @"Subnet Mask",
      @"Internal IPV4",
      @"Internal IPV6",
      @"External IPV4",
      @"Interfaces",
   ];
   
   __TRY;
   
   //   WifiSectionDetail    = 0,
   //   WifiSectionDataUsage = 1,
   //   WifiSectionWarning   = 2,
   //   WifiSectionNumber
   
   if (WifiSectionDetail == aIndexPath.section) {
      
      stTableViewCell   = self.detailCells[aIndexPath.row];
      
//      WifiDetailStatus        = 0,
//      WifiDetailSSID          = 1,
//      WifiDetailBSSID         = 2,
//      WifiDetailGateway       = 3,
//      WifiDetailSubnet        = 4,
//      WifiDetailIPV4          = 5,
//      WifiDetailIPV6          = 6,
//      WifiDetailExternalIPV4  = 7,
//      WifiDetailInterfaces    = 8,
      
      [stTableViewCell.titleLabel setText:stTitles[aIndexPath.row]];
      
      if (WifiDetailStatus == aIndexPath.row) {
         
         if ([IDEARouter isWifiConnected]) {
            
            [stTableViewCell.infoView setBackgroundColor:UIColor.systemGreenColor];
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"Connected")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoView setBackgroundColor:UIColor.systemRedColor];
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"Not connected")];
            
         } /* End else */
         
#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoView setBackgroundColor:UIColor.systemGreenColor];
         [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"Connected")];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (WifiDetailSSID == aIndexPath.row) {
         
         if (kStringIsEmpty([IDEARouter getSSID])) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:[IDEARouter getSSID]];
            
         } /* End else */
         
#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"Wi-Fi: 4-2-202"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (WifiDetailBSSID == aIndexPath.row) {
         
         if (kStringIsEmpty([IDEARouter getBSSID])) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:[IDEARouter getBSSID]];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailGateway == aIndexPath.row) {
         
         if (kStringIsEmpty([IDEARouter getGatewayIP])) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:[IDEARouter getGatewayIP]];
            
         } /* End else */
         
#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"FF:FF:FF:FF:FF:FF"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (WifiDetailSubnet == aIndexPath.row) {
         
         // ().first(where: {$0.name == "en0" && $0.family.toString() == "IPv4"})
         NSArray<IDEANetInterface *>   *stInterfaces  = [IDEANetUtils allInterfaces];
         
         IDEANetInterface              *stInterface   = nil;
         
         for (stInterface in stInterfaces) {
            
            if ([stInterface.name isEqualToString:@"en0"] && NetFamilyIPV4 == stInterface.family) {
               
               break;
               
            } /* End if () */
            
         } /* End for () */
         
         if (nil == stInterface || kStringIsEmpty(stInterface.netmask)) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:stInterface.netmask];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailIPV4 == aIndexPath.row) {
         
         NSString    *szIPV4  = [UIDevice ipv4:NetworkWifi];
         
         if (kStringIsEmpty(szIPV4)) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:szIPV4];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailIPV6 == aIndexPath.row) {
         
         // ().first(where: {$0.name == "en0" && $0.family.toString() == "IPv4"})
         NSArray<IDEANetInterface *>   *stInterfaces  = [IDEANetUtils allInterfaces];
         
         IDEANetInterface              *stInterface   = nil;
         
         for (stInterface in stInterfaces) {
            
            if ([stInterface.name isEqualToString:@"en0"] && NetFamilyIPV6 == stInterface.family) {
               
               break;
               
            } /* End if () */
            
         } /* End for () */
         
         if (nil == stInterface || kStringIsEmpty(stInterface.address)) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:stInterface.address];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailExternalIPV4 == aIndexPath.row) {
         
         if (NO == [IDEARouter isWifiConnected] || kStringIsEmpty(self.externalIPv4)) {
            
            [stTableViewCell.infoLabel setText:__LOCALIZED_STRING(self.class, @"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:self.externalIPv4];
            
         } /* End else */
         
      } /* End if () */
      
      /**
       * 设置圆角
       */
      if (0 == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

         } /* End else */

      } /* End if () */
      else if ((self.detailCells.count - 1) == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:0];

      } /* End else */

   } /* End if () */
   else if (WifiSectionDataUsage == aIndexPath.section) {
            
      stTableViewCell   = self.dataUsageCells[aIndexPath.row];
      
      DataUsageInfo  *stDataUsageInfo  = [[DataUsage sharedInstance] getDataUsage];

      if (WifiDataUsageReceived == aIndexPath.row) {
         
         [stTableViewCell.infoLabel setText:[IDEAFileUtils byteCountFormat:stDataUsageInfo.wifiReceived]];
         
      } /* End if () */
      else if (WifiDataUsageSent == aIndexPath.row) {

         [stTableViewCell.infoLabel setText:[IDEAFileUtils byteCountFormat:stDataUsageInfo.wifiSent]];

      } /* End if () */

      /**
       * 设置圆角
       */
      if (0 == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

         } /* End else */

      } /* End if () */
      else if ((self.dataUsageCells.count - 1) == aIndexPath.row) {
         
         if (@available(iOS 13, *)) {

         } /* End if () */
         else {
            
            [stTableViewCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

         } /* End else */

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:0];

      } /* End else */

   } /* End if () */
   else if (WifiSectionWarning == aIndexPath.section) {
      
      stTableViewCell   = self.warningCells[aIndexPath.row];
      [stTableViewCell.titleLabel setTextColorPicker:nil];
      [stTableViewCell.titleLabel setTextColor:UIColorX.labelColor];

      /**
       * 设置圆角
       */
      [stTableViewCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];

   } /* End if () */
   
   if (nil != stTableViewCell) {
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

@end

#pragma mark - UITableViewDelegate
@implementation WiFiMoreContentController (UITableViewDelegate)

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   WifiInterfacesController      *stWifiInterfacesController               = nil;
   
   __TRY;
   
   if (WifiSectionDetail == aIndexPath.section) {
      
#if WIFI_INTERFACES
      if (WifiDetailInterfaces == aIndexPath.row) {
         
         stWifiInterfacesController = [UIStoryboard loadStoryboard:WifiInterfacesController.storyboard
                                                    viewController:WifiInterfacesController.class
                                                          inBundle:WifiInterfacesController.bundle];
         
         [self.navigationController pushViewController:stWifiInterfacesController
                                              animated:YES];
         
      } /* End if () */
#endif /* WIFI_INTERFACES */
      
   } /* End if () */
      
   __CATCH(nErr);
   
   return;
}

@end
