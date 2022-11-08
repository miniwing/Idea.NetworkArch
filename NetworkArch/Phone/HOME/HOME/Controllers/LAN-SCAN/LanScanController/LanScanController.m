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

#import "LanScanRootController.h"

#import "LanScanController.h"
#import "LanScanController+Inner.h"
#import "LanScanController+Action.h"
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"
#import "LanScanController+Theme.h"
#import "LanScanController+Debug.h"

@interface LanScanController ()

@end

@implementation LanScanController

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
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
      
   NSString                      *szIP                                     = nil;
   NSString                      *szSSID                                   = nil;

   __TRY;
   
   [super viewDidLoad];
   
   [self setTitle:__LOCALIZED_STRING(self.class, @"LAN Scan")];
   LogDebug((@"-[PortScanController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"Port Scan")));
   
   [self.navigationController setNavigationBarHidden:YES];
   
#if FULLSCREEN_POP_GESTURE
   [self setPrefersNavigationBarHidden:YES];
#else /* FULLSCREEN_POP_GESTURE */
   self.navigationController.interactivePopGestureRecognizer.delegate = self;
#endif /* !FULLSCREEN_POP_GESTURE */
   
   [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"LAN Scan")];
   LogDebug((@"-[TracerouteController viewDidLoad] : Title : %@", __LOCALIZED_STRING(self.class, @"LAN Scan")));
//   [self.navigationBarX setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   
   [self.navigationBarX.navigationBar setAllowAnyTitleFontSize:YES];
   [self.navigationBarX.navigationBar setEnableRippleBehavior:NO];
   
//   [self.navigationBarX showLine:YES];
   
   /// 关闭水波纹效果
   [self.navigationBarX.navigationBar setRippleColor:UIColor.clearColor];
   [self.navigationBarX.navigationBar setInkColor:UIColor.clearColor];
   
   [self.navigationBarX.navigationBar setTintColor:[IDEAColor colorWithKey:[IDEAColor appNavigationBarTint]]];
   [self.navigationBarX.navigationBar setTitleTextColor:[IDEAColor colorWithKey:[IDEAColor label]]];
   
   [self.navigationBarX setNavigationBarTopInset:[UIWindow topSafeAreaInset]];
   [self.navigationBarX.navigationBarXHeight setConstant:[self.navigationBarX.navigationBar intrinsicContentSize].height + [UIWindow topSafeAreaInset]];
   
   /**
    * Left
    */
   [self.navigationBarX.navigationBar setLeftBarButtonItem:self.leftBarButtonItem];
   [self.leftBarButtonItem setEnabled:YES];
   [self.leftBarButtonItem setImage:nil];
   [self.leftBarButtonItem setTitle:nil];
   [self.leftBarButtonItem setWidth:[UISetting leftBarButtonWidth]];
   
   [self.leftBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.leftBarButton.titleLabel setText:nil];
   
   [self.leftBarButton setTitle:nil forState:UIControlStateNormal];
   [self.leftBarButton setTitle:nil forState:UIControlStateSelected];
   [self.leftBarButton setTitle:nil forState:UIControlStateHighlighted];
   
   [self.leftBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarArrowLeft"]
                        forState:UIControlStateNormal];
//   [self.leftBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarArrowLeft"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateSelected];
//   [self.leftBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarArrowLeft"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateHighlighted];
   
   [self.leftBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   /**
    * Right
    */
   [self.navigationBarX.navigationBar setRightBarButtonItem:self.rightBarButtonItem];
   [self.rightBarButtonItem setEnabled:YES];
   [self.rightBarButtonItem setImage:nil];
   [self.rightBarButtonItem setTitle:nil];
   [self.rightBarButtonItem setWidth:[UISetting rightBarButtonWidth]];
   
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   [self.rightBarButton.titleLabel setText:nil];
   
   [self.rightBarButton setTitle:nil forState:UIControlStateNormal];
   [self.rightBarButton setTitle:nil forState:UIControlStateSelected];
   [self.rightBarButton setTitle:nil forState:UIControlStateHighlighted];
   
   [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarPlay"]
                        forState:UIControlStateNormal];
//   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateSelected];
//   [self.rightBarButton setImage:[[ImageProvider imageNamed:@"UIButtonBarPlay"] imageRenderWithTintColor:UIColor.systemGrayColor]
//                        forState:UIControlStateHighlighted];
   
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
  
   /**
    * Background Color
    */
   [self.view setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

   [self.tableView setBackgroundColor:UIColor.clearColor];
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   [self.tableView setSeparatorColor:[IDEAColor colorWithKey:[IDEAColor separator]]];
   [self.tableView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

//   [self.infoView setBackgroundColor:UIColor.clearColor];
   [self.infoView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   [self.infoView setCornerRadius:[UISetting cornerRadiusBig] clipsToBounds:YES];

   [self.ssidLabel setText:__LOCALIZED_STRING(self.class, @"SSID")];
   [self.ssidLabel setFont:[UIFont systemFontOfSize:self.ssidLabel.font.pointSize
                                             weight:UIFontWeightRegular]];
   [self.ssidLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [self.ipLabel setText:__LOCALIZED_STRING(self.class, @"Local IP")];
   [self.ipLabel setFont:[UIFont systemFontOfSize:self.ipLabel.font.pointSize
                                           weight:UIFontWeightRegular]];
   [self.ipLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];

   [PNetMLanScanner shareInstance].delegate = self;

   szIP     = [IDEARouter getIPAddress];
   szSSID   = [IDEARouter getSSID];

   if (kStringIsEmpty(szSSID)) {
      
//      "SSID not available"                = "SSID not available";
//      "Wi-Fi not connected"               = "Wi-Fi not connected";
      
      if ([IDEARouter isWifiConnected]) {
                  
         szSSID   = __LOCALIZED_STRING(self.class, @"SSID not available");
         szIP     = __LOCALIZED_STRING(self.class, @"N/A");
                  
      } /* End if () */
      else {

         szSSID   = __LOCALIZED_STRING(self.class, @"Wi-Fi not connected");
         szIP     = __LOCALIZED_STRING(self.class, @"N/A");

      } /* End else */

      [self.rightBarButton setEnabled:NO];
      
   } /* End if () */
   
   [self.ssidLabel setText:[NSString stringWithFormat:@"SSID : %@", szSSID]];
   [self.ipLabel setText:[NSString stringWithFormat:@"Local IP : %@", szIP]];
   [[PNetMLanScanner shareInstance] stop];

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

#pragma mark - NSMutableArray<NSString *> * activeIPs;
- (NSMutableArray<NSString *> *)activeIPs {
   
   if (!_activeIPs) {
      
      _activeIPs = [NSMutableArray<NSString *> array];
      
   } /* End if () */
   
   return _activeIPs;
}

@end

#pragma mark - UIStoryboardSegue
@implementation LanScanController (UIStoryboardSegue)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)aSegue sender:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   // Get the new view controller using [aSegue destinationViewController].
   // Pass the selected object to the new view controller.

   __CATCH(nErr);

   return;
}

@end
