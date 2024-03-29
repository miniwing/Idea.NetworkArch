//
//  HomeContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/6/25.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@signal(loadWifiInfo);
@signal(loadCellularInfo);

@signal(loadAD);

@end

NS_ASSUME_NONNULL_END
