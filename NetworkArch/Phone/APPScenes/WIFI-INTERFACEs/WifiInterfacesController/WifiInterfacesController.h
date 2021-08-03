//
//  WifiInterfacesController.h
//  NetworkArch
//
//  Created by Harry on 2021/8/4.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface WifiInterfacesController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@end

@interface WifiInterfacesController ()

@end

NS_ASSUME_NONNULL_END
