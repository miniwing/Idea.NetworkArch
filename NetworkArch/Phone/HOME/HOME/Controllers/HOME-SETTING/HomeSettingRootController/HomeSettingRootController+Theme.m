//
//  HomeSettingRootController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingRootController+Inner.h"
#import "HomeSettingRootController+Signal.h"
#import "HomeSettingRootController+Notification.h"
#import "HomeSettingRootController+Theme.h"
#import "HomeSettingRootController+Debug.h"

#pragma mark - UITheme
@implementation HomeSettingRootController (Theme)

// #if DK_NIGHT_VERSION
// #endif // #if DK_NIGHT_VERSION
- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeSettingRootController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
