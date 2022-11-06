//
//  CellularMoreRootController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CellularMoreRootController+Inner.h"
#import "CellularMoreRootController+Signal.h"
#import "CellularMoreRootController+Notification.h"
#import "CellularMoreRootController+Theme.h"
#import "CellularMoreRootController+Debug.h"

#pragma mark - UITheme
@implementation CellularMoreRootController (Theme)

// #if DK_NIGHT_VERSION
// #endif // #if DK_NIGHT_VERSION
- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[CellularMoreRootController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
