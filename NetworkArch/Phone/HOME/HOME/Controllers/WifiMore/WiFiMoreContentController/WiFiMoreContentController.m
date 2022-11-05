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

#import <IDEAKit/UIDevice+Network.h>

#import <APPDriver/DataUsage.h>

#import "WiFiMoreContentController.h"
#import "WiFiMoreContentController+Inner.h"
#import "WiFiMoreContentController+Signal.h"

#import "WifiInterfacesController+Inner.h"

@implementation WiFiMoreContentController

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
   
   __TRY;
   
   [super viewDidLoad];
   
   // Uncomment the following line to preserve selection between presentations.
   self.clearsSelectionOnViewWillAppear = NO;
   
   // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
         
         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
         
      } /* End if () */
      
      return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
   }];

   for (UIView *stView in self.detailCellContainerViews) {
      
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];

         } /* End if () */

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];

   } /* End for () */
   
   for (UIView *stView in self.dataUsageCellContainerViews) {
      
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {

         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {

            return [IDEAColor colorWithKey:[IDEAColor tertiarySystemGroupedBackground]];

         } /* End if () */

         return [IDEAColor colorWithKey:[IDEAColor systemBackground]];
      }];

   } /* End for () */
   
   for (UIView *stView in self.warningCellContainerViews) {
      
      [stView setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
         
         return UIColorX.systemYellowColor;
      }];

   } /* End for () */
   
   for (UIView *stView in self.separatorViews) {
      
#if __DEBUG_COLOR__
      [stView setBackgroundColor:UIColor.systemOrangeColor];
#else /* __DEBUG_COLOR__ */
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];
#endif /* !__DEBUG_COLOR__ */
      
   } /* End for () */
      
   [self.interfacesImageView setBackgroundColor:UIColor.clearColor];
   [self.interfacesImageView setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.interfacesImageView setImage:[ImageProvider imageNamed:@"UIButtonBarArrowRightLandscape"]];
   
#if __Debug__
#else /* __Debug__ */
   [self.warningButton setHidden:YES];
#endif /* !__Debug__ */
   [self.warningButton.titleLabel setFont:[UIFont systemFontOfSize:self.warningButton.titleLabel.font.pointSize
                                                            weight:UIFontWeightLight]];
   [self.warningButton setTitle:__LOCALIZED_STRING(self.class, @"OK") forState:UIControlStateNormal];

   [self.warningImageView setBackgroundColor:UIColor.clearColor];
   [self.warningImageView setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
      
      return UIColorX.labelColor;
   }];
   [self.warningImageView setImage:[ImageProvider imageNamed:@"UIAccessoryButtonInfo"]];
   
   /**
    添加网络状态监听
    */
   [self sendSignal:WiFiMoreContentController.loadExternalIPv4Signal];
   
#if __Debug__
   
   for (WifiMoreCell *stWifiMoreCell in self.detailCells) {
      
      LogDebug((@"-[WiFiMoreContentController viewDidLoad] : Container : %@", stWifiMoreCell.containerView));

   } /* End for () */

   for (WifiMoreCell *stWifiMoreCell in self.dataUsageCells) {

      LogDebug((@"-[WiFiMoreContentController viewDidLoad] : Container : %@", stWifiMoreCell.containerView));

   } /* End for () */

   for (WifiMoreCell *stWifiMoreCell in self.dataUsageCells) {

      LogDebug((@"-[WiFiMoreContentController viewDidLoad] : Container : %@", stWifiMoreCell.containerView));

   } /* End for () */

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
   
//   if (@available(iOS 13, *)) {
//
//   } /* End if () */
//   else {
//      
//      [self.detailCells.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight
//                                           radius:UITableViewCellX.cornerRadii];
//      [self.detailCells.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight
//                                          radius:UITableViewCellX.cornerRadii];
//      
//      [self.dataUsageCells.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight
//                                              radius:UITableViewCellX.cornerRadii];
//      [self.dataUsageCells.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight
//                                             radius:UITableViewCellX.cornerRadii];
//      
//      [self.warningCells.firstObject setCornerRadius:UITableViewCellX.cornerRadii
//                                       clipsToBounds:YES];
//
//   } /* End else */

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
@implementation WiFiMoreContentController (UIStoryboardSegue)

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
