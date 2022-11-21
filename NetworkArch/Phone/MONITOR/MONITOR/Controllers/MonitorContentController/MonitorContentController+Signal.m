//
//  MonitorContentController+Signal.m
//  MONITOR
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorContentController+Inner.h"
#import "MonitorContentController+Action.h"
#import "MonitorContentController+Signal.h"
#import "MonitorContentController+Notification.h"
#import "MonitorContentController+Theme.h"
#import "MonitorContentController+Debug.h"

@implementation MonitorContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadAD);

@def_signal(battery);

@end

#pragma mark - handleSignal
@implementation MonitorContentController (handleSignal)

#if __Debug__
handleSignal(MonitorContentController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

handleSignal(MonitorContentController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeContentController loadADSignal:] : Signal : %@", aSignal));
   
   __CATCH(nErr);

   return;
}

handleSignal(MonitorContentController, batterySignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}

@end
