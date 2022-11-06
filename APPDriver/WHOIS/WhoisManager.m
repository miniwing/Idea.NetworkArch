//
//  WhoisManager.m
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

#import "WhoisManager.h"

@implementation WhoisManager

+ (void)fetchWhoisForDomain:(NSString *)aDomain
                 withApiKey:(NSString *)aXmlApikey
          completionHandler:(void (^)(NSData * aData, NSURLResponse * aResponse, NSError * aError))aCompletionHandler {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szAPIKey                                 = nil;
   __block NSString              *szURL                                    = nil;
   __block NSURLSessionDataTask  *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{

      if (NO == kStringIsBlank(aXmlApikey)) {

         szURL = [WhoisManager whoisURLWithKey:aXmlApikey];

      } /* End if () */
      else {

         szURL = [WhoisManager whoisURL];

      } /* End else */

      szURL = [NSString stringWithFormat:@"%@&domainName=%@", szURL, aDomain];

      LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : URL : %@", szURL));
      
      stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:szURL]
                                                         completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
         
         LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : Error    : %@", aError));
         LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
         LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : Response : %@", aResponse));
         
         if (nil != aCompletionHandler) {
            
            aCompletionHandler(aData, aResponse, aError);
            
         } /* End if () */
      }];
      
      if (nil != stURLSessionDataTask) {
         
         [stURLSessionDataTask resume];
         
      } /* End if () */
   });

   __CATCH(nErr);
   
   return;
}

+ (void)fetchWhoisForDomain:(NSString *)aDomain
          completionHandler:(void (^)(NSData * aData, NSURLResponse * aResponse, NSError * aError))aCompletionHandler {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szURL                                    = nil;
   __block NSURLSessionDataTask  *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{

      szURL = [NSString stringWithFormat:@"%@/%@", [WhoisManager whoisURL], aDomain];

      LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : URL : %@", szURL));
      
      stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:szURL]
                                                         completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
         
         LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : Error    : %@", aError));
         LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
         LogDebug((@"+[WhoisManager fetchWhoisForDomain:withApiKey:completionHandler:] : Response : %@", aResponse));
         
         if (nil != aCompletionHandler) {
            
            aCompletionHandler(aData, aResponse, aError);
            
         } /* End if () */
      }];
      
      if (nil != stURLSessionDataTask) {
         
         [stURLSessionDataTask resume];
         
      } /* End if () */
   });

   __CATCH(nErr);
   
   return;
}

#pragma mark - URL
// "at_wa51HmNxHCpSNqTTi1UFv38wluCtf"

+ (NSString *)whoisURL {
   
   if ([APPDATA whoisXmlApi]) {
      
      return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=%@&outputFormat=JSON", [APPDATA xmlAPIKey]];

   } /* End if () */

   return @"http://api.ivirtex.dev:2137/whois";
}

+ (NSString *)whoisURLWithKey:(NSString *)aKey {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=%@&outputFormat=JSON", aKey];
}

@end
