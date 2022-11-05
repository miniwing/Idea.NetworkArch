//
//  RootViewController+Theme.m
//  NuclearWater
//
//  Created by Harry on 2022/10/19.
//  Copyright © 2022 Harry. All rights reserved.
//

#import <IDEATypeFace/IDEATypeFace.h>
#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "RootViewController+Inner.h"
#import "RootViewController+Theme.h"

@implementation RootViewController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[RootViewController onThemeUpdate:] : Notification : %@", aNotification));

   [UIView animateWithDuration:DKNightVersionAnimationDuration
                    animations:^(void) {
      
      [self setNeedsStatusBarAppearanceUpdate];
   }];

   __CATCH(nErr);

   return;
}

@end
