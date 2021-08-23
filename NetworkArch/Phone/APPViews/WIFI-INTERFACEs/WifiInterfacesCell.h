//
//  WifiInterfacesCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/11.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WifiInterfacesCell : UITableViewCell

@end

@interface WifiInterfacesCell ()

- (void)setInterface:(IDEANetInterface *)aNetInterface;

@end

NS_ASSUME_NONNULL_END
