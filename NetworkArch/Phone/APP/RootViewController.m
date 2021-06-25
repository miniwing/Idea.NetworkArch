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

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "SplashViewController.h"
#import "RootViewController.h"

#import "SettingController+Notification.h"

IDEA_ENUM(NSInteger, TransType) {
   
   TransTypeNone  = -1,
   TransTypeMove  = 0,
   TransTypeFade  = 1,
   TransTypeScale = 2,
   TransTypeCustom= 3
};

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController ()

@property (nonatomic, weak, nullable)        id<UITabBarControllerDelegate>        originalDelegate;
@property (nonatomic, assign)                TransType                             type;

@end

NS_ASSUME_NONNULL_END

@implementation RootViewController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeNotification];
   
   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
      
      self.originalDelegate   = self.delegate;
      
      self.type   = TransTypeMove;
      
      @weakify(self);
      /******************************************************************************************/
//      self.onNotification(IDEA_MAKE_NOTIFICATION( Setting, TABBAR, ANIMATE ), ^(NSNotification *aNotification) {
//
//         @strongify(self);
//         LogDebug((@"-[RootViewController onNotification : %@] : %@ : %@", aNotification.name, aNotification.name, aNotification.object));
//
//         if ([aNotification.object boolValue]) {
//
//            if (TransTypeNone != self.type) {
//
//               self.delegate  = self;
//
//            } /* End if () */
//
//         } /* End if () */
//         else {
//
//            self.delegate     = self.originalDelegate;
//
//         } /* End else */
//      });
      
      self.onNotification(SettingController.tabAnimationNotification, ^(NSNotification *aNotification) {
         
         @strongify(self);
         LogDebug((@"-[RootViewController onNotification : %@] : %@ : %@", aNotification.name, aNotification.name, aNotification.object));
         
         if ([aNotification.object boolValue]) {
            
            if (TransTypeNone != self.type) {
               
               self.delegate  = self;
               
            } /* End if () */
            
         } /* End if () */
         else {
            
            self.delegate     = self.originalDelegate;
            
         } /* End else */
      });

      [self addNotificationName:SplashViewController.SPLASH_DONE
                       selector:@selector(onSplashDone:)
                         object:nil];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   NSDictionary                  *stAttributes                             = nil;
   NSArray<NSString *>           *stTitles                                 = nil;
   
   __TRY;
   
   [super viewDidLoad];
   
   if (TransTypeNone != self.type && [APPDelegate isTabbarAnimation]) {
      
      self.delegate  = self;
      
   } /* End if () */
   
#  if DK_NIGHT_VERSION
   [self.tabBar setTintColorPicker:DKColorPickerWithKey([IDEAColor appTabbarTint])];
   [self.tabBar setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor appTabbarBackground])];
   [self.tabBar setBarTintColorPicker:DKColorPickerWithKey([IDEAColor appTabbarBackground])];
   [self.tabBar setBackgroundImage:[UIImage new]];
   [self.tabBar setShadowImagePicker:^UIImage *(DKThemeVersion *aThemeVersion) {
      
      return [UIImage imageWithColor:[IDEAColor colorWithKey:[IDEAColor separator]] size:CGSizeMake(1, 0.5)];
   }];
#  else /* DK_NIGHT_VERSION */
#  endif /* !DK_NIGHT_VERSION */
   
   //   Icons_Tabbar_Discovery
   //   Icons_Tabbar_Trend
   //   Icons_Tabbar_Checkin
   //   Icons_Tabbar_Diary
   
   // Do any additional setup after loading the view.
   stTitles       = @[ APP_STR(@"DISCOVERY"),
                       APP_STR(@"TREND"),
                       APP_STR(@"CHECKIN"),
                       APP_STR(@"DIARY")];
   
   stAttributes   = @{
      NSFontAttributeName : [APPFont lightFontOfSize:[APPFont appFontTabTitleSize]]
   };
   
   for (NSInteger H = 0; H < [self.tabBar.items count]; ++H) {
      
      [self.tabBar.items[H] setTitle:stTitles[H]];
      [self.tabBar.items[H] setTitleTextAttributes:stAttributes
                                          forState:UIControlStateNormal];
      [self.tabBar.items[H] setTitleTextAttributes:stAttributes
                                          forState:UIControlStateSelected];
   } /* End for () */
   
