//
//  CellularMoreController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreController+Inner.h"
#import "CellularMoreController+Action.h"
#import "CellularMoreController+Signal.h"
#import "CellularMoreController+Notification.h"
#import "CellularMoreController+Theme.h"
#import "CellularMoreController+Debug.h"

#pragma mark - UITheme
@implementation CellularMoreController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super onThemeUpdate:aNotification];
   
   LogDebug((@"-[CellularMoreController onThemeUpdate:] : Notification : %@", aNotification));
   
   [self.navigationBarX.navigationBar setTitleTextColor:[IDEAColor colorWithKey:[IDEAColor label]]];
   [self.navigationBarX.navigationBar setTintColor:[IDEAColor colorWithKey:[IDEAColor appNavigationBarTint]]];

   __CATCH(nErr);
   
   return;
}

#pragma mark - UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle {

   LogView((@"-[%@ preferredStatusBarStyle]", [self class]));
   
   if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {
      
      return UIStatusBarStyleLightContent;
      
   } /* End if () */
   else { // if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNormal])
   
      if (@available(iOS 13, *)) {

         // 系统版本高于 13.0
         return UIStatusBarStyleDarkContent;
         
      } /* End if () */
      
      return UIStatusBarStyleDefault;

   } /* End if () */
}

- (BOOL)prefersStatusBarHidden {

   LogView((@"-[%@ prefersStatusBarHidden]", [self class]));

   return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {

   LogView((@"-[%@ preferredStatusBarUpdateAnimation]", [self class]));

   return UIStatusBarAnimationFade;
}

- (BOOL)shouldAutorotate {

   LogView((@"-[%@ shouldAutorotate]", [self class]));

   return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {

   LogView((@"-[%@ supportedInterfaceOrientations]", [self class]));

   return UIInterfaceOrientationMaskPortrait;
}

// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
- (BOOL)prefersHomeIndicatorAutoHidden {

   LogView((@"-[%@ prefersHomeIndicatorAutoHidden]", [self class]));

   return YES;
}

- (UIModalPresentationStyle)modalPresentationStyle {

   LogView((@"-[%@ modalPresentationStyle]", [self class]));

   return UIModalPresentationFullScreen;
}

@end
