//
//  WoLANRootController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WoLANRootController+Inner.h"
#import "WoLANRootController+Signal.h"
#import "WoLANRootController+Notification.h"
#import "WoLANRootController+Theme.h"
#import "WoLANRootController+Debug.h"

#pragma mark - UITheme
@implementation WoLANRootController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WoLANRootController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
