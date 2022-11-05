//
//  HomeContentCell.h
//  NetworkArch
//
//  Created by Harry on 2021/6/26.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeContentCell : UITableViewCellX

@property (nonatomic, weak)   IBOutlet       UIView                              * selectedColorView;
@property (nonatomic, weak)   IBOutlet       UIImageView                         * cellRightImage;
@property (nonatomic, weak)   IBOutlet       UIView                              * separatorView;

@end

@interface HomeContentCell ()

@property (nonatomic, assign)                BOOL                                 canSelected;

@end

NS_ASSUME_NONNULL_END
