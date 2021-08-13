//
//  WhoisController+Inner.m
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "WhoisController+Inner.h"

@implementation WhoisController (Inner)

// "at_wa51HmNxHCpSNqTTi1UFv38wluCtf"

+ (NSString *)whoisURL {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=%@&outputFormat=JSON", @"at_wa51HmNxHCpSNqTTi1UFv38wluCtf"];
}

+ (NSString *)whoisURLWithKey:(NSString *)aKey {
   
   return [NSString stringWithFormat:@"https://www.whoisxmlapi.com/whoisserver/WhoisService?apiKey=%@&outputFormat=JSON", aKey];
}

@end
