//
//  SettingContentController+Signal.h
//  NetworkArch
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "SettingContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingContentController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
