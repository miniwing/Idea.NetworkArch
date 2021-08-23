//
//  SettingController+Debug.m
//  NetworkArch
//
//  Created by Harry on 2021/8/23.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "SettingController+Debug.h"

#if __Debug__
@implementation SettingController (Debug)

@end
#endif /* __Debug__ */

#if __InjectionIII__
#pragma mark - InjectionIII
@implementation SettingController (InjectionIII)

- (void)injected {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   __CATCH(nErr);
   
   return;
}

@end
#endif /* __InjectionIII__ */
