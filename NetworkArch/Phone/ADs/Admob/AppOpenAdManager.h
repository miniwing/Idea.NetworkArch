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
#  ifndef ADS_GOOGLE_MOBILE
#     define ADS_GOOGLE_MOBILE                                       (1)
#  endif /* ADS_GOOGLE_MOBILE */
#elif __has_include("GoogleMobileAds/GoogleMobileAds.h")
#  import "GoogleMobileAds/GoogleMobileAds.h"
#  ifndef ADS_GOOGLE_MOBILE
#     define ADS_GOOGLE_MOBILE                                       (1)
#  endif /* ADS_GOOGLE_MOBILE */
#else
#  ifndef ADS_GOOGLE_MOBILE
#     define ADS_GOOGLE_MOBILE                                       (0)
#  endif /* ADS_GOOGLE_MOBILE */
#endif

#define ADMOB_TEST_DEVICE                                            (__Debug__)

#import <ADs/AD.h>

#if ADS_GOOGLE_MOBILE

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

#else /* ADS_GOOGLE_MOBILE */

@interface GADBannerView : UIView

@end

#endif /* !ADS_GOOGLE_MOBILE */
