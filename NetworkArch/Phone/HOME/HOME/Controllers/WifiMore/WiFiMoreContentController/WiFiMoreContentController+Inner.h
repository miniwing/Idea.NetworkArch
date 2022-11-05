//
//  WiFiMoreContentController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WiFiMoreContentController.h"

#import <IDEAKit/UIDevice+Network.h>

#import <APPDriver/DataUsage.h>

NS_ASSUME_NONNULL_BEGIN

@interface WiFiMoreContentController ()

@property (nonatomic, strong)                NSTimer                             * timer;

@property (nonatomic, strong)                NSString                            * externalIPv4;
@property (nonatomic, assign)                BOOL                                  externalIPv4ing;

@end

@interface WiFiMoreContentController (Inner)

- (void)getExternalIPv4;

@end

NS_ASSUME_NONNULL_END
