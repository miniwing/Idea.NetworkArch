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
#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>
#import <APPDATA/NetworkArch+Storage.h>

#import "WhoisController+Inner.h"
#import "WhoisController+Action.h"
#import "WhoisController+Signal.h"
#import "WhoisController+Notification.h"
#import "WhoisController+Theme.h"
#import "WhoisController+Debug.h"

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
   
   NSString                      *szApiKey                                 = nil;
   __block NSString              *szDomain                                 = nil;

   __block NSError               *stError                                  = nil;
   __block NSDictionary          *stWhois                                  = nil;
   __block NSString              *szWhois                                  = nil;

   __block UIUserInterfaceStyle   eUserInterfaceStyle                      = UIUserInterfaceStyleLight;

   __TRY;
   
   LogDebug((@"-[WhoisController startSignal:] : Signal : %@", aSignal));

   if ([APPDATA whoisXmlApi]) {
      
      szApiKey = [NetworkArch apiKey];
      LogDebug((@"-[WhoisController startSignal:] : ApiKey : %@", szApiKey));

   } /* End if () */

   [CATransaction begin];
   
   [CATransaction setCompletionBlock:^{
      
      if ([APPDATA whoisXmlApi] && kStringIsBlank(szApiKey)) {

         if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNight]) {

            eUserInterfaceStyle  = UIUserInterfaceStyleDark;

         } /* End if () */
         else { // if ([[DKNightVersionManager sharedManager].themeVersion isEqualToString:DKThemeVersionNormal])

            eUserInterfaceStyle  = UIUserInterfaceStyleLight;

         } /* End if () */

         [UIAlertController showActionSheetInViewController:self
                                         userInterfaceStyle:eUserInterfaceStyle
                                                  withTitle:__LOCALIZED_STRING(self.class, @"API Key Empty")
                                                    message:__LOCALIZED_STRING(self.class, @"PRESS OK TO GET (FREE).")
                                          cancelButtonTitle:__LOCALIZED_STRING(self.class, @"Cancel")
                                     destructiveButtonTitle:__LOCALIZED_STRING(self.class, @"OK")
                                          otherButtonTitles:nil
                         popoverPresentationControllerBlock:^(UIPopoverPresentationController *aPopover) {
            
         }
                                                   tapBlock:^(UIAlertController *aController, UIAlertAction *aAction, NSInteger aButtonIndex) {
            
            [self.rightBarButtonItem setEnabled:!kStringIsBlank(self.textField.text)];

            [self.textField setEnabled:YES];

            [self.activityIndicator setHidden:YES animated:YES];
            [self.activityIndicator stopAnimating];
            
            if ([[aAction title] isEqualToString:__LOCALIZED_STRING(self.class, @"OK")]) {
               
//               [self postNotify:HomeController.settingNotification
//                        onQueue:DISPATCH_GET_MAIN_QUEUE()];

            } /* End if () */
            else {
               
               [self.textField becomeFirstResponder];

            } /* End else */
         }];
         
      } /* End if () */
      else {
         
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
               
               szWhois  = stWhois[@"response"];
               
            } /* End if () */
            else {
               
               stError  = aError;
               
            } /* End else */
            
            [self postSignal:WhoisController.doneSignal
                  withObject:stError
                       input:szWhois ? @{@"Whois" : szWhois} : nil
                     onQueue:dispatch_get_main_queue()];
         }];
         
      } /* End else */
   }];

   [self resignFirstResponder];

   [CATransaction commit];

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
