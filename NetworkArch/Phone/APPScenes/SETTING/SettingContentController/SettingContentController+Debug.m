//
//  SettingContentController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/8/23.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "SettingContentController+Debug.h"

#if __Debug__
@implementation SettingContentController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation SettingContentController (InjectionIII)

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
