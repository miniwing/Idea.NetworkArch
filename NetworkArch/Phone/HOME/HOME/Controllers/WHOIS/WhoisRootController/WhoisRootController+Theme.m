//
//  WhoisRootController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisRootController+Inner.h"
#import "WhoisRootController+Signal.h"
#import "WhoisRootController+Notification.h"
#import "WhoisRootController+Theme.h"
#import "WhoisRootController+Debug.h"

#pragma mark - UITheme
@implementation WhoisRootController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WhoisRootController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
