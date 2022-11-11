//
//  RootViewController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "RootViewController.h"
#import "RootViewController+Inner.h"
#import "RootViewController+Theme.h"

#import "SplashViewController.h"

#import <PRIVACY/PrivacyController+Notification.h>
#import <INTRODUCTION/IntroductionController+Notification.h>

@implementation RootViewController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeAllNotifications];
   
   [self unobserveAllNotifications];
   [self removeAllSignalResponders];

   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
      
      self.delegate  = self;
      
      [self addNotificationName:DKNightVersionThemeChangingNotification
                       selector:@selector(onThemeUpdate:)
                         object:nil];
      
      [self addNotificationName:SplashViewController.SPLASH_DONE
                       selector:@selector(onSplashDone:)
                         object:nil];

      /******************************************************************************************/
      @weakify(self);
#if IDEA_TABBARCONTROLLER_TRANSITION
      [self addNotificationName:IDEATabBarControllerTransitionBeginNotification
                       selector:@selector(__onIDEATabBarControllerTransitionBeginNotification:)
                         object:nil];
      
      [self addNotificationName:IDEATabBarControllerTransitionEndNotification
                       selector:@selector(__onIDEATabBarControllerTransitionEndNotification:)
                         object:nil];
      
      self.onNotification(SettingProvider.tabAnimationNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);
         LogDebug((@"-[RootViewController onNotification : %@] : strongify : %@", aNotification.name, self));
         LogDebug((@"-[RootViewController onNotification : %@] : %@ : %@", aNotification.name, aNotification.name, aNotification.object));
         
         return;
      });
#endif /* IDEA_TABBARCONTROLLER_TRANSITION */

      self.onNotification(IntroductionController.introductionDoneNotification, ^(NSNotification *aNotification) {
         
         LogDebug((@"-[RootViewController onNotification:] : introductionDoneNotification : %@", aNotification.name));

         @strongify(self);
         
         if (@available(iOS 14, *)) {
            
            if (![SettingProvider isPrivacy]) {

               [IDEAUIRouter openURL:@"PRIVACY/create"
                          completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {

                  if (nil != aViewController) {

                     LogDebug((@"-[RootViewController openPrivacy:] : %@ : %@", aURL, aViewController));

                     [self popUp:aViewController animated:YES completion:^{

                        [SettingProvider setPrivacy:!__Debug__];

                        return;
                     }];
                  } /* End if () */

                  return;
               }];

            } /* End if () */

         } /* End if () */
         else {
            
            [self postNotify:[PrivacyController trackingDoneNotification]];

         } /* End else */
         
         return;
      });

//      self.onNotification(PrivacyController.trackingDoneNotification, ^(NSNotification *aNotification) {
//
//         LogDebug((@"-[RootViewController onNotification:] : trackingDoneNotification : %@", aNotification.name));
////         @strongify(self);
//
//         return;
//      });
      
      _titles           = @[ APP_STR(@"HOME"),
                             APP_STR(@"SETTING") ];
      
      _images           = @[ @"TAB-HOME",
                             @"TAB-SETTING" ];
      
      _imageSelecteds   = @[ @"TAB-HOME+",
                             @"TAB-SETTING+" ];

      [IDEAUIRouter registerURLPattern:@"query/tabbar/height"
                             toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
         
         LogDebug((@"RootViewController:: URL     : %@", aURL));
         LogDebug((@"RootViewController:: Router  : %@", aRouter));

         if (nil != aCompletion) {

            aCompletion(aURL, nil, @(self.tabBar.height));

         } /* End if () */

         return;
      }];

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;

   NSDictionary                  *stAttributes                             = nil;
   NSDictionary                  *stSelectedAttributes                     = nil;
      
   NSMutableArray<UIViewController *>  *stViewControllers                  = nil;

   UIView                        *stLine                                   = nil;
   
   __TRY;
   
   [super viewDidLoad];

#  if IDEA_NIGHT_VERSION_MANAGER
   [self.tabBar setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.tabBar setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor appTabbarBackground])];
   [self.tabBar setBarTintColorPicker:DKColorPickerWithKey([IDEAColor appTabbarBackground])];
   [self.tabBar setBackgroundImage:[UIImage new]];
   [self.tabBar setShadowImage:[UIImage new]];
