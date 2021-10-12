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

#import "PortScanController+Signal.h"

@implementation PortScanController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(startScan);
@def_signal(stopScan);

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
   
   LogDebug((@"-[PortScanController startScanSignal:] : Signal : %@", aSignal.input));
   
   [self resignFirstResponder];
   
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarStop"]];
   
   [self.textField setEnabled:NO];
   [self.fromPortTextField setEnabled:NO];
   [self.toPortTextField setEnabled:NO];

//   @{
//      @"ip"    : self.textField.text,
//      @"begin" : self.fromPortTextField.text,
//      @"end"   : self.toPortTextField.text,
//   }
   
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

   __CATCH(nErr);
   
   return;
}

handleSignal(PortScanController, stopScanSignal) {
   
   int                            nErr                                     = EFAULT;
      
   __TRY;
   
   [self resignFirstResponder];
   
   [self.rightBarButtonItem setImage:[UIImage imageNamed:@"UIButtonBarPlay"]];

   [self.textField setEnabled:YES];

   __CATCH(nErr);
   
   return;
}

@end
