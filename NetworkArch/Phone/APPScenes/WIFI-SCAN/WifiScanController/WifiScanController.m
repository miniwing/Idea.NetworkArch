//
//  WifiScanController.m
//  NetworkArch
//
//  Created by Harry on 2021/9/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiScanController.h"
#import "WifiScanController+Inner.h"
#import "WifiScanController+Signal.h"
#import "WifiScanController+Notification.h"

@interface WifiScanController ()

@end

@implementation WifiScanController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc

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

   // Do any additional setup after loading the view.
   
   [self setTitle:APP_STR(@"Scan LAN")];
   LogDebug((@"[WifiScanController viewDidLoad] : VIEW : %@", self.view));
   
   [self.view setBackgroundColor:UIColor.clearColor];
   [self.tableView setTableHeaderView:[UIView new]];
   [self.tableView setEstimatedSectionFooterHeight:0];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];

   [self.tableView setContentInset:UIEdgeInsetsMake(16, 0, 16, 0)];
   
   /**
    Empty View
    */
   [self.emptyView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
   
   [self.emptyLabel setBackgroundColor:UIColor.clearColor];
   [self.emptyLabel setTextColorPicker:DKColorPickerWithKey([IDEAColor label])];
   [self.emptyLabel setFont:[APPFont regularFontOfSize:self.emptyLabel.font.pointSize]];
   [self.emptyLabel setText:APP_STR(@"SCAN EMPTY")];

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

#if MATERIAL_APP_BAR
   /**
    调整 Layout
    contentView.top
    */
   stLayoutConstraint   = [NSLayoutConstraint constraintWithIdentifier:@"tableView.top"
                                                              fromView:self.view];
   
   if (nil != stLayoutConstraint) {
      
      stLayoutConstraint.constant   = self.appBar.headerViewController.headerView.height;
      
   } /* End if () */
#endif /* MATERIAL_APP_BAR */
   
   self.tableView.delegate    = self;
   self.tableView.dataSource  = self;

   LogDebug((@"[WifiScanController viewDidLoad] : Interfaces : %d", self.wifiScanResults.count));
   
   [self.tableView setBackgroundView:self.emptyView];
   
   [self.tableView reloadData];

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

#pragma mark - <UITableViewDelegate>

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSInteger                      nNumberOfSections                        = 0;

   __TRY;

   nNumberOfSections = self.wifiScanResults.count;
   
   __CATCH(nErr);

   return nNumberOfSections;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   WifiScanCell                  *stWifiScanCell                           = nil;
   
   WifiScanResult                *stWifiScanResult                         = nil;
   
   __TRY;
   
   stWifiScanCell    = [self.tableView dequeueReusableCellWithIdentifier:WifiScanCell.reuseIdentifier
                                                            forIndexPath:aIndexPath];
   
   stWifiScanResult  = [self.wifiScanResults objectAtIndex:aIndexPath.row];
   
   [stWifiScanCell setScanResult:stWifiScanResult];

   if (0 == self.wifiScanResults.count) {
      
      [stWifiScanCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];

   } /* End if () */
   else {

      if (0 == aIndexPath.row) {
         
         [stWifiScanCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];

      } /* End if () */
      else if (self.wifiScanResults.count - 1 == aIndexPath.row) {
         
         [stWifiScanCell.separatorView setHidden:YES];
         [stWifiScanCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];

      } /* End if () */
      else {
         
         [stWifiScanCell setRectCorner:0];

      } /* End else */
      
   } /* End else */

   __CATCH(nErr);
   
   return stWifiScanCell;
}

#pragma mark - MMLANScannerDelegate
- (void)lanScanDidFindNewDevice:(MMDevice *)aDevice {
   
   int                            nErr                                     = EFAULT;
            
   __TRY;
   
   LogDebug((@"-[WifiScanController lanScanDidFindNewDevice:] : IP : %@", aDevice.ipAddress));

   if (NO == [self.devices containsObject:aDevice]) {
      
      [self.devices addObject:aDevice];

   } /* End if () */
   
   __CATCH(nErr);
   
   return;
}

