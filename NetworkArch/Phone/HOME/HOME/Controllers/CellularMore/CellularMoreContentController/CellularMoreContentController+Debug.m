//
//  CellularMoreContentController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreContentController+Action.h"
#import "CellularMoreContentController+Inner.h"
#import "CellularMoreContentController+Signal.h"
#import "CellularMoreContentController+Notification.h"
#import "CellularMoreContentController+Theme.h"
#import "CellularMoreContentController+Debug.h"

#if __Debug__
@implementation CellularMoreContentController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation CellularMoreContentController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
      
      [self.tableView reloadData];
   });
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
