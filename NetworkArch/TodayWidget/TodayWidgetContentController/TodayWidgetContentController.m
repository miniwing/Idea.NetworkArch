//
//  TodayWidgetContentController.m
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TodayWidgetContentController.h"
#import "TodayWidgetContentController+Inner.h"
#import "TodayWidgetContentController+Signal.h"

@implementation TodayWidgetContentController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeAllSignalResponders];
   [self unobserveAllNotifications];

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
   // self.clearsSelectionOnViewWillAppear = NO;
   
   // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
//   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   [self.tableView setBackgroundColorPicker:nil];
   [self.tableView setBackgroundColor:UIColor.clearColor];
   
   for (UIView *stView in self.wifiCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemBlueColor];
#else /* __DEBUG_COLOR__ */
      //      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
      [stView setBackgroundColor:UIColor.clearColor];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   for (UIView *stView in self.cellularCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemPinkColor];
#else /* __DEBUG_COLOR__ */
      //      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
      [stView setBackgroundColor:UIColor.clearColor];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   for (UIView *stView in self.utilitiesCellContainerViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
      //      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
      [stView setBackgroundColor:UIColor.clearColor];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
   
   /**
    WI-FI
    */
   [self.wifiSSIDLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiSSIDLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiSSIDLabel setFont:[UIFont systemFontOfSize:self.wifiSSIDLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
   [self.wifiIPLabel setText:APP_STR(@"SSID not available")];
   
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
   
   [self.wifiIPLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiIPLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiIPLabel setFont:[UIFont systemFontOfSize:self.wifiIPLabel.font.pointSize
                                               weight:UIFontWeightLight]];
   [self.wifiIPLabel setText:APP_STR(@"IP Address")];
   
   [self.wifiIP setBackgroundColor:UIColor.clearColor];
   [self.wifiIP setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiIP setFont:[UIFont systemFontOfSize:self.wifiIP.font.pointSize
                                          weight:UIFontWeightLight]];
   [self.wifiIP setText:APP_STR(@"N/A")];
   
   [self.wifiMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.wifiMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.wifiMoreLabel setFont:[UIFont systemFontOfSize:self.wifiMoreLabel.font.pointSize
                                                 weight:UIFontWeightLight]];
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
   
   self.wifiCells[TodayWidgetWifiSSID].canSelected  = NO;
   self.wifiCells[TodayWidgetWifiIP].canSelected    = NO;
   self.wifiCells[TodayWidgetWifiMore].canSelected  = YES;
   
   /**
    Cellular
    */
   [self.cellularOperatorLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularOperatorLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularOperatorLabel setFont:[UIFont systemFontOfSize:self.cellularOperatorLabel.font.pointSize
                                                         weight:UIFontWeightLight]];

   [self.cellularOperatorLabel setText:APP_STR(@"No Service")];
   
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
   
   [self.cellularIPLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularIPLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularIPLabel setFont:[UIFont systemFontOfSize:self.cellularIPLabel.font.pointSize
                                                   weight:UIFontWeightLight]];
   [self.cellularIPLabel setText:APP_STR(@"IP Address")];
   
   [self.cellularIP setBackgroundColor:UIColor.clearColor];
   [self.cellularIP setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularIP setFont:[UIFont systemFontOfSize:self.cellularIP.font.pointSize
                                              weight:UIFontWeightLight]];
   [self.cellularIP setText:APP_STR(@"N/A")];
   
   [self.cellularMoreLabel setBackgroundColor:UIColor.clearColor];
   [self.cellularMoreLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.cellularMoreLabel setFont:[UIFont systemFontOfSize:self.cellularMoreLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
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
   
   self.cellularCells[TodayWidgetCellularOperator].canSelected  = NO;
   self.cellularCells[TodayWidgetCellularIP].canSelected        = NO;
   self.cellularCells[TodayWidgetCellularMore].canSelected      = YES;
   
   /**
    工具
    */
   [self.utilitiesPingLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesPingLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesPingLabel setFont:[UIFont systemFontOfSize:self.utilitiesPingLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.utilitiesPingLabel setText:APP_STR(@"Ping")];
   
   [self.utilitiesWakeOnLanLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesWakeOnLanLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesWakeOnLanLabel setFont:[UIFont systemFontOfSize:self.utilitiesWakeOnLanLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.utilitiesWakeOnLanLabel setText:APP_STR(@"Wake on LAN")];
   
   [self.utilitiesWhoisLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesWhoisLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesWhoisLabel setFont:[UIFont systemFontOfSize:self.utilitiesWhoisLabel.font.pointSize
                                                       weight:UIFontWeightLight]];
   [self.utilitiesWhoisLabel setText:APP_STR(@"Whois")];
   
   [self.utilitiesDNSLabel setBackgroundColor:UIColor.clearColor];
   [self.utilitiesDNSLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.utilitiesDNSLabel setFont:[UIFont systemFontOfSize:self.utilitiesDNSLabel.font.pointSize
                                                     weight:UIFontWeightLight]];
   [self.utilitiesDNSLabel setText:APP_STR(@"DNS Lookup")];
   
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
   
   for (TodayWidgetCell *stTodayWidgetCell in self.utilitiesCells) {
      
      stTodayWidgetCell.canSelected = YES;
      
   } /* End for () */
   
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
    Load Wi-Fi, Cellular
    */
   //   [self postSignal:TodayWidgetContentController.loadWifiInfoSignal onQueue:DISPATCH_GET_MAIN_QUEUE()];
   [self sendSignal:TodayWidgetContentController.loadWifiInfoSignal];
   [self sendSignal:TodayWidgetContentController.loadCellularInfoSignal];
   
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
   
   [self.wifiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.wifiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   [self.cellularCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.cellularCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
   [self.utilitiesCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
   [self.utilitiesCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   if (NCWidgetDisplayModeExpanded == self.extensionContext.widgetActiveDisplayMode) {
      
      return TodayWidgetSectionNumber;
      
   } /* End if () */
   
   return TodayWidgetSectionNumber - 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfRows                            = 0;
   
   __TRY;
   
   //   TodayWidgetSectionWifi      = 0,
   //   TodayWidgetSectionCellular  = 1,
   //   TodayWidgetSectionUtilities = 2,
   
   if (TodayWidgetSectionWifi == aSection) {
      
      nNumberOfRows  = self.wifiCells.count;
      LogDebug((@"-[TodayWidgetContentController tableView:numberOfRowsInSection:] : TodayWidgetSectionWifi : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   if (TodayWidgetSectionCellular == aSection) {
      
      nNumberOfRows  = self.cellularCells.count;
      LogDebug((@"-[TodayWidgetContentController tableView:numberOfRowsInSection:] : TodayWidgetSectionCellular : %d", nNumberOfRows));
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return nNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   TodayWidgetCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   //   TodayWidgetSectionWifi      = 0,
   //   TodayWidgetSectionCellular  = 1,
   //   TodayWidgetSectionUtilities = 2,
   
   if (TodayWidgetSectionWifi == aIndexPath.section) {
      
      stTableViewCell   = self.wifiCells[aIndexPath.row];
      
   } /* End if () */
   else if (TodayWidgetSectionCellular == aIndexPath.section) {
      
      stTableViewCell   = self.cellularCells[aIndexPath.row];
      
   } /* End if () */
   
   if (nil != stTableViewCell) {
      
      [stTableViewCell setBackgroundColor:UIColor.clearColor];
      [stTableViewCell.contentView setBackgroundColor:UIColor.clearColor];
      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.clearColor];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   TodayWidgetCell               *stTableViewCell                          = nil;
   
   __TRY;
   
   stTableViewCell = [aTableView cellForRowAtIndexPath:aIndexPath];
   
   if (NO == stTableViewCell.canSelected) {
      
      nErr  = noErr;
      
      break;
      
   } /* End if () */
   
   //   [UIView transitionWithView:stTableViewCell.selectedColorView
   //                     duration:[UIView animationDefaultDuration]
   //                      options:UIViewAnimationOptionTransitionCrossDissolve
   //                   animations:^{
   //      [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
   //   }
   //                   completion:^(BOOL aComplete) {
   //      [stTableViewCell setSelectionStyle:UITableViewCellSelectionStyleDefault];
   //   }];
   
   //   [stTableViewCell.selectedColorView setBackgroundColor:UIColor.systemBlueColor];
   //   [stTableViewCell setSelected:YES animated:NO];
   
   //   TodayWidgetSectionWifi      = 0,
   //   TodayWidgetSectionCellular  = 1,
   //   TodayWidgetSectionUtilities = 2,
   //   TodayWidgetSectionNumber
   
   if (TodayWidgetSectionWifi == aIndexPath.section) {
      
      if (TodayWidgetWifiMore == aIndexPath.row) {
         
         LogDebug((@"-[TodayWidgetContentController tableView:didSelectRowAtIndexPath:] : %@", [NSString stringWithFormat:@"%@%@", [IDEAIdentifier scheme], @"Wi-Fi"]));
         
         [self.extensionContext openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [IDEAIdentifier scheme], @"Wi-Fi"]]
                      completionHandler:^(BOOL aSuccess) {
            
            LogDebug((@"-[TodayWidgetContentController tableView:didSelectRowAtIndexPath:] : openURL"));
         }];
         
      } /* End if () */
      
   } /* End if () */
   else if (TodayWidgetSectionCellular == aIndexPath.section) {
      
      if (TodayWidgetCellularMore == aIndexPath.row) {
         
         LogDebug((@"-[TodayWidgetContentController tableView:didSelectRowAtIndexPath:] : %@",  [NSString stringWithFormat:@"%@%@", [IDEAIdentifier scheme], @"Wi-Fi"]));
         
         [self.extensionContext openURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@%@", [IDEAIdentifier scheme], @"Wi-Fi"]]
                      completionHandler:^(BOOL aSuccess) {
            
            LogDebug((@"-[TodayWidgetContentController tableView:didSelectRowAtIndexPath:] : openURL"));
         }];
         
      } /* End if () */
      
   } /* End else if () */
   else {
      //      Error
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   CGFloat                        fTableViewHeight                         = 0.0f;
   CGFloat                        fHeight                                  = 0.0f;
   
   __TRY;
   
//   fHeight  = aTableView.height / self.wifiCells.count;
   
   fTableViewHeight  = self.preferredContentSize.height / [aTableView numberOfSections];
   
   if (TodayWidgetSectionWifi == aIndexPath.section) {

      if (aIndexPath.row == self.wifiCells.count - 1) {
         
         fHeight  = fTableViewHeight * 3 / 7;

      } /* End if () */
      else {
         
         fHeight  = fTableViewHeight * 2 / 7;

      } /* End else */

   } /* End if () */
   else {
      
      if (aIndexPath.row == self.cellularCells.count - 1) {
         
         fHeight  = fTableViewHeight * 3 / 7;

      } /* End if () */
      else {
         
         fHeight  = fTableViewHeight * 2 / 7;

      } /* End else */

   } /* End else */
   
   __CATCH(nErr);
   
   return fHeight;
}

@end

#pragma mark - UIStoryboardSegue
@implementation TodayWidgetContentController (UIStoryboardSegue)

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
   
   return @"WIDGET";
}

@end

#pragma mark - IBAction
@implementation TodayWidgetContentController (Action)

- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);
   
   return;
}

@end
