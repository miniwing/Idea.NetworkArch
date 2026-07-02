//
//  HomeContentController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeContentController+Inner.h"
#import "HomeContentController+Action.h"
#import "HomeContentController+Signal.h"
#import "HomeContentController+Notification.h"
#import "HomeContentController+Theme.h"
#import "HomeContentController+Debug.h"

#import "HomeContentController+AD.h"

#pragma mark - UITheme
@implementation HomeContentController (Theme)

// #if DK_NIGHT_VERSION
// #endif // #if DK_NIGHT_VERSION
- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeContentController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

@end
