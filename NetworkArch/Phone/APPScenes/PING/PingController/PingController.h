//
//  PingController.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "PingTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * searchView;
//@property (nonatomic, weak)   IBOutlet       UISearchBar                         * searchBar;
@property (nonatomic, weak)   IBOutlet       PingTextField                       * textField;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@end

@interface PingController ()

@end

NS_ASSUME_NONNULL_END
