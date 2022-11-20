//
//  PHAuthorizationController.h
//  UISETTING
//
//  Created by Harry on 2022/6/20.
//
//  Mail: miniwing.hz@gmail.com
//

#import <IDEAUIVendor/IDEAUIVendor.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHAuthorizationController : IDEAViewController <IDEAPresentationControllerDelegate>

@end

@interface PHAuthorizationController ()

- (void)setPermissionTip:(NSString *)aPermissionTip;

@end

@interface PHAuthorizationController ()

@property (nonatomic, class, readonly)       NSString                            * PERMISSION_KEY;

@end

NS_ASSUME_NONNULL_END
