//
//  WoLANContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/13.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "WoLANContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WoLANContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(start);
@signal(done);

@end

NS_ASSUME_NONNULL_END
