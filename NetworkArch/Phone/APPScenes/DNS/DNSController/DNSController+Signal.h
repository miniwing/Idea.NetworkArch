//
//  DNSController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "DNSController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNSController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(start);
@signal(done);

@end

NS_ASSUME_NONNULL_END
