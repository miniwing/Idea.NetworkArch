//
//  MonitorContentController.m
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorContentController.h"
#import "MonitorContentController+Inner.h"
#import "MonitorContentController+Action.h"
#import "MonitorContentController+Signal.h"
#import "MonitorContentController+Notification.h"
#import "MonitorContentController+Theme.h"
#import "MonitorContentController+Debug.h"

@interface MonitorContentController ()

@end

@implementation MonitorContentController

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
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {
   
   int                            nErr                                     = EFAULT;
   
#if GOOGLE_MOBILE_ADS
   NSDictionary                  *stAdUnitIDs                              = nil;
   NSString                      *szAdUnitID                               = nil;
#endif /* GOOGLE_MOBILE_ADS */

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

   /**
    * ADs
    */
#if GOOGLE_MOBILE_ADS
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
   
   [self postSignal:MonitorContentController.loadADSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
#endif /* GOOGLE_MOBILE_ADS */

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

@end

#pragma mark - UIStoryboardSegue
@implementation MonitorContentController (UIStoryboardSegue)

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
