//
//  Copyright 2021 Google LLC
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "AppOpenAdManager.h"

#if GOOGLE_MOBILE_ADS
/// Ad references in the app open beta will time out after four hours, but this time limit
/// may change in future beta versions. For details, see:
/// https://support.google.com/admanager/answer/9351867?hl=en
static const NSInteger TimeoutInterval = 4;

@interface AppOpenAdManager ()

@property (nonatomic, weak)                  id <AppOpenAdManagerDelegate>         delegate;

/// The app open ad.
@property (nonatomic, strong)                GADAppOpenAd                        * appOpenAd;

/// Keeps track of if an app open ad is loading.
@property (nonatomic, assign)                BOOL                                  isLoadingAd;

/// Keeps track of if an app open ad is showing.
@property (nonatomic, assign)                BOOL                                  isShowingAd;

/// Keeps track of the time when an app open ad was loaded to discard expired ad.
@property (nonatomic, strong)                NSDate                              * loadTime;

@end

@implementation AppOpenAdManager

+ (nonnull AppOpenAdManager *)sharedInstance {
   
   static AppOpenAdManager  *instance   = nil;
   static dispatch_once_t    onceToken;
   
   dispatch_once(&onceToken, ^{
      
      instance = [[AppOpenAdManager alloc] init];
   });
   return instance;
}

- (BOOL)wasLoadTimeLessThanNHoursAgo:(int)n {
   
   int                            nErr                                     = EFAULT;

   const double                   secondsPerHour                           = 3600.0;
   double                         intervalInHours                          = 0.0;
   
   NSTimeInterval                 timeIntervalBetweenNowAndLoadTime        = 0.0;
   
   __TRY;

   // Check if ad was loaded more than n hours ago.
   timeIntervalBetweenNowAndLoadTime   = [[NSDate date] timeIntervalSinceDate:_loadTime];
   intervalInHours   = timeIntervalBetweenNowAndLoadTime / secondsPerHour;
   
   __CATCH(nErr);
   
   return intervalInHours < n;
}

- (BOOL)isAdAvailable {
   
   // Check if ad exists and can be shown.
   return self.appOpenAd && [self wasLoadTimeLessThanNHoursAgo:TimeoutInterval];
}

- (void)adDidComplete {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // The app open ad is considered to be complete when it dismisses or fails to show,
   // call the delegate's adDidComplete method if the delegate is not nil.
   if (!self.delegate) {
      
      return;
      
   } /* End if () */
   
   [self.delegate adDidComplete];
   self.delegate = nil;
   
   __CATCH(nErr);
   
   return;
}

+ (void)setDelegate:(id<AppOpenAdManagerDelegate>)aDelegate {
   
   [AppOpenAdManager sharedInstance].delegate   = aDelegate;
   
   return;
}

+ (void)loadAd {
   
   [[AppOpenAdManager sharedInstance] loadAd];
   
   return;
}

- (void)loadAd {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   // Do not load ad if there is an unused ad or one is already loading.
   if ([self isAdAvailable] || self.isLoadingAd) {
      
      break;
      
   } /* End if () */
   
   self.isLoadingAd  = YES;
      
   LogDebug((@"-[AppOpenAdManager loadAd] : Start loading app open ad. : %@", [NSDate date]));

   [GADAppOpenAd loadWithAdUnitID:@"ca-app-pub-3940256099942544/5662855259"
                          request:[GADRequest request]
                      orientation:UIInterfaceOrientationPortrait
                completionHandler:^(GADAppOpenAd * _Nullable aOpenAd, NSError * _Nullable aError) {

      self.isLoadingAd = NO;

      if (aError) {

         self.appOpenAd = nil;
         self.loadTime  = nil;

         LogError((@"-[AppOpenAdManager loadAd] : App open ad failed to load with error: %@.", aError));

         return;
      }
      
      self.appOpenAd = aOpenAd;
      self.appOpenAd.fullScreenContentDelegate = self;
      self.loadTime  = [NSDate date];

      LogDebug((@"-[AppOpenAdManager loadAd] : App open ad loaded successfully. : %@", [NSDate date]));

      return;
   }];
   
   __CATCH(nErr);
   
   return;
}

+ (void)showAdIfAvailable:(UIViewController*)viewController {
   
   [[AppOpenAdManager sharedInstance] showAdIfAvailable:viewController];
   
   return;
}

- (void)showAdIfAvailable:(nonnull UIViewController *)aViewController {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   // If the app open ad is already showing, do not show the ad again.
   if (self.isShowingAd) {
      
      LogError((@"-[AppOpenAdManager adWillPresentFullScreenContent:] : App open ad is already showing."));

      nErr  = noErr;
      
      break;
      
   } /* End if () */

   // If the app open ad is not available yet but it is supposed to show,
   // it is considered to be complete in this example. Call the adDidComplete method
   // and load a new ad.
   if (![self isAdAvailable]) {

      LogError((@"-[AppOpenAdManager adWillPresentFullScreenContent:] : App open ad is not ready yet."));

      [self adDidComplete];
      [self loadAd];
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

   LogDebug((@"-[AppOpenAdManager adWillPresentFullScreenContent:] : App open ad will be displayed."));

   self.isShowingAd  = YES;
   [self.appOpenAd presentFromRootViewController:aViewController];
   
   __CATCH(nErr);
   
   return;
}

/// Keeps track of if an app open ad is loading.
+ (BOOL)isLoadingAd {
   
   return [AppOpenAdManager sharedInstance].isLoadingAd;
}

/// Keeps track of if an app open ad is showing.
+ (BOOL)isShowingAd {
   
   return [AppOpenAdManager sharedInstance].isShowingAd;
}

#pragma mark - GADFullScreenContentDelegate

/// Tells the delegate that the ad will present full screen content.
- (void)adWillPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)aAD {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   LogDebug((@"-[AppOpenAdManager adWillPresentFullScreenContent:] : App open ad is will be presented."));

   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)aAD {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   self.appOpenAd    = nil;
   self.isShowingAd  = NO;

   LogDebug((@"-[AppOpenAdManager adDidDismissFullScreenContent:] : App open ad was dismissed."));
   
   [self adDidComplete];
   [self loadAd];
   
   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that the ad failed to present full screen content.
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   self.appOpenAd    = nil;
   self.isShowingAd  = NO;
   
   LogDebug((@"-[AppOpenAdManager ad:didFailToPresentFullScreenContentWithError:] : App open ad failed to present with error: %@.", error.localizedDescription));
   
   [self adDidComplete];
   [self loadAd];
   
   __CATCH(nErr);
   
   return;
}

@end

#else /* GOOGLE_MOBILE_ADS */

@implementation GADBannerView

@end

#endif /* !GOOGLE_MOBILE_ADS */
