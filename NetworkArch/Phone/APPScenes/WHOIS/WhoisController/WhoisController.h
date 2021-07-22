//
//  WhoisController.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface WhoisController : IDEAViewController

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * rightBarButtonItem;

@property (nonatomic, weak)   IBOutlet       UIView                              * searchView;
@property (nonatomic, weak)   IBOutlet       UISearchBar                         * searchBar;

@end

@interface WhoisController ()

@end

NS_ASSUME_NONNULL_END
