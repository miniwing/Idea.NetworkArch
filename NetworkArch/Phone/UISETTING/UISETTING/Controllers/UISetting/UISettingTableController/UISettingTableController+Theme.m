//
//  UISettingTableController+Theme.m
//  UISETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "UISettingTableController+Inner.h"
#import "UISettingTableController+Theme.h"

#pragma mark - UITheme
@implementation UISettingTableController (Theme)

- (void)onThemeUpdate:(NSNotification *)aNotification {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[UISettingTableController onThemeUpdate:] : Notification : %@", aNotification));

   [super onThemeUpdate:aNotification];
   
   if ([DKThemeVersionNight isEqualToString:[DKNightVersionManager sharedManager].themeVersion]) {
      
      [self.lightButton setSelected:NO];
      
      if (NO == self.nightButton.isSelected) {
         
         [self.nightButton setSelected:YES];
         
      } /* End if () */
      
   } /* End if () */
   else { // Normal
      
      if (NO == self.lightButton.isSelected) {
         
         [self.lightButton setSelected:YES];
         
      } /* End if () */
      
      [self.nightButton setSelected:NO];
      
   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

@end
