//
//  PingResultCell.h
//  NetworkArch
//
//  Created by Harry on 2021/7/29.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

#import "PingCell.h"

#import "PingResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingResultCell : PingCell

@property (nonatomic, weak)   IBOutlet       UIView                              * statusView;
@property (nonatomic, weak)   IBOutlet       UILabel                             * statusLabel;

@end

@interface PingResultCell ()

- (void)setPingResult:(PingResult *)aPingResult;

@end

NS_ASSUME_NONNULL_END
