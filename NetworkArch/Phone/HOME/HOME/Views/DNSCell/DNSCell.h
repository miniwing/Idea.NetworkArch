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

#import "DNSModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNSCell : UITableViewCellX

@property (nonatomic, weak)   IBOutlet       UILabel                             * domainLabel;
@property (nonatomic, weak)   IBOutlet       UILabel                             * ttlLabel;

@property (nonatomic, weak)   IBOutlet       UILabel                             * dnsLabel;

@end

@interface DNSCell ()

- (void)setDNSModel:(DNSModel *)aDNSModel;

@end

NS_ASSUME_NONNULL_END
