//
//  SecurityUtils.h
//  SecurityUtils
//
//  Created by Harry on 2022/3/21.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecurityUtils : NSObject

@property (nonatomic, strong)                NSString                            * privateAesStr;

@end

@interface SecurityUtils ()

+ (instancetype)sharedInstance;

/**
 *  Unavailable initializer
 */
+ (instancetype)new NS_UNAVAILABLE;

/**
 *  Unavailable initializer
 */
- (instancetype)init NS_UNAVAILABLE;

@end

@interface SecurityUtils ()

+ (NSData *)getHMACMD5:(NSData *)aData key:(NSData *)aKeyData;

+ (SecKeyRef)getRSAPrivateKey;
+ (SecKeyRef)getRSAPublicKeyWithPrivateKey:(SecKeyRef)aPrivateKey;
+ (NSData *)getKeyBitsFromKey:(SecKeyRef)aKey;
+ (NSString *)getKeyForJavaServer:(NSData*)aKeyBits;
+ (SecKeyRef)getRSAKeyWithBase64:(NSString *)aBase64 isPrivateKey:(BOOL)isPrivateKey;

+ (NSData *)decryptMessageRSA:(NSData *)aMsgData withPrivateKey:(SecKeyRef)aPrivateKey;

@end

@interface SecurityUtils (deCrypt)

+ (NSString *)deCrypt:(NSString *)aString;

@end

NS_ASSUME_NONNULL_END
