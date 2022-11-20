//
//  MonitorController+Inner.h
//  PRIVACY
//
//  Created by Harry on 2022/10/14.
//

#import <SettingProvider/SettingProvider.h>

#import "MonitorController.h"
#import "MonitorContentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MonitorController ()

@property (nonatomic, weak)   IBOutlet       UINavigationBarX                    * navigationBarX;
@property (nonatomic, strong) IBOutlet       UIBarButtonItem                     * rightBarButtonItem;
@property (nonatomic, strong) IBOutlet       UIButton                            * rightBarButton;

@property (nonatomic, weak)   IBOutlet       UIView                              * contentView;

@end

@interface MonitorController ()

@property (nonatomic, strong)                MonitorContentController            * contentController;

@end

@interface MonitorController (Inner)

@end

NS_ASSUME_NONNULL_END
