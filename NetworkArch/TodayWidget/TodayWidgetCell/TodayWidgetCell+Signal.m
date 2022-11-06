//
//  TodayWidgetCell+Signal.m
//  TodayWidget
//
//  Created by Harry on 2021/7/24.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "TodayWidgetCell+Signal.h"

@implementation TodayWidgetCell (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation TodayWidgetCell (handleSignal)

#if __Debug__
handleSignal(TodayWidgetCell, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[TodayWidgetCell selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
