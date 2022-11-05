//
//  Setting.h
//  SettingProvider
//
//  Created by Harry on 2022/3/11.
//

#import <Foundation/Foundation.h>

#import <YYKit/NSObject+YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface Setting : NSObject <YYModel>

@property (nonatomic, strong)                NSString                            * phone;
@property (nonatomic, strong)                NSString                            * avatar;
@property (nonatomic, strong)                NSString                            * token;

@end

@interface Setting ()

@end

NS_ASSUME_NONNULL_END
