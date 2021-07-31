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

#import "HomeContentController+Signal.h"

@implementation HomeContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadWifiInfo);
@def_signal(loadCellularInfo);

@end

#pragma mark - handleSignal
@implementation HomeContentController (HandleSignal)

handleSignal(APPDelegate, networkStatusSignal) {

   int                            nErr                                     = EFAULT;
      
   __TRY;

   LogDebug((@"-[HomeContentController handleSignal:%@] : status : %@", aSignal.name, aSignal.object));

   [self sendSignal:HomeContentController.loadWifiInfoSignal];
   [self sendSignal:HomeContentController.loadCellularInfoSignal];

   __CATCH(nErr);
   
   return;
}

handleSignal(HomeContentController, loadWifiInfoSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szIP                                     = nil;
   NSString                      *szSSID                                   = nil;
   
   NSString                      *szIcon                                   = nil;
   
   __TRY;
   
   szIP     = [IDEARoute getIPAddress];
   szSSID   = [IDEARoute getSSID];
   
   LogDebug((@"-[HomeContentController handleSignal:%@] : IPV4 : %@", aSignal.name, szIP));
   LogDebug((@"-[HomeContentController handleSignal:%@] : SSID : %@", aSignal.name, szSSID));

   szIcon   = @"WIFI-ON";
   
   if (kStringIsEmpty(szSSID)) {
      
//      "SSID not available"                = "SSID not available";
//      "Wi-Fi not connected"               = "Wi-Fi not connected";
      
      if ([IDEARoute isWifiConnected]) {
                  
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
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiSSIDLabel setText:szSSID];
   }
                   completion:nil];
   
   [UIView transitionWithView:self.wifiSSIDIcon
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiSSIDIcon setImage:[UIImage imageNamed:szIcon]];
   }
                   completion:nil];

   [UIView transitionWithView:self.wifiIP
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiIP setText:szIP];
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
   
   __TRY;
   
   stTelephonyNetworkInfo  = [[CTTelephonyNetworkInfo alloc] init];
   
   szIcon   = @"CELLULAR";
   
   if (@available(iOS 12.0, *)) {
      
      stCarriers  = stTelephonyNetworkInfo.serviceSubscriberCellularProviders;
      
      LogDebug((@"-[HomeContentController handleSignal:%@] : Carriers : %@", aSignal.name, stCarriers));
      
#if __Debug__
      [stCarriers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, CTCarrier * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[HomeContentController handleSignal:%@] : Carrier : %@:%@", aSignal.name, aKey, aObject));

      }];
#endif /* __Debug__ */
      
      stRadioAccesses   = stTelephonyNetworkInfo.serviceCurrentRadioAccessTechnology;
      
      LogDebug((@"-[HomeContentController handleSignal:%@] : RadioAccesses : %@", aSignal.name, stRadioAccesses));

#if __Debug__
      [stRadioAccesses enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, NSString * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[HomeContentController handleSignal:%@] : RadioAccess : %@:%@", aSignal.name, aKey, aObject));

      }];
#endif /* __Debug__ */

   } /* End if () */
   else {
      
      stCarrier   = stTelephonyNetworkInfo.subscriberCellularProvider;
      
      LogDebug((@"-[HomeContentController handleSignal:%@] : Carrier : %@", aSignal.name, stCarrier));
      
      szRadioAccess  = stTelephonyNetworkInfo.currentRadioAccessTechnology;
      
      LogDebug((@"-[HomeContentController handleSignal:%@] : RadioAccess : %@", aSignal.name, szRadioAccess));
      
   } /* End else */
   
   [UIView transitionWithView:self.cellularOperatorLabel
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.cellularOperatorLabel setText:stCarrier.carrierName];
   }
                   completion:nil];
   
   [UIView transitionWithView:self.wifiSSIDIcon
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiSSIDIcon setImage:[UIImage imageNamed:szIcon]];
   }
                   completion:nil];

   [UIView transitionWithView:self.wifiIP
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.wifiIP setText:szIP];
   }
                   completion:nil];

   __CATCH(nErr);
   
   return;
}

@end
