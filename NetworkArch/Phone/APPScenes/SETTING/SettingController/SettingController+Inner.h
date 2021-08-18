//
//  SettingController+Inner.h
//  SETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//

#import "SettingController.h"
#import "SettingContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingController ()

#if MATERIAL_APP_BAR
@property (nonatomic, strong)                MDCAppBar                           * appBar;
#endif /* MATERIAL_APP_BAR */

@property (nonatomic, strong)                SettingContentController            * contentController;

@end

@interface SettingController (Inner)

@end

NS_ASSUME_NONNULL_END
