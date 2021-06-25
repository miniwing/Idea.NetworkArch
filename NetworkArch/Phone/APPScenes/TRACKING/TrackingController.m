//
//  TrackingController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+Kit.h"

#import "TrackingController.h"
#import "AppTracking.h"

@interface TrackingController ()

@end

@implementation TrackingController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)initWithCoder:(NSCoder *)aCoder {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super initWithCoder:aCoder];
   
   if (self) {
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {

   int                            nErr                                     = EFAULT;

   AppTracking                   *stAppTracking                            = nil;
   
   UIImage                       *stIcon                                   = nil;
   NSMutableAttributedString     *stAttributedString                       = nil;

   __TRY;

   [super viewDidLoad];

   // Do any additional setup after loading the view.
   [self.view setBackgroundColor:UIColor.clearColor];
   [self.view setBackgroundColorPicker:nil];
   
   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   [self.contentView setBackgroundColor:UIColor.clearColor];

   [self.trackingTitleLabel setBackgroundColor:UIColor.clearColor];
   [self.trackingSummaryLabel setBackgroundColor:UIColor.clearColor];

   [self.imageView setCornerRadius:8 clipsToBounds:YES];
   [self.containerView setCornerRadius:8 clipsToBounds:YES];
   [self.continueButton setCornerRadius:4 clipsToBounds:YES];
   
   stAppTracking  = [AppTracking appTracking];
   LogDebug((@"-[TrackingController viewDidLoad] : AppTracking : %@", stAppTracking));
   
   [self.trackingTitleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.trackingTitleLabel setFont:[APPFont lightFontOfSize:self.trackingTitleLabel.font.pointSize]];
   
   [self.trackingTitleLabel setText:[NSString stringWithFormat:stAppTracking.title, [UIDevice getOSVersion]]];
   
   stAttributedString   = [[NSMutableAttributedString alloc] initWithString:stAppTracking.summary];
   [stAttributedString setLineSpacing:5];
   [stAttributedString setAlignment:NSTextAlignmentLeft];

   [self.trackingSummaryLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.trackingSummaryLabel setFont:[APPFont lightFontOfSize:self.trackingSummaryLabel.font.pointSize]];
   [self.trackingSummaryLabel setAttributedText:stAttributedString];

   for (UIView *stTrackingView in self.trackingViews) {
      
      [stTrackingView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */

//   for (UIImageView *stTrackingImageView in self.trackingImageViews) {
//
//      [stTrackingImageView setBackgroundColor:UIColor.clearColor];
//      [stTrackingImageView setCornerRadius:4 clipsToBounds:YES];
//
//   } /* End for () */

   for (int H = 0; H < stAppTracking.trackings.count && H < self.trackingImageViews.count; ++H) {

      [self.trackingImageViews[H] setBackgroundColor:UIColor.clearColor];
//      [self.trackingImageViews[H] setCornerRadius:4 clipsToBounds:YES];

      stIcon   = [UIImage imageNamed:stAppTracking.trackings[H].icon];
      if (@available(iOS 13.0, *)) {
         
         stIcon   = [stIcon imageWithTintColor:UIColor.systemRedColor];

      } /* End if () */
      else {
         
         stIcon   = [stIcon imageRenderWithTintColor:UIColor.systemRedColor];

      } /* End else */

      [self.trackingImageViews[H] setImage:stIcon];
      
   } /* End for () */

//   for (UILabel *stTrackingLabel in self.trackingLabels) {
//
//      [stTrackingLabel setBackgroundColor:UIColor.clearColor];
//
//      [stTrackingLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//      [stTrackingLabel setFont:[APPFont lightFontOfSize:stTrackingLabel.font.pointSize]];
//
//   } /* End for () */
   
   for (int H = 0; H < stAppTracking.trackings.count && H < self.trackingLabels.count; ++H) {
      
      [self.trackingLabels[H] setBackgroundColor:UIColor.clearColor];
      
      [self.trackingLabels[H] setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.trackingLabels[H] setFont:[APPFont lightFontOfSize:self.trackingLabels[H].font.pointSize]];
      
      [self.trackingLabels[H] setText:stAppTracking.trackings[H].content];

   } /* End for () */

   [self.continueButton.titleLabel setFont:[APPFont regularFontOfSize:self.continueButton.titleLabel.font.pointSize]];
   [self.continueButton setTitle:APP_STR(@"CONTINUE") forState:UIControlStateNormal];

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

#pragma mark - IDEAPresentationControllerDelegate
- (NSValue *)frameOfPresented {

//   return @(CGRectMake(0,
//                       MAKE_GOLDEN_RATIO_2(self.view.height),
//                       self.view.width,
//                       self.view.height - MAKE_GOLDEN_RATIO_2(self.view.height)));

   return @(CGRectMake(0,
                       0,
                       self.view.width,
                       self.view.height));
}

@end

#pragma mark - IBAction
@implementation TrackingController (Action)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)onContinue:(UIButton *)aButton {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   @weakify(self);
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
#if __Debug__
#else /* __Debug__ */
      [APPDelegate setTracking:YES];
#endif /* !__Debug__ */
      
      @strongify(self);
      UI_PERFORM_SELECTOR(self, @selector(openTracking), nil, NO);
   }];
   
   __CATCH(nErr);
   
   return;
}

- (void)openTracking {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (@available(iOS 14, *)) {
      
      // iOS14及以上版本需要先请求权限
      [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus aStatus) {
         
         // 获取到权限后，依然使用老方法获取idfa
         if (ATTrackingManagerAuthorizationStatusAuthorized == aStatus) {
            
            LogDebug((@"[TrackingController onContinue] : IDFA(iOS 14+) : %@", [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString]));
            
         } /* End if () */
         else {
            
            LogDebug((@"请在设置-隐私-跟踪中允许App请求跟踪"));
            
            dispatch_async_on_main_queue(^{

               [UIAlertController showAlertInViewController:self
                                                  withTitle:@""
                                                    message:APP_STR(@"Settings-Tracking-Tracking")
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:APP_STR(@"OK")
                                          otherButtonTitles:nil
                                                   tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {

                  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                                     options:nil
                                           completionHandler:nil];
               }];
            });
         } /* End else */
      }];
      
   } /* @available(iOS 14, *) */
   else {
      
      // iOS14以下版本依然使用老方法
      // 判断在设置-隐私里用户是否打开了广告跟踪
      if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
         
         LogDebug((@"[TrackingController onContinue] : IDFA(iOS 14-) : %@", [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString]));
         
      } /* End if () */
      else {
         
         LogDebug((@"请在设置-隐私-广告中打开广告跟踪功能"));
         
//         dispatch_async_on_main_queue(^{
//
//            [UIAlertController showAlertInViewController:self
//                                               withTitle:@""
//                                                 message:APP_STR(@"Settings-Tracking-Tracking")
//                                       cancelButtonTitle:nil
//                                  destructiveButtonTitle:APP_STR(@"OK")
//                                       otherButtonTitles:nil
//                                                tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {
//
//               [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
//                                                  options:nil
//                                        completionHandler:nil];
//            }];
//         });
      } /* End else */
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation TrackingController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.

   __CATCH(nErr);

   return;
}

+ (NSString *)storyboard {
   
   return @"TRACKING";
}

@end

#pragma mark - UITheme
@implementation TrackingController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[TrackingController onThemeUpdate:] : Notification : %@", aNotification));

   if ([super respondsToSelector:@selector(onThemeUpdate:)]) {

      [super onThemeUpdate:aNotification];
      
   } /* End if () */

   [self setNeedsStatusBarAppearanceUpdate];

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

   return UIModalPresentationCustom;
}

@end

