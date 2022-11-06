//
//  LanScanRootController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "LanScanRootController+Inner.h"
#import "LanScanRootController+Signal.h"
#import "LanScanRootController+Notification.h"
#import "LanScanRootController+Theme.h"
#import "LanScanRootController+Debug.h"

#pragma mark - UITheme
@implementation LanScanRootController (Theme)

// #if DK_NIGHT_VERSION
// #endif // #if DK_NIGHT_VERSION
- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[LanScanRootController+Theme onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
