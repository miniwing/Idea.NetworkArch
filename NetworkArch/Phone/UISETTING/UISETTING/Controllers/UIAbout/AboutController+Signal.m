//
//  AboutController+Signal.m
//  Pods
//
//  Created by Harry on 2022/11/26.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "AboutController+Inner.h"
#import "AboutController+Action.h"
#import "AboutController+Signal.h"
#import "AboutController+Notification.h"
#import "AboutController+Theme.h"
#import "AboutController+Debug.h"

@implementation AboutController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation AboutController (handleSignal)

#if __Debug__
handleSignal(AboutController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
