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

#import <SettingProvider/SettingProvider.h>

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

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
   
   __block NSString              *szApiKey                                 = nil;
   __block NSString              *szDomain                                 = nil;
   
   __block NSError               *stError                                  = nil;
   __block NSDictionary          *stWhois                                  = nil;
   __block NSString              *szWhois                                  = nil;
   
   __block UIUserInterfaceStyle   eUserInterfaceStyle                      = UIUserInterfaceStyleLight;
   
   __TRY;
   
   LogDebug((@"-[WhoisController startSignal:] : Signal : %@", aSignal));

   szDomain = self.textField.text;
   LogDebug((@"-[WhoisController startSignal:] : Domain : %@", szDomain));

   [CATransaction begin];
   
   [CATransaction setCompletionBlock:^{
   
      if ([APPDATA whoisXmlApi]) {
         
         /**
          * 用户自定义数据
          */
         szApiKey = [SettingProvider xmlApiKey];
         LogDebug((@"-[WhoisController startSignal:] : [SettingProvider xmlApiKey] : %@", szApiKey));

         /**
          * 服务器部署数据
          */
         if (kStringIsBlank(szApiKey)) {
            
            szApiKey = [NetworkArch xmlApiKey];
            LogDebug((@"-[WhoisController startSignal:] : [WhoisController startSignal:] : %@", szApiKey));

         } /* End if () */

         /**
          * 应用内固化数据
          */
         if (NO == [SettingProvider isApiKeySetting]) {
            
            if (kStringIsBlank(szApiKey)) {
               
               szApiKey = [APPDATA xmlAPIKey];
               LogDebug((@"-[WhoisController startSignal:] : [APPDATA xmlAPIKey] : %@", szApiKey));

            } /* End if () */

         } /* End if () */

         if (kStringIsBlank(szApiKey)) {
            
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
            
            [WhoisManager fetchWhoisForDomain:szDomain
                                   withApiKey:szApiKey
                            completionHandler:^(NSData * _Nonnull aData, NSURLResponse * _Nonnull aResponse, NSError * _Nonnull aError) {
               
               LogDebug((@"-[WhoisController startSignal:] : Error    : %@", aError));
               LogDebug((@"-[WhoisController startSignal:] : Response : %@", aResponse));
               
               LogDebug((@"-[WhoisController startSignal:] : JSON : %@", [NSString stringWithData:aData encoding:NSUTF8StringEncoding]));

               if (nil == aError) {
                  
                  stWhois  = [NSDictionary modelWithJSON:aData];
                  LogDebug((@"-[WhoisController startSignal:] : Whois JSON 1 : %@", stWhois));

                  stWhois  = [NSJSONSerialization JSONObjectWithData:aData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&stError];
                  LogDebug((@"-[WhoisController startSignal:] : Whois JSON 2 : %@", stWhois));

                  szWhois  = stWhois[@"WhoisRecord"][@"rawText"];

               } /* End if () */
               else {
                  
                  stError  = aError;
                  
               } /* End else */
               
               LogDebug((@"-[WhoisController startSignal:] : Whois : %@", szWhois));

               [self postSignal:WhoisController.doneSignal
                     withObject:stError
                          input:szWhois ? @{@"Whois" : szWhois} : nil
                        onQueue:DISPATCH_GET_MAIN_QUEUE()];
            }];

         } /* End else */

      } /* End if () */
      else {
                  
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
            
            LogDebug((@"-[WhoisController startSignal:] : Whois : %@", szWhois));

            [self postSignal:WhoisController.doneSignal
                  withObject:stError
                       input:szWhois ? @{@"Whois" : szWhois} : nil
                     onQueue:DISPATCH_GET_MAIN_QUEUE()];
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
   LogDebug((@"-[WhoisController doneSignal:] : Whois  : %@", aSignal.input[@"Whois"]));

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
