//
//  PortScanController.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PortScanRootController.h"

#import "PortScanController.h"
#import "PortScanController+Inner.h"
#import "PortScanController+Theme.h"
#import "PortScanController+Signal.h"
#import "PortScanController+Notification.h"

@interface PortScanController ()

@end

@implementation PortScanController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeAllNotification];

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
         
   LogDebug((@"[PortScanController viewDidLoad] : VIEW : %@", self.view));
   
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
   
   /**
    IP
    */
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
   

   /**
    说明 Label
    */
   [self.portLabel setText:APP_STR(@"Ports Tetween : ")];
   [self.portLabel setFont:[APPFont regularFontOfSize:self.portLabel.font.pointSize]];
//   [self.portLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor lightText])];
   [self.portLabel setTextColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor lightText]];
         
      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor darkGray]];

      } /* End else */
   }];

   /**
    开始端口
    */
   [self.fromPortTextField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.fromPortTextField setCornerRadius:4 clipsToBounds:YES];
   [self.fromPortTextField setFont:[APPFont regularFontOfSize:self.fromPortTextField.font.pointSize]];
   
//   [self.fromPortTextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.fromPortTextField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.portAndLabel setText:APP_STR(@" And ")];
   [self.portAndLabel setFont:[APPFont regularFontOfSize:self.portAndLabel.font.pointSize]];
//   [self.portAndLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor lightText])];
   [self.portAndLabel setTextColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor lightText]];
         
      } /* End if () */
      else {

         return [IDEAColor colorWithKey:[IDEAColor darkGray]];

      } /* End else */
   }];

   /**
    结束端口
    */
   [self.toPortTextField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.toPortTextField setCornerRadius:4 clipsToBounds:YES];
   [self.toPortTextField setFont:[APPFont regularFontOfSize:self.toPortTextField.font.pointSize]];
   
//   [self.toPortTextField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];
   [self.toPortTextField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    扫描过程
    */
   [self.portView setBackgroundColor:UIColor.clearColor];
   
   [self.portScaningLabel setText:APP_STR(@"Scaning Port : ")];
//   [self.portScaningLabel setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.portScaningLabel setCornerRadius:6 clipsToBounds:YES];
   [self.portScaningLabel setFont:[APPFont regularFontOfSize:self.portScaningLabel.font.pointSize]];
   [self.portScaningLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.textView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.textView setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.textView setCornerRadius:6 clipsToBounds:YES];
   [self.textView setText:nil];

#if __Debug__
   dispatch_async_on_main_queue(^{
      
      [self.textField setText:@"192.168.3.1"];
      
      [self.fromPortTextField setText:@"80"];
      [self.toPortTextField   setText:@"8888"];

      [self.fromPortTextField setText:nil];
      [self.toPortTextField   setText:nil];
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

@end

#pragma mark - UIStoryboard
@implementation PortScanController (UIStoryboard)

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
@implementation PortScanController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR

   [CATransaction begin];

   [self resignFirstResponder];

   [CATransaction setCompletionBlock:^{

      if ((nil != self.navigationController) || (![self.navigationController isKindOfClass:[PortScanRootController class]])) {

         [self.navigationController popViewControllerAnimated:YES
                                                   completion:nil];
      } /* End if () */
      else {

         [self dismissViewControllerAnimated:YES
                                  completion:nil];
      } /* End else */
   }];

   [CATransaction commit];

#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   if ((nil != self.navigationController) || (![self.navigationController isKindOfClass:[PortScanRootController class]])) {
      
      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];
   } /* End if () */
   else {
      
      [self dismissViewControllerAnimated:YES
                               completion:nil];
   } /* End else */

#endif /* !APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (NO == [[PhoneNetManager shareInstance] isDoingPortScan]) {
      
      [self postSignal:PortScanController.startScanSignal
                 input:@{
                    @"ip"    : self.textField.text,
                    @"begin" : self.fromPortTextField.text,
                    @"end"   : self.toPortTextField.text,
                 }
               onQueue:dispatch_get_main_queue()];
      
   } /* End if () */
   else {
      
      [self postSignal:PortScanController.stopScanSignal
               onQueue:dispatch_get_main_queue()];
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
