//
//  UISettingRootController.m
//  UISETTING
//
//  Created by Harry on 2021/02/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "UISettingRootController.h"
#import "UISettingRootController+Inner.h"

@implementation UISettingRootController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   [self unobserveAllNotifications];
   [self removeAllSignalResponders];
      
   [self removeAllNotifications];

   __SUPER_DEALLOC;
   
   return;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   
   // Do any additional setup after loading the view.   
   LogDebug((@"-[UISettingRootController viewDidLoad] : MODULE : %s", MODULE));
   
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

@end

#pragma mark - UIStoryboardSegue
@implementation UISettingRootController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   __CATCH(nErr);
   
   return;
}

//#pragma mark - UIStatusBar
//- (UIStatusBarStyle)preferredStatusBarStyle {
//
//   LogView((@"-[%@ preferredStatusBarStyle]", [self class]));
//
//   return UIStatusBarStyleLightContent;
//}
//
//- (BOOL)prefersStatusBarHidden {
//
//   LogView((@"-[%@ prefersStatusBarHidden]", [self class]));
//
//   return NO;
//}
//
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
//
//   LogView((@"-[%@ preferredStatusBarUpdateAnimation]", [self class]));
//
//   return UIStatusBarAnimationFade;
//}
//
//- (BOOL)shouldAutorotate {
//
//   LogView((@"-[%@ shouldAutorotate]", [self class]));
//
//   return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//
//   LogView((@"-[%@ supportedInterfaceOrientations]", [self class]));
//
//   return UIInterfaceOrientationMaskPortrait;
//}
//
//// Controls the application's preferred home indicator auto-hiding when this view controller is shown.
//- (BOOL)prefersHomeIndicatorAutoHidden {
//
//   LogView((@"-[%@ prefersHomeIndicatorAutoHidden]", [self class]));
//
//   return YES;
//}
//
//- (UIModalPresentationStyle)modalPresentationStyle {
//
//   LogView((@"-[%@ modalPresentationStyle]", [self class]));
//
//   return UIModalPresentationFullScreen;
//}

@end
