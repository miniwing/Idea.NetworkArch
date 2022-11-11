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

#import <UIKit/UIKit.h>

#if __has_include(<GoogleMobileAds/GoogleMobileAds.h>)
#  import <GoogleMobileAds/GoogleMobileAds.h>
#  define GOOGLE_MOBILE_ADS                                          (1)
#elif __has_include("GoogleMobileAds/GoogleMobileAds.h")
#  import "GoogleMobileAds/GoogleMobileAds.h"
#  define GOOGLE_MOBILE_ADS                                          (1)
#else
#  define GOOGLE_MOBILE_ADS                                          (0)
#endif

#if GOOGLE_MOBILE_ADS

@protocol AppOpenAdManagerDelegate <NSObject>

/// Method to be invoked when an app open ad is complete (i.e. dismissed or fails to show).
@required
- (void)adDidComplete;

@end

@interface AppOpenAdManager : NSObject <GADFullScreenContentDelegate>


@end

@interface AppOpenAdManager ()

+ (void)setDelegate:(id<AppOpenAdManagerDelegate>)aDelegate;

+ (void)loadAd;
+ (void)showAdIfAvailable:(UIViewController*)viewController;

/// Keeps track of if an app open ad is loading.
+ (BOOL)isLoadingAd;

/// Keeps track of if an app open ad is showing.
+ (BOOL)isShowingAd;

@end

#else /* GOOGLE_MOBILE_ADS */

@interface GADBannerView : UIView

@end

#endif /* !GOOGLE_MOBILE_ADS */
