//
//  WifiInterfacesCell+Theme.m
//  NetworkArch
//
//  Created by Harry on 2021/8/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WifiInterfacesCell+Theme.h"

#pragma mark - UITheme
@implementation WifiInterfacesCell (Theme)

// #if DK_NIGHT_VERSION
// #endif // #if DK_NIGHT_VERSION
- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WifiInterfacesCell+Theme onThemeUpdate:] : Notification : %@", aNotification));

   if ([super respondsToSelector:@selector(onThemeUpdate:)]) {
      
   } /* End if () */

   __CATCH(nErr);

   return;
}

@end
