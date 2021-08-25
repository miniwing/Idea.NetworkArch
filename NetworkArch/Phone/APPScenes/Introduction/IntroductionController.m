//
//  IntroductionController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "IntroductionController.h"

#import "HomeController+Signal.h"
#import "HomeController+Notification.h"

#import "AppIntroduction.h"

@implementation IntroductionController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc
   
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
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {

   int                            nErr                                     = EFAULT;

   AppIntroduction               *stAppIntroduction                            = nil;
   
   UIImage                       *stIcon                                   = nil;
   NSMutableAttributedString     *stAttributedString                       = nil;

   __TRY;

   [super viewDidLoad];

   // Do any additional setup after loading the view.
   [self.view setBackgroundColor:UIColor.clearColor];
   [self.view setBackgroundColorPicker:nil];
   
   [self.containerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   [self.contentView setBackgroundColor:UIColor.clearColor];

   [self.titleLabel setBackgroundColor:UIColor.clearColor];
   [self.summaryLabel setBackgroundColor:UIColor.clearColor];

   [self.imageView setCornerRadius:8 clipsToBounds:YES];
   [self.containerView setCornerRadius:8 clipsToBounds:YES];
   [self.continueButton setCornerRadius:4 clipsToBounds:YES];
   
   stAppIntroduction  = [AppIntroduction appIntroduction];
   LogDebug((@"-[IntroductionController viewDidLoad] : AppIntroduction : %@", stAppIntroduction));
   
   [self.titleLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.titleLabel setFont:[APPFont lightFontOfSize:self.titleLabel.font.pointSize]];
   
   [self.titleLabel setText:[NSString stringWithFormat:stAppIntroduction.title, [UIDevice getOSVersion]]];
   
   stAttributedString   = [[NSMutableAttributedString alloc] initWithString:stAppIntroduction.summary];
   [stAttributedString setLineSpacing:5];
   [stAttributedString setAlignment:NSTextAlignmentLeft];

   [self.summaryLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.summaryLabel setFont:[APPFont lightFontOfSize:self.summaryLabel.font.pointSize]];
   [self.summaryLabel setAttributedText:stAttributedString];

   for (UIView *stIntroductionView in self.introductionViews) {
      
      [stIntroductionView setBackgroundColor:UIColor.clearColor];
      
   } /* End for () */

//   for (UIImageView *stIntroductionImageView in self.introductionImageViews) {
//
//      [stIntroductionImageView setBackgroundColor:UIColor.clearColor];
//      [stIntroductionImageView setCornerRadius:4 clipsToBounds:YES];
//
//   } /* End for () */

   for (int H = 0; H < stAppIntroduction.introductions.count && H < self.introductionImageViews.count; ++H) {

      [self.introductionImageViews[H] setBackgroundColor:UIColor.clearColor];
//      [self.introductionImageViews[H] setCornerRadius:4 clipsToBounds:YES];
      [self.introductionImageViews[H] setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

      stIcon   = [UIImage imageNamed:stAppIntroduction.introductions[H].icon];
//      if (@available(iOS 13.0, *)) {
//
//         stIcon   = [stIcon imageWithTintColor:UIColor.systemRedColor];
//
//      } /* End if () */
//      else {
//
//         stIcon   = [stIcon imageRenderWithTintColor:UIColor.systemRedColor];
//
//      } /* End else */

      [self.introductionImageViews[H] setImage:stIcon];
      
   } /* End for () */

//   for (UILabel *stIntroductionLabel in self.introductionLabels) {
//
//      [stIntroductionLabel setBackgroundColor:UIColor.clearColor];
//
//      [stIntroductionLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
//      [stIntroductionLabel setFont:[APPFont lightFontOfSize:stIntroductionLabel.font.pointSize]];
//
//   } /* End for () */
   
   for (int H = 0; H < stAppIntroduction.introductions.count && H < self.introductionLabels.count; ++H) {
      
      [self.introductionLabels[H] setBackgroundColor:UIColor.clearColor];
      
      [self.introductionLabels[H] setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.introductionLabels[H] setFont:[APPFont regularFontOfSize:self.introductionLabels[H].font.pointSize]];
      
      [self.introductionLabels[H] setText:stAppIntroduction.introductions[H].title];

   } /* End for () */

   for (int H = 0; H < stAppIntroduction.introductions.count && H < self.introductionSummaryLabels.count; ++H) {
      
      [self.introductionSummaryLabels[H] setBackgroundColor:UIColor.clearColor];
      
      [self.introductionSummaryLabels[H] setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.introductionSummaryLabels[H] setFont:[APPFont lightFontOfSize:self.introductionLabels[H].font.pointSize]];
      
      [self.introductionSummaryLabels[H] setText:stAppIntroduction.introductions[H].summary];

   } /* End for () */

   [self.continueButton.titleLabel setFont:[APPFont regularFontOfSize:self.continueButton.titleLabel.font.pointSize]];
   [self.continueButton setTitle:APP_STR(@"OK") forState:UIControlStateNormal];

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
- (CGRect)frameOfPresented {
   
   return CGRectMake(0,
                     0,
                     self.view.width,
                     self.view.height);
}

- (BOOL)backgroundTouchToClose {
   
   return NO;
}

@end

#pragma mark - UIStoryboard
@implementation IntroductionController (UIStoryboard)

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
   
   return @"INTRODUCTION";
}

@end

#pragma mark - UITheme
@implementation IntroductionController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[IntroductionController onThemeUpdate:] : Notification : %@", aNotification));

   if ([super respondsToSelector:@selector(onThemeUpdate:)]) {

      [super onThemeUpdate:aNotification];
      
   } /* End if () */

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

#pragma mark - IBAction
@implementation IntroductionController (Action)

- (IBAction)onOk:(UIButton *)aButton {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szAPI                                    = nil;
   
   __TRY;
   
   [self dismissViewControllerAnimated:YES
                            completion:^{
      
#if __Debug__
#else
      [APPDelegate setIntroduced:YES];
#endif
      
      szAPI = [APPDelegate apiKey];
      
      if ([APPDelegate isApiKeySetting] && kStringIsBlank(szAPI)) {
         
         [self postNotify:HomeController.settingNotification
                  onQueue:dispatch_get_main_queue()];
         
      } /* End if () */
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
