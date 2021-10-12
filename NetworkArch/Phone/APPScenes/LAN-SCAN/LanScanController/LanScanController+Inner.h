//
//  LanScanController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "LanScanController.h"

#import "LanScanCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LanScanController () <PNetMLanScannerDelegate>

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@end

@interface LanScanController ()

@property (nonatomic, strong)                NSMutableArray<NSString *>          * activeIPs;

@end

@interface LanScanController (Inner)

@end

@interface LanScanController (PNetMLanScannerDelegate)

- (void)scanMLan:(PNetMLanScanner *)aScanner activeIp:(NSString *)aIP;

- (void)scanMlan:(PNetMLanScanner *)aScanner percent:(float)aPercent;

- (void)finishedScanMlan:(PNetMLanScanner *)aScanner;

@end

NS_ASSUME_NONNULL_END
