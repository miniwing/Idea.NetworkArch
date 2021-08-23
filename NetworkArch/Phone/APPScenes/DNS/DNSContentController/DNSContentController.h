//
//  DNSContentController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNSContentController : IDEATableViewController

@end

@interface DNSContentController ()

- (void)startWithDomain:(NSString *)aDomain completion:(void (^ __nullable)(NSError * _Nullable aError))aCompletion;

@end

NS_ASSUME_NONNULL_END