//   [self.tabBar setShadowColor:UIColor.clearColor];
//   [self.tabBar setShadowImage:[UIImage new]];
   
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
   
   LogDebug((@"-[RootViewController viewWillAppear:] : XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"));
   
   //   if (nil != self.onboardingController) {
   //
   //      [self presentViewController:self.onboardingController
   //                         animated:NO
   //                       completion:^{
   //
   //         self.onboardingController  = nil;
   //      }];
   //
   //   } /* End if () */
   
   //   UI_PERFORM_SELECTOR(self, @selector(openPrivacy:), @(NO), NO);
   
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
      
      if ([APPDelegate isAutoTheme]) {
         
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

- (void)openPrivacy:(NSNumber *)aAnimated {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   if ([APPDelegate isPrivacy]) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
      
   __CATCH(nErr);
   
   return;
}

#pragma mark - NSNotification
- (void)onSplashDone:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   UI_PERFORM_SELECTOR(self, @selector(openPrivacy:), @(YES), NO);
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - childViewController
- (UIViewController *)childViewControllerForStatusBarStyle {
   
   LogView((@"-[RootViewController childViewControllerForStatusBarStyle]"));
   
   //   if ((nil != [APPDelegate splashViewController]) && (YES == [[APPDelegate splashViewController] splashing])) {
   //
   //      return [APPDelegate splashViewController];
   //
   //   } /* End if () */
   
   //   if (0 < self.childViewControllers.count)
   //   {
   //      return self.childViewControllers.lastObject;
   //
   //   } /* End if () */
   
   if (nil != self.selectedViewController) {
      
      return self.selectedViewController;
      
   } /* End if () */
   
   return self.viewControllers[0];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
   
   LogView((@"-[RootViewController childViewControllerForStatusBarHidden]"));
   
   //   if ((nil != [APPDelegate splashViewController]) && (YES == [[APPDelegate splashViewController] splashing])) {
   //
   //      return [APPDelegate splashViewController];
   //
   //   } /* End if () */
   
   //   if (0 < self.childViewControllers.count)
   //   {
   //      return self.childViewControllers.lastObject;
   //
   //   } /* End if () */
   
   if (nil != self.selectedViewController) {
      
      return self.selectedViewController;
      
   } /* End if () */
   
   return self.viewControllers[0];
}

- (CFTimeInterval) transitionDuration {
   
   return 0.35;
   //   return 1;
   //   return 4;
}

- (CAMediaTimingFunction *)transitionTimingFunction {
   
   return [CAMediaTimingFunction easeInOut];
}

- (BOOL)tabBarController:(UITabBarController *)aTabBarController shouldSelectViewController:(UIViewController *)aViewController {
   
   return [self animateTransition:aTabBarController shouldSelect:aViewController];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   //   AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
   //   AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
   
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
   
   LogDebug((@"[%@ preferredStatusBarStyle]", [self class]));
   
   return UIStatusBarStyleLightContent;
}
//
//- (BOOL)prefersStatusBarHidden
//{
//   LogDebug((@"[%@ prefersStatusBarHidden]", [self class]));
//
//   return NO;
//}
//
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
//{
//   LogDebug((@"[%@ preferredStatusBarUpdateAnimation]", [self class]));
//
//   return UIStatusBarAnimationFade;
//}
//
//- (BOOL)shouldAutorotate
//{
//   LogDebug((@"[%@ shouldAutorotate]", [self class]));
//
//   return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//   LogDebug((@"[%@ supportedInterfaceOrientations]", [self class]));
//
//   return UIInterfaceOrientationMaskPortrait;
//}
//
//// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
//- (BOOL)prefersHomeIndicatorAutoHidden
//{
//   LogDebug((@"[%@ prefersHomeIndicatorAutoHidden]", [self class]));
//
//   return YES;
//}
//
//- (UIModalPresentationStyle)modalPresentationStyle
//{
//   LogDebug((@"[%@ modalPresentationStyle]", [self class]));
//
//   return UIModalPresentationFullScreen;
//}

@end

#pragma mark - UIStoryboard
@implementation RootViewController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"MAIN";
}

@end

