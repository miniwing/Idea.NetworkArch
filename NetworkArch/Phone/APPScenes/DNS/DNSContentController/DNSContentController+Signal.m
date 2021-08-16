//
//  DNSContentController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Signal.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation DNSContentController (handleSignal)

handleSignal(DNSController, startSignal) {
   
   int                            nErr                                     = EFAULT;
      
   __block NSError               *stError                                  = nil;

   __TRY;
      
   LogDebug((@"-[DNSContentController startSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[DNSContentController startSignal:] : Domain : %@", aSignal.object));
   
   [DNSManager fetchIP:aSignal.object
     completionHandler:^(NSData * _Nonnull aData, NSURLResponse * _Nonnull aResponse, NSError * _Nonnull aError) {
      
      LogDebug((@"-[DNSContentController startSignal:] : Error    : %@", aError));
      LogDebug((@"-[DNSContentController startSignal:] : Response : %@", aResponse));

      if (nil != aError) {
         
         self.dns = [NSJSONSerialization JSONObjectWithData:aData
                                                    options:NSJSONReadingMutableContainers
                                                      error:&stError];

      } /* End if () */
      
      [self postSignal:DNSController.doneSignal
            withObject:stError
               onQueue:dispatch_get_main_queue()];
   }];

   __CATCH(nErr);

   __RELEASE(stError);

   return;
}

@end
