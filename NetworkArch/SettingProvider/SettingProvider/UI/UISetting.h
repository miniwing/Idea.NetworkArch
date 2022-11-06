//
//  UISetting.h
//  SettingProvider
//
//  Created by Harry on 2022/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISetting : NSObject

@property (class, nonatomic, readonly)       CGFloat                               cornerRadiusBig;
@property (class, nonatomic, readonly)       CGFloat                               cornerRadiusSmall;

@property (class, nonatomic, readonly)       CGFloat                               textFieldEdgeX;
@property (class, nonatomic, readonly)       CGFloat                               textFieldEdgeY;

@end

@interface UISetting (BarButton)

+ (CGFloat)leftBarButtonWidth;
+ (CGFloat)rightBarButtonWidth;

@end

@interface UISetting (Notification)

+ (NSString *)LOGINDONE_NOTIFICATION;
+ (NSString *)LOGOUT_NOTIFICATION;

@end

@interface UISetting (Color)

+ (NSString *)mainColor;

@end

NS_ASSUME_NONNULL_END
