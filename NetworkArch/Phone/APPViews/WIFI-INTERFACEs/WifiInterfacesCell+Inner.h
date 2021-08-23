//
//  WifiInterfacesCell+Inner.h
//  NetworkArch
//
//  Created by Harry on 2021/8/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WifiInterfacesCell.h"

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WifiInterfacesCell ()

@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;
@property (nonatomic, strong)                IDEANetInterface                    * interface;

@end

@interface WifiInterfacesCell (Inner)

@end

NS_ASSUME_NONNULL_END
