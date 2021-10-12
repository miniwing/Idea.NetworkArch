//
//  LanScanController.h
//  NetworkArch
//
//  Created by Harry on 2021/10/9.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanScanController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * infoView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ssidLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ipLabel;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@end

@interface LanScanController ()

@end

NS_ASSUME_NONNULL_END
