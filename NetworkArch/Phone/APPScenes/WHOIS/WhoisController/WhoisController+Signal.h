//
//  WhoisController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/7/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

#import "WhoisController.h"
#import "WhoisManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface WhoisController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(start);
@signal(done);

@end

NS_ASSUME_NONNULL_END
