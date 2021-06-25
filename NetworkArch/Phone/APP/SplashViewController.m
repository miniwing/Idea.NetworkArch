//
//  SplashViewController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

//- (void)dealloc {
//
//   __LOG_FUNCTION;
//
//   // Custom dealloc
//
//   __SUPER_DEALLOC;
//
//   return;
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aCoder {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   self  = [super initWithCoder:aCoder];
//
//   if (self)
//   {
//
//   } /* End if () */
//
//   __CATCH(nErr);
//
//   return self;
//}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   // Do any additional setup after loading the view.
      
   //   UIImage  *stImage = Image Literal
   
   __CATCH(nErr);
   
   return;
}

//- (void)didReceiveMemoryWarning {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super didReceiveMemoryWarning];
//   // Dispose of any resources that can be recreated.
//
//   __CATCH(nErr);
//
//   return;
//}
//
//- (void)viewWillAppear:(BOOL)aAnimated {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super viewWillAppear:aAnimated];
//
//   __CATCH(nErr);
//
//   return;
//}
//
//- (void)viewDidAppear:(BOOL)aAnimated {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super viewDidAppear:aAnimated];
//
//   __CATCH(nErr);
//
//   return;
//}
//
//- (void)viewWillDisappear:(BOOL)aAnimated {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super viewWillDisappear:aAnimated];
//
//   __CATCH(nErr);
//
//   return;
//}
//
//- (void)viewDidDisappear:(BOOL)aAnimated {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   [super viewDidDisappear:aAnimated];
//
//   __CATCH(nErr);
//
//   return;
//}

//+ (NSTimeInterval)duration {
//
//#if UIKIT_EXTENSION
//   return UIAViewAnimationDefaultDuraton * 2;
//#else /* UIKIT_EXTENSION */
//   return 0.3;
//#endif /* !UIKIT_EXTENSION */
//}

#pragma mark - Splashing
//- (BOOL)splashing {
//   
//   if ((nil != self.view.superview) && (0 != self.view.alpha)) {
//      
//      return YES;
//      
//   } /* End if () */
//   
//   return NO;
//}

@end

@implementation SplashViewController (Notification)

#pragma mark - NSNotification
+ (NSString *)SPLASH {

   return [[self class] notificationName:@"SPLASH"];
}

+ (NSString *)SPLASH_DONE {

   return [[self class] notificationName:@"SPLASH.DONE"];
}

//+ (NSString *)SPLASH_PRE_DONE {
//
//   return [[self class] notificationName:@"SPLASH.PRE.DONE"];
//}

@end

#pragma mark - UIStoryboardSegue
@implementation SplashViewController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
//   
//   int                            nErr                                     = EFAULT;
//   
//   __TRY;
//   
//   // Get the new view controller using [aSegue destinationViewController].
//   // Pass the selected object to the new view controller.
//   
//   __CATCH(nErr);
//   
//   return;
//}

@end

@implementation SplashViewController (System)

#pragma mark - UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle {
   
   LogView((@"[%@ preferredStatusBarStyle]", [self class]));
   
   //   if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight])
   //   {
   //      return UIStatusBarStyleLightContent;
   //
   //   } /* End if () */
   //   else // if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNormal])
   //   {
   //      if (@available(iOS 13, *))
   //      {
   //         // 系统版本高于 13.0
   //         return UIStatusBarStyleDarkContent;
   //
   //      } /* End if () */
   //
   //      return UIStatusBarStyleDefault;
   //
   //   } /* End if () */
   
   if (@available(iOS 13, *)) {
      
      // 系统版本高于 13.0
      return UIStatusBarStyleDarkContent;

   } /* End if () */

   return UIStatusBarStyleDefault;
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

#pragma mark - UIStoryboard
@implementation SplashViewController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"SPLASH";
}

@end
