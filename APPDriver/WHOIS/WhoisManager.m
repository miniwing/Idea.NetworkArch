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
#import <APPDATA/NetworkArch+Storage.h>

#import "WhoisManager.h"

@implementation WhoisManager

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)init {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
            
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

+ (void)fetchWhoisForDomain:(NSString *)aDomain
          completionHandler:(void (^)(NSData * aData, NSURLResponse * aResponse, NSError * aError))aCompletionHandler {
   
   int                            nErr                                     = EFAULT;
   
   __block NSString              *szAPIKey                                 = nil;
   __block NSString              *szURL                                    = nil;
   __block NSURLSessionDataTask  *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   if ([APPDATA whoisXmlApi]) {
      
      DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{

         szAPIKey = [NetworkArch apiKey];

         if (NO == kStringIsBlank(szAPIKey)) {

            szURL = [WhoisManager whoisURLWithKey:szAPIKey];

         } /* End if () */
         else {

            szURL = [WhoisManager whoisURL];

         } /* End else */

         szURL = [NSString stringWithFormat:@"%@&domainName=%@", szURL, aDomain];

         LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : URL : %@", szURL));
         
         stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:szURL]
                                                            completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
            
            LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : Error    : %@", aError));
            LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
            LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : Response : %@", aResponse));
            
            if (nil != aCompletionHandler) {
               
               aCompletionHandler(aData, aResponse, aError);
               
            } /* End if () */
         }];
         
         if (nil != stURLSessionDataTask) {
            
            [stURLSessionDataTask resume];
            
         } /* End if () */
      });

   } /* End if () */
   else {
      
      DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{

         szURL = [NSString stringWithFormat:@"%@/%@", [WhoisManager whoisURL], aDomain];

         LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : URL : %@", szURL));
         
         stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:szURL]
                                                            completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
            
            LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : Error    : %@", aError));
            LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
            LogDebug((@"+[WhoisManager fetchWhoisForDomain:completionHandler:] : Response : %@", aResponse));
            
            if (nil != aCompletionHandler) {
               
               aCompletionHandler(aData, aResponse, aError);
               
            } /* End if () */
         }];
         
         if (nil != stURLSessionDataTask) {
            
            [stURLSessionDataTask resume];
            
         } /* End if () */
      });

   } /* End else */
      
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
