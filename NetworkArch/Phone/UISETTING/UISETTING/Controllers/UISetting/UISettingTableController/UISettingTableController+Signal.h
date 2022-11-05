//
//  UISettingTableController+Signal.h
//  UISETTING
//
//  Created by Harry on 2021/8/19.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "UISettingTableController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISettingTableController (Signal)

#if __Debug__
@signal(self);
#endif /* __Debug__ */

@end

NS_ASSUME_NONNULL_END
