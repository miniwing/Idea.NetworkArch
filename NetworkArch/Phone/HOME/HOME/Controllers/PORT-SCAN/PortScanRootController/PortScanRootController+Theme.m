//
//  PortScanRootController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "PortScanRootController+Inner.h"
#import "PortScanRootController+Signal.h"
#import "PortScanRootController+Notification.h"
#import "PortScanRootController+Theme.h"
#import "PortScanRootController+Debug.h"

#pragma mark - UITheme
@implementation PortScanRootController (Theme)

// #if DK_NIGHT_VERSION
// #endif // #if DK_NIGHT_VERSION
- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PortScanRootController+Theme onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
