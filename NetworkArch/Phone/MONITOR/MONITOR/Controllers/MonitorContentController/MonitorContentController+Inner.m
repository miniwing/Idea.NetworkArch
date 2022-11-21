//
//  MonitorContentController+Inner.m
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorContentController+Inner.h"
#import "MonitorContentController+Action.h"
#import "MonitorContentController+Signal.h"
#import "MonitorContentController+Notification.h"
#import "MonitorContentController+Theme.h"
#import "MonitorContentController+Debug.h"

@implementation MonitorContentController (Inner)

- (void)loadBattery {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}

@end

#pragma mark - UIStoryboard
@implementation MonitorContentController (UIStoryboard)

+ (NSString *)storyboard {

   return @"MONITOR";
}

+ (NSString *)bundle {
   
   return @(BUNDLE);
}

@end

#pragma mark - UITableViewDataSource
@implementation MonitorContentController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return MonitorSectionNumber;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
      
   return 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   UITableViewCellX              *stTableViewCell                          = nil;

   __TRY;
   
//   MonitorSectionBattery   = 0,
//   MonitorSectionNetwork,
//   MonitorSectionCPU,
//   MonitorSectionDrive,
//   MonitorSectionMemory,
//   MonitorSectionNumber

   if (MonitorSectionBattery == aIndexPath.section) {
      
      stTableViewCell   = self.batteryCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End if () */
   else if (MonitorSectionNetwork == aIndexPath.section) {
      
      stTableViewCell   = self.networkCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */
   else if (MonitorSectionCPU == aIndexPath.section) {
      
      stTableViewCell   = self.cpuCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */
   else if (MonitorSectionDrive == aIndexPath.section) {
      
      stTableViewCell   = self.driveCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */
   else if (MonitorSectionMemory == aIndexPath.section) {
      
      stTableViewCell   = self.memoryCell;
      
      if (@available(iOS 13, *)) {

      } /* End if () */
      else {
         
         [stTableViewCell setRectCorner:UIRectCornerAllCorners];

      } /* End else */

   } /* End else if () */

   __CATCH(nErr);
   
   return stTableViewCell;
}

@end
