//
//  HomeSettingContentController+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/8/15.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "HomeSettingContentController+Inner.h"
#import "HomeSettingContentController+Action.h"
#import "HomeSettingContentController+Signal.h"
#import "HomeSettingContentController+Notification.h"
#import "HomeSettingContentController+Theme.h"
#import "HomeSettingContentController+Debug.h"

#pragma mark - UITheme
@implementation HomeSettingContentController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeSettingContentController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];

   __CATCH(nErr);

   return;
}

- (UIModalPresentationStyle)modalPresentationStyle {

   LogView((@"-[%@ modalPresentationStyle]", [self class]));

   return UIModalPresentationFullScreen;
}

@end
