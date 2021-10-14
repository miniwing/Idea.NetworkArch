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
#import "LanScanController+Signal.h"
#import "LanScanController+Notification.h"

@implementation LanScanController (Inner)

@end

#pragma mark - PNetMLanScannerDelegate
@implementation LanScanController (PNetMLanScannerDelegate)

- (void)scanMLan:(PNetMLanScanner *)aScanner activeIp:(NSString *)aIP {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   dispatch_async_on_main_queue(^{
      
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
            onQueue:dispatch_get_main_queue()];

   __CATCH(nErr);

   return;
}

@end
