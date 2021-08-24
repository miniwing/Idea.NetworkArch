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

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;

@property (nonatomic, weak)   IBOutlet       UIView                              * topView;
@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;
@property (nonatomic, weak)   IBOutlet       UIView                              * bottomView;

@property (nonatomic, weak)   IBOutlet       UIView                              * upView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * upLabel;

@property (nonatomic, weak)   IBOutlet       UIView                              * runingView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * runingLabel;

@property (nonatomic, weak)   IBOutlet       UIView                              * deviceView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * deviceLabel;

@property (nonatomic, weak)   IBOutlet       UILabel                             * addressLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ipLabel;

@end

@interface WifiInterfacesCell ()

- (void)setInterface:(IDEANetInterface *)aNetInterface;

@end

NS_ASSUME_NONNULL_END
