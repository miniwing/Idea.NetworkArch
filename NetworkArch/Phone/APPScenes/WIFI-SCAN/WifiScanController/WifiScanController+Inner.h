//
//  WifiScanController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/9/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import <IDEALanScan/MMLANScanner.h>

#import "WifiScanController.h"
#import "WifiScanResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiScanController () <UITableViewDelegate, UITableViewDataSource, MMLANScannerDelegate>

@property (nonatomic, strong)                MDCAppBar                           * appBar;

@property (nonatomic, strong)                MMLANScanner                        * lanScanner;

//@property (nonatomic, strong)                NSMutableArray<WifiScanResult *>    * wifiScanResults;
@property (nonatomic, strong)                NSArray<WifiScanResult *>           * wifiScanResults;

@property (nonatomic, strong)                NSMutableArray<MMDevice *>          * devices;

@end

@interface WifiScanController ()

@property (nonatomic, assign, getter = isScaning)  BOOL                            scaning;

@end

@interface WifiScanController (Inner)

@end

NS_ASSUME_NONNULL_END
