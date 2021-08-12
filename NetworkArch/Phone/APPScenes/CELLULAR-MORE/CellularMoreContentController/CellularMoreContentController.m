//
//  CellularMoreContentController.m
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

#import "CellularMoreContentController.h"

#import "DataUsage.h"

@interface CellularMoreContentController ()

@end

@implementation CellularMoreContentController

- (void)dealloc {

   __LOG_FUNCTION;

   // Custom dealloc
   [[APPDelegate APP] removeSignalResponder:self];

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
//   return CellularSectionNumber;
//}
//
//- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
//
//   int                            nErr                                     = EFAULT;
//
//   NSInteger                      nRows                                    = 0;
//
//   __TRY;
//
//   if (CellularSectionDetail == aSection) {
//
//      nRows = self.detailCells.count;
//
//   } /* End if () */
//   else if (CellularSectionDataUsage == aSection) {
//
//      nRows = self.dataUsageCells.count;
//
//   } /* End if () */
//   else if (CellularSectionWarning == aSection) {
//
//      nRows = self.warningCells.count;
//
//   } /* End if () */
//
//   __CATCH(nErr);
//
//   return nRows;
//}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   CellularMoreCell              *stTableViewCell                          = nil;
   
   NSArray<NSString *>           *stTitles                                 = @[
      @"Carrier",
      @"ISO Country Code",
      @"Mobile Country Code",
      @"Mobile Network Code",
      @"Rdio Access Technology",
      @"IPv4 Address",
      @"IPv6 Address",
      @"VoIP Support",
   ];
   
   CTTelephonyNetworkInfo        *stTelephonyNetworkInfo                   = nil;
   
   NSDictionary<NSString *, CTCarrier *>  *stCarriers                      = nil;
   CTCarrier                     *stCarrier                                = nil;

   NSDictionary<NSString *, NSString *>   *stRadioAccesses                 = nil;
   NSString                      *szRadioAccess                            = nil;
   
   NSString                      *szCarrierName                            = nil;
   NSString                      *szIP                                     = nil;

   __TRY;
   
   //   CellularSectionDetail    = 0,
   //   CellularSectionDataUsage = 1,
   //   CellularSectionWarning   = 2,
   //   CellularSectionNumber
   
   LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Section : %d, Row : %d", aIndexPath.section, aIndexPath.row));
   
   stTelephonyNetworkInfo  = [[CTTelephonyNetworkInfo alloc] init];

   if (@available(iOS 12.0, *)) {
      
      stCarriers  = stTelephonyNetworkInfo.serviceSubscriberCellularProviders;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Carriers : %@", stCarriers));
      
#if __Debug__
      [stCarriers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, CTCarrier * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Carrier : %@:%@", aKey, aObject));

      }];
#endif /* __Debug__ */
      
      stCarrier   = [stCarriers objectForKey:stCarriers.allKeys.firstObject];
            
      stRadioAccesses   = stTelephonyNetworkInfo.serviceCurrentRadioAccessTechnology;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : RadioAccesses : %@", stRadioAccesses));

#if __Debug__
      [stRadioAccesses enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull aKey, NSString * _Nonnull aObject, BOOL * _Nonnull aStop) {

         LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : RadioAccess : %@:%@", aKey, aObject));

      }];
