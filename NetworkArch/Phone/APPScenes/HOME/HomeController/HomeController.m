//
//  HomeController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"
#import "APPDelegate+Signal.h"

#import "HomeController.h"
#import "HomeController+Inner.h"
#import "HomeController+Theme.h"
#import "HomeController+Signal.h"
#import "HomeController+Notification.h"
#import "HomeController+Debug.h"

#import "HomeSettingRootController.h"
#import "HomeSettingRootController+Inner.h"
#import "HomeSettingRootController+Signal.h"
#import "HomeSettingRootController+Notification.h"

@implementation HomeController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
//   [self removeSignalResponder:self.contentController];
   
   [[APPDelegate APP] removeSignalResponder:self];

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

      [self observeNotification:HomeController.settingNotification];

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
   
   [self setTitle:APP_STR(@"HOME")];
   LogDebug((@"[HomeController viewDidLoad] : VIEW : %@", self.view));
   
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

   if ([APPDelegate isApiKeySetting]) {
      
      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarSetting"]];

      [self.rightBarButtonItem setEnabled:YES];
      [self.appBar.navigationBar.rightBarButtonItem setEnabled:YES];

   } /* End if () */
   else {

      [self.rightBarButtonItem setTintColor:UIColor.clearColor];
      [self.rightBarButtonItem setImage:nil];

      [self.rightBarButtonItem setEnabled:NO];
      [self.appBar.navigationBar.rightBarButtonItem setEnabled:NO];

   } /* End else */

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
   
   [self.locationManager requestAlwaysAuthorization];

   [[APPDelegate APP] addSignalResponder:self];
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
   
//   [self.contentController viewWillAppear:aAnimated];
   
   if ([APPDelegate isApiKeySetting]) {
      
      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarSetting"]];

      [self.rightBarButtonItem setEnabled:YES];
      [self.appBar.navigationBar.rightBarButtonItem setEnabled:YES];

   } /* End if () */
   else {

      [self.rightBarButtonItem setTintColor:UIColor.clearColor];
      [self.rightBarButtonItem setImage:nil];

      [self.rightBarButtonItem setEnabled:NO];
      [self.appBar.navigationBar.rightBarButtonItem setEnabled:NO];

   } /* End else */

   __CATCH(nErr);
   
   return;
}

- (void)viewDidAppear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidAppear:aAnimated];
   
   //   [self.contentController viewDidAppear:aAnimated];
   
   [self.locationManager requestAlwaysAuthorization];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewWillDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillDisappear:aAnimated];
   
   //   [self.contentController viewWillDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidDisappear:(BOOL)aAnimated {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidDisappear:aAnimated];
   
   //   [self.contentController viewDidDisappear:aAnimated];
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - (CLLocationManager *)locationManager
- (CLLocationManager *)locationManager {
   
   if (nil == _locationManager) {
      
      _locationManager  = [[CLLocationManager alloc] init];
      
      [_locationManager setDelegate:self];
      
   } /* End if () */
   
   return _locationManager;
}

@end

#pragma mark - UIStoryboard
@implementation HomeController (UIStoryboard)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.
   
   if ([aSegue.identifier isEqualToString:HomeContentController.className]) {
      
      self.contentController  = aSegue.destinationViewController;

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

+ (NSString *)storyboard {
   
   return @"HOME";
}

@end

#pragma mark - IBAction
@implementation HomeController (Action)

- (IBAction)onSetting:(id)aSender {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [self notify:HomeController.settingNotification];
      
   __CATCH(nErr);
   
   return;
}

@end
