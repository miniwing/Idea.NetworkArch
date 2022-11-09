//
//  PrivacyController+Inner.m
//  PRIVACY
//
//  Created by Harry on 2022/10/14.
//

#import "PrivacyRootController.h"

#import "PrivacyController+Inner.h"
#import "PrivacyController+Action.h"
#import "PrivacyController+Notification.h"
#import "PrivacyController+Theme.h"

@implementation PrivacyController (Inner)

- (void)openTracking {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (@available(iOS 14, *)) {
      
      // iOS14及以上版本需要先请求权限
      [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus aStatus) {
         
         LogDebug((@"-[PrivacyController openTracking] : MainThread : %d", [NSThread isMainThread]));
         LogDebug((@"-[PrivacyController openTracking] : requestTrackingAuthorizationWithCompletionHandler : %d", aStatus));
         
         // 获取到权限后，依然使用老方法获取idfa
         if (ATTrackingManagerAuthorizationStatusAuthorized == aStatus) {
            
            LogDebug((@"-[PrivacyController openTracking] : IDFA(iOS 14+) : %@", [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString]));
            
            [self postNotify:[PrivacyController trackingDoneNotification]];
            
         } /* End if () */
         else {
            
            LogDebug((@"请在设置-隐私-跟踪中允许App请求跟踪"));

            DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
               
               [UIAlertController showAlertInViewController:UIApplication.sharedApplication.delegate.window.rootViewController
                                         userInterfaceStyle:UIUserInterfaceStyleLight
                                                  withTitle:@""
                                                    message:__LOCALIZED_STRING(self.class, @"Settings-Privacy-Tracking")
                                          cancelButtonTitle:__LOCALIZED_STRING(self.class, @"Cancel")
                                     destructiveButtonTitle:__LOCALIZED_STRING(self.class, @"Setting")
                                          otherButtonTitles:nil
                                                   tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {

                  [self postNotify:[PrivacyController trackingDoneNotification]];

                  if (aController.destructiveButtonIndex == aButtonIndex) {

                     // Setting
                     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                                        options:nil
                                              completionHandler:nil];

                  } /* End if () */

                  return;
               }];
            });
         } /* End else */
      }];
      
   } /* @available(iOS 14, *) */
   else {
      
      // iOS14以下版本依然使用老方法
      // 判断在设置-隐私里用户是否打开了广告跟踪
      if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
         
         LogDebug((@"-[PrivacyController openTracking] : IDFA(iOS 14-) : %@", [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString]));
         
         [self postNotify:[PrivacyController trackingDoneNotification]];

      } /* End if () */
      else {
         
         LogDebug((@"请在设置-隐私-广告中打开广告跟踪功能"));
         
         DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
            
            [UIAlertController showAlertInViewController:UIApplication.sharedApplication.delegate.window.rootViewController
                                      userInterfaceStyle:UIUserInterfaceStyleLight
                                               withTitle:@""
                                                 message:__LOCALIZED_STRING(self.class, @"Settings-Privacy-Tracking")
                                       cancelButtonTitle:__LOCALIZED_STRING(self.class, @"Cancel")
                                  destructiveButtonTitle:__LOCALIZED_STRING(self.class, @"Setting")
                                       otherButtonTitles:nil
                                                tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {
               
               [self postNotify:[PrivacyController trackingDoneNotification]];

               if (aController.destructiveButtonIndex == aButtonIndex) {

                  // Setting
                  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                                     options:nil
                                           completionHandler:nil];

               } /* End if () */

               return;
            }];
         });
      } /* End else */
      
   } /* End else */

   /**
    * 同一版本不需要重复提示。
    */
   [SettingProvider setTracking:YES];

   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation PrivacyController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @(MODULE);
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - IDEAPresentationControllerDelegate
@implementation PrivacyController (IDEAPresentationControllerDelegate)
- (CGRect)frameOfPresented {
   
   LogDebug((@"-[PrivacyController frameOfPresented] : presentationController : %@", self.presentationController));
   LogDebug((@"-[PrivacyController frameOfPresented] : presentedViewController : %@", self.presentedViewController));

   return CGRectMake(0,
                     [UIWindow topSafeAreaInset] + 56 + 10,
                     self.view.width,
                     self.view.height - ([UIWindow topSafeAreaInset] + 56 + 10) - ([(UITabBarController *)UIApplication.sharedApplication.delegate.window.rootViewController tabBar].height + 10));
}

- (BOOL)backgroundTouchToClose {
   
   return NO;
}

@end

IDEA_MAIN() {
   
   LogDebug((@"PrivacyController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"PRIVACY/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"PrivacyController::IDEA_MAIN : URL     : %@", aURL));
      LogDebug((@"PrivacyController::IDEA_MAIN : Router  : %@", aRouter));
      
      PrivacyController *stPrivacyController = [UIStoryboard loadStoryboard:PrivacyController.storyboard
                                                             viewController:PrivacyController.class
                                                                   inBundle:PrivacyController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stPrivacyController);
         
      } /* End if () */
   }];
   
   return;
}
