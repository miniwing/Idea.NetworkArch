//
//  RootViewController.h
//  NetworkArch
//
//  Created by Harry on 2021/6/24.
//  Copyright © 2021 Harry. All rights reserved.
//

#import <IDEAUIVendor/IDEATabBarController.h>

NS_ASSUME_NONNULL_BEGIN

#if IDEA_TABBARCONTROLLER_TRANSITION
@interface RootViewController : IDEATabBarControllerTransition <UITabBarControllerDelegate>
#else /* IDEA_TABBARCONTROLLER_TRANSITION */
@interface RootViewController : IDEATabBarController <UITabBarControllerDelegate>
#endif /* !IDEA_TABBARCONTROLLER_TRANSITION */

@end

NS_ASSUME_NONNULL_END