#  else /* IDEA_NIGHT_VERSION_MANAGER */
#  endif /* !IDEA_NIGHT_VERSION_MANAGER */

   stViewControllers = [NSMutableArray<UIViewController *> array];
   
   [IDEAUIRouter openURL:@"HOME/create"
              completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {
      
      if (nil != aViewController) {
         
         LogDebug((@"-[RootViewController viewDidLoad] : %@ : %@", aURL, aViewController));
         [stViewControllers addObject:aViewController];

      } /* End if () */

      return;
   }];

   [IDEAUIRouter openURL:@"UISETTING/create"
              completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {
      
      if (nil != aViewController) {
         
         LogDebug((@"-[RootViewController viewDidLoad] : %@ : %@", aURL, aViewController));
         [stViewControllers addObject:aViewController];

      } /* End if () */

      return;
   }];

   self.viewControllers = stViewControllers;

   stAttributes   = @{
      
      NSFontAttributeName : [UIFont systemFontOfSize:[IDEATypeFace tabTitleSize] weight:UIFontWeightLight]
   };

   LogDebug((@"-[RootViewController viewDidLoad] : [UISetting mainColor] : %@", [UISetting mainColor]));
   LogDebug((@"-[RootViewController viewDidLoad] : [UISetting mainColor] : %@", [IDEAColor colorWithKey:[UISetting mainColor]]));

   stSelectedAttributes = @{

      NSFontAttributeName : [UIFont systemFontOfSize:[IDEATypeFace tabTitleSize] weight:UIFontWeightLight]
   };

   for (NSInteger H = 0; H < [self.tabBar.items count]; ++H) {
      
      [self.tabBar.items[H] setTitle:self.titles[H]];
      
      [self.tabBar.items[H] setTitleTextAttributes:stAttributes
                                          forState:UIControlStateNormal];
      [self.tabBar.items[H] setTitleTextAttributes:stSelectedAttributes
                                          forState:UIControlStateSelected];
      
      [self.tabBar.items[H] setImage:[UIImage imageNamed:self.images[H]]];
      [self.tabBar.items[H] setSelectedImage:[UIImage imageNamed:self.imageSelecteds[H]]];
      
   } /* End for () */

   /**
    * Tabbar 顶部分割线，为修复 IDEA_TABBARCONTROLLER_TRANSITION 动画有问题。
    */
   stLine   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0.25f)];
   [stLine setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor opaqueSeparator])];
   [self.tabBar addSubview:stLine];

#if __Debug__
   [self setSelectedIndex:TabIdHome];

#  if IDEA_TABBARCONTROLLER_TRANSITION
   if (TransTypeNone != [self transType] && [SettingProvider isTabbarAnimation]) {

      DISPATCH_ASYNC_ON_MAIN_QUEUE(^{

         self.delegate  = self;
         
         return;
      });
   } /* End if () */
#  endif /* IDEA_TABBARCONTROLLER_TRANSITION */
#endif /* __Debug__ */

   __CATCH(nErr);
   
   return;
}

