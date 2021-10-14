//
//  LanScanController.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"

#import "LanScanRootController.h"

#import "LanScanController.h"
#import "LanScanController+Inner.h"
#import "LanScanController+Theme.h"
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"

@interface LanScanController ()

@end

@implementation LanScanController

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
   
   NSString                      *szIP                                     = nil;
   NSString                      *szSSID                                   = nil;

   __TRY;
   
   [super viewDidLoad];
   
   [self setTitle:APP_STR(@"LAN Scan")];
   LogDebug((@"[LanScanController viewDidLoad] : VIEW : %@", self.view));

   [self.view setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   [self.tableView setBackgroundColor:UIColor.clearColor];
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   [self.tableView setSeparatorColor:[IDEAColor colorWithKey:[IDEAColor separator]]];
   
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
   
   [self.rightBarButtonItem setEnabled:YES];
   
#if MATERIAL_APP_BAR
   // Dispose of any resources that can be recreated.
   /**
    调整 Layout
    inputView.top
    */
   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"infoView.top"
                                                              fromView:self.view];
   
   if (nil != stLayoutConstraint) {
      
      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
      
   } /* End if () */
#endif /* MATERIAL_APP_BAR */
   
   [self.infoView setBackgroundColor:UIColor.clearColor];
   
   [self.ssidLabel setText:APP_STR(@"SSID")];
   [self.ssidLabel setFont:[APPFont regularFontOfSize:self.ssidLabel.font.pointSize]];
   [self.ssidLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.ipLabel setText:APP_STR(@"Local IP")];
   [self.ipLabel setFont:[APPFont regularFontOfSize:self.ipLabel.font.pointSize]];
   [self.ipLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    添加网络状态监听
    */
   [[APPDelegate APP] addSignalResponder:self];

   [PNetMLanScanner shareInstance].delegate = self;

   szIP     = [IDEARouter getIPAddress];
   szSSID   = [IDEARouter getSSID];

   if (kStringIsEmpty(szSSID)) {
      
//      "SSID not available"                = "SSID not available";
//      "Wi-Fi not connected"               = "Wi-Fi not connected";
      
      if ([IDEARouter isWifiConnected]) {
                  
         szSSID   = APP_STR(@"SSID not available");
         szIP     = APP_STR(@"N/A");
                  
      } /* End if () */
      else {

         szSSID   = APP_STR(@"Wi-Fi not connected");
         szIP     = APP_STR(@"N/A");

      } /* End else */

      [self.rightBarButtonItem setEnabled:NO];
      
   } /* End if () */
   
   [self.ssidLabel setText:[NSString stringWithFormat:@"SSID : %@", szSSID]];
   [self.ipLabel setText:[NSString stringWithFormat:@"Local IP : %@", szIP]];

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

#pragma mark - <UITableViewDataSource>
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
//
//   return 0;
//}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   return self.activeIPs.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   LanScanCell                   *stLanScanCell                            = nil;
   
   NSString                      *szIP                                     = nil;
   
   __TRY;
   
   stLanScanCell = [aTableView dequeueReusableCellWithIdentifier:LanScanCell.reuseIdentifier
                                                           forIndexPath:aIndexPath];

   szIP  = [self.activeIPs objectAtIndex:aIndexPath.row];
   
   [stLanScanCell setIP:szIP];
   
   if (1 == self.activeIPs.count) {
      
      [stLanScanCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];
      
      [stLanScanCell.separatorView setHidden:YES];
      
   } /* End if () */
   else {
      
      if (0 == aIndexPath.row) {
         
         [stLanScanCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
         [stLanScanCell.separatorView setHidden:NO];
         
      } /* End if () */
      else if (self.activeIPs.count - 1 == aIndexPath.row) {
         
         [stLanScanCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
         [stLanScanCell.separatorView setHidden:YES];
         
      } /* End else if () */
      else {
         
         [stLanScanCell setRectCorner:0];
         [stLanScanCell.separatorView setHidden:NO];
         
      } /* End else */
      
   } /* End else */

   __CATCH(nErr);
   
   return stLanScanCell;
}

#pragma mark - NSMutableArray<NSString *> * activeIPs;
- (NSMutableArray<NSString *> *)activeIPs {
   
   if (!_activeIPs) {
      
      _activeIPs = [NSMutableArray<NSString *> array];
      
   } /* End if () */
   
   return _activeIPs;
}

@end

#pragma mark - UIStoryboard
@implementation LanScanController (UIStoryboard)

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
@implementation LanScanController (Action)

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

   [self sendSignal:LanScanController.stopScanSignal];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   if (NO == [[PNetMLanScanner shareInstance] isScanning]) {
      
      [self postSignal:LanScanController.startScanSignal
               onQueue:dispatch_get_main_queue()];
      
   } /* End if () */
   else {
      
      [self postSignal:LanScanController.stopScanSignal
               onQueue:dispatch_get_main_queue()];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
