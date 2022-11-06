//
//  HomeController+Notification.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <SettingProvider/SettingProvider.h>

#import "HomeController+Inner.h"
#import "HomeController+Signal.h"
#import "HomeController+Notification.h"

@implementation HomeController (Notification)

#if __Debug__
@def_notification(self);
#endif /* __Debug__ */

@def_notification(setting);

@end

#pragma mark - handleNotification
@implementation HomeController (handleNotification)

handleNotification(HomeController, settingNotification) {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   LogDebug((@"-[HomeController settingNotification:] : %@", aNotification));
      
   __CATCH(nErr);
   
   return;
}

@end
