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

#import "HomeContentController.h"
#import "HomeContentController+Inner.h"
#import "HomeContentController+Action.h"
#import "HomeContentController+Signal.h"
#import "HomeContentController+Notification.h"
#import "HomeContentController+Theme.h"
#import "HomeContentController+Debug.h"

#import "HomeContentController+AD.h"

@implementation HomeContentController

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
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
#if ADS_GOOGLE_MOBILE
   NSDictionary                  *stAdUnitIDs                              = nil;
   NSString                      *szAdUnitID                               = nil;
#endif /* ADS_GOOGLE_MOBILE */

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
   
   [self.tableView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

   for (UIView *stView in self.wifiCellContainerViews) {
      
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];

         } /* End if () */

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];

   } /* End for () */

   for (UIView *stView in self.cellularCellContainerViews) {
      
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];

         } /* End if () */

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];

   } /* End for () */
   
   for (UIView *stView in self.utilitiesCellContainerViews) {
      
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];

         } /* End if () */

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];

   } /* End for () */

   /**
    WI-FI
    */
   [self.wifiSSIDLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiSSIDLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiSSIDLabel setFont:[UIFont systemFontOfSize:self.wifiSSIDLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
   [self.wifiSSIDLabel setText:__LOCALIZED_STRING(self.class, @"SSID not available")];

//#if TARGET_IPHONE_SIMULATOR
//   [self.wifiSSIDLabel setText:__LOCALIZED_STRING(self.class, @"Wi-Fi: 4-2-202")];
//#endif /* TARGET_IPHONE_SIMULATOR */
   
   [self.wifiSSIDIcon setBackgroundColor:UIColor.clearColor];
   [self.wifiSSIDIcon setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiSSIDIcon setImage:[ImageProvider imageNamed:@"wifi.slash"]];
   LogDebug((@"-[HomeContentController viewDidLoad] : WIFI-SLASH : %@", __IMAGE_NAMED(@"WIFI-SLASH", self.class)));
   
//#if TARGET_IPHONE_SIMULATOR
//   [self.wifiSSIDIcon setImage:__IMAGE_NAMED(@"WIFI-ON", self.class)];
//#endif /* TARGET_IPHONE_SIMULATOR */

   [self.wifiIPLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiIPLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiIPLabel setFont:[UIFont systemFontOfSize:self.wifiIPLabel.font.pointSize
                                               weight:UIFontWeightLight]];
   [self.wifiIPLabel setText:__LOCALIZED_STRING(self.class, @"IP Address")];
   
   [self.wifiIP setBackgroundColor:UIColor.clearColor];
   [self.wifiIP setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiIP setFont:[UIFont systemFontOfSize:self.wifiIP.font.pointSize
                                          weight:UIFontWeightLight]];
   [self.wifiIP setText:__LOCALIZED_STRING(self.class, @"N/A")];

//#if TARGET_IPHONE_SIMULATOR
//   [self.wifiIP setText:__LOCALIZED_STRING(self.class, @"192.168.88.88")];
//#endif /* TARGET_IPHONE_SIMULATOR */

   [self.wifiMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiMoreLabel setFont:[UIFont systemFontOfSize:self.wifiMoreLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
   [self.wifiMoreLabel setText:__LOCALIZED_STRING(self.class, @"More Info")];
   
   [self.wifiMoreIcon setBackgroundColor:UIColor.clearColor];
   [self.wifiMoreIcon setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   self.wifiCells[HomeWifiSSID].canSelected  = NO;
   self.wifiCells[HomeWifiIP].canSelected    = NO;
   self.wifiCells[HomeWifiMore].canSelected  = YES;

   /**
    Cellular
    */
   [self.cellularOperatorLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularOperatorLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularOperatorLabel setFont:[UIFont systemFontOfSize:self.cellularOperatorLabel.font.pointSize
                                                         weight:UIFontWeightLight]];
   [self.cellularOperatorLabel setText:__LOCALIZED_STRING(self.class, @"No Service")];

//#if TARGET_IPHONE_SIMULATOR
//   [self.cellularOperatorLabel setText:__LOCALIZED_STRING(self.class, @"Cellular Network")];
//#endif /* TARGET_IPHONE_SIMULATOR */

   [self.cellularOperatorIcon setBackgroundColor:UIColor.clearColor];
   [self.cellularOperatorIcon setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularOperatorIcon setImage:[ImageProvider imageNamed:@"antenna.radiowaves.left.and.right.slash"]];

//#if TARGET_IPHONE_SIMULATOR
//   [self.cellularOperatorIcon setImage:__IMAGE_NAMED(@"CELLULAR", self.class)];
//#endif /* TARGET_IPHONE_SIMULATOR */

   LogDebug((@"-[HomeContentController viewDidLoad] : CELLULAR : %@", __IMAGE_NAMED(@"CELLULAR", self.class)));
   LogDebug((@"-[HomeContentController viewDidLoad] : UIButtonBarArrowRight : %@", [ImageProvider imageNamed:@"UIButtonBarArrowRight"]));

   [self.cellularIPLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularIPLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularIPLabel setFont:[UIFont systemFontOfSize:self.cellularIPLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.cellularIPLabel setText:__LOCALIZED_STRING(self.class, @"IP Address")];

   [self.cellularIP setBackgroundColor:UIColor.clearColor];
   [self.cellularIP setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularIP setFont:[UIFont systemFontOfSize:self.cellularIP.font.pointSize
                                              weight:UIFontWeightLight]];
   [self.cellularIP setText:__LOCALIZED_STRING(self.class, @"N/A")];

//#if TARGET_IPHONE_SIMULATOR
//   [self.cellularIP setText:__LOCALIZED_STRING(self.class, @"10.8.8.8")];
//#endif /* TARGET_IPHONE_SIMULATOR */

   [self.cellularMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularMoreLabel setFont:[UIFont systemFontOfSize:self.cellularMoreLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.cellularMoreLabel setText:__LOCALIZED_STRING(self.class, @"More Info")];

   [self.cellularMoreIcon setBackgroundColor:UIColor.clearColor];
   [self.cellularMoreIcon setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];

   self.cellularCells[HomeCellularOperator].canSelected  = NO;
   self.cellularCells[HomeCellularIP].canSelected        = NO;
   self.cellularCells[HomeCellularMore].canSelected      = YES;

   /**
    工具
    */
   [self.utilitiesPingLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesPingLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesPingLabel setFont:[UIFont systemFontOfSize:self.utilitiesPingLabel.font.pointSize
                                                      weight:UIFontWeightLight]];
   [self.utilitiesPingLabel setText:__LOCALIZED_STRING(self.class, @"Ping")];
   
   [self.utilitiesWakeOnLanLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesWakeOnLanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesWakeOnLanLabel setFont:[UIFont systemFontOfSize:self.utilitiesWakeOnLanLabel.font.pointSize
                                                           weight:UIFontWeightLight]];
   [self.utilitiesWakeOnLanLabel setText:__LOCALIZED_STRING(self.class, @"Wake on LAN")];

   [self.utilitiesWhoisLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesWhoisLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesWhoisLabel setFont:[UIFont systemFontOfSize:self.utilitiesWhoisLabel.font.pointSize
                                                       weight:UIFontWeightLight]];
   [self.utilitiesWhoisLabel setText:__LOCALIZED_STRING(self.class, @"Whois")];

   [self.utilitiesDNSLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesDNSLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesDNSLabel setFont:[UIFont systemFontOfSize:self.utilitiesDNSLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.utilitiesDNSLabel setText:__LOCALIZED_STRING(self.class, @"DNS Lookup")];

   [self.utilitiesTracerouteLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesTracerouteLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesTracerouteLabel setFont:[UIFont systemFontOfSize:self.utilitiesTracerouteLabel.font.pointSize
                                                            weight:UIFontWeightLight]];
   [self.utilitiesTracerouteLabel setText:__LOCALIZED_STRING(self.class, @"Traceroute")];

   [self.utilitiesPortScanLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesPortScanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesPortScanLabel setFont:[UIFont systemFontOfSize:self.utilitiesPortScanLabel.font.pointSize
                                                          weight:UIFontWeightLight]];
   [self.utilitiesPortScanLabel setText:__LOCALIZED_STRING(self.class, @"Port Scan")];

   [self.utilitiesLanScanLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesLanScanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesLanScanLabel setFont:[UIFont systemFontOfSize:self.utilitiesLanScanLabel.font.pointSize
                                                         weight:UIFontWeightLight]];
   [self.utilitiesLanScanLabel setText:__LOCALIZED_STRING(self.class, @"LAN Scan")];

//   /**
//    * 设置图标
//    */
//   [self.wifiCells[0].iconImage setImage:__IMAGE_NAMED(@"WIFI-ON", self.class)];
//   [self.cellularCells[0].iconImage setImage:__IMAGE_NAMED(@"CELLULAR", self.class)];
   
   /**
    * 设置箭头
    */
   for (UIImageView *stICON in self.cellRightImageViews) {
      
      [stICON setBackgroundColor:UIColor.clearColor];
      [stICON setImage:[ImageProvider imageNamed:@"UIButtonBarArrowRight"]];
//      [stICON setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [stICON setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
            
            return [IDEAColor colorWithKey:[IDEAColor lightText]];
            
         } /* End if () */
         
         return [IDEAColor colorWithKey:[IDEAColor darkGray]];
      }];

   } /* End for () */
   
   for (HomeContentCell *stHomeContentCell in self.utilitiesCells) {
      
      stHomeContentCell.canSelected = YES;
      
   } /* End for () */
      
   /**
    * ADs
    */   
#if ADS_GOOGLE_MOBILE
   stAdUnitIDs = [AD admobs];
   LogDebug((@"-[HomeContentController viewDidLoad] : AdUnitIDs : %@", stAdUnitIDs));
   
   szAdUnitID  = [stAdUnitIDs objectForKey:@"HOME-BANNER"];
   
   [self.bannerView setBackgroundColor:UIColor.clearColor];
   [self.gadBannerView setCornerRadius:[UISetting cornerRadiusSmall] clipsToBounds:YES];
   [self.gadBannerView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
   }];
   
   [self.bannerViewWidth setConstant:self.tableView.width];

   [self.gadBannerView setAdUnitID:szAdUnitID];
   [self.gadBannerView setAdSize:GADAdSizeBanner];
   [self.gadBannerView setAutoloadEnabled:YES];

   [self.gadBannerView setRootViewController:self];
   [self.gadBannerView setDelegate:self];
   [self.gadBannerView setAdSizeDelegate:self];
   
   [self postSignal:HomeContentController.loadADSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
#endif /* ADS_GOOGLE_MOBILE */

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

@end

#pragma mark - UIStoryboardSegue
@implementation HomeContentController (UIStoryboardSegue)

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