- (void)lanScanDidFinishScanningWithStatus:(MMLanScannerStatus)aStatus {
   
   int                            nErr                                     = EFAULT;
   
   NSMutableArray<WifiScanResult *> *stWifiScanResults                     = nil;
   
   NSSortDescriptor              *stValueDescriptor                        = nil;

   __TRY;
   
   self.scaning      = NO;
   
   if (MMLanScannerStatusFinished == aStatus) {

      stWifiScanResults = [NSMutableArray<WifiScanResult *> array];
      
      for (MMDevice *stDevice in self.devices) {
         
         LogDebug((@"-[WifiScanController lanScanDidFinishScanningWithStatus:] : Brand : %@", stDevice.brand));

         [stWifiScanResults addObject:[WifiScanResult scanResultWithDevice:stDevice]];
         
      } /* End for () */
      
      stValueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"device.ipAddress" ascending:YES];
      
      //Updating the array that holds the data. MainVC will be notified by KVO
      self.wifiScanResults = [[stWifiScanResults sortedArrayUsingDescriptors:@[stValueDescriptor]] mutableCopy];

   } /* (MMLanScannerStatusFinished == aStatus) */
   else if (MMLanScannerStatusCancelled == aStatus) {
      
   } /* (MMLanScannerStatusCancelled == aStatus) */

   dispatch_async_on_main_queue(^{
      
      [UIView transitionWithView:self.tableView
                        duration:UIAViewAnimationDefaultDuraton
                         options:UIViewAnimationOptionTransitionCrossDissolve
                      animations:^{
         
         [self.tableView reloadData];
         
      }
                      completion:^(BOOL finished) {
         
      }];
   });
   
   [UIView transitionWithView:self.appBar.navigationBar
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarRefresh"]];
   }
                   completion:^(BOOL finished) {
      
   }];

   __CATCH(nErr);
   
   return;
}

- (void)lanScanProgressPinged:(float)aPingedHosts from:(NSInteger)aOverallHosts {
   
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
      
//   self.progressValue=pingedHosts/overallHosts;
   LogDebug((@"-[WifiScanController lanScanProgressPinged:from:] : Progress : %.2f%%", aPingedHosts * 100 / aOverallHosts));

//   __CATCH(nErr);
   
   return;
}

- (void)lanScanDidFailedToScan {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self.scaning   = NO;
   
   [UIView transitionWithView:self.appBar.navigationBar
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarRefresh"]];
   }
                   completion:^(BOOL finished) {
      
   }];

   __CATCH(nErr);
   
   return;
}

#pragma mark - (NSMutableArray<WifiScanResult *> *)wifiScanResults
//- (NSMutableArray<WifiScanResult *> *)wifiScanResults {
//
//   if (nil == _wifiScanResults) {
//
//      _wifiScanResults  = [NSMutableArray<WifiScanResult *> array];
//
//   } /* End if () */
//
//   return _wifiScanResults;
//}

#pragma mark - (NSMutableArray<MMDevice *> *)devices
- (NSMutableArray<MMDevice *> *)devices {
   
   if (nil == _devices) {
      
      _devices  = [NSMutableArray<MMDevice *> array];
      
   } /* End if () */
   
   return _devices;
}

#pragma mark - MMLANScanner
- (MMLANScanner *)lanScanner {
   
   if (nil == _lanScanner) {
      
      _lanScanner = [[MMLANScanner alloc] initWithDelegate:self];
      
   } /* End if () */
   
   return _lanScanner;
}

- (BOOL)isScaning {
   
   return _scaning;
}

@end

#pragma mark - UIStoryboard
@implementation WifiScanController (UIStoryboard)

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
   
   return @"SCAN";
}

@end

#pragma mark - IBAction
@implementation WifiScanController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onRefresh:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   //Checks if is already scanning
   if (self.isScaning) {
      
      [UIView transitionWithView:self.appBar.navigationBar
                        duration:UIAViewAnimationDefaultDuraton
                         options:UIViewAnimationOptionTransitionCrossDissolve
                      animations:^{
         [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarRefresh"]];
      }
                      completion:^(BOOL finished) {
         
         [self.lanScanner stop];
         self.scaning   = NO;
      }];
            
   } /* End if () */
   else {

      [UIView transitionWithView:self.appBar.navigationBar
                        duration:UIAViewAnimationDefaultDuraton
                         options:UIViewAnimationOptionTransitionCrossDissolve
                      animations:^{
         [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
      }
                      completion:^(BOOL finished) {
         
         [self.lanScanner start];
      }];
      
      self.scaning   = YES;
            
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
