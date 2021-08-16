//
//  DNSCell.h
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DNSCell : UITableViewCell

@property (nonatomic, weak)   IBOutlet       UIView                              * containerView;

@property (nonatomic, weak)   IBOutlet       UILabel                             * domainLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ttlLabel;

@property (nonatomic, weak)   IBOutlet       UILabel                             * dnsLabel;

@end

@interface DNSCell ()

@end

NS_ASSUME_NONNULL_END
