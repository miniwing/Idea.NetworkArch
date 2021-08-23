//
//  DNSContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSContentController (Inner)

- (void)fetchDoneWithError:(NSError *)aError {
   
   int                            nErr                                     = EFAULT;
   
   
   __TRY;
   
   [UIView transitionWithView:self.tableView
                     duration:UIAViewAnimationDefaultDuraton
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.tableView reloadData];
   }
                   completion:^(BOOL finished) {
      
      [self postSignal:DNSController.doneSignal
            withObject:aError
               onQueue:dispatch_get_main_queue()];
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
