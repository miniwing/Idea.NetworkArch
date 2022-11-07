//
//  APPDelegate+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/31.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <SettingProvider/SettingProvider.h>

#import <APPDATA/APPDATA.h>
#import <APPDATA/NetworkArch.h>

//#import "HOME/HomeController.h"
//#import "HomeController+Notification.h"

#import "APPDelegate+Inner.h"
#import "APPDelegate+Signal.h"

@implementation APPDelegate (Signal)

@def_signal(loadApiKey);
@def_signal(loadApiKeyDone);

@end

#pragma mark - handleSignal
@implementation APPDelegate (handleSignal)

handleSignal(APPDelegate, loadApiKeySignal) {
   
   int                            nErr                                     = EFAULT;
   
   NSURLSessionDataTask          *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate loadApiKeySignal:] : Signal : %@", aSignal));
   LogDebug((@"-[APPDelegate loadApiKeySignal:] : [NetworkArch networkArchApi] : %@", [NetworkArch networkArchApi]));

   stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NetworkArch networkArchApi]]
                                                      completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
      
      LogDebug((@"+[APPDelegate loadApiKeySignal:] : Error    : %@", aError));
      LogDebug((@"+[APPDelegate loadApiKeySignal:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
      LogDebug((@"+[APPDelegate loadApiKeySignal:] : Response : %@", aResponse));
      
      [self postSignal:APPDelegate.loadApiKeyDoneSignal
            withObject:aData
               onQueue:DISPATCH_GET_BACKGROUND_QUEUE()];
      
      return;
   }];
   
   if (nil != stURLSessionDataTask) {
      
      [stURLSessionDataTask resume];
      
   } /* End if () */

   __CATCH(nErr);
   
   return;
}

handleSignal(APPDelegate, loadApiKeyDoneSignal) {
   
   int                            nErr                                     = EFAULT;

   NSError                       *stError                                  = nil;

   NSDictionary                  *stJson                                   = nil;
   NSDictionary                  *stVersion                                = nil;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate loadApiKeyDoneSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[APPDelegate loadApiKeyDoneSignal:] : Signal : %@", aSignal.object));

   if (nil != aSignal.object) {
      
      stJson   = [NSJSONSerialization JSONObjectWithData:aSignal.object
                                                 options:NSJSONReadingMutableContainers
                                                   error:&stError];
      
      if (nil != stJson) {
         
         stVersion   = [stJson objectForKey:[UIApplication sharedApplication].appVersion];
         
      } /* End if () */
      
      if (nil != stVersion) {
         
         [[NetworkArch sharedInstance] modelSetWithDictionary:stVersion];

      } /* End if () */
      
      LogDebug((@"-[APPDelegate loadApiKeyDoneSignal:] : NetworkArch : %@", [[NetworkArch sharedInstance] modelToJSONString]));

      [SettingProvider setApiKeySetting:[NetworkArch apiKey]];
      
   } /* End if () */
   else {

   } /* End else */
   
   [self postNotify:SettingProvider.apiKeySettingNotification
            onQueue:DISPATCH_GET_MAIN_QUEUE()];
   
   __CATCH(nErr);
   
   return;
}

@end
