//
//  DNSContentController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "DNSContentController.h"

#import "DNSCell+Inner.h"
#import "DNSCell+Signal.h"
#import "DNSCell+Notification.h"

#import "DNSManager.h"
#import "DNSManager+Singleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNSContentController ()

@property (nonatomic, strong)                NSDictionary                        * dns;

@end

@interface DNSContentController (Inner)

@end

NS_ASSUME_NONNULL_END
