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

#import "WhoisManager.h"

@interface WhoisManager ()

@end

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
   
   __block NSString              *szURL                                    = nil;
   __block NSURLSessionDataTask  *stURLSessionDataTask                     = nil;
   
   __TRY;
   
   dispatch_async_on_background_queue(^{
      
      szURL = [NSString stringWithFormat:@"%@&domainName=%@", [WhoisManager whoisURL], aDomain];
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
   
   __CATCH(nErr);
   
   return;
}

#pragma mark - URL
// "at_wa51HmNxHCpSNqTTi1UFv38wluCtf"

+ (NSString *)whoisURL {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=%@&outputFormat=JSON", [APPDATA xmlAPIKey]];
}

+ (NSString *)whoisURLWithKey:(NSString *)aKey {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=%@&outputFormat=JSON", aKey];
}

@end
