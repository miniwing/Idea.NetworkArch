//
//  WifiScanCell.h
//  NetworkArch
//
//  Created by Harry on 2021/9/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

#import "WifiScanResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface WifiScanCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * selectedColorView;

@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * ipLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * deviceLabel;

@end

@interface WifiScanCell ()

@property (nonatomic, assign)                UIRectCorner                          rectCorner;

@end

@interface WifiScanCell ()

- (void)setScanResult:(WifiScanResult *)aScanResult;

@end

NS_ASSUME_NONNULL_END
