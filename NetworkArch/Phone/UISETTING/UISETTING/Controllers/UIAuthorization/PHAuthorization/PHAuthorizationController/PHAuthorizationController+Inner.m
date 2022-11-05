//
//  PHAuthorizationController+Inner.m
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationRootController.h"

#import "PHAuthorizationController+Inner.h"

@implementation PHAuthorizationController (Inner)

@end

@implementation PHAuthorizationController (HWPanModalPresentable)

#pragma mark - HWPanModalPresentable
- (PanModalHeight)longFormHeight {
   
//   return PanModalHeightMake(PanModalHeightTypeContent, 284);
   return PanModalHeightMake(PanModalHeightTypeMaxTopInset, 44);
}

- (CGFloat)topOffset {
   
   return 0;
}

- (BOOL)showDragIndicator {
   
   return NO;
}

- (BOOL)allowsDragToDismiss {
   
   return NO;
}

- (BOOL)allowsTapBackgroundToDismiss {
   
   return NO;
}

- (BOOL)allowScreenEdgeInteractive {
   
   return NO;
}

- (BOOL)shouldRespondToPanModalGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
   
   return NO;
}

- (NSTimeInterval)transitionDuration {
   
   return 0.5;
}

- (UIViewAnimationOptions)transitionAnimationOptions {
   
   return UIViewAnimationOptionCurveEaseIn;
}

- (CGFloat)springDamping {
   
   return 1.0f;
}

/**
 * HARRY
 */
- (BOOL)isSpringDamping {
   
   return YES;
}

- (PresentingViewControllerAnimationStyle)presentingVCAnimationStyle {
   
//   return PresentingViewControllerAnimationStylePageSheet;
   return PresentingViewControllerAnimationStyleCustom;
}

- (id<HWPresentingViewControllerAnimatedTransitioning>)customPresentingVCAnimation {

   return self.authorizationAnimation;
}

@end

#pragma mark - UIStoryboard
@implementation PHAuthorizationController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"AUTHORIZATION";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"PHAuthorizationController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"PHAuthorizationRootController/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"PHAuthorizationController::IDEA_MAIN : URL     : %@", aURL));
      LogDebug((@"PHAuthorizationController::IDEA_MAIN : Router  : %@", aRouter));
      
      PHAuthorizationRootController *stPHAuthorizationController  = [UIStoryboard loadStoryboard:PHAuthorizationRootController.storyboard
                                                                                  viewController:PHAuthorizationRootController.class
                                                                                        inBundle:PHAuthorizationRootController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stPHAuthorizationController);
         
      } /* End if () */
   }];
   
   [IDEAUIRouter registerURLPattern:@"PHAuthorizationController/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"PHAuthorizationController::IDEA_MAIN : URL     : %@", aURL));
      LogDebug((@"PHAuthorizationController::IDEA_MAIN : Router  : %@", aRouter));
      
      NSDictionary               *stUserInfo                   = [aRouter objectForKey:IDEAUIRouterParameterUserInfo];
      
      PHAuthorizationController  *stPHAuthorizationController  = [UIStoryboard loadStoryboard:PHAuthorizationController.storyboard
                                                                               viewController:PHAuthorizationController.class
                                                                                     inBundle:PHAuthorizationController.bundle];
      
      stPHAuthorizationController.permissionTip = [stUserInfo objectForKey:PHAuthorizationController.PERMISSION_KEY];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stPHAuthorizationController);
         
      } /* End if () */
   }];
   
   return;
}
