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
#import "DNSContentController+Action.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"
#import "DNSContentController+Theme.h"
#import "DNSContentController+Debug.h"

@implementation DNSContentController (Inner)

- (void)fetchDoneWithError:(NSError *)aError {
   
   int                            nErr                                     = EFAULT;
   
   
   __TRY;
   
   [UIView transitionWithView:self.tableView
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      [self.tableView reloadData];
   }
                   completion:^(BOOL finished) {
      
      [self postNotify:DNSContentController.doneNotification
            withObject:aError
               onQueue:DISPATCH_GET_MAIN_QUEUE()];      
   }];
   
   __CATCH(nErr);
   
   return;
}

#pragma mark -
- (void)startWithDomain:(NSString *)aDomain completion:(void (^ __nullable)(NSError  * _Nullable aError))aCompletion {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSContentController startWithDomain:completion:] : Domain : %@", aDomain));
   
//   [self sendSignal:DNSController.startSignal withObject:aDomain];
   
   __CATCH(nErr);
   
   return;
}


@end

#pragma mark - UITableViewDataSource
@implementation DNSContentController (UITableViewDataSource)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
   
   return self.dns.count;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)aSection {
   
   return 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)aIndexPath {
   
   int                            nErr                                     = EFAULT;
   
   DNSCell                       *stDNSCell                                = nil;
   
   NSArray                       *stKeys                                   = nil;
   DNSModel                      *stDNSModel                               = nil;
   
   __TRY;
      
   stDNSCell   = [aTableView dequeueReusableCellWithIdentifier:DNSCell.reuseIdentifier
                                                  forIndexPath:aIndexPath];
   
   // Configure the cell...
   stKeys      = [self.dns allKeys];
   stDNSModel  = [self.dns objectForKey:[stKeys objectAtIndex:aIndexPath.section]];

   [stDNSCell setDNSModel:stDNSModel];
   
   __CATCH(nErr);
   
   return stDNSCell;
}

- (nullable NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)aSection {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szTitle                                  = nil;
   NSArray                       *stKeys                                   = nil;
   
   __TRY;
   
   stKeys   = [self.dns allKeys];

   szTitle  = [NSString stringWithFormat:@"%@ RECORD", [stKeys objectAtIndex:aSection]];

   __CATCH(nErr);
   
   return szTitle;
}

@end
