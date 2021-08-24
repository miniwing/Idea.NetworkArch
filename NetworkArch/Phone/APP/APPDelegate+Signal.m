//
//  APPDelegate+Signal.m
//  NetworkArch
//
//  Created by Harry on 2021/7/31.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "APPDelegate+APP.h"
#import "APPDelegate+Kit.h"

#import "APPDelegate+Inner.h"
#import "APPDelegate+Signal.h"

@implementation APPDelegate (Signal)

@def_signal(networkStatus);

@def_signal(loadApiKey);
@def_signal(loadApiKeyDone);

@def_signal(apiKeySetting);

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
               onQueue:dispatch_get_main_queue()];
      
   }];
   
   if (nil != stURLSessionDataTask) {
      
      [stURLSessionDataTask resume];
      
   } /* End if () */

   __CATCH(nErr);
   
   return;
}

handleSignal(APPDelegate, loadApiKeyDoneSignal) {
   
   int                            nErr                                     = EFAULT;

   NSDictionary                  *stJson                                   = nil;
   NSError                       *stError                                  = nil;
   
   __TRY;
   
   LogDebug((@"-[APPDelegate loadApiKeyDoneSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[APPDelegate loadApiKeyDoneSignal:] : Signal : %@", aSignal.object));

   if (nil != aSignal.object) {
      
      stJson   = [NSJSONSerialization JSONObjectWithData:aSignal.object
                                                 options:NSJSONReadingMutableContainers
                                                   error:&stError];
      
      self.networkArch  = [NetworkArch modelWithJSON:stJson];
      
      [APPDelegate setApiKeySetting:self.networkArch.apiKey];

   } /* End if () */
   else {
      
      self.networkArch  = nil;
      
   } /* End else */
   
   [self postSignal:APPDelegate.apiKeySettingSignal onQueue:dispatch_get_main_queue()];
   
   __CATCH(nErr);
   
   return;
}

@end
