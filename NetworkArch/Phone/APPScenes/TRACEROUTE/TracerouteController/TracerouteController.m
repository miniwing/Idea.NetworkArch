//
//  TracerouteController.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+Kit.h"

#import "TracerouteRootController.h"

#import "TracerouteController.h"
#import "TracerouteController+Inner.h"
#import "TracerouteController+Theme.h"
#import "TracerouteController+Signal.h"
#import "TracerouteController+Notification.h"

@interface TracerouteController ()

@end

@implementation TracerouteController

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
   
   [self.icmpSwitch setOn:[APPDelegate isICMPEnable]];
   
   if (self.icmpSwitch.isOn) {
      
      [self setTitle:APP_STR(@"ICMP traceroute")];

   } /* End if () */
   else {
      
      [self setTitle:APP_STR(@"UDP traceroute")];

   } /* End else */
   
   LogDebug((@"[TracerouteController viewDidLoad] : VIEW : %@", self.view));
   
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
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
   
   [self.icmpSwitch setOnTintColorPicker:DKColorPickerWithKey([IDEAColor switchOn])];

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
   [self.textField setPlaceholder:APP_STR(@"IP Address / Host Name")];
   
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   
   [self.icmpLabel setFont:[APPFont regularFontOfSize:self.icmpLabel.font.pointSize]];
   [self.icmpLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor lightText])];
   [self.icmpLabel setTextColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor lightText]];
         
      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor darkGray]];

      } /* End else */
   }];

   [self.textView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.textView setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.textView setCornerRadius:6 clipsToBounds:YES];
   [self.textView setText:nil];

#if __Debug__
   dispatch_async_on_main_queue(^{

      [self.textField setText:@"www.baidu.com"];
   });
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
@implementation TracerouteController (UIStoryboard)

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
@implementation TracerouteController (Action)

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

//   [self postSignal:TracerouteController.stopScanSignal
//            onQueue:dispatch_get_main_queue()];
   
   [self sendSignal:TracerouteController.stopScanSignal];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bStart                                   = NO;
   
   __TRY;

   if (self.icmpSwitch.isOn) {

      if (NO == [[PhoneNetManager shareInstance] isDoingTraceroute]) {
         
         bStart   = YES;
         
      } /* End if () */
   }
   else {
      
      if (NO == [self.udpTraceroute isDoingUdpTraceroute]) {
         
         bStart   = YES;

      } /* End if () */
      
   } /* End else */

   if (bStart) {
      
      [self postSignal:TracerouteController.startScanSignal
            withObject:self.textField.text
               onQueue:dispatch_get_main_queue()];

   } /* End if () */
   else {

      [self postSignal:TracerouteController.stopScanSignal
               onQueue:dispatch_get_main_queue()];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onICMP:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   UISwitch                      *stICMPSwitch                             = nil;
   
   __TRY;
   
   stICMPSwitch   = aSender;
   
   LogDebug((@"-[TracerouteController onICMP:] : ICMP : %@", stICMPSwitch.isOn ? @"ON" : @"OFF"));
   
   if (stICMPSwitch.isOn) {
      
      [self setTitle:APP_STR(@"ICMP traceroute")];
      
   } /* End if () */
   else {
      
      [self setTitle:APP_STR(@"UDP traceroute")];
      
   } /* End else */

   [APPDelegate setICMPEnable:stICMPSwitch.isOn];
   
   __CATCH(nErr);
   
   return;
}

@end
