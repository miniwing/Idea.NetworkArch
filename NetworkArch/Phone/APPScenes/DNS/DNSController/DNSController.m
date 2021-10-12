//
//  DNSController.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "HomeController+Signal.h"
#import "HomeController+Notification.h"

#import "DNSRootController.h"

#import "DNSController.h"
#import "DNSController+Inner.h"
#import "DNSController+Debug.h"
#import "DNSController+Theme.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"

@implementation DNSController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self.contentController removeSignalResponder:self];
   
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
   
   [self setTitle:APP_STR(@"DNS Lookup")];
   LogDebug((@"[DNSController viewDidLoad] : VIEW : %@", self.view));
   
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
   
   [self.textField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   
   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:APP_STR(@"Domain Name")];
   
   /**
    ContentView
    */
//   [self.contentView setCornerRadius:8 clipsToBounds:YES];
   [self.contentView setHidden:YES];
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
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
   
   [self.activityIndicator setHidden:YES];
   
   /**
    监听输入
    */
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   
#if __Debug__
   dispatch_async_on_main_queue(^{
      
      [self.textField setText:@"www.twitter.com"];
   });
#endif /* __Debug__ */
   
   /**
    注册消息响应
    */
   [self addSignalResponder:self.contentController];
   [self.contentController addSignalResponder:self];
   
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
@implementation DNSController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   if ([aSegue.identifier isEqualToString:DNSContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

+ (NSString *)storyboard {
   
   return @"UTILITIES";
}

@end

#pragma mark - IBAction
@implementation DNSController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR

   [CATransaction begin];

   [CATransaction setCompletionBlock:^{

      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];
   }];

   [self resignFirstResponder];

   [CATransaction commit];

#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

#endif /* !APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szApiKey                                 = nil;
   
   __TRY;
   
   if (kStringIsBlank(self.textField.text)) {
      
      nErr  = EFAULT;
      
      break;
      
   } /* End if () */
   
   szApiKey = [APPDelegate apiKey];
   LogDebug((@"-[DNSController onStart:] : ApiKey : %@", szApiKey));

   [CATransaction begin];
   
   [CATransaction setCompletionBlock:^{
   
      if (kStringIsBlank(szApiKey)) {
         
         [UIAlertController showActionSheetInViewController:self
                                                  withTitle:APP_STR(@"API Key Empty")
                                                    message:APP_STR(@"PRESS OK TO GET (FREE).")
                                          cancelButtonTitle:APP_STR(@"Cancel")
                                     destructiveButtonTitle:APP_STR(@"OK")
                                          otherButtonTitles:nil
                         popoverPresentationControllerBlock:^(UIPopoverPresentationController *aPopover) {
            
         }
                                                   tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {
            
            [self.textField setEnabled:YES];
            [self.activityIndicator setHidden:YES animated:YES];
            [self.activityIndicator stopAnimating];
            
            if ([[aAction title] isEqualToString:APP_STR(@"OK")]) {
               
               [self postNotify:HomeController.settingNotification
                        onQueue:dispatch_get_main_queue()];

            } /* End if () */
            else {
               
               [self.textField becomeFirstResponder];

            } /* End else */
         }];
         
      } /* End if () */
      else {
         
         [self.textField setEnabled:NO];
         [self.rightBarButtonItem setEnabled:NO];
         [self.activityIndicator startAnimating];
         
         [self.contentView setHidden:YES animated:YES];
         
         @weakify(self);
         [self.activityIndicator setHidden:NO
                                  animated:YES
                                  complete:^{
                  
            @strongify(self);

            [self sendSignal:DNSController.startSignal withObject:self.textField.text];
         }];
      } /* End else */
      
   }];

   [self resignFirstResponder];
   
   [CATransaction commit];

   __CATCH(nErr);
   
   return;
}

@end

