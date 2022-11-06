//
//  DNSManager.m
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

#import "DNSManager.h"

@interface DNSManager ()

@end

@implementation DNSManager

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

+ (void)fetchIP:(NSString *)aDomain
completionHandler:(void (^)(NSData * aData, NSURLResponse * aResponse, NSError * aError))aCompletionHandler {
   
   int                            nErr                                     = EFAULT;

   __block NSString              *szAPIKey                                 = nil;

   __block NSString              *szURL                                    = nil;
   __block NSURLSessionDataTask  *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   if ([APPDATA whoisXmlApi]) {
      
      DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{
         
//         szAPIKey = [NetworkArch apiKey];
         
         if (NO == kStringIsBlank(szAPIKey)) {
            
            szURL = [DNSManager DNSServiceURLWithKey:szAPIKey];
            
         } /* End if () */
         else {
            
            szURL = [DNSManager DNSServiceURL];
            
         } /* End else */

         szURL = [NSString stringWithFormat:@"%@&domainName=%@", szURL, aDomain];
         LogDebug((@"+[DNSManager fetchIP:completionHandler:] : URL : %@", szURL));
         
         stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:szURL]
                                                            completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
            
            LogDebug((@"+[DNSManager fetchIP:completionHandler:] : Error    : %@", aError));
            LogDebug((@"+[DNSManager fetchIP:completionHandler:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
            LogDebug((@"+[DNSManager fetchIP:completionHandler:] : Response : %@", aResponse));
            
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
      
      
      
   } /* End else */
      
   __CATCH(nErr);
   
   return;
}

+ (void)fetchIP:(NSString *)aDomain
     withApiKey:(NSString *)aXmlApikey
completionHandler:(void (^)(NSData * aData, NSURLResponse * aResponse, NSError * aError))aCompletionHandler {
   
   int                            nErr                                     = EFAULT;

   __block NSString              *szURL                                    = nil;
   __block NSURLSessionDataTask  *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   if ([APPDATA whoisXmlApi]) {
      
      DISPATCH_ASYNC_ON_BACKGROUND_QUEUE(^{
                  
         if (NO == kStringIsBlank(aXmlApikey)) {
            
            szURL = [DNSManager DNSServiceURLWithKey:aXmlApikey];
            
         } /* End if () */
         else {
            
            szURL = [DNSManager DNSServiceURL];
            
         } /* End else */

         szURL = [NSString stringWithFormat:@"%@&domainName=%@", szURL, aDomain];
         LogDebug((@"+[DNSManager fetchIP:completionHandler:] : URL : %@", szURL));
         
         stURLSessionDataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:szURL]
                                                            completionHandler:^(NSData * _Nullable aData, NSURLResponse * _Nullable aResponse, NSError * _Nullable aError) {
            
            LogDebug((@"+[DNSManager fetchIP:completionHandler:] : Error    : %@", aError));
            LogDebug((@"+[DNSManager fetchIP:completionHandler:] : Data     : %@", [NSString stringWithUTF8Data:aData]));
            LogDebug((@"+[DNSManager fetchIP:completionHandler:] : Response : %@", aResponse));
            
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
      
      
      
   } /* End else */
      
   __CATCH(nErr);
   
   return;
}

#pragma mark - URL
// "at_wa51HmNxHCpSNqTTi1UFv38wluCtf"

+ (NSString *)DNSServiceURL {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/DNSService?apiKey=%@&type=_all&outputFormat=JSON",  [APPDATA xmlAPIKey]];
}

+ (NSString *)DNSServiceURLWithKey:(NSString *)aKey {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/DNSService?apiKey=%@&type=_all&outputFormat=JSON", aKey];
}

@end
