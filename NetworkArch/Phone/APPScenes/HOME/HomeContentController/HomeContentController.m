//
//  HomeContentController.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"

#import "HomeContentController.h"
#import "HomeContentController+Inner.h"
#import "HomeContentController+Signal.h"

#import "WifiMoreController.h"
#import "WifiScanController.h"
#import "CellularMoreController.h"
#import "PingController.h"
#import "WoLANController.h"
#import "WhoisController.h"
#import "DNSController.h"
#import "UtilitiesMoreController.h"

@implementation HomeContentController

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
   
   [self.tableView setTableHeaderView:[UIView new]];
//   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setEstimatedSectionFooterHeight:0];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
//   dispatch_async_on_main_queue(^{
//
//      [self.wifiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.wifiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      [self.cellularCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.cellularCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      [self.utilitiesCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.utilitiesCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//   });
   
   for (UIView *stView in self.wifiCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */

   for (UIView *stView in self.scanCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */

   for (UIView *stView in self.cellularCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemPinkColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   for (UIView *stView in self.utilitiesCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */

   /**
    WI-FI
    */
   [self.wifiSSIDLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiSSIDLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiSSIDLabel setFont:[APPFont regularFontOfSize:self.wifiSSIDLabel.font.pointSize]];
   [self.wifiSSIDLabel setText:APP_STR(@"SSID not available")];

#if TARGET_IPHONE_SIMULATOR
   [self.wifiSSIDLabel setText:APP_STR(@"Wi-Fi: 4-2-202")];
#endif /* TARGET_IPHONE_SIMULATOR */
   
   [self.wifiSSIDIcon setBackgroundColor:UIColor.clearColor];
   [self.wifiSSIDIcon setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];
   [self.wifiSSIDIcon setImage:[UIImage imageNamed:@"WIFI-SLASH"]];

#if TARGET_IPHONE_SIMULATOR
   [self.wifiSSIDIcon setImage:[UIImage imageNamed:@"WIFI-ON"]];
#endif /* TARGET_IPHONE_SIMULATOR */

   [self.wifiIPLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiIPLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiIPLabel setFont:[APPFont lightFontOfSize:self.wifiIPLabel.font.pointSize]];
   [self.wifiIPLabel setText:APP_STR(@"IP Address")];
   
   [self.wifiIP setBackgroundColor:UIColor.clearColor];
   [self.wifiIP setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiIP setFont:[APPFont lightFontOfSize:self.wifiIP.font.pointSize]];
   [self.wifiIP setText:APP_STR(@"N/A")];

#if TARGET_IPHONE_SIMULATOR
   [self.wifiIP setText:APP_STR(@"192.168.88.88")];
#endif /* TARGET_IPHONE_SIMULATOR */

   [self.wifiMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiMoreLabel setFont:[APPFont regularFontOfSize:self.wifiMoreLabel.font.pointSize]];
   [self.wifiMoreLabel setText:APP_STR(@"More Info")];
   
   [self.wifiMoreIcon setBackgroundColor:UIColor.clearColor];
   [self.wifiMoreIcon setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];

   self.wifiCells[HomeWifiSSID].canSelected  = NO;
   self.wifiCells[HomeWifiIP].canSelected    = NO;
   self.wifiCells[HomeWifiMore].canSelected  = YES;

   /**
    Scan
    */
   [self.scanLabel setBackgroundColor:UIColor.clearColor];
   [self.scanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.scanLabel setFont:[APPFont regularFontOfSize:self.scanLabel.font.pointSize]];
   [self.scanLabel setText:APP_STR(@"SCAN")];

   [self.scanIcon setBackgroundColor:UIColor.clearColor];
   [self.scanIcon setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];

   self.scanCells[0].canSelected = YES;

   /**
    Cellular
    */
   [self.cellularOperatorLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularOperatorLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularOperatorLabel setFont:[APPFont regularFontOfSize:self.wifiSSIDLabel.font.pointSize]];
   [self.cellularOperatorLabel setText:APP_STR(@"No Service")];

#if TARGET_IPHONE_SIMULATOR
   [self.cellularOperatorLabel setText:APP_STR(@"Cellular Network")];
#endif /* TARGET_IPHONE_SIMULATOR */

   [self.cellularOperatorIcon setBackgroundColor:UIColor.clearColor];
   [self.cellularOperatorIcon setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];

   [self.cellularOperatorIcon setImage:[UIImage imageNamed:@"CELLULAR-SLASH"]];
   
#if TARGET_IPHONE_SIMULATOR
   [self.cellularOperatorIcon setImage:[UIImage imageNamed:@"CELLULAR"]];
#endif /* TARGET_IPHONE_SIMULATOR */

   [self.cellularIPLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularIPLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularIPLabel setFont:[APPFont lightFontOfSize:self.cellularIPLabel.font.pointSize]];
   [self.cellularIPLabel setText:APP_STR(@"IP Address")];

   [self.cellularIP setBackgroundColor:UIColor.clearColor];
   [self.cellularIP setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularIP setFont:[APPFont lightFontOfSize:self.cellularIP.font.pointSize]];
   [self.cellularIP setText:APP_STR(@"N/A")];

#if TARGET_IPHONE_SIMULATOR
   [self.cellularIP setText:APP_STR(@"10.8.8.8")];
#endif /* TARGET_IPHONE_SIMULATOR */

   [self.cellularMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularMoreLabel setFont:[APPFont regularFontOfSize:self.cellularMoreLabel.font.pointSize]];
   [self.cellularMoreLabel setText:APP_STR(@"More Info")];

   [self.cellularMoreIcon setBackgroundColor:UIColor.clearColor];
   [self.cellularMoreIcon setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return UIColor.whiteColor;
         
      } /* End if () */
      else {
         
         return UIColor.blackColor;
         
      }/* End else */
   }];
   
   self.cellularCells[HomeCellularOperator].canSelected  = NO;
   self.cellularCells[HomeCellularIP].canSelected        = NO;
   self.cellularCells[HomeCellularMore].canSelected      = YES;

   /**
    工具
    */
   [self.utilitiesPingLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesPingLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesPingLabel setFont:[APPFont lightFontOfSize:self.utilitiesPingLabel.font.pointSize]];
   [self.utilitiesPingLabel setText:APP_STR(@"Ping")];
   
   [self.utilitiesWakeOnLanLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesWakeOnLanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesWakeOnLanLabel setFont:[APPFont lightFontOfSize:self.utilitiesWakeOnLanLabel.font.pointSize]];
   [self.utilitiesWakeOnLanLabel setText:APP_STR(@"Wake on LAN")];

   [self.utilitiesWhoisLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesWhoisLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesWhoisLabel setFont:[APPFont lightFontOfSize:self.utilitiesWhoisLabel.font.pointSize]];
   [self.utilitiesWhoisLabel setText:APP_STR(@"Whois")];

   [self.utilitiesDNSLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesDNSLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesDNSLabel setFont:[APPFont lightFontOfSize:self.utilitiesDNSLabel.font.pointSize]];
   [self.utilitiesDNSLabel setText:APP_STR(@"DNS Lookup")];

   [self.utilitiesMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesMoreLabel setFont:[APPFont lightFontOfSize:self.utilitiesMoreLabel.font.pointSize]];
   [self.utilitiesMoreLabel setText:APP_STR(@"More")];

   for (UIImageView *stICON in self.cellRightImageViews) {
      
      [stICON setBackgroundColor:UIColor.clearColor];
      [stICON setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
         
         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
            
            return UIColor.whiteColor;
            
         } /* End if () */
         else {
            
            return UIColor.blackColor;
            
         }/* End else */
      }];
      
   } /* End for () */
   
   for (HomeContentCell *stHomeContentCell in self.utilitiesCells) {
      
      stHomeContentCell.canSelected = YES;
      
   } /* End for () */
   
   /**
    Copyright
    */
   [self.copyrightView setBackgroundColor:UIColor.clearColor];
   
   [self.copyrightLabel setBackgroundColor:UIColor.clearColor];
   [self.copyrightLabel setTextColor:UIColor.lightGrayColor];
   [self.copyrightLabel setFont:[APPFont lightFontOfSize:self.copyrightLabel.font.pointSize]];

   /**
    分割线
    */
   for (UIView *stView in self.cellSeparatorViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.whiteColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   /**
    添加网络状态监听
    */
   [[APPDelegate APP] addSignalResponder:self];
   
   /**
    Load Wi-Fi, Cellular
    */
//   [self postSignal:HomeContentController.loadWifiInfoSignal onQueue:dispatch_get_main_queue()];
   [self sendSignal:HomeContentController.loadWifiInfoSignal];
   [self sendSignal:HomeContentController.loadCellularInfoSignal];
   
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

//   dispatch_once(&_viewDidLayoutToken, ^{
//
//      [self.wifiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.wifiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      [self.cellularCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.cellularCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      [self.utilitiesCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//      [self.utilitiesCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//   });
   
   __CATCH(nErr);
   
   return;
}

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];

