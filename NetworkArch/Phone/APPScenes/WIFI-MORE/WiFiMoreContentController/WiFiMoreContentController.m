//
//  WiFiMoreContentController.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"
#import "UIDevice+Network.h"

#import "WiFiMoreContentController.h"
#import "WiFiMoreContentController+Inner.h"
#import "WiFiMoreContentController+Signal.h"

#import "WifiInterfacesController.h"
#import "WifiInterfacesController+Inner.h"
#import "WifiInterfacesController+Signal.h"

#import "DataUsage.h"

@implementation WiFiMoreContentController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
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
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLoad];
   
   // Uncomment the following line to preserve selection between presentations.
   self.clearsSelectionOnViewWillAppear = NO;
   
   // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   for (UIView *stView in self.detailCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   for (UIView *stView in self.dataUsageCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemPinkColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   for (UIView *stView in self.warningCellContainerViews) {
      
//#if __DEBUG_COLOR__
//      [stView setBackgroundColor:UIColor.systemOrangeColor];
//#else /* __DEBUG_COLOR__ */
//      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
//#endif /* !__DEBUG_COLOR__ */

      [stView setBackgroundColor:UIColor.systemYellowColor];

   } /* End for () */
   
   for (UIView *stView in self.separatorViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   [self.separatorViews.lastObject setHidden:YES];
   
   [self.interfacesImageView setBackgroundColor:UIColor.clearColor];
   [self.interfacesImageView setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];
   
#if __Debug__
#else /* __Debug__ */
   [self.warningButton setHidden:YES];
#endif /* !__Debug__ */
   [self.warningButton.titleLabel setFont:[APPFont lightFontOfSize:self.warningButton.titleLabel.font.pointSize]];

   /**
    添加网络状态监听
    */
   [[APPDelegate APP] addSignalResponder:self];
   
   [self sendSignal:WiFiMoreContentController.loadExternalIPv4Signal];
   
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

- (void)viewWillLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewWillLayoutSubviews];
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];
   
   [self.detailCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.detailCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   [self.dataUsageCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.dataUsageCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   [self.warningCellContainerViews.firstObject setCornerRadius:8 clipsToBounds:YES];
   
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

#pragma mark - UITableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
//
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
//
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   WifiMoreCell                  *stTableViewCell                          = nil;
   
   NSArray<NSString *>           *stTitles                                 = @[
      @"Status",
      @"SSID",
      @"BSSID",
      @"Default Gateway",
      @"Subnet Mask",
      @"Internal IPV4",
      @"Internal IPV6",
      @"External IPV4",
      @"Interfaces",
   ];
   
   __TRY;
   
   //   WifiSectionDetail    = 0,
   //   WifiSectionDataUsage = 1,
   //   WifiSectionWarning   = 2,
   //   WifiSectionNumber
   
   if (WifiSectionDetail == aIndexPath.section) {
      
      stTableViewCell   = self.detailCells[aIndexPath.row];
      
//      WifiDetailStatus        = 0,
//      WifiDetailSSID          = 1,
//      WifiDetailBSSID         = 2,
//      WifiDetailGateway       = 3,
//      WifiDetailSubnet        = 4,
//      WifiDetailIPV4          = 5,
//      WifiDetailIPV6          = 6,
//      WifiDetailExternalIPV4  = 7,
//      WifiDetailInterfaces    = 8,
      
      [stTableViewCell.titleLabel setText:stTitles[aIndexPath.row]];
      
      if (WifiDetailStatus == aIndexPath.row) {
         
         if ([IDEARoute isWifiConnected]) {
            
            [stTableViewCell.infoView setBackgroundColor:UIColor.systemGreenColor];
            [stTableViewCell.infoLabel setText:APP_STR(@"Connected")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoView setBackgroundColor:UIColor.systemRedColor];
            [stTableViewCell.infoLabel setText:APP_STR(@"Not connected")];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailSSID == aIndexPath.row) {
         
         if (kStringIsEmpty([IDEARoute getSSID])) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:[IDEARoute getSSID]];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailBSSID == aIndexPath.row) {
         
         if (kStringIsEmpty([IDEARoute getBSSID])) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:[IDEARoute getBSSID]];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailGateway == aIndexPath.row) {
         
         if (kStringIsEmpty([IDEARoute getGatewayIP])) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:[IDEARoute getGatewayIP]];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailSubnet == aIndexPath.row) {
         
         // ().first(where: {$0.name == "en0" && $0.family.toString() == "IPv4"})
         NSArray<IDEANetInterface *>   *stInterfaces  = [IDEANetUtils allInterfaces];
         
         IDEANetInterface              *stInterface   = nil;
         
         for (stInterface in stInterfaces) {
            
            if ([stInterface.name isEqualToString:@"en0"] && NetFamilyIPV4 == stInterface.family) {
               
               break;
               
            } /* End if () */
            
         } /* End for () */
         
         if (nil == stInterface || kStringIsEmpty(stInterface.netmask)) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:stInterface.netmask];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailIPV4 == aIndexPath.row) {
         
         NSString    *szIPV4  = [UIDevice ipv4:NetworkWifi];
         
         if (kStringIsEmpty(szIPV4)) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:szIPV4];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailIPV6 == aIndexPath.row) {
         
         // ().first(where: {$0.name == "en0" && $0.family.toString() == "IPv4"})
         NSArray<IDEANetInterface *>   *stInterfaces  = [IDEANetUtils allInterfaces];
         
         IDEANetInterface              *stInterface   = nil;
         
         for (stInterface in stInterfaces) {
            
            if ([stInterface.name isEqualToString:@"en0"] && NetFamilyIPV6 == stInterface.family) {
               
               break;
               
            } /* End if () */
            
         } /* End for () */
         
         if (nil == stInterface || kStringIsEmpty(stInterface.address)) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:stInterface.address];
            
         } /* End else */
         
      } /* End if () */
      else if (WifiDetailExternalIPV4 == aIndexPath.row) {
         
         if (NO == [IDEARoute isWifiConnected] || kStringIsEmpty(self.externalIPv4)) {
            
            [stTableViewCell.infoLabel setText:APP_STR(@"N/A")];
            
         } /* End if () */
         else {
            
            [stTableViewCell.infoLabel setText:self.externalIPv4];
            
         } /* End else */
         
      } /* End if () */
      
   } /* End if () */
   else if (WifiSectionDataUsage == aIndexPath.section) {
            
      stTableViewCell   = self.dataUsageCells[aIndexPath.row];
      
      DataUsageInfo  *stDataUsageInfo  = [[DataUsage sharedInstance] getDataUsage];

      if (WifiDataUsageReceived == aIndexPath.row) {
         
         [stTableViewCell.infoLabel setText:[APPUtils byteCountFormat:stDataUsageInfo.wifiReceived]];
         
      } /* End if () */
      else if (WifiDataUsageSent == aIndexPath.row) {

         [stTableViewCell.infoLabel setText:[APPUtils byteCountFormat:stDataUsageInfo.wifiSent]];

      } /* End if () */

   } /* End if () */
   else if (WifiSectionWarning == aIndexPath.section) {
      
      stTableViewCell   = self.warningCells[aIndexPath.row];
      
   } /* End if () */
   
   if (nil != stTableViewCell) {
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   WifiInterfacesController      *stWifiInterfacesController               = nil;
   
   __TRY;
   
   if (WifiSectionDetail == aIndexPath.section) {
      
      if (WifiDetailInterfaces == aIndexPath.row) {
         
         stWifiInterfacesController = [UIStoryboard loadStoryboard:WifiInterfacesController.storyboard
                                                    viewController:[WifiInterfacesController class]];
         
         [self.navigationController pushViewController:stWifiInterfacesController
                                              animated:YES];
         
      } /* End if () */
      
   } /* End if () */
      
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation WiFiMoreContentController (UIStoryboard)

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
   
   return @"WIFI";
}

@end

#pragma mark - IBAction
@implementation WiFiMoreContentController (Action)

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (IBAction)onWarning:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   __CATCH(nErr);
   
   return;
}

@end
