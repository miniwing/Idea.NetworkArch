//
//  LanScanController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanController+Inner.h"
#import "LanScanController+Action.h"
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"
#import "LanScanController+Theme.h"
#import "LanScanController+Debug.h"

@implementation LanScanController (Inner)

@end

#pragma mark - UIStoryboard
@implementation LanScanController (UIStoryboard)

+ (NSString *)storyboard {
   
   return @"UTILITIES";
}

+ (NSString *)bundle {

   return @(BUNDLE);
}

@end

#pragma mark - UITableViewDataSource
@implementation LanScanController (UITableViewDataSource)

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
//
//   return 0;
//}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   return self.activeIPs.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   LanScanCell                   *stLanScanCell                            = nil;
   
   NSString                      *szIP                                     = nil;
   
   __TRY;
   
   stLanScanCell = [aTableView dequeueReusableCellWithIdentifier:LanScanCell.reuseIdentifier
                                                           forIndexPath:aIndexPath];

   szIP  = [self.activeIPs objectAtIndex:aIndexPath.row];
   
   [stLanScanCell setIP:szIP];
   
   if (1 == self.activeIPs.count) {
      
      [stLanScanCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight];
      
      [stLanScanCell.separatorView setHidden:YES];
      
   } /* End if () */
   else {
      
      if (0 == aIndexPath.row) {
         
         [stLanScanCell setRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
         [stLanScanCell.separatorView setHidden:NO];
         
      } /* End if () */
      else if (self.activeIPs.count - 1 == aIndexPath.row) {
         
         [stLanScanCell setRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
         [stLanScanCell.separatorView setHidden:YES];
         
      } /* End else if () */
      else {
         
         [stLanScanCell setRectCorner:0];
         [stLanScanCell.separatorView setHidden:NO];
         
      } /* End else */
      
   } /* End else */

   __CATCH(nErr);
   
   return stLanScanCell;
}

@end

#pragma mark - PNetMLanScannerDelegate
@implementation LanScanController (PNetMLanScannerDelegate)

- (void)scanMLan:(PNetMLanScanner *)aScanner activeIp:(NSString *)aIP {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
      
      [self.activeIPs addObject:aIP];
      [self.tableView reloadData];
   });
   
   __CATCH(nErr);

   return;
}

- (void)scanMlan:(PNetMLanScanner *)aScanner percent:(float)aPercent {
   
//   int                            nErr                                     = EFAULT;
//
//   __TRY;
   
   LogDebug((@"-[LanScanController scanMlan:percent:] : %d%%", (int)(aPercent * 100)));
   
//   __CATCH(nErr);

   return;
}

- (void)finishedScanMlan:(PNetMLanScanner *)aScanner {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   [self postSignal:LanScanController.stopScanSignal
            onQueue:DISPATCH_GET_MAIN_QUEUE()];

   __CATCH(nErr);

   return;
}

@end

#pragma mark - IDEA_MAIN
IDEA_MAIN() {
   
   LogDebug((@"LanScanController::IDEA_MAIN"));
   
   [IDEAUIRouter registerURLPattern:@"LANSCAN/create"
                          toHandler:^(NSString *aURL, NSDictionary *aRouter, IDEAUIRouterCompletion aCompletion) {
      
      LogDebug((@"LanScanController::IDEA_MAIN : URL      : %@", aURL));
      LogDebug((@"LanScanController::IDEA_MAIN : Router   : %@", aRouter));
      
      LanScanController *stController  = [UIStoryboard loadStoryboard:LanScanController.storyboard
                                                       viewController:LanScanController.class
                                                             inBundle:LanScanController.bundle];
      
      if (nil != aCompletion) {
         
         aCompletion(aURL, nil, stController);
         
      } /* End if () */
   }];
   
   return;
}
