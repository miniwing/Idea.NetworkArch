//
//  PingController.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PingRootController.h"

#import "PingController.h"
#import "PingController+Inner.h"
#import "PingController+Debug.h"
#import "PingController+Theme.h"
#import "PingController+Signal.h"
#import "PingController+Notification.h"

@implementation PingController

- (void)dealloc {
   
   __LOG_FUNCTION;
   
   // Custom dealloc
   
   [self removeAllNotification];
   
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
      
      [_appBar.headerViewController setShowsHairline:YES];
      [_appBar.headerViewController setHairlineColor:[IDEAColor colorWithKey:[IDEAColor separator]]];
      
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
   
   [self setTitle:APP_STR(@"Ping")];
   LogDebug((@"[PingController viewDidLoad] : VIEW : %@", self.view));
   
   [self.view setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   [self.tableView setBackgroundColor:UIColor.clearColor];

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
   
   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
   
   [self.rightBarButtonItem setEnabled:NO];
   
#if MATERIAL_APP_BAR
   // Dispose of any resources that can be recreated.
   /**
    调整 Layout
    contentView.top
    */
   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"search.top"
                                                              fromView:self.view];
#endif /* MATERIAL_APP_BAR */
   
   if (nil != stLayoutConstraint) {
      
      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
      
   } /* End if () */
   
   /**
    Search Bar
    */
   [self.searchView setBackgroundColor:UIColor.clearColor];
   [self.textField setBackground:[UIImage imageNamed:@"CLEAR-IMAGE"]];
   [self.textField setBackgroundColor:UIColor.whiteColor];
   [self.textField setCornerRadius:8 clipsToBounds:YES];
      
   [self.textField setFont:[APPFont regularFontOfSize:16]];
   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   if (@available(iOS 13, *)) {
      
   } /* End if () */
   else {
      
      [self.textField setTintColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
         
         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
            
            return [UIColor lightTextColor];
            
         } /* End if () */
         else {
            
            return [UIColor secondaryLabelColor];
            
         } /* End else */
      }];
      
      [self.textField setBackgroundColorPicker:^UIColor *(DKThemeVersion *aThemeVersion) {
         
         if ([DKThemeVersionNight isEqualToString:aThemeVersion]) {
            
            return [IDEAColor colorWithKey:[IDEAColor secondarySystemBackground]];
            
         }
         else {
            
            return [IDEAColor colorWithKey:[IDEAColor systemGroupedBackground]];
            
         }
      }];
   } /* End else */
   
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:APP_STR(@"IP Address / Host Name")];
   
   if (nil != self.textField) {
      
      //      [self.searchBarTextField setDelegate:self];
      
      [self addNotificationName:UITextFieldTextDidChangeNotification
                       selector:@selector(textFieldTextDidChange:)
                         object:self.textField];
      
   } /* End if () */
   
