//
//  WifiInterfacesController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/4.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WifiInterfacesController.h"

#import "WifiInterfacesController.h"

#import "WifiInterfacesCell+Inner.h"
#import "WifiInterfacesCell+Signal.h"
#import "WifiInterfacesCell+Notification.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiInterfacesController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, weak)   IBOutlet       UITableView                         * tableView;

@end

@interface WifiInterfacesController ()

@property (nonatomic, strong)                NSArray<IDEANetInterface *>         * interfaces;

@end

@interface WifiInterfacesController (Inner)

@end

NS_ASSUME_NONNULL_END
