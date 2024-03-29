//
//  DNSContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/16.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "DNSContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNSContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(keyEmpty);

@signal(start);

@end

NS_ASSUME_NONNULL_END
