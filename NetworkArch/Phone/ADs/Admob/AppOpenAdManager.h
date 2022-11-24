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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<GoogleMobileAds/GoogleMobileAds.h>)
#  import <GoogleMobileAds/GoogleMobileAds.h>
#  ifndef GOOGLE_MOBILE_ADS
#     define GOOGLE_MOBILE_ADS                                       (1)
#  endif /* GOOGLE_MOBILE_ADS */
#elif __has_include("GoogleMobileAds/GoogleMobileAds.h")
#  import "GoogleMobileAds/GoogleMobileAds.h"
#  ifndef GOOGLE_MOBILE_ADS
#     define GOOGLE_MOBILE_ADS                                       (1)
#  endif /* GOOGLE_MOBILE_ADS */
#else
#  ifndef GOOGLE_MOBILE_ADS
#     define GOOGLE_MOBILE_ADS                                       (0)
#  endif /* GOOGLE_MOBILE_ADS */
#endif

#define ADMOB_TEST_DEVICE                                            (__Debug__)

#import <ADs/AD.h>

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
