//
//  PHAuthorizationController+Theme.m
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PHAuthorizationController+Inner.h"
#import "PHAuthorizationController+Theme.h"

#pragma mark - UITheme
@implementation PHAuthorizationController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PHAuthorizationController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

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

- (UIUserInterfaceStyle)overrideUserInterfaceStyle {
   
   return UIUserInterfaceStyleLight;
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

//   if (@available(iOS 13, *)) {
//
//      return UIModalPresentationPageSheet;
//
//   } /* End if () */

   return UIModalPresentationCustom;
}

@end
