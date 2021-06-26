//
//  HomeContentController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeContentController+Inner.h"
#import "HomeContentController+Debug.h"

#if __Debug__
@implementation HomeContentController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation HomeContentController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   dispatch_async_on_main_queue(^{
      
      [self.tableView reloadData];
   });
   
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
