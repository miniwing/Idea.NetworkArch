//
//  WhoisController.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisRootController.h"

#import "WhoisController.h"
#import "WhoisController+Inner.h"
#import "WhoisController+Debug.h"
#import "WhoisController+Theme.h"
#import "WhoisController+Signal.h"
#import "WhoisController+Notification.h"

@implementation WhoisController

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
      
#if MATERIAL_APP_BAR
      _appBar  = [[MDCAppBar alloc] init];
      
      [_appBar.headerViewController.headerView setShadowColor:[IDEAColor colorWithKey:[IDEAColor systemBackground]]];
      [_appBar.headerViewController.headerView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
      
//      [_appBar.headerViewController setShowsHairline:YES];
//      [_appBar.headerViewController setHairlineColor:[IDEAColor colorWithKey:[IDEAColor separator]]];

      [_appBar.headerViewController setShowsHairline:NO];
      [_appBar.headerViewController setHairlineColor:UIColor.clearColor];

      [self addChildViewController:_appBar.headerViewController];
#endif /* MATERIAL_APP_BAR */
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
#if MATERIAL_APP_BAR
   NSLayoutConstraint            *stLayoutConstraint                       = nil;
#else /* MATERIAL_APP_BAR */
   NSMutableDictionary           *stTitleAttributes                        = nil;
#endif /* MATERIAL_APP_BAR */
      
   __TRY;
   
   [super viewDidLoad];
   
   [self setTitle:APP_STR(@"Whois")];
   LogDebug((@"[WhoisController viewDidLoad] : VIEW : %@", self.view));
   
   [self.view setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];

#if MATERIAL_APP_BAR
   [self.navigationController setNavigationBarHidden:YES];
   
#  if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#  endif /* FULLSCREEN_POP_GESTURE */
   
   [self.appBar addSubviewsToParent];
   
   [self.appBar.navigationBar setAllowAnyTitleFontSize:YES];
   [self.appBar.navigationBar setEnableRippleBehavior:NO];
   
   /// 关闭水波纹效果
   [self.appBar.navigationBar setRippleColor:UIColor.clearColor];
   [self.appBar.navigationBar setInkColor:UIColor.clearColor];

   [self.appBar.navigationBar setTintColor:[IDEAColor colorWithKey:[IDEAColor appNavigationBarTint]]];
   [self.appBar.navigationBar setTitleTextColor:[IDEAColor colorWithKey:[IDEAColor label]]];
   [self.appBar.navigationBar setTitleFont:[APPFont regularFontOfSize:[APPFont appFontTitleSize]]];
#else /* MATERIAL_APP_BAR */
   [self.navigationController setNavigationBarHidden:NO];
   [self.navigationController.navigationBar setTranslucent:NO];
   [self.navigationController.navigationBar setOpaque:YES];
   [self setPrefersNavigationBarHidden:NO];
   
   [self setSeparator];
   
   [self.navigationController.navigationBar setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.navigationController.navigationBar setBarTintColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   [self.navigationController.navigationBar setBackgroundImagePicker:^UIImage *(DKThemeVersion *aThemeVersion) {
      return [UIImage imageWithColor:[IDEAColor colorWithKey:[IDEAColor systemBackground]]];
   }
                                                       forBarMetrics:UIBarMetricsDefault];
   
   if (nil == self.navigationController.navigationBar.titleTextAttributes) {
      
      stTitleAttributes = [NSMutableDictionary dictionary];
      
   } /* End if () */
   else {
      
      stTitleAttributes = [self.navigationController.navigationBar.titleTextAttributes mutableCopy];
      
   } /* End else */
   
   [stTitleAttributes setObject:[IDEAColor colorWithKey:[IDEAColor label]]
                         forKey:NSForegroundColorAttributeName];
   [stTitleAttributes setObject:[APPFont regularFontOfSize:[APPFont appFontTitleSize]]
                         forKey:NSFontAttributeName];
   
   [self.navigationController.navigationBar setTitleTextAttributes:stTitleAttributes];
#endif /* !MATERIAL_APP_BAR */
   
   [self.leftBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.rightBarButtonItem setEnabled:NO];

#if MATERIAL_APP_BAR
   // Dispose of any resources that can be recreated.
   /**
    调整 Layout
    inputView.top
    */
   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"inputView.top"
                                                              fromView:self.view];
   
   if (nil != stLayoutConstraint) {
      
      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
      
   } /* End if () */
#endif /* MATERIAL_APP_BAR */

   /**
    UITextField
    */
   [self.inputView setBackgroundColor:UIColor.clearColor];
//   [self.textField setBackground:[UIImage imageNamed:@"CLEAR-IMAGE"]];
   [self.textField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.textField setCornerRadius:8 clipsToBounds:YES];
   
   [self.textField setFont:[APPFont regularFontOfSize:self.textField.font.pointSize]];
      
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:APP_STR(@"IP / AS / Domain Name")];

   [self.textField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    UITextView
    */
   [self.textView setCornerRadius:8 clipsToBounds:YES];
   [self.textView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.textView setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.textView setHidden:YES];

   /**
    MDCActivityIndicator
    */
   [self.activityIndicator setBackgroundColor:UIColor.clearColor];
   [self.activityIndicator setIndicatorMode:MDCActivityIndicatorModeIndeterminate];
   [self.activityIndicator setTrackEnabled:YES];
   
   if ([DKThemeVersionNormal isEqualToString:[DKNightVersionManager sharedManager].themeVersion]) {
      
      [self.activityIndicator setCycleColors:@[
         [MDCPalette paletteGeneratedFromColor:UIColor.darkGrayColor].tint500, MDCPalette.greyPalette.tint500
      ]];
      
   } /* End if () */
   else {
      
      [self.activityIndicator setCycleColors:@[
         [MDCPalette paletteGeneratedFromColor:UIColor.lightGrayColor].tint500, MDCPalette.greyPalette.tint500
      ]];
      
   } /* End else */

//   [self.activityIndicator startAnimating];
   
   [self.activityIndicator setHidden:YES];

//#if MATERIAL_APP_BAR
//   // Dispose of any resources that can be recreated.
//   /**
//    调整 Layout
//    inputView.top
//    */
//   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"activityIndicator.Center.Y"
//                                                              fromView:self.view];
//
//   if (nil != stLayoutConstraint) {
//
//      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
//
//   } /* End if () */
//#endif /* MATERIAL_APP_BAR */

   /**
    监听输入
    */
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   
//#if __Debug__
//   dispatch_async_on_main_queue(^{
//      
//      [self.textField setText:@"www.baidu.com"];
//   });
//#endif /* __Debug__ */

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

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];
   
   [self.activityIndicator setRadius:self.activityIndicator.height / 2];
   
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
   
   dispatch_once(&_firstResponder, ^{
      
      [self.textField becomeFirstResponder];
   });
   
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
   
   _firstResponder   = 0;
   
   __CATCH(nErr);
   
   return;
}

