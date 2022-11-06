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

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

#import "DNSController+Signal.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@def_signal(keyEmpty);
@def_signal(start);

@end

#pragma mark - handleSignal
@implementation DNSContentController (handleSignal)

#if __Debug__
handleSignal(DNSContentController, selfSignal) {
      
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   LogDebug((@"-[DNSContentController selfSignal:] : Signal : %@", aSignal));

   __CATCH(nErr);

   return;
}
#endif /* __Debug__ */

handleSignal(DNSContentController, startSignal) {
   
   int                            nErr                                     = EFAULT;
   
   __block NSError               *stError                                  = nil;
   
   __block NSString              *szApiKey                                 = nil;

   __block NSDictionary          *stDNS                                    = nil;
   
   __block DNSModel              *stDNSModel                               = nil;
   __block NSArray<DNSModel *>   *stDNSModels                              = nil;
   
   __block UIUserInterfaceStyle   eUserInterfaceStyle                      = UIUserInterfaceStyleLight;

   __TRY;
   
   LogDebug((@"-[DNSContentController startSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[DNSContentController startSignal:] : Domain : %@", aSignal.object));

   DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{
      
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
               
               if ([[aAction title] isEqualToString:__LOCALIZED_STRING(self.class, @"OK")]) {
                  
                  [self postSignal:DNSContentController.keyEmptySignal
                           onQueue:DISPATCH_GET_MAIN_QUEUE()];
                  
               } /* End if () */
               
               return;
            }];
            
         } /* End if () */
         else {
            
            DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{
               
               [DNSManager fetchIP:aSignal.object
                        withApiKey:szApiKey
                 completionHandler:^(NSData * _Nonnull aData, NSURLResponse * _Nonnull aResponse, NSError * _Nonnull aError) {
                  
                  LogDebug((@"-[DNSContentController startSignal:] : Error    : %@", aError));
                  LogDebug((@"-[DNSContentController startSignal:] : Response : %@", aResponse));
                  
                  if (nil == aError) {
                     
                     [self.dns removeAllObjects];
                     
                     stDNS       = [NSJSONSerialization JSONObjectWithData:aData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&stError];
                     
                     stDNSModels = [NSArray modelArrayWithClass:DNSModel.class json:stDNS[@"DNSData"][@"dnsRecords"]];
                     LogDebug((@"-[DNSContentController startSignal:] : DNSModels Count : %d", stDNSModels.count));
                     
                     for (DNSModel *stTemp in stDNSModels) {
                        
                        LogDebug((@"-[DNSContentController startSignal:] : dnsType : %@", stTemp.dnsType));
                        
                        stDNSModel  = [self.dns objectForKey:stTemp.dnsType];
                        
                        if (nil == stDNSModel) {
                           
                           [self.dns setObject:stTemp forKey:stTemp.dnsType];
                           
                           //                  if ([stTemp.dnsType isEqualToString:@"TXT"]) {
                           //
                           ////                     stTemp.string  = [stTemp.strings componentsJoinedByString:@"\n"];
                           //
                           //                     continue;
                           //
                           //                  } /* End if () */
                           
                        } /* End if () */
                        else {
                           
                           if ([stDNSModel.dnsType isEqualToString:@"A"]) {
                              
                              stDNSModel.address = [stDNSModel.address stringByAppendingFormat:@"\n%@", stTemp.address];
                              
                              continue;
                              
                           } /* End if () */
                           
                           if ([stDNSModel.dnsType isEqualToString:@"AAAA"]) {
                              
                              stDNSModel.address = [stDNSModel.address stringByAppendingFormat:@"\n%@", stTemp.address];
                              
                              continue;
                              
                           } /* End if () */
                           
                           if ([stDNSModel.dnsType isEqualToString:@"NS"]) {
                              
                              stDNSModel.target = [stDNSModel.target stringByAppendingFormat:@"\n%@", stTemp.target];
                              continue;
                              
                           } /* End if () */
                           
                           if ([stDNSModel.dnsType isEqualToString:@"SOA"]) {
                              
                              continue;
                              
                           } /* End if () */
                           
                           if ([stDNSModel.dnsType isEqualToString:@"MX"]) {
                              
                              //                     self.mxDNSTypeTarget.append(item["target"].stringValue + "\nPriority: " + String(item["priority"].intValue) + "\n\n")
                              
                              stDNSModel.target = [stDNSModel.target stringByAppendingFormat:@"\n%@\nPriority:%@\n\n", stTemp.target, stTemp.priority];
                              
                              continue;
                              
                           } /* End if () */
                           
                           if ([stDNSModel.dnsType isEqualToString:@"TXT"]) {
                              
                              //                     stDNSModel.string = [stDNSModel.string stringByAppendingString:[stTemp.strings componentsJoinedByString:@"\n"]];
                              NSMutableArray *stStrings  = [NSMutableArray arrayWithArray:stDNSModel.strings];
                              [stStrings addObjectsFromArray:stTemp.strings];
                              
                              stDNSModel.strings         = stStrings;
                              
                              continue;
                              
                           } /* End if () */
                           
                        } /* End else */
                        
                     } /* End for () */
                     
                  } /* End if () */
                  
                  LogDebug((@"-[DNSContentController startSignal:] : DNS Count : %d", self.dns.count));
                  
                  UI_PERFORM_SELECTOR(self, @selector(fetchDoneWithError:), aError, NO);
               }];
            });
            
            
         } /* End else */
         
      } /* End if () */
      
      return;
   });
   
   __CATCH(nErr);
   
   __RELEASE(stDNSModels);
   __RELEASE(stError);
   
   return;
}

@end
