//
//  SettingController+Theme.m
//  SETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "SettingController+Inner.h"
#import "SettingController+Theme.h"

#pragma mark - UITheme
@implementation SettingController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
#if MATERIAL_APP_BAR
#else /* MATERIAL_APP_BAR */
   NSMutableDictionary           *stTitleAttributes                        = nil;
#endif /* !MATERIAL_APP_BAR */

   __TRY;
   
   [super onThemeUpdate:aNotification];
   
   LogDebug((@"-[SettingController onThemeUpdate:] : Notification : %@", aNotification));

#if MATERIAL_APP_BAR
   [self.appBar.navigationBar setTitleTextColor:[IDEAColor colorWithKey:[IDEAColor label]]];
   [self.appBar.navigationBar setTintColor:[IDEAColor colorWithKey:[IDEAColor appNavigationBarTint]]];
   
   [self.appBar.headerViewController setHairlineColor:[IDEAColor colorWithKey:[IDEAColor separator]]];
   [self.appBar.headerViewController.headerView setShadowColor:[IDEAColor colorWithKey:[IDEAColor systemBackground]]];
#else /* MATERIAL_APP_BAR */
   if (nil == self.navigationController.navigationBar.titleTextAttributes) {
      
      stTitleAttributes = [NSMutableDictionary dictionary];
      
   } /* End if () */
   else {
      
      stTitleAttributes = [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
      
   } /* End else */

   [stTitleAttributes setObject:[IDEAColor colorWithKey:[IDEAColor label]]
                         forKey:NSForegroundColorAttributeName];
   [self.navigationController.navigationBar setTitleTextAttributes:stTitleAttributes];
#endif /* !MATERIAL_APP_BAR */
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - UIStatusBar

- (UIStatusBarStyle)preferredStatusBarStyle {
   
   LogView((@"[%@ preferredStatusBarStyle]", [self class]));
   
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
   
   LogView((@"[%@ prefersStatusBarHidden]", [self class]));
   
   return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
   
   LogView((@"[%@ preferredStatusBarUpdateAnimation]", [self class]));
   
   return UIStatusBarAnimationFade;
}

- (BOOL)shouldAutorotate {
   
   LogView((@"[%@ shouldAutorotate]", [self class]));
   
   return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
   
   LogView((@"[%@ supportedInterfaceOrientations]", [self class]));
   
   return UIInterfaceOrientationMaskPortrait;
}

// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
- (BOOL)prefersHomeIndicatorAutoHidden {
   
   LogView((@"[%@ prefersHomeIndicatorAutoHidden]", [self class]));
   
   return YES;
}

- (UIModalPresentationStyle)modalPresentationStyle {
   
   LogView((@"[%@ modalPresentationStyle]", [self class]));
   
   return UIModalPresentationFullScreen;
}

@end
