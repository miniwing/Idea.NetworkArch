//
//  WiFiMoreContentController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WiFiMoreContentController+Inner.h"

@implementation WiFiMoreContentController (Inner)

- (void)getExternalIPv4 {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;

   self.externalIPv4ing = YES;
   
   dispatch_async_on_background_queue(^{
      
      NSURL    *stURL   = [NSURL URLWithString:@"https://api.ipify.org"];
      
      self.externalIPv4 = [NSString stringWithContentsOfURL:stURL];
      
      if (NO == kStringIsEmpty(self.externalIPv4)) {
         
         dispatch_async_on_main_queue(^{
            
            self.externalIPv4ing = NO;
            
            [UIView transitionWithView:self.detailCells[WifiDetailExternalIPV4]
                              duration:UIAViewAnimationDefaultDuraton
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
               
               [self.detailCells[WifiDetailExternalIPV4].infoLabel setText:self.externalIPv4];
               
            }
                            completion:^(BOOL finished) {
               
            }];
         });
         
      } /* End if () */
   });

   __CATCH(nErr);
   
   return;
}

@end