//   dispatch_once(&_viewDidLayoutToken, ^{

   [self.wifiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.wifiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   [self.scanCellContainerViews.firstObject setCornerRadius:8 clipsToBounds:YES];
   
   [self.cellularCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.cellularCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   [self.utilitiesCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.utilitiesCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//   });
   
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
   
   [self.tableView clearSelectedRowsAnimated:YES];
   [self.tableView reloadData];

   __CATCH(nErr);
   
   return;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return HomeSectionNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfRows                            = 0;
   
   __TRY;
   
   //   HomeSectionWifi      = 0,
   //   HomeSectionCellular  = 1,
   //   HomeSectionUtilities = 2,
   
   if (HomeSectionWifi == aSection) {
      
      nNumberOfRows  = self.wifiCells.count;
      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionWifi : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   if (HomeSectionScan == aSection) {
//
//      nNumberOfRows  = self.scanCells.count;
//      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionWifi : %d", nNumberOfRows));
//
//      nErr  = noErr;
//
//      break;
//
//   } /* End if () */

   if (HomeSectionCellular == aSection) {
      
      nNumberOfRows  = self.cellularCells.count;
      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionCellular : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (HomeSectionUtilities == aSection) {
      
      nNumberOfRows  = self.utilitiesCells.count;
      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionUtilities : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   if (HomeSectionCopyright == aSection) {
//
//      nNumberOfRows  = self.copyrightCells.count;
//      LogDebug((@"-[HomeContentController tableView:numberOfRowsInSection:] : HomeSectionCopyright : %d", nNumberOfRows));
//
//      nErr  = noErr;
//
//      break;
//
//   } /* End if () */
   
   __CATCH(nErr);
   
   return nNumberOfRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szTitle                                  = nil;
   
   __TRY;
   
   //   HomeSectionWifi      = 0,
   //   HomeSectionCellular  = 1,
   //   HomeSectionUtilities = 2,
   
   //   "WIFI"                              = "Wi-Fi";
   //   "CELLULAR"                          = "Cellular";
   //   "UTILITIES"                         = "Utilities";
   
   if (HomeSectionWifi == aSection) {
      
      szTitle  = APP_STR(@"WIFI");
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   if (HomeSectionScan == aSection) {
//
//      szTitle  = APP_STR(@"SCAN");
//
//      nErr  = noErr;
//
//      break;
//
//   } /* End if () */

   if (HomeSectionCellular == aSection) {
      
      szTitle  = APP_STR(@"CELLULAR");
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (HomeSectionUtilities == aSection) {
      
      szTitle  = APP_STR(@"UTILITIES");
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;

   __TRY;
   
   //   HomeSectionWifi      = 0,
   //   HomeSectionCellular  = 1,
   //   HomeSectionUtilities = 2,
   
   if (HomeSectionWifi == aIndexPath.section) {
      
      stTableViewCell   = self.wifiCells[aIndexPath.row];
      
   } /* End if () */
//   else if (HomeSectionScan == aIndexPath.section) {
//
//      stTableViewCell   = self.scanCells[aIndexPath.row];
//
//   } /* End if () */
   else if (HomeSectionCellular == aIndexPath.section) {
      
      stTableViewCell   = self.cellularCells[aIndexPath.row];
      
   } /* End else if () */
   else if (HomeSectionUtilities == aIndexPath.section) {
      
      stTableViewCell   = self.utilitiesCells[aIndexPath.row];
      
   } /* End else if () */
//   else if (HomeSectionCopyright == aIndexPath.section) {
//
//      stTableViewCell   = self.copyrightCells[aIndexPath.row];
//
//      [stTableViewCell setBackgroundColor:UIColor.clearColor];
//      [stTableViewCell.contentView setBackgroundColor:UIColor.clearColor];
//      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.clearColor];
//
//   } /* End else if () */
   
   if (nil != stTableViewCell) {
      
//      [stTableViewCell setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
//      [stTableViewCell.contentView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];

   } /* End if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

#pragma mark - UITableViewDelegate
- (nullable NSIndexPath *)tableView:(UITableView *)aTableView willSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];

   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   [UIView transitionWithView:stTableViewCell.selectedColorView
//                     duration:UIAViewAnimationDefaultDuraton
//                      options:UIViewAnimationOptionTransitionCrossDissolve
//                   animations:^{
//
//      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//   }
//                   completion:nil];
//
//   [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];

   __CATCH(nErr);
   
   return aIndexPath;
}

- (nullable NSIndexPath *)tableView:(UITableView *)aTableView willDeselectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];

   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

   __CATCH(nErr);
   
   return aIndexPath;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
   
   WifiMoreController            *stWifiMoreController                     = nil;
//   WifiScanController            *stWifiScanController                     = nil;
   CellularMoreController        *stCellularMoreController                 = nil;
   
   PingController                *stPingController                         = nil;
   WoLANController               *stWoLANController                        = nil;
   WhoisController               *stWhoisController                        = nil;
   DNSController                 *stDNSController                          = nil;
   UtilitiesMoreController       *stUtilitiesMoreController                = nil;
   
   UIViewController              *stViewController                         = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];
   
   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   [UIView transitionWithView:stTableViewCell.selectedColorView
//                     duration:UIAViewAnimationDefaultDuraton
//                      options:UIViewAnimationOptionTransitionCrossDissolve
//                   animations:^{
//      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//   }
//                   completion:^(BOOL aComplete) {
//      [stTableViewCell setSelectionStyle:UITableViewCellSelectionStyleDefault];
//   }];

//   [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
//   [stTableViewCell setSelected:YES animated:NO];

//   HomeSectionWifi      = 0,
//   HomeSectionCellular  = 1,
//   HomeSectionUtilities = 2,
//   HomeSectionNumber
   
   if (HomeSectionWifi == aIndexPath.section) {

      if (HomeWifiMore == aIndexPath.row) {
         
         stWifiMoreController = [UIStoryboard loadStoryboard:WifiMoreController.storyboard
                                              viewController:WifiMoreController.class];
         
         stViewController  = stWifiMoreController;
         
      } /* End if () */
      
   } /* End if () */
//   else if (HomeSectionScan == aIndexPath.section) {
//
//      stWifiScanController = [UIStoryboard loadStoryboard:WifiScanController.storyboard
//                                           viewController:WifiScanController.class];
//      
//      stViewController     = stWifiScanController;
//
//   } /* End if () */
   else if (HomeSectionCellular == aIndexPath.section) {
      
      if (HomeCellularMore == aIndexPath.row) {
         
         stCellularMoreController = [UIStoryboard loadStoryboard:CellularMoreController.storyboard
                                              viewController:CellularMoreController.class];
         
         stViewController  = stCellularMoreController;

      } /* End if () */
      
   } /* End else if () */
   else if (HomeSectionUtilities == aIndexPath.section) {

      if (HomeUtilitiesPing == aIndexPath.row) {
         
         stPingController  = [UIStoryboard loadStoryboard:PingController.storyboard
                                           viewController:PingController.class];

         stViewController  = stPingController;
         
      } /* End if () */
      else if (HomeUtilitiesWoL == aIndexPath.row) {

         stWoLANController = [UIStoryboard loadStoryboard:WoLANController.storyboard
                                           viewController:WoLANController.class];

         stViewController  = stWoLANController;

      } /* End else if () */
      else if (HomeUtilitiesWhois == aIndexPath.row) {

         stWhoisController = [UIStoryboard loadStoryboard:WhoisController.storyboard
                                           viewController:WhoisController.class];

         stViewController  = stWhoisController;

      } /* End else if () */
      else if (HomeUtilitiesDNS == aIndexPath.row) {

         stDNSController   = [UIStoryboard loadStoryboard:DNSController.storyboard
                                           viewController:DNSController.class];

         stViewController  = stDNSController;

      } /* End else if () */
      else if (HomeUtilitiesMore == aIndexPath.row) {

         stUtilitiesMoreController  = [UIStoryboard loadStoryboard:UtilitiesMoreController.storyboard
                                           viewController:UtilitiesMoreController.class];

         stViewController  = stUtilitiesMoreController;

      } /* End else if () */
      else {
   //      Error
         
      } /* End else */

   } /* End else if () */
   else {
//      Error
      
   } /* End else */
   
   if (nil != stViewController) {
      
      [self.navigationController pushViewController:stViewController
                                           animated:YES
                                         completion:nil];

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

- (void)tableView:(UITableView *)aTableView didDeselectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   HomeContentCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];

   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */

//   [UIView transitionWithView:stTableViewCell.selectedColorView
//                     duration:UIATableViewSelectedDefaultDuraton
//                      options:UIViewAnimationOptionTransitionCrossDissolve
//                   animations:^{
//
//      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.clearColor];
//   }
//                   completion:nil];

//   [stTableViewCell setSelected:NO animated:NO];
//   [stTableViewCell.selectedColorView setBackgroundColor:UIColor.clearColor];

   __CATCH(nErr);
   
   return;
}

//- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)aIndexPath {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   __CATCH(nErr);
//
//   return;
//}
//
//- (CGFloat)tableView:(UITableView *)aTableView heightForHeaderInSection:(NSInteger)aSection {
//
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
//
//   __CATCH(nErr);
//
//   return;
//}
//
- (CGFloat)tableView:(UITableView *)aTableView heightForFooterInSection:(NSInteger)aSection {

   int                            nErr                                     = EFAULT;
   
   CGFloat                        fHeight                                  = 0.1f;

   __TRY;

   if (HomeSectionUtilities == aSection) {
      
      fHeight  = 20.0f;
      
   } /* End if () */
   
   __CATCH(nErr);

   return fHeight;
}

@end

#pragma mark - UIStoryboard
@implementation HomeContentController (UIStoryboard)

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
   
   return @"HOME";
}

@end

#pragma mark - IBAction
@implementation HomeContentController (Action)

- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
