//
//  HomeContentController+Signal.m
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

#import "HomeContentController+AD.h"

@implementation HomeContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadWifiInfo);
@def_signal(loadCellularInfo);

@def_signal(loadAD);

@end

#pragma mark - handleSignal
@implementation HomeContentController (HandleSignal)

#if __Debug__
handleSignal(HomeContentController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeContentController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

handleSignal(HomeContentController, loadWifiInfoSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szIP                                     = nil;
   NSString                      *szSSID                                   = nil;
   
   NSString                      *szIcon                                   = nil;
   
   __TRY;
   
   szIP     = [IDEARouter getIPAddress];
   szSSID   = [IDEARouter getSSID];
   
   LogDebug((@"-[HomeContentController handleSignal:networkStatusSignal:] : IPV4 : %@", szIP));
   LogDebug((@"-[HomeContentController handleSignal:networkStatusSignal:] : SSID : %@", szSSID));
      
   if (kStringIsEmpty(szSSID)) {
      
//      "SSID not available"                = "SSID not available";
//      "Wi-Fi not connected"               = "Wi-Fi not connected";
      
      if ([IDEARouter isWifiConnected]) {
         
         szSSID   = __LOCALIZED_STRING(self.class, @"SSID not available");
         szIP     = __LOCALIZED_STRING(self.class, @"N/A");
         
         szIcon   = @"WIFI-ON";
         
      } /* End if () */
      else {
         
         szSSID   = __LOCALIZED_STRING(self.class, @"Wi-Fi not connected");
         szIP     = __LOCALIZED_STRING(self.class, @"N/A");
         
         szIcon   = @"WIFI-SLASH";
         
      } /* End else */
      
   } /* End if () */
   else {
      
      szIcon   = @"WIFI-ON";

   } /* End else */
   
   [UIView transitionWithView:self.wifiSSIDLabel
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.wifiSSIDLabel setText:szSSID];
      
//#if TARGET_IPHONE_SIMULATOR
//      [self.wifiSSIDLabel setText:__LOCALIZED_STRING(self.class, @"Wi-Fi: 4-2-202")];
//#endif /* TARGET_IPHONE_SIMULATOR */

      return;
   }
                   completion:nil];
   
   [UIView transitionWithView:self.wifiSSIDIcon
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.wifiSSIDIcon setImage:__IMAGE_NAMED(szIcon, self.class)];
      
//#if TARGET_IPHONE_SIMULATOR
//      [self.wifiSSIDIcon setImage:__IMAGE_NAMED(@"WIFI-ON", self.class)];
//#endif /* TARGET_IPHONE_SIMULATOR */

      return;
   }
                   completion:nil];
   
   [UIView transitionWithView:self.wifiIP
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.wifiIP setText:szIP];

//#if TARGET_IPHONE_SIMULATOR
//      [self.wifiIP setText:__LOCALIZED_STRING(self.class, @"192.168.88.88")];
//#endif /* TARGET_IPHONE_SIMULATOR */
      
      return;
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(HomeContentController, loadCellularInfoSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szIcon                                   = nil;
   
   CTTelephonyNetworkInfo        *stTelephonyNetworkInfo                   = nil;
   
   NSDictionary<NSString *, CTCarrier *>  *stCarriers                      = nil;
   CTCarrier                     *stCarrier                                = nil;
   
   NSDictionary<NSString *, NSString *>   *stRadioAccesses                 = nil;
   NSString                      *szRadioAccess                            = nil;
   
   NSString                      *szCarrierName                            = nil;
   NSString                      *szIP                                     = nil;
   
   __TRY;
   
   stTelephonyNetworkInfo  = [[CTTelephonyNetworkInfo alloc] init];
   
   if (@available(iOS 12.0, *)) {
      
      stCarriers  = stTelephonyNetworkInfo.serviceSubscriberCellularProviders;
      
      LogDebug((@"-[HomeContentController handleSignal:loadCellularInfoSignal:] : Carriers : %@", stCarriers));
      
#if __Debug__
      [stCarriers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, CTCarrier * _Nonnull aObject, BOOL * _Nonnull aStop) {
         
         LogDebug((@"-[HomeContentController handleSignal:loadCellularInfoSignal:] : Carrier : %@:%@", aKey, aObject));
         
      }];
#endif /* __Debug__ */
      
      stCarrier   = [stCarriers objectForKey:stCarriers.allKeys.firstObject];
      
      stRadioAccesses   = stTelephonyNetworkInfo.serviceCurrentRadioAccessTechnology;
      
      LogDebug((@"-[HomeContentController handleSignal:loadCellularInfoSignal:] : RadioAccesses : %@", stRadioAccesses));
      
#if __Debug__
      [stRadioAccesses enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, NSString * _Nonnull aObject, BOOL * _Nonnull aStop) {
         
         LogDebug((@"-[HomeContentController handleSignal:loadCellularInfoSignal:] : RadioAccess : %@:%@", aKey, aObject));
         
      }];
#endif /* __Debug__ */
      
      szRadioAccess  = [stRadioAccesses objectForKey:stRadioAccesses.allKeys.firstObject];
      
   } /* End if () */
   else {
      
      stCarrier   = stTelephonyNetworkInfo.subscriberCellularProvider;
      
      LogDebug((@"-[HomeContentController handleSignal:loadCellularInfoSignal:] : Carrier : %@", stCarrier));
      
      szRadioAccess  = stTelephonyNetworkInfo.currentRadioAccessTechnology;
      
      LogDebug((@"-[HomeContentController handleSignal:loadCellularInfoSignal:] : RadioAccess : %@", szRadioAccess));
      
   } /* End else */
   
   if ((nil == stCarrier) || (YES == kStringIsEmpty(stCarrier.carrierName))){
      
      szCarrierName  = __LOCALIZED_STRING(self.class, @"No service");
      szIcon         = @"CELLULAR-SLASH";
      
   } /* End if () */
   else {
      
      szCarrierName  = stCarrier.carrierName;
      szIcon         = @"CELLULAR";
      
   } /* End else */
   
   szIP  = [UIDevice ipv4:NetworkCellular];
   
   if (kStringIsEmpty(szIP)) {
      
      szIP           = __LOCALIZED_STRING(self.class, @"N/A");
      
   } /* End if () */
   
   [UIView transitionWithView:self.cellularOperatorLabel
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.cellularOperatorLabel setText:szCarrierName];
      
//#if TARGET_IPHONE_SIMULATOR
//      [self.cellularOperatorLabel setText:__LOCALIZED_STRING(self.class, @"Cellular Network")];
//#endif /* TARGET_IPHONE_SIMULATOR */

      return;
   }
                   completion:nil];
   
   [UIView transitionWithView:self.cellularOperatorIcon
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.cellularOperatorIcon setImage:__IMAGE_NAMED(szIcon, self.class)];
//#if TARGET_IPHONE_SIMULATOR
//      [self.cellularOperatorIcon setImage:__IMAGE_NAMED(@"CELLULAR", self.class)];
//#endif /* TARGET_IPHONE_SIMULATOR */

      return;
   }
                   completion:nil];
   
   [UIView transitionWithView:self.cellularIP
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.cellularIP setText:szIP];

//#if TARGET_IPHONE_SIMULATOR
//      [self.cellularIP setText:__LOCALIZED_STRING(self.class, @"10.8.8.8")];
//#endif /* TARGET_IPHONE_SIMULATOR */

      return;
   }
                   completion:nil];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(HomeContentController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeContentController loadADSignal:] : Signal : %@", aSignal));

   [self loadAd];
   
   __CATCH(nErr);

   return;
}

@end
