//
//  CellularMoreCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/1.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellularMoreCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * selectedColorView;
@property (nonatomic, weak)   IBOutlet       UIView                              * cellContainerView;
@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * titleLabel;
@property (nonatomic, weak)   IBOutlet       UIView                              * infoView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * infoLabel;

@end

@interface CellularMoreCell ()

@end

NS_ASSUME_NONNULL_END
