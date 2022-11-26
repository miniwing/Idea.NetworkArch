//
//  LanScanCell.h
//  NetworkArch
//
//  Created by Harry on 2021/10/12.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanScanCell : UITableViewCellX

@property (nonatomic, weak)   IBOutlet       UIView                              * selectedColorView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * ipLabel;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * rightIcon;

//@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@end

@interface LanScanCell ()

- (void)setIP:(NSString *)aIP;

@end

NS_ASSUME_NONNULL_END
