//
//  DNSController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "DNSController+Inner.h"
#import "DNSController+Signal.h"

@implementation DNSController (Inner)

// "at_wa51HmNxHCpSNqTTi1UFv38wluCtf"

+ (NSString *)DNSServiceURL {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/DNSService?apiKey=%@&type=_all&outputFormat=JSON", @"at_wa51HmNxHCpSNqTTi1UFv38wluCtf"];
}

+ (NSString *)DNSServiceURLWithKey:(NSString *)aKey {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/DNSService?apiKey=%@&type=_all&outputFormat=JSON", aKey];
}

@end
