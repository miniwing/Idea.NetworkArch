//
//  HomeController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(setting);

@end

NS_ASSUME_NONNULL_END
