//
//  PortScanController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <PhoneNetSDK/PhoneNetSDK.h>

#import "PortScanController+Inner.h"
#import "PortScanController+Action.h"
#import "PortScanController+Signal.h"
#import "PortScanController+Notification.h"
#import "PortScanController+Theme.h"
#import "PortScanController+Debug.h"

#import "PortScanController+AD.h"

@implementation PortScanController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startScan);
@def_signal(stopScan);

@def_signal(loadAD);

@end

#pragma mark - handleSignal
@implementation PortScanController (handleSignal)

handleSignal(PortScanController, startScanSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szHost                                   = nil;
   NSString                      *szBeginPort                              = nil;
   NSString                      *szEndPort                                = nil;
   
   NSUInteger                     nBeginPort                               = 20;
   NSUInteger                     nEndPort                                 = 10000;
   
   __TRY;
   
   //   @{
   //      @"ip"    : self.textField.text,
   //      @"begin" : self.fromPortTextField.text,
   //      @"end"   : self.toPortTextField.text,
   //   }
   LogDebug((@"-[PortScanController startScanSignal:] : Signal : %@", aSignal.input));
   
   [self resignFirstResponder];
   
   [UIView transitionWithView:self.navigationBarX
                     duration:[UIView animationDefaultDuration]
                      options:UIViewAnimationOptionTransitionCrossDissolve
                   animations:^{

      [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarStop"] forState:UIControlStateNormal];
      [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemRed])];
   }
                   completion:^(BOOL finished) {

      [self.textField setEnabled:NO];
   }];
   
   [self.fromPortTextField setEnabled:NO];
   [self.toPortTextField setEnabled:NO];
   
   __RELEASE(self.portScanRes);
   [self.textView setText:nil];
   
   szHost      = [aSignal.input objectForKey:@"ip"];
   szBeginPort = [aSignal.input objectForKey:@"begin"];
   szEndPort   = [aSignal.input objectForKey:@"end"];
   
   if (!kStringIsEmpty(szBeginPort)) {
      
      nBeginPort  = [szBeginPort integerValue];
      
   } /* End if () */
   LogDebug((@"-[PortScanController startScanSignal:] : BeginPort : %ld", nBeginPort));
   
   if (!kStringIsEmpty(szEndPort)) {
      
      nEndPort    = [szEndPort integerValue];
      
   } /* End if () */
   LogDebug((@"-[PortScanController startScanSignal:] : EndPort : %ld", nEndPort));
   
   [[PhoneNetManager shareInstance] netPortScan:szHost
                                      beginPort:nBeginPort
                                        endPort:nEndPort
                                    scanHandler:^(NSString * _Nullable aPort, BOOL isOpen, PNError * _Nullable sdkError) {
      
      LogDebug((@"-[PortScanController startScanSignal:] : PortScan : Port : %@", aPort));
      
      DISPATCH_ASYNC_ON_MAIN_QUEUE(^{
         
         self.portScaningLabel.text = aPort;
      });
      
      if (sdkError) {
         
         self.portScanRes = [NSMutableString stringWithString:sdkError.error.description] ;
         
         dispatch_async_on_main_queue(^{
            
            self.textView.text = self.portScanRes;
         });
         
      } /* End if () */
      else {
         
         if (isOpen) {
            
            if (nil == self.portScanRes) {
               
               self.portScanRes  = [NSMutableString stringWithFormat:@"Open TCP port:  %@", aPort];
               
            } /* End if () */
            else {

               [self.portScanRes appendString:[NSString stringWithFormat:@"Open TCP port:  %@", aPort]];

            } /* End else */
            
            [self.portScanRes appendString:@"\n"];
            
            dispatch_async_on_main_queue(^{
               
               self.textView.text = self.portScanRes;
            });
         } /* End if () */
         
      } /* End else */
   }
                                completeHandler:^{
      
      LogDebug((@"-[PortScanController startScanSignal:] : PortScan : completeHandler"));
      
      [self postSignal:PortScanController.stopScanSignal
               onQueue:dispatch_get_main_queue()];
   }];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(PortScanController, stopScanSignal) {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [self resignFirstResponder];
   
   [self.rightBarButton setImage:[ImageProvider imageNamed:@"UIButtonBarPlay"] forState:UIControlStateNormal];
   [self.rightBarButton setTintColorPicker:DKColorPickerWithKey([IDEAColor systemGreen])];

   [self.textField setEnabled:YES];
   [self.fromPortTextField setEnabled:YES];
   [self.toPortTextField setEnabled:YES];

   [[PhoneNetManager shareInstance] netStopPortScan];
   
   __CATCH(nErr);
   
   return;
}

handleSignal(PortScanController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[PortScanController loadADSignal:] : Signal : %@", aSignal));

   [self loadAd];
   
   __CATCH(nErr);

   return;
}

@end
