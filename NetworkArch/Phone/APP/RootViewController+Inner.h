//
//  RootViewController+Inner.h
//  NetworkArch
//
//  Created by Harry on 2022/10/19.
//  Copyright © 2022 Harry. All rights reserved.
//

#import <IDEAStartUp/IDEAStartUp.h>
#import <IDEAUIRouter/IDEAUIRouter.h>

#import "RootViewController.h"

NS_ASSUME_NONNULL_BEGIN

IDEA_ENUM(NSInteger, TabId) {
   
   TabIdHome      = 0,
   TabIdSetting   = 1,
   TabIdNumber
};

@interface RootViewController ()

#if IDEA_TABBARCONTROLLER_TRANSITION
@property (nonatomic, assign)                TransType                             type;
#endif /* IDEA_TABBARCONTROLLER_TRANSITION */

@property (nonatomic, strong)                NSArray<NSString *>                 * titles;
@property (nonatomic, strong)                NSArray<NSString *>                 * images;
@property (nonatomic, strong)                NSArray<NSString *>                 * imageSelecteds;

@end

@interface RootViewController (Inner)

@end

NS_ASSUME_NONNULL_END