#if __Debug__
   dispatch_async_on_main_queue(^{
      
      [self.textField setText:@"www.baidu.com"];
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

- (void)viewDidLayoutSubviews {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [super viewDidLayoutSubviews];
   
   //   dispatch_once(&_didLayoutOnceToken, ^{
   //
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
   
   dispatch_once(&_firstResponder, ^{
      
      [self.textField becomeFirstResponder];
      
//#if __Debug__
//      [CATransaction begin];
//      [self.searchBar becomeFirstResponder];
//      [CATransaction commit];
//
//      [CATransaction setCompletionBlock:^{
//
//         [self.searchBar setText:@"www.baidu.com"];
//      }];
//#else
//      [self.searchBar becomeFirstResponder];
//#endif /* __Debug__ */
   });
   
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

- (BOOL)resignFirstResponder {
   
   int                            nErr                                     = EFAULT;
   BOOL                           bDone                                    = NO;
   
   __TRY;
   
   bDone = [self.textField resignFirstResponder];
   
   if (!bDone) {
      
      bDone = [super resignFirstResponder];
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return bDone;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
      
   return PingSectionNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfRows                            = 0;
   
   __TRY;

   if (PingSectionStatistics == aSection) {
      
      nNumberOfRows  = PingStatisticsNumber;
      
   } /* End if () */
   else /* if (PingSectionStatistics == aSection) */ {
      
      nNumberOfRows  = 2;
      
   } /* End else */
   
   __CATCH(nErr);
   
   return nNumberOfRows;
}

- (nullable NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szTitle                                  = nil;
   
   __TRY;

   if (PingSectionStatistics == aSection) {
      
      szTitle  = APP_STR(@"Statistics");
      
   } /* End if () */

   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   PingCell                      *stPingCell                               = nil;
   
   PingStatisticsCell            *stPingStatisticsCell                     = nil;
   PingGraphCell                 *stPingGraphCell                          = nil;
   PingTimeCell                  *stPingTimeCell                           = nil;
   
   __TRY;
   
   if (PingSectionStatistics == aIndexPath.section) {
      
//      PingStatisticsMinmum    = 0,
//      PingStatisticsAverage   = 1,
//      PingStatisticsMaximum   = 2,
//      PingStatisticsGraph     = 3
      
      if (PingStatisticsMinmum == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         stPingCell  = stPingStatisticsCell;
         
         [stPingCell.containerView setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];

      } /* End if () */
      else if (PingStatisticsAverage == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         stPingCell  = stPingStatisticsCell;
         
      } /* End else if () */
      else if (PingStatisticsMaximum == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         stPingCell  = stPingStatisticsCell;
         
      } /* End else if () */
      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
         
         stPingGraphCell      = [aTableView dequeueReusableCellWithIdentifier:PingGraphCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         stPingCell  = stPingGraphCell;
         
         [stPingCell.containerView setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];

      } /* End else if () */
      
   } /* End if () */
   else /* if (PingSectionTime == aIndexPath.section) */ {
      
      stPingTimeCell    = [aTableView dequeueReusableCellWithIdentifier:PingTimeCell.reuseIdentifier
                                                           forIndexPath:aIndexPath];
      
      stPingCell  = stPingTimeCell;
      
   } /* End else */
   
   if (nil != stPingCell) {
            
      [stPingCell setBackgroundColor:UIColor.clearColor];
      [stPingCell.contentView setBackgroundColor:UIColor.clearColor];
            
   } /* End if () */

   __CATCH(nErr);
   
   return stPingCell;
}

#pragma mark - <UITableViewDelegate>

@end

#pragma mark - UIStoryboard
@implementation PingController (UIStoryboard)

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

#pragma mark IBAction
@implementation PingController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [CATransaction begin];
   
   [self resignFirstResponder];
   
   [CATransaction commit];
   
   [CATransaction setCompletionBlock:^{
      
      if ((nil != self.navigationController) || (![self.navigationController isKindOfClass:[PingRootController class]])) {
         
         [self.navigationController popViewControllerAnimated:YES
                                                   completion:nil];
         
      } /* End if () */
      else {
         
         [self dismissViewControllerAnimated:YES
                                  completion:nil];
         
      } /* End else */
   }];
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
//   [self resignFirstResponder];
//
//   LogDebug((@"-[PingController onStart:] : aSender : %@", aSender));
//
//   // 按钮状态变更。
//   if (nil == self.pingClient) {
//
//      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
//      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];
//
//      self.pingClient   = [IDEAPingClient pingWithHostName:self.textField.text
//                                                    result:^(NSTimeInterval aTime, NSError * _Nonnull aError) {
//
//         LogDebug((@"-[PingController onStart:] : ping : Error : %@", aError));
//         LogDebug((@"-[PingController onStart:] : ping : Time  : %ld", aTime));
//      }];
//
//   } /* End if () */
//   else {
//
//      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
//      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
//
//      if (nil != self.pingClient) {
//
//         [self.pingClient stopPing];
//         __RELEASE(_pingClient);
//
//      } /* End if () */
//
//   } /* End else */

   [self postSignal:PingController.startPingSignal
            onQueue:dispatch_get_main_queue()];
   
   __CATCH(nErr);
   
   return;
}

@end