- (BOOL)resignFirstResponder {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bDone                                    = NO;
   
   __TRY;
   
   bDone = [self.textField resignFirstResponder];
   
   if (!bDone) {
      
      bDone = [super resignFirstResponder];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return bDone;
}

@end

#pragma mark - UIStoryboard
@implementation WhoisController (UIStoryboard)

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
   
   return @"UTILITIES";
}

@end

#pragma mark - IBAction
@implementation WhoisController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [CATransaction begin];
   
   [self resignFirstResponder];
      
   [CATransaction commit];

   [CATransaction setCompletionBlock:^{

      if ((nil != self.navigationController) || (![self.navigationController isKindOfClass:[WhoisRootController class]])) {
         
         [self.navigationController popViewControllerAnimated:YES
                                                   completion:nil];
         
      } /* End if () */
      else {
         
         [self dismissViewControllerAnimated:YES
                                  completion:nil];
         
      } /* End else */
   }];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.textField setEnabled:NO];
   [self.rightBarButtonItem setEnabled:NO];
   [self.activityIndicator startAnimating];
   
   [self.textView setText:@""];

   @weakify(self);
   [self.activityIndicator setHidden:NO
                            animated:YES
                            complete:^{
      
      @strongify(self);
      [self postSignal:WhoisController.startSignal
               onQueue:dispatch_get_main_queue()];
   }];
      
   __CATCH(nErr);
   
   return;
}

@end

