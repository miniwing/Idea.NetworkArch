//
//  NetworkArch+Storage.h
//  APPDATA
//
//  Created by Harry on 2022/11/1.
//

#import "NetworkArch.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkArch (Storage)

+ (BOOL)isApiKeySetting;
+ (void)setApiKeySetting:(BOOL)aApiKeySetting;

+ (BOOL)isApiKeyOpened;
+ (void)setApiKeyOpened:(BOOL)aApiKeyOpened;

+ (NSString *)apiKey;
+ (void)setApiKey:(NSString *)aApiKey;

+ (BOOL)isICMPEnable;
+ (void)setICMPEnable:(BOOL)aICMPEnable;

@end

NS_ASSUME_NONNULL_END