#endif /* __Debug__ */

      szRadioAccess  = [stRadioAccesses objectForKey:stRadioAccesses.allKeys.firstObject];

   } /* End if () */
   else {
      
      stCarrier   = stTelephonyNetworkInfo.subscriberCellularProvider;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : Carrier : %@", stCarrier));
      
      szRadioAccess  = stTelephonyNetworkInfo.currentRadioAccessTechnology;
      
      LogDebug((@"-[CellularMoreContentController tableView:cellForRowAtIndexPath:] : RadioAccess : %@", szRadioAccess));
      
   } /* End else */
      
   if (CellularSectionDetail == aIndexPath.section) {
      
      stTableViewCell   = self.detailCells[aIndexPath.row];
      
//      CellularDetailCarrier      = 0,
//      CellularDetailISO          = 1,
//      CellularDetailCountry      = 2,
//      CellularDetailNetwork      = 3,
//      CellularDetailRadio        = 4,
//      CellularDetailIPV4         = 5,
//      CellularDetailIPV6         = 6,
//      CellularDetailVoIP         = 7,

      [stTableViewCell.titleLabel setText:stTitles[aIndexPath.row]];
      [stTableViewCell.infoLabel setText:@"N/A"];

      if (CellularDetailCarrier == aIndexPath.row) {
         
         if ((nil == stCarrier) || (YES == kStringIsEmpty(stCarrier.carrierName))){
            
            szCarrierName  = APP_STR(@"No service");
            
         } /* End if () */
         else {
            
            szCarrierName  = stCarrier.carrierName;
            
         } /* End else */
         

         [stTableViewCell.infoLabel setText:szCarrierName];
         
      } /* End if () */
      else if (CellularDetailISO == aIndexPath.row) {
         
         if (NO == kStringIsEmpty(stCarrier.isoCountryCode)) {
            
            [stTableViewCell.infoLabel setText:stCarrier.isoCountryCode];

         } /* End if () */
                  
      } /* End if () */
      else if (CellularDetailCountry == aIndexPath.row) {

         if (NO == kStringIsEmpty(stCarrier.mobileCountryCode)) {
            
            [stTableViewCell.infoLabel setText:stCarrier.mobileCountryCode];

         } /* End if () */

      } /* End if () */
      else if (CellularDetailNetwork == aIndexPath.row) {

         if (NO == kStringIsEmpty(stCarrier.mobileNetworkCode)) {
            
            [stTableViewCell.infoLabel setText:stCarrier.mobileNetworkCode];

         } /* End if () */

      } /* End if () */
      else if (CellularDetailRadio == aIndexPath.row) {

         if (kStringIsEmpty(szRadioAccess)) {
            
            szRadioAccess  = @"N/A";
            
         } /* End if () */

         [stTableViewCell.infoLabel setText:[UIDevice radioTechnologyFor:szRadioAccess]];

      } /* End if () */
      else if (CellularDetailIPV4 == aIndexPath.row) {

         szIP  = [UIDevice ipv4:NetworkCellular];
         
         if (kStringIsEmpty(szIP)) {
            
            szIP           = APP_STR(@"N/A");

         } /* End if () */

         [stTableViewCell.infoLabel setText:szIP];

      } /* End if () */
      else if (CellularDetailIPV6 == aIndexPath.row) {

         szIP  = [UIDevice ipv6:NetworkCellular];
         
         if (kStringIsEmpty(szIP)) {
            
            szIP           = APP_STR(@"N/A");

         } /* End if () */

         [stTableViewCell.infoLabel setText:szIP];

      } /* End if () */
      else if (CellularDetailVoIP == aIndexPath.row) {
         
         if (stCarrier.allowsVOIP) {
            
            [stTableViewCell.infoLabel setText:@"Yes"];

         } /* End if () */
         else {

            [stTableViewCell.infoLabel setText:@"No"];

         } /* End else */
         
      } /* End if () */
      
   } /* End if () */
   else if (CellularSectionDataUsage == aIndexPath.section) {
      
      stTableViewCell   = self.dataUsageCells[aIndexPath.row];
      
      DataUsageInfo  *stDataUsageInfo  = [[DataUsage sharedInstance] getDataUsage];

      if (CellularDataUsageReceived == aIndexPath.row) {
         
         [stTableViewCell.infoLabel setText:[APPUtils byteCountFormat:stDataUsageInfo.wirelessWanDataReceived]];
         
      } /* End if () */
      else if (CellularDataUsageSent == aIndexPath.row) {

         [stTableViewCell.infoLabel setText:[APPUtils byteCountFormat:stDataUsageInfo.wirelessWanDataSent]];

      } /* End if () */

   } /* End if () */
   else if (CellularSectionWarning == aIndexPath.section) {
      
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
      
   __TRY;
         
   __CATCH(nErr);
   
   return;
}

@end

#pragma mark - UIStoryboard
@implementation CellularMoreContentController (UIStoryboard)

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
   
   return @"CELLULAR";
}

@end

#pragma mark - IBAction
@implementation CellularMoreContentController (Action)

- (IBAction)onWarning:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   __CATCH(nErr);

   return;
}

@end
