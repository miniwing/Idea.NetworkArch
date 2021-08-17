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

#import "DNSController+Signal.h"

#import "DNSContentController+Inner.h"
#import "DNSContentController+Signal.h"
#import "DNSContentController+Notification.h"

@implementation DNSContentController (Signal)

#if __Debug__
@def_signal(self);
#endif /* __Debug__ */

@end

#pragma mark - handleSignal
@implementation DNSContentController (handleSignal)

handleSignal(DNSController, startSignal) {
   
   int                            nErr                                     = EFAULT;
      
   __block NSError               *stError                                  = nil;
   
   __block NSDictionary          *stDNS                                    = nil;
   
   __block DNSModel              *stDNSModel                               = nil;
   __block NSArray<DNSModel *>   *stDNSModels                              = nil;

   __TRY;
      
   LogDebug((@"-[DNSContentController startSignal:] : Signal : %@", aSignal));
   LogDebug((@"-[DNSContentController startSignal:] : Domain : %@", aSignal.object));

   dispatch_async_on_background_queue(^{
      
      [DNSManager fetchIP:aSignal.object
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
                  
                     stDNSModel.address = [stDNSModel.address stringByAppendingFormat:@"%@\n", stTemp.address];

                     continue;
                     
                  } /* End if () */
                  
                  if ([stDNSModel.dnsType isEqualToString:@"AAAA"]) {

                     stDNSModel.address = [stDNSModel.address stringByAppendingFormat:@"%@\n", stTemp.address];

                     continue;

                  } /* End if () */

                  if ([stDNSModel.dnsType isEqualToString:@"NS"]) {

                     stDNSModel.target = [stDNSModel.address stringByAppendingFormat:@"%@\n", stTemp.target];
                     continue;

                  } /* End if () */

                  if ([stDNSModel.dnsType isEqualToString:@"SOA"]) {

                     continue;

                  } /* End if () */

                  if ([stDNSModel.dnsType isEqualToString:@"MX"]) {

//                     self.mxDNSTypeTarget.append(item["target"].stringValue + "\nPriority: " + String(item["priority"].intValue) + "\n\n")

                     stDNSModel.target = [stDNSModel.target stringByAppendingFormat:@"%@\nPriority:%@\n\n", stTemp.target, stTemp.priority];

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

   __CATCH(nErr);

   __RELEASE(stDNSModels);
   __RELEASE(stError);

   return;
}

@end
