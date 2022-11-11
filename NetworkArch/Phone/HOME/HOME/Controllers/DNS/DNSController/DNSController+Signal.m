//
//  DNSController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Action.h"
#import "DNSController+Inner.h"
#import "DNSController+Signal.h"
#import "DNSController+Notification.h"
#import "DNSController+Theme.h"
#import "DNSController+Debug.h"

#import "DNSController+AD.h"

@implementation DNSController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(loadAD);

@end

#pragma mark - handleSignal
@implementation DNSController (handleSignal)

#if __Debug__
handleSignal(DNSController, selfSignal) {

   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[DNSController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

handleSignal(DNSController, keyEmptySignal) {

   int                            nErr                                     = EFAULT;

   __TRY;

   LogDebug((@"-[DNSController startSignal:] : Signal : %@", aSignal));

   [self.textField setEnabled:YES];
   [self.activityIndicator setHidden:YES animated:YES];
   [self.activityIndicator stopAnimating];
   
   [self.textField becomeFirstResponder];

   __CATCH(nErr);

   return;
}

handleSignal(DNSController, loadADSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSController loadADSignal:] : Signal : %@", aSignal));

   [self loadAd];
   
   __CATCH(nErr);

   return;
}

@end
