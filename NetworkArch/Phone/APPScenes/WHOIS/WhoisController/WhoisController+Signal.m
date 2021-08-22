//
//  WhoisController+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisController+Inner.h"
#import "WhoisController+Signal.h"
#import "WhoisController+Notification.h"

@implementation WhoisController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(start);
@def_signal(done);

@end

#pragma mark - handleSignal
@implementation WhoisController (handleSignal)

handleSignal(WhoisController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSString                      *szDomain                                 = nil;
   
   __block NSError               *stError                                  = nil;
   __block NSDictionary          *stWhois                                  = nil;
   __block NSString              *szWhois                                  = nil;

   __TRY;
   
   [self resignFirstResponder];
   
   LogDebug((@"-[WhoisController startSignal:] : Signal : %@", aSignal));
   
   szDomain = self.textField.text;
   LogDebug((@"-[WhoisController startSignal:] : Domain : %@", szDomain));
   
   [WhoisManager fetchWhoisForDomain:szDomain
                   completionHandler:^(NSData * _Nonnull aData, NSURLResponse * _Nonnull aResponse, NSError * _Nonnull aError) {

      LogDebug((@"-[WhoisController startSignal:] : Error    : %@", aError));
      LogDebug((@"-[WhoisController startSignal:] : Response : %@", aResponse));

      if (nil == aError) {
         
         stWhois  = [NSJSONSerialization JSONObjectWithData:aData
                                                    options:NSJSONReadingMutableContainers
                                                      error:&stError];
         
         szWhois  = stWhois[@"WhoisRecord"][@"rawText"];

      } /* End if () */
      else {
         
         stError  = aError;
         
      } /* End else */
                  
      [self postSignal:WhoisController.doneSignal
            withObject:stError
                 input:szWhois ? @{@"Whois" : szWhois} : nil
               onQueue:dispatch_get_main_queue()];
   }];

   __CATCH(nErr);

   __RELEASE(stError);

   return;
}

handleSignal(WhoisController, doneSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[WhoisController doneSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[WhoisController doneSignal:] : Error  : %@", aSignal.object));
   
   if (nil != aSignal.object) {
      
      // occur some error.
      
   } /* End if () */
   else {
      
      [self.textView setText:aSignal.input[@"Whois"]];

   } /* End else */

   @weakify(self);
   [self.activityIndicator setHidden:YES
                            animated:YES
                            complete:^{
      
      @strongify(self);
      [self.activityIndicator stopAnimating];

      if (!kStringIsEmpty(self.textField.text)) {
         
         [self.rightBarButtonItem setEnabled:YES];

      } /* End if () */

      [self.textField setEnabled:YES];

      if (nil != aSignal.object) {
         
         // occur some error.
         [self.textField becomeFirstResponder];
         
      } /* End if () */
      else {
         
         [self.textView setHidden:NO animated:YES];

      } /* End else */
   }];
   
   __CATCH(nErr);
   
   return;
}

@end
