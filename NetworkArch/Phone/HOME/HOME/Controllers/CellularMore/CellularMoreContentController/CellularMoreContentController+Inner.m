//
//  CellularMoreContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <IDEAKit/UIDevice+Network.h>
#import <APPDriver/DataUsage.h>

#import "CellularMoreContentController+Action.h"
#import "CellularMoreContentController+Inner.h"
#import "CellularMoreContentController+Signal.h"
#import "CellularMoreContentController+Notification.h"
#import "CellularMoreContentController+Theme.h"
#import "CellularMoreContentController+Debug.h"

#import "CellularMoreContentController+AD.h"

@implementation CellularMoreContentController (Inner)

@end

#pragma mark - UITableViewDataSource
@implementation CellularMoreContentController (UITableViewDataSource)

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
//
//   return CellularSectionNumber;
//}
//
//- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
//
//   int                            nErr                                     = EFAULT;
//
//   NSInteger                      nRows                                    = 0;
//
//   __TRY;
//
//   if (CellularSectionDetail == aSection) {
//
//      nRows = self.detailCells.count;
//
//   } /* End if () */
//   else if (CellularSectionDataUsage == aSection) {
//
//      nRows = self.dataUsageCells.count;
//
//   } /* End if () */
//   else if (CellularSectionWarning == aSection) {
//
//      nRows = self.warningCells.count;
//
//   } /* End if () */
//
//   __CATCH(nErr);
//
//   return nRows;
//}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   CellularMoreCell              *stTableViewCell                          = nil;
   
   NSArray<NSString *>           *stTitles                                 = @[
      @"Carrier",
      @"ISO Country Code",
      @"Mobile Country Code",
      @"Mobile Network Code",
      @"Rdio Access Technology",
      @"IPv4 Address",
      @"IPv6 Address",
      @"VoIP Support",
   ];
   
   CTTelephonyNetworkInfo        *stTelephonyNetworkInfo                   = nil;
   
   NSDictionary<NSString *, CTCarrier *>  *stCarriers                      = nil;
   CTCarrier                     *stCarrier                                = nil;

   NSDictionary<NSString *, NSString *>   *stRadioAccesses                 = nil;
   NSString                      *szRadioAccess                            = nil;
   
   NSString                      *szCarrierName                            = nil;
   NSString                      *szIP                                     = nil;

   __TRY;
   
   //   CellularSectionDetail    = 0,
   //   CellularSectionDataUsage = 1,
   //   CellularSectionWarning   = 2,
   //   CellularSectionNumber
   
   LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Section : %d, Row : %d", aIndexPath.section, aIndexPath.row));
   
   stTelephonyNetworkInfo  = [[CTTelephonyNetworkInfo alloc] init];

   if (@available(iOS 12.0, *)) {
      
      stCarriers  = stTelephonyNetworkInfo.serviceSubscriberCellularProviders;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Carriers : %@", stCarriers));
      
#if __Debug__
      [stCarriers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, CTCarrier * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Carrier : %@:%@", aKey, aObject));

      }];
#endif /* __Debug__ */
      
      stCarrier   = [stCarriers objectForKey:stCarriers.allKeys.firstObject];
            
      stRadioAccesses   = stTelephonyNetworkInfo.serviceCurrentRadioAccessTechnology;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : RadioAccesses : %@", stRadioAccesses));

#if __Debug__
      [stRadioAccesses enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, NSString * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : RadioAccess : %@:%@", aKey, aObject));

      }];
