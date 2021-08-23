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
   
   [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];
   
   [self.rightBarButtonItem setEnabled:NO];
   
#if MATERIAL_APP_BAR
   // Dispose of any resources that can be recreated.
   /**
    调整 Layout
    inputView.top
    */
   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"inputView.top"
                                                              fromView:self.view];
   
   if (nil != stLayoutConstraint) {
      
      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
      
   } /* End if () */
#endif /* MATERIAL_APP_BAR */

   /**
    UITextField
    */
   [self.inputView setBackgroundColor:UIColor.clearColor];
//   [self.textField setBackground:[UIImage imageNamed:@"CLEAR-IMAGE"]];
   [self.textField setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor systemBackground])];
   [self.textField setCornerRadius:8 clipsToBounds:YES];
   
   [self.textField setFont:[APPFont regularFontOfSize:self.textField.font.pointSize]];
   
   [self.textField setPlaceholderColorPicker:DKColorPickerWithKey([IDEAColor placeholderText])];

   [self.textField setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   
   [self.textField setDelegate:self];
   [self.textField setPlaceholder:APP_STR(@"IP Address / Host Name")];
   
   [self addNotificationName:UITextFieldTextDidChangeNotification
                    selector:@selector(textFieldTextDidChange:)
                      object:self.textField];
   
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
   
   _firstResponder   = 0;
   
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
   
   return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfRows                            = 0;
   NSNumber                      *stSection                                = nil;
   
   __TRY;
   
   stSection   = [self.sections objectAtIndex:aSection];
   
   if (PingSectionStatistics == stSection.integerValue) {
      
      nNumberOfRows  = PingStatisticsNumber;
      
   } /* End if () */
   else /* if (PingSectionStatistics == aSection) */ {
      
      nNumberOfRows  = self.pingResults.count;
      
   } /* End else */
   
   __CATCH(nErr);
   
   return nNumberOfRows;
}

