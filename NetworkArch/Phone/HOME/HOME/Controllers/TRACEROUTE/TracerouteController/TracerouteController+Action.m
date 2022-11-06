//
//  TracerouteController+Action.m
//  Pods
//
//  Created by Harry on 2022/11/6.
//

#import "TracerouteController+Inner.h"
#import "TracerouteController+Action.h"
#import "TracerouteController+Signal.h"
#import "TracerouteController+Notification.h"
#import "TracerouteController+Theme.h"
#import "TracerouteController+Debug.h"

#pragma mark - IBAction
@implementation TracerouteController (Action)

- (IBAction)onBack:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
#if APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR

   [CATransaction begin];

   [CATransaction setCompletionBlock:^{

      [self.navigationController popViewControllerAnimated:YES
                                                completion:nil];

   }];

   [self resignFirstResponder];

   [CATransaction commit];

#else /* APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */

   [self.navigationController popViewControllerAnimated:YES
                                             completion:nil];

#endif /* !APP_CLOSE_KEYBOARD_BEFORE_VIEW_DISAPPEAR */
   
   [self sendSignal:TracerouteController.stopScanSignal];

   __CATCH(nErr);
   
   return;
}

- (IBAction)onStart:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   BOOL                           bStart                                   = NO;
   
   __TRY;

   if (self.icmpSwitch.isOn) {

      if (NO == [[PhoneNetManager shareInstance] isDoingTraceroute]) {
         
         bStart   = YES;
         
      } /* End if () */
   }
   else {
      
      if (NO == [self.udpTraceroute isDoingUdpTraceroute]) {
         
         bStart   = YES;

      } /* End if () */
      
   } /* End else */

   if (bStart) {
      
      [self postSignal:TracerouteController.startScanSignal
            withObject:self.textField.text
               onQueue:dispatch_get_main_queue()];

   } /* End if () */
   else {

      [self postSignal:TracerouteController.stopScanSignal
               onQueue:dispatch_get_main_queue()];

   } /* End else */
   
   __CATCH(nErr);
   
   return;
}

- (IBAction)onICMP:(id)aSender {
   
   int                            nErr                                     = EFAULT;
   
   UISwitch                      *stICMPSwitch                             = nil;
   
   __TRY;
   
   stICMPSwitch   = aSender;
   
   LogDebug((@"-[TracerouteController onICMP:] : ICMP : %@", stICMPSwitch.isOn ? @"ON" : @"OFF"));
   
   [UIView transitionWithView:self.navigationBarX
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{
      
      if (stICMPSwitch.isOn) {
         
         [self setTitle:__LOCALIZED_STRING(self.class, @"ICMP traceroute")];
         [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class,@"ICMP traceroute")];

      } /* End if () */
      else {
         
         [self setTitle:__LOCALIZED_STRING(self.class, @"UDP traceroute")];
         [self.navigationBarX.navigationBar setTitle:__LOCALIZED_STRING(self.class, @"UDP traceroute")];

      } /* End else */
   }
                   completion:^(BOOL finished) {

      [SettingProvider setICMPEnable:stICMPSwitch.isOn];
   }];
      
   __CATCH(nErr);
   
   return;
}

@end
