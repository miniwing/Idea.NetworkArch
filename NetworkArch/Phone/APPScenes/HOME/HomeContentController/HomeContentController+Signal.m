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

   LogDebug((@"-[HomeContentController handleSignal:networkStatusSignal:] : status : %@", aSignal.object));

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
   
   szIP     = [IDEARouter getIPAddress];
   szSSID   = [IDEARouter getSSID];
   
   LogDebug((@"-[HomeContentController handleSignal:networkStatusSignal:] : IPV4 : %@", szIP));
   LogDebug((@"-[HomeContentController handleSignal:networkStatusSignal:] : SSID : %@", szSSID));

//   szIcon   = @"WIFI-ON";
   
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
      
      szCarrierName  = APP_STR(@"No service");
      szIcon         = @"CELLULAR-SLASH";

   } /* End if () */
   else {
      
      szCarrierName  = stCarrier.carrierName;
      szIcon         = @"CELLULAR";

   } /* End else */
   
   szIP  = [UIDevice ipv4:NetworkCellular];
   
   if (kStringIsEmpty(szIP)) {
      
      szIP           = APP_STR(@"N/A");

   } /* End if () */
   
   [UIView transitionWithView:self.cellularOperatorLabel
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.cellularOperatorLabel setText:szCarrierName];
   }
                   completion:nil];
   
   [UIView transitionWithView:self.cellularOperatorIcon
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.cellularOperatorIcon setImage:[UIImage imageNamed:szIcon]];
   }
                   completion:nil];

   [UIView transitionWithView:self.cellularIP
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.cellularIP setText:szIP];
   }
                   completion:nil];

   __CATCH(nErr);
   
   return;
}

@end