- (void)didReceiveMemoryWarning {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillAppear:aAnimated];
         
   __CATCH(nErr);
   
   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   
   __TRY;
   
   [super viewDidAppear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)traitCollectionDidChange:(UITraitCollection *)aPreviousTraitCollection {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (@available(iOS 13, *)) {
      
      if ([SettingProvider isAutoTheme]) {
         
         if (UIUserInterfaceStyleDark == self.traitCollection.userInterfaceStyle) {
            
            [[DKNightVersionManager sharedManager] nightFalling];
            
         } /* End if () */
         else {
            
            [[DKNightVersionManager sharedManager] dawnComing];
            
         } /* End else */
         
      } /* End if () */
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

- (void)openIntroduction:(NSNumber *)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[RootViewController openIntroduction:] : Animated : %@", aAnimated));
   
   if (![SettingProvider isIntroduction]) {
      
      [IDEAUIRouter openURL:@"INTRODUCTION/create"
                 completion:^(NSString *aURL, NSError *aError, UIViewController *aViewController) {
         
         if (nil != aViewController) {
            
            LogDebug((@"-[RootViewController openIntroduction:] : %@ : %@", aURL, aViewController));
            
            [self popUp:aViewController animated:[aAnimated boolValue] completion:^{
               
               [SettingProvider setIntroduction:!__Debug__];
               
               return;
            }];
         } /* End if () */
         
         return;
      }];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

- (void)openPrivacy:(NSNumber *)aAnimated {
   
   int                            nErr                                     = EFAULT;

   __TRY;
   
   LogDebug((@"-[RootViewController openPrivacy:] : Animated : %@", aAnimated));

   __CATCH(nErr);
   
   return;
}

#pragma mark - NSNotification
- (void)onSplashDone:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

//   UI_PERFORM_SELECTOR(self, @selector(openPrivacy:), @(YES), NO);
   UI_PERFORM_SELECTOR(self, @selector(openIntroduction:), @(YES), NO);

   __CATCH(nErr);
   
   return;
}

#pragma mark - childViewController
- (UIViewController *)childViewControllerForStatusBarStyle {
   
   LogView((@"-[RootViewController childViewControllerForStatusBarStyle]"));
   
   if (nil != self.selectedViewController) {
      
      return self.selectedViewController;
      
   } /* End if () */
   
   if (0 < self.viewControllers.count) {
      
      return self.viewControllers[0];

   } /* End if () */

   return nil;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
   
   LogView((@"-[RootViewController childViewControllerForStatusBarHidden]"));
   
   if (nil != self.selectedViewController) {
      
      return self.selectedViewController;
      
   } /* End if () */
   
   if (0 < self.viewControllers.count) {
      
      return self.viewControllers[0];

   } /* End if () */

   return nil;
}

#if IDEA_TABBARCONTROLLER_TRANSITION
- (void)__onIDEATabBarControllerTransitionBeginNotification:(NSNotification *)aNotification {
      
//   self.view.layer.opacity = 0;
   LogDebug((@"-[RootViewController __onIDEATabBarControllerTransitionBeginNotification:] : NSNotification : %@", aNotification));

   return;
}

- (void)__onIDEATabBarControllerTransitionEndNotification:(NSNotification *)aNotification {
      
//   self.view.layer.opacity = 1;

   LogDebug((@"-[RootViewController __onIDEATabBarControllerTransitionEndNotification:] : NSNotification : %@", aNotification));

   return;
}

- (TransType)transType {
   
   return TransTypeMove;
}

- (CFTimeInterval)transitionDuration {
   
#if __Debug__
   return 0.5f;
#else /* __Debug__ */
   return 0.35f;
#endif /* !__Debug__ */
}

- (CAMediaTimingFunction *)transitionTimingFunction {
   
   return [CAMediaTimingFunction easeInOut];
}

- (BOOL)tabBarController:(UITabBarController *)aTabBarController shouldSelectViewController:(UIViewController *)aViewController {
   
   if (TransTypeNone != [self transType] && [SettingProvider isTabbarAnimation]) {
      
      return [self animateTransition:aTabBarController shouldSelect:aViewController];
      
   } /* End if () */
   
   return YES;
}

#endif /* IDEA_TABBARCONTROLLER_TRANSITION */

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[RootViewController tabBarController:didSelectViewController:] : SelectedIndex : %d", self.selectedIndex));

//   [UISelectionFeedbackGenerator selectionChanged];
   if ([SettingProvider isHaptics]) {
      
      [UIImpactFeedbackGenerator impactOccurredWithStyle:UIImpactFeedbackStyleLight];

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboardSegue
@implementation RootViewController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle {
   
   LogView((@"-[%@ preferredStatusBarStyle]", [self class]));
   
//   if (nil != [APPDelegate splashViewController]) {
//
//      return [APPDelegate splashViewController].preferredStatusBarStyle;
//
//   } /* End if () */

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

//- (BOOL)prefersStatusBarHidden
//{
//   LogDebug((@"-[%@ prefersStatusBarHidden]", [self class]));
//
//   return NO;
//}
//
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
//{
//   LogDebug((@"-[%@ preferredStatusBarUpdateAnimation]", [self class]));
//
//   return UIStatusBarAnimationFade;
//}
//
//- (BOOL)shouldAutorotate
//{
//   LogDebug((@"-[%@ shouldAutorotate]", [self class]));
//
//   return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//   LogDebug((@"-[%@ supportedInterfaceOrientations]", [self class]));
//
//   return UIInterfaceOrientationMaskPortrait;
//}
//
//// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
//- (BOOL)prefersHomeIndicatorAutoHidden
//{
//   LogDebug((@"-[%@ prefersHomeIndicatorAutoHidden]", [self class]));
//
//   return YES;
//}
//
//- (UIModalPresentationStyle)modalPresentationStyle
//{
//   LogDebug((@"-[%@ modalPresentationStyle]", [self class]));
//
//   return UIModalPresentationFullScreen;
//}

@end
