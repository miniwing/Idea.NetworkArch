//
//  WoLANController.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANRootController.h"

#import "WoLANController.h"
#import "WoLANController+Inner.h"
#import "WoLANController+Debug.h"
#import "WoLANController+Theme.h"
#import "WoLANController+Signal.h"
#import "WoLANController+Notification.h"

#import "WoLANContentController.h"
#import "WoLANContentController+Inner.h"
#import "WoLANContentController+Signal.h"
#import "WoLANContentController+Notification.h"

#import "DeviceAwake.h"

@implementation WoLANController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self.contentController removeAllSignalResponders];

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
   
   [self setTitle:APP_STR(@"Wake on LAN")];
   LogDebug((@"[WoLANController viewDidLoad] : VIEW : %@", self.view));
   
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
   
#if __Debug__
#else /* __Debug__ */
   [self.rightBarButtonItem setEnabled:NO];
#endif /* !__Debug__ */
   
   [self.contentView setBackgroundColor:UIColor.clearColor];
   
#if MATERIAL_APP_BAR
   /**
    调整 Layout
    contentView.top
    */
   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"contentView.top"
                                                              fromView:self.view];
   
   if (nil != stLayoutConstraint) {
      
      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
      
   } /* End if () */
#endif /* MATERIAL_APP_BAR */
   
   [self.contentController addSignalResponder:self];
   [self addSignalResponder:self.contentController];

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
@implementation WoLANController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:WoLANContentController.className]) {
      
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
@implementation WoLANController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR
   
   [CATransaction begin];

   [CATransaction setCompletionBlock:^{

      if ((nil != self.navigationController) || (![self.navigationController isKindOfClass:[WoLANRootController class]])) {

         [self.navigationController popViewControllerAnimated:YES
                                                   completion:nil];
      } /* End if () */
      else {

         [self dismissViewControllerAnimated:YES
                                  completion:nil];
      } /* End else */
   }];

   [self resignFirstResponder];

   [CATransaction commit];
   
#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */
   
   if ((nil != self.navigationController) || (![self.navigationController isKindOfClass:[WoLANRootController class]])) {
      
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
      
   [self resignFirstResponder];
   
//   [self postSignal:WoLANController.startSignal
//            onQueue:dispatch_get_main_queue()];

   [self.contentView setUserInteractionEnabled:NO];
   
   [self sendSignal:WoLANContentController.startSignal];
   
   __CATCH(nErr);
   
   return;
}

@end

