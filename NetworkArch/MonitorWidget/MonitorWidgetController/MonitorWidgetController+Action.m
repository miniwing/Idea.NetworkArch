//
//  MonitorWidgetController+Action.m
//  MonitorWidget
//
//  Created by Harry on 2022/11/23.
//  Copyright © 2022 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MonitorWidgetController+Inner.h"
#import "MonitorWidgetController+Action.h"
#import "MonitorWidgetController+Signal.h"
#import "MonitorWidgetController+Notification.h"
#import "MonitorWidgetController+Theme.h"
#import "MonitorWidgetController+Debug.h"

@implementation MonitorWidgetController (Action)

#if __Debug__
- (IBAction)onAction:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

@end
