//
//  APPDelegate+ADs.m
//  NetworkArch
//
//  Created by Harry on 2022/11/10.
//  Copyright © 2022 Harry. All rights reserved.
//

#import "APPDelegate+ADs.h"
#import "APPDelegate+Inner.h"
#import "APPDelegate+Signal.h"

@implementation APPDelegate (Admob)

- (void)requestAppOpenAd {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self.appOpenAd = nil;
   
   [GADAppOpenAd loadWithAdUnitID:@"ca-app-pub-3940256099942544/5662855259"
                          request:[GADRequest request]
                      orientation:UIInterfaceOrientationPortrait
                completionHandler:^(GADAppOpenAd *aAppOpenAd, NSError *aError) {

      if (aError) {

         LogDebug((@"-[APPDelegate requestAppOpenAd] : Failed to load app open ad: %@", aError));

         return;

      } /* End if () */

      self.appOpenAd = aAppOpenAd;
      self.appOpenAd.fullScreenContentDelegate = self;
      
      self.loadTime  = [NSDate date];
   }];
      
   __CATCH(nErr);
      
   return;
}

- (void)tryToPresentAd {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (self.appOpenAd) {
      
      UIViewController *rootController = self.window.rootViewController;
      
      [self.appOpenAd presentFromRootViewController:rootController];
      
   } /* End if () */
   else {
      // If you don't have an ad ready, request one.
      [self requestAppOpenAd];
      
   } /* End else */
   
   __CATCH(nErr);
      
   return;
}

- (BOOL)wasLoadTimeLessThanNHoursAgo:(int)n {
   
   NSDate         *stNow                              = [NSDate date];
   NSTimeInterval  timeIntervalBetweenNowAndLoadTime  = [stNow timeIntervalSinceDate:self.loadTime];
   
   double          secondsPerHour                     = 3600.0;
   double          intervalInHours                    = timeIntervalBetweenNowAndLoadTime / secondsPerHour;
   
   return intervalInHours < n;
}

#pragma mark - GADFullScreenContentDelegate
/// Tells the delegate that the ad failed to present full screen content.
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
   
   LogDebug((@"-[APPDelegate ad:didFailToPresentFullScreenContentWithError:]"));

   [self requestAppOpenAd];
   
   return;
}

/// Tells the delegate that the ad will present full screen content.
- (void)adWillPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
   
   LogDebug((@"-[APPDelegate adWillPresentFullScreenContent:]"));

   return;
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {

   LogDebug((@"-[APPDelegate adDidDismissFullScreenContent:]"));

   [self requestAppOpenAd];
   
   return;
}

@end
