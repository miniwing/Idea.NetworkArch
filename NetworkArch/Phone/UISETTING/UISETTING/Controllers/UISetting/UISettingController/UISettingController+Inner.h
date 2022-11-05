//
//  UISettingController+Inner.h
//  SETTING
//
//  Created by Harry on 2021/6/10.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <SettingProvider/SettingProvider.h>
#import <SettingProvider/UISetting.h>

#import "UISETTING/UISettingController.h"
#import "UISETTING/UISettingTableController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISettingController ()

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
//@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * navigationBarXHeight;

@property (nonatomic, weak)   IBOutlet       UIBarButtonItem                     * leftBarButtonItem;
@property (nonatomic, weak)   IBOutlet       UIButton                            * leftBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;
@property (nonatomic, weak)   IBOutlet       NSLayoutConstraint                  * contentViewTop;

@end

@interface UISettingController ()

@property (nonatomic, strong)                UISettingTableController            * tableController;

@end

@interface UISettingController (Inner)

@end

NS_ASSUME_NONNULL_END