#endif /* __Debug__ */

      szRadioAccess  = [stRadioAccesses objectForKey:stRadioAccesses.allKeys.firstObject];

   } /* End if () */
   else {
      
      stCarrier   = stTelephonyNetworkInfo.subscriberCellularProvider;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Carrier : %@", stCarrier));
      
      szRadioAccess  = stTelephonyNetworkInfo.currentRadioAccessTechnology;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : RadioAccess : %@", szRadioAccess));
      
   } /* End else */
      
   if (CellularSectionDetail == aIndexPath.section) {
      
      stTableViewCell   = self.detailCells[aIndexPath.row];
      
//      CellularDetailCarrier      = 0,
//      CellularDetailISO          = 1,
//      CellularDetailCountry      = 2,
//      CellularDetailNetwork      = 3,
//      CellularDetailRadio        = 4,
//      CellularDetailIPV4         = 5,
//      CellularDetailIPV6         = 6,
//      CellularDetailVoIP         = 7,

      [stTableViewCell.titleLabel setText:stTitles[aIndexPath.row]];
      [stTableViewCell.infoLabel setText:@"N/A"];

      if (CellularDetailCarrier == aIndexPath.row) {
         
         if ((nil == stCarrier) || (YES == kStringIsEmpty(stCarrier.carrierName))){
            
            szCarrierName  = __LOCALIZED_STRING(self.class, @"No service");
            
         } /* End if () */
         else {
            
            szCarrierName  = stCarrier.carrierName;
            
         } /* End else */

         [stTableViewCell.infoLabel setText:szCarrierName];

#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"Cellular Network"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (CellularDetailISO == aIndexPath.row) {
         
         if (NO == kStringIsEmpty(stCarrier.isoCountryCode)) {
            
            [stTableViewCell.infoLabel setText:stCarrier.isoCountryCode];

         } /* End if () */

#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"000"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (CellularDetailCountry == aIndexPath.row) {

         if (NO == kStringIsEmpty(stCarrier.mobileCountryCode)) {
            
            [stTableViewCell.infoLabel setText:stCarrier.mobileCountryCode];

         } /* End if () */

#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"US"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (CellularDetailNetwork == aIndexPath.row) {

         if (NO == kStringIsEmpty(stCarrier.mobileNetworkCode)) {
            
            [stTableViewCell.infoLabel setText:stCarrier.mobileNetworkCode];

         } /* End if () */

#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"00"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (CellularDetailRadio == aIndexPath.row) {

         if (kStringIsEmpty(szRadioAccess)) {
            
            szRadioAccess  = @"N/A";
            
         } /* End if () */

         [stTableViewCell.infoLabel setText:[UIDevice radioTechnologyFor:szRadioAccess]];

#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"HSDPA"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (CellularDetailIPV4 == aIndexPath.row) {

         szIP  = [UIDevice ipv4:NetworkCellular];
         
         if (kStringIsEmpty(szIP)) {
            
            szIP           = __LOCALIZED_STRING(self.class, @"N/A");

         } /* End if () */

         [stTableViewCell.infoLabel setText:szIP];

#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"10.8.8.8"];
#endif /* TARGET_IPHONE_SIMULATOR */

      } /* End if () */
      else if (CellularDetailIPV6 == aIndexPath.row) {

         szIP  = [UIDevice ipv6:NetworkCellular];
         
         if (kStringIsEmpty(szIP)) {
            
            szIP           = __LOCALIZED_STRING(self.class, @"N/A");

         } /* End if () */

         [stTableViewCell.infoLabel setText:szIP];

      } /* End if () */
      else if (CellularDetailVoIP == aIndexPath.row) {
         
         if (stCarrier.allowsVOIP) {
            
            [stTableViewCell.infoLabel setText:@"Yes"];

         } /* End if () */
         else {

            [stTableViewCell.infoLabel setText:@"No"];

         } /* End else */
         
#if TARGET_IPHONE_SIMULATOR
         [stTableViewCell.infoLabel setText:@"Yes"];
#endif /* TARGET_IPHONE_SIMULATOR */

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
   else if (CellularSectionDataUsage == aIndexPath.section) {
      
      stTableViewCell   = self.dataUsageCells[aIndexPath.row];
      
      DataUsageInfo  *stDataUsageInfo  = [[DataUsage sharedInstance] getDataUsage];

      if (CellularDataUsageReceived == aIndexPath.row) {
         
         [stTableViewCell.infoLabel setText:[IDEAFileUtils byteCountFormat:stDataUsageInfo.wirelessWanDataReceived]];
         
      } /* End if () */
      else if (CellularDataUsageSent == aIndexPath.row) {

         [stTableViewCell.infoLabel setText:[IDEAFileUtils byteCountFormat:stDataUsageInfo.wirelessWanDataSent]];

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
   else if (CellularSectionWarning == aIndexPath.section) {
      
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
@implementation CellularMoreContentController (UITableViewDelegate)

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
         
   __CATCH(nErr);
   
   return;
}

@end
