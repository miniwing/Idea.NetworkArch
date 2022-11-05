//
//  UISettingTableController+Debug.m
//  UISETTING
//
//  Created by Harry on 2021/8/23.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISettingTableController+Debug.h"

#if __Debug__
@implementation UISettingTableController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation UISettingTableController (InjectionIII)

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
