//
//  UISettingController+Signal.h
//  SETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISETTING/UISettingController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISettingController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
