//
//  WiFiMoreContentController+AD.m
//  Pods
//
//  Created by Harry on 2022/11/11.
//

#import <ADs/AD.h>
#import <ADs/AppOpenAdManager.h>

#import "WiFiMoreContentController+Inner.h"
#import "WiFiMoreContentController+Action.h"
#import "WiFiMoreContentController+Signal.h"
#import "WiFiMoreContentController+Notification.h"
#import "WiFiMoreContentController+Theme.h"
#import "WiFiMoreContentController+Debug.h"

#import "WiFiMoreContentController+AD.h"

@implementation WiFiMoreContentController (AD)

- (void)loadAd {
   
   int                            nErr                                     = EFAULT;
   
   GADRequest                    *stGADRequest                             = nil;
   
   __TRY;

   stGADRequest   = [GADRequest request];
      
   [self.gadBannerView loadRequest:stGADRequest];

   __CATCH(nErr);
   
   return;
}

#pragma mark - GADBannerViewDelegate
/// Tells the delegate that an ad request successfully received an ad. The delegate may want to add
/// the banner view to the view hierarchy if it hasn't been added yet.
- (void)bannerViewDidReceiveAd:(nonnull GADBannerView *)aBannerView {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [UIView transitionWithView:self.tableView
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{

      [self.tableView setTableHeaderView:self.bannerView];
   }
                   completion:nil];

   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that an ad request failed. The failure is normally due to network
/// connectivity or ad availablility (i.e., no fill).
- (void)bannerView:(nonnull GADBannerView *)aBannerView didFailToReceiveAdWithError:(nonnull NSError *)aError {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   [UIView transitionWithView:self.tableView
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{

      [self.tableView setTableHeaderView:nil];
   }
                   completion:nil];

   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that an impression has been recorded for an ad.
- (void)bannerViewDidRecordImpression:(nonnull GADBannerView *)aBannerView {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that a click has been recorded for the ad.
- (void)bannerViewDidRecordClick:(nonnull GADBannerView *)aBannerView {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   __CATCH(nErr);
   
   return;
}

#pragma mark Click-Time Lifecycle Notifications

/// Tells the delegate that a full screen view will be presented in response to the user clicking on
/// an ad. The delegate may want to pause animations and time sensitive interactions.
- (void)bannerViewWillPresentScreen:(nonnull GADBannerView *)aBannerView {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that the full screen view will be dismissed.
- (void)bannerViewWillDismissScreen:(nonnull GADBannerView *)aBannerView {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   __CATCH(nErr);
   
   return;
}

/// Tells the delegate that the full screen view has been dismissed. The delegate should restart
/// anything paused while handling bannerViewWillPresentScreen:.
- (void)bannerViewDidDismissScreen:(nonnull GADBannerView *)aBannerView {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   __CATCH(nErr);
   
   return;
}

#pragma mark - GADAdSizeDelegate
/// Called before the ad view changes to the new size.
- (void)adView:(nonnull GADBannerView *)aBannerView willChangeAdSizeTo:(GADAdSize)aSize {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   __CATCH(nErr);
   
   return;
}

@end
