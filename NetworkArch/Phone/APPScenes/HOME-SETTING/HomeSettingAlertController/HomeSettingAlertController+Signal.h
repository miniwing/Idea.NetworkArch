//
//  HomeSettingAlertController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/18.
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//

#import "HomeSettingAlertController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSettingAlertController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
