//
//  CellularMoreController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/7/19.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "CellularMoreController.h"
#import "CellularMoreContentController+Inner.h"

NS_ASSUME_NONNULL_BEGIN

@interface CellularMoreController ()

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;

@end

@interface CellularMoreController ()

@property (nonatomic, strong)                CellularMoreContentController       * moreContentController;

@end

@interface CellularMoreController (Inner)

@end

NS_ASSUME_NONNULL_END
