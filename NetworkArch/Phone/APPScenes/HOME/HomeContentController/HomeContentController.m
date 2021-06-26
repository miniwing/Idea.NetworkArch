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

@interface HomeContentController ()

@end

@implementation HomeContentController

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
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)viewDidLoad {

   int                            nErr                                     = EFAULT;

   __TRY;

   [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;acki

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

   [self.tableView setTableFooterView:[UIView new]];
   [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

   [self.tableView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];

   dispatch_async_on_main_queue(^{
      
      [self.wifiCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
      [self.wifiCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];

      [self.cellularCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
      [self.cellularCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];

      [self.utilitiesCellContainerViews.firstObject setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight radius:8];
      [self.utilitiesCellContainerViews.lastObject setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight radius:8];
   });
   
   for (UIView *stView in self.wifiCellContainerViews) {
      
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

   for (UIView *stView in self.cellSeparatorViews) {
      
      [stView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor separator])];

   } /* End for () */

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

//#pragma mark - UITableViewDataSource
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
   
   UITableViewCell               *stTableViewCell                          = nil;
   
   __TRY;
   
//   HomeSectionWifi      = 0,
//   HomeSectionCellular  = 1,
//   HomeSectionUtilities = 2,

   if (HomeSectionWifi == aIndexPath.section) {
      
      stTableViewCell   = self.wifiCells[aIndexPath.row];
      
   } /* End if () */
   else if (HomeSectionCellular == aIndexPath.section) {
      
      stTableViewCell   = self.cellularCells[aIndexPath.row];
      
   } /* End if () */
   else if (HomeSectionUtilities == aIndexPath.section) {
      
      stTableViewCell   = self.utilitiesCells[aIndexPath.row];
      
   } /* End if () */
   
   if (nil != stTableViewCell) {
            
//      [stTableViewCell setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];
//      [stTableViewCell.contentView setBackgroundColorPicker:DKColorPickerWithKey([IDEAColor tertiarySystemGroupedBackground])];

      [stTableViewCell setBackgroundColor:UIColor.clearColor];
      [stTableViewCell.contentView setBackgroundColor:UIColor.clearColor];

   } /* End if () */
   
   __CATCH(nErr);
   
   return stTableViewCell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)aTableView canEditRowAtIndexPath:(NSIndexPath *)aIndexPath {

   // Return NO if you do not want the specified item to be editable.
   return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)aEditingStyle forRowAtIndexPath:(NSIndexPath *)aIndexPath {

   if (aEditingStyle == UITableViewCellEditingStyleDelete) {

      // Delete the row from the data source
      [aTableView deleteRowsAtIndexPaths:@[aIndexPath] withRowAnimation:UITableViewRowAnimationFade];
      
   }
   else if (aEditingStyle == UITableViewCellEditingStyleInsert) {

      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }

   return;
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)aTableView moveRowAtIndexPath:(NSIndexPath *)aFromIndexPath toIndexPath:(NSIndexPath *)aToIndexPath {

   return;
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)aTableView canMoveRowAtIndexPath:(NSIndexPath *)aIndexPath {

   // Return NO if you do not want the item to be re-orderable.
   return YES;
}
*/

@end

#pragma mark - IBAction
@implementation HomeContentController (IBACTION)

- (IBAction)onAction:(id)aSender {

   int                            nErr                                     = EFAULT;

   __TRY;

   __CATCH(nErr);

   return;
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