- (nullable NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSNumber                      *stSection                                = nil;
   
   NSString                      *szTitle                                  = nil;
   
   __TRY;
   
   stSection   = [self.sections objectAtIndex:aSection];
   
   if (PingSectionStatistics == stSection.integerValue) {
      
      szTitle  = APP_STR(@"Statistics");
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return szTitle;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   NSNumber                      *stSection                                = nil;
   
   PingCell                      *stPingCell                               = nil;
   
   PingStatisticsCell            *stPingStatisticsCell                     = nil;
#if PING_STATISTICS_GRAPH
   PingGraphCell                 *stPingGraphCell                          = nil;
#endif /* PING_STATISTICS_GRAPH */
   
   PingResult                    *stPingResult                             = nil;
   PingResultCell                *stPingResultCell                         = nil;
   
   __TRY;
   
   stSection   = [self.sections objectAtIndex:aIndexPath.section];
   
   if (PingSectionStatistics == stSection.integerValue) {
      
      //      PingStatisticsMinmum    = 0,
      //      PingStatisticsAverage   = 1,
      //      PingStatisticsMaximum   = 2,
      //      PingStatisticsGraph     = 3
      //
      //      int sum = [[self.pingResults valueForKeyPath:@"@sum.intValue"] intValue];//求和
      //      int max = [[self.pingResults valueForKeyPath:@"@max.intValue"] intValue];//求最大值
      //      int min = [[self.pingResults valueForKeyPath:@"@min.intValue"] intValue];//求最小值
      //
      //      float avg = [[self.pingResults valueForKeyPath:@"@avg.floatValue"] floatValue];//求平均值
      
      if (PingStatisticsMinmum == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         [stPingStatisticsCell setStatistics:PingStatisticsMinmum
                                       value:[[self.pingResults valueForKeyPath:@"@min.duration.doubleValue"] doubleValue]];
         
         stPingCell  = stPingStatisticsCell;
         
         [stPingCell.separatorView setHidden:NO];
         [stPingCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
         
      } /* End if () */
      else if (PingStatisticsAverage == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         [stPingStatisticsCell setStatistics:PingStatisticsAverage
                                       value:[[self.pingResults valueForKeyPath:@"@avg.duration.doubleValue"] doubleValue]];
         
         stPingCell  = stPingStatisticsCell;
         
      } /* End else if () */
      else if (PingStatisticsMaximum == aIndexPath.row) {
         
         stPingStatisticsCell = [aTableView dequeueReusableCellWithIdentifier:PingStatisticsCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         [stPingStatisticsCell setStatistics:PingStatisticsMinmum
                                       value:[[self.pingResults valueForKeyPath:@"@max.duration.doubleValue"] doubleValue]];
         
         stPingCell  = stPingStatisticsCell;
         
         [stPingCell.separatorView setHidden:NO];
         
#if PING_STATISTICS_GRAPH
#else /* PING_STATISTICS_GRAPH */
         [stPingCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
#endif /* !PING_STATISTICS_GRAPH */
         
      } /* End else if () */
#if PING_STATISTICS_GRAPH
      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
         
         stPingGraphCell      = [aTableView dequeueReusableCellWithIdentifier:PingGraphCell.reuseIdentifier
                                                                 forIndexPath:aIndexPath];
         
         stPingCell  = stPingGraphCell;
         
         [stPingCell.separatorView setHidden:YES];
         [stPingCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
         
      } /* End else if () */
      
#endif /* PING_STATISTICS_GRAPH */
      
   } /* End if () */
   else /* if (PingSectionPing == aIndexPath.section) */ {
      
      stPingResult      = [self.pingResults objectAtIndex:aIndexPath.row];
      
      stPingResultCell  = [aTableView dequeueReusableCellWithIdentifier:PingResultCell.reuseIdentifier
                                                           forIndexPath:aIndexPath];
      
      [stPingResultCell setPingResult:stPingResult];
      
      stPingCell  = stPingResultCell;
      
      [stPingCell setRectCorner:0];
      
      if (1 == self.pingResults.count) {
         
         [stPingCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];
         
         [stPingCell.separatorView setHidden:YES];
         
      } /* End if () */
      else {
         
         if (0 == aIndexPath.row) {
            
            [stPingCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
            [stPingCell.separatorView setHidden:NO];
            
         } /* End if () */
         else if (self.pingResults.count - 1 == aIndexPath.row) {
            
            [stPingCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
            [stPingCell.separatorView setHidden:YES];
            
         } /* End else if () */
         else {
            
            [stPingCell setRectCorner:0];
            [stPingCell.separatorView setHidden:NO];
            
         } /* End else */
         
      } /* End else */
      
   } /* End else */
   
   __CATCH(nErr);
   
   return stPingCell;
}

#pragma mark - <UITableViewDelegate>
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)aCell forRowAtIndexPath:(NSIndexPath *)aIndexPath {
//
//   int                            nErr                                     = EFAULT;
//
//   PingCell                      *stPingCell                               = (PingCell *)aCell;
//
//   __TRY;
//
//   if (PingSectionStatistics == aIndexPath.section) {
//
//      if (PingStatisticsMinmum == aIndexPath.row) {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//
//      } /* End if () */
//      else if (PingStatisticsAverage == aIndexPath.row) {
//
//      } /* End else if () */
//      else if (PingStatisticsMaximum == aIndexPath.row) {
//
//      } /* End else if () */
//      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      } /* End else if () */
//
//   } /* End if () */
//   else /* if (PingSectionPing == aIndexPath.section) */ {
//
////      stPingResult      = [self.pingResults objectAtIndex:aIndexPath.row];
////
////      stPingResultCell  = [aTableView dequeueReusableCellWithIdentifier:PingResultCell.reuseIdentifier
////                                                           forIndexPath:aIndexPath];
////
////      [stPingResultCell setPingResult:stPingResult];
////
////      stPingCell  = stPingResultCell;
//
//   } /* End else */
//
//   __CATCH(nErr);
//
//   return;
//}

//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)aCell forRowAtIndexPath:(NSIndexPath*)aIndexPath {
//
//   int                            nErr                                     = EFAULT;
//
//   PingCell                      *stPingCell                               = (PingCell *)aCell;
//
//   __TRY;
//
//   if (PingSectionStatistics == aIndexPath.section) {
//
//      if (PingStatisticsMinmum == aIndexPath.row) {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
//
//      } /* End if () */
//      else if (PingStatisticsAverage == aIndexPath.row) {
//
//      } /* End else if () */
//      else if (PingStatisticsMaximum == aIndexPath.row) {
//
//      } /* End else if () */
//      else /* if (PingStatisticsGraph == aIndexPath.row) */ {
//
//         [stPingCell.containerView setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
//
//      } /* End else if () */
//
//   } /* End if () */
//   else /* if (PingSectionPing == aIndexPath.section) */ {
//
////      stPingResult      = [self.pingResults objectAtIndex:aIndexPath.row];
////
////      stPingResultCell  = [aTableView dequeueReusableCellWithIdentifier:PingResultCell.reuseIdentifier
////                                                           forIndexPath:aIndexPath];
////
////      [stPingResultCell setPingResult:stPingResult];
////
////      stPingCell  = stPingResultCell;
//
//   } /* End else */
//
//   __CATCH(nErr);
//
//   return;
//}

#pragma mark - (NSMutableArray<PingResult *> *)pingResults
- (NSMutableArray<PingResult *> *)pingResults {
   
   if (nil == _pingResults) {
      
      _pingResults   = [NSMutableArray<PingResult *> array];
      
   } /* End if () */
   
   return _pingResults;
}

#pragma mark - (NSMutableArray<NSNumber *> *)sections
- (NSMutableArray<NSNumber *> *)sections {
   
   if (nil == _sections) {
      
      _sections   = [NSMutableArray<NSNumber *> array];
      
   } /* End if () */
   
   return _sections;
}

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

#pragma mark - IBAction
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

