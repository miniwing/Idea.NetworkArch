//
//  HomeController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "HomeController+Inner.h"
#import "HomeController+Signal.h"

@implementation HomeController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation HomeController (handleSignal)

handleSignal(APPDelegate, apiKeySettingSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[HomeController settingSignal:] : Signal : %@", aSignal));
   
   if ([APPDelegate isApiKeySetting]) {
      
      [self.rightBarButtonItem setTintColorPicker:DKColorPickerWithKey([IDEAColor label])];
      [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarSetting"]];

      [self.rightBarButtonItem setEnabled:YES];
      [self.appBar.navigationBar.rightBarButtonItem setEnabled:YES];

   } /* End if () */
   else {

      [self.rightBarButtonItem setTintColor:UIColor.clearColor];
      [self.rightBarButtonItem setImage:nil];

      [self.rightBarButtonItem setEnabled:NO];
      [self.appBar.navigationBar.rightBarButtonItem setEnabled:NO];

   } /* End else */

   __CATCH(nErr);
   
   return;
}

@end
