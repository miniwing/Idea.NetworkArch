//
//  TodayWidgetContentController+Signal.m
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TodayWidgetContentController+Signal.h"

@implementation TodayWidgetContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadWifiInfo);
@def_signal(loadCellularInfo);

@end

#pragma mark - handleSignal
@implementation TodayWidgetContentController (HandleSignal)

handleSignal(TodayWidgetContentController, loadWifiInfoSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szIP                                     = nil;
   NSString                      *szSSID                                   = nil;
   
   NSString                      *szIcon                                   = nil;
   
   __TRY;
   
   szIP     = [IDEARouter getIPAddress];
   szSSID   = [IDEARouter getSSID];
   
   LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : IPV4 : %@", aSignal.name, szIP));
   LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : SSID : %@", aSignal.name, szSSID));

   szIcon   = @"WIFI-ON";
   
   if (kStringIsEmpty(szSSID)) {
      
//      "SSID not available"                = "SSID not available";
//      "Wi-Fi not connected"               = "Wi-Fi not connected";
      
      if ([IDEARouter isWifiConnected]) {
                  
         szSSID   = APP_STR(@"SSID not available");
         szIP     = APP_STR(@"N/A");
         
         szIcon   = @"WIFI-ON";
         
      } /* End if () */
      else {

         szSSID   = APP_STR(@"Wi-Fi not connected");
         szIP     = APP_STR(@"N/A");

         szIcon   = @"WIFI-SLASH";

      } /* End else */

   } /* End if () */

   [UIView transitionWithView:self.wifiSSIDLabel
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiSSIDLabel setText:szSSID];
   }
                   completion:nil];
   
   [UIView transitionWithView:self.wifiSSIDIcon
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiSSIDIcon setImage:[UIImage imageNamed:szIcon]];
   }
                   completion:nil];

   [UIView transitionWithView:self.wifiIP
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiIP setText:szIP];
   }
                   completion:nil];

   __CATCH(nErr);
   
   return;
}

handleSignal(TodayWidgetContentController, loadCellularInfoSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szIcon                                   = nil;
   
   CTTelephonyNetworkInfo        *stTelephonyNetworkInfo                   = nil;
   
   NSDictionary<NSString *, CTCarrier *>  *stCarriers                      = nil;
   CTCarrier                     *stCarrier                                = nil;

   NSDictionary<NSString *, NSString *>   *stRadioAccesses                 = nil;
   NSString                      *szRadioAccess                            = nil;
   
   __TRY;
   
   stTelephonyNetworkInfo  = [[CTTelephonyNetworkInfo alloc] init];
   
   szIcon   = @"CELLULAR";
   
   if (@available(iOS 12.0, *)) {
      
      stCarriers  = stTelephonyNetworkInfo.serviceSubscriberCellularProviders;
      
      LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : Carriers : %@", aSignal.name, stCarriers));
      
#if __Debug__
      [stCarriers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, CTCarrier * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : Carrier : %@:%@", aSignal.name, aKey, aObject));

      }];
#endif /* __Debug__ */
      
      stRadioAccesses   = stTelephonyNetworkInfo.serviceCurrentRadioAccessTechnology;
      
      LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : RadioAccesses : %@", aSignal.name, stRadioAccesses));

#if __Debug__
      [stRadioAccesses enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, NSString * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : RadioAccess : %@:%@", aSignal.name, aKey, aObject));

      }];
#endif /* __Debug__ */

   } /* End if () */
   else {
      
      stCarrier   = stTelephonyNetworkInfo.subscriberCellularProvider;
      
      LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : Carrier : %@", aSignal.name, stCarrier));
      
      szRadioAccess  = stTelephonyNetworkInfo.currentRadioAccessTechnology;
      
      LogDebug((@"-[TodayWidgetContentController handleSignal:%@] : RadioAccess : %@", aSignal.name, szRadioAccess));
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
