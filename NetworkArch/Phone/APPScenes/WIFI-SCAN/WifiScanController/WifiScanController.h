//
//  WifiScanController.h
//  NetworkArch
//
//  Created by Harry on 2021/9/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WifiScanCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiScanController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@property (nonatomic, weak)   IBOutlet       UIView                              * emptyView;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * emptyImageView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * emptyLabel;

@end

@interface WifiScanController ()

@end

NS_ASSUME_NONNULL_END
