//
//  SecurityUtils.m
//  SecurityUtils
//
//  Created by Harry on 2022/3/21.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "SecurityUtils.h"

@interface SecurityUtils ()

@property (nonatomic, strong)                NSString                            * publicIdentifier;
@property (nonatomic, strong)                NSString                            * privateIdentifier;

@end

@implementation SecurityUtils

- (void)dealloc {

   __LOG_FUNCTION;
   
   // Custom dealloc

   __SUPER_DEALLOC;

   return;
}

- (instancetype)__init {

   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
      
//      self.publicIdentifier   = [NSString stringWithFormat:@"com.RSA.publicIdentifier.mykey.%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"my.user.id"]];
//      self.privateIdentifier  = [NSString stringWithFormat:@"com.RSA.privateIdentifier.mykey.%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"my.user.id"]];
//
//      // 获取本地aes加密后的私钥
//      self.privateAesStr      = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"kMyPayPrivateKey_%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"my.user.id"]]];

   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

+ (instancetype)sharedInstance {
   
   static SecurityUtils    *g_INSTANCE    = nil;
   static dispatch_once_t   stOnceToken;
   
   dispatch_once(&stOnceToken, ^{
      
      g_INSTANCE  = (SecurityUtils *)objc_getAssociatedObject([NSUserDefaults standardUserDefaults],
                                                              (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x06);

      if (nil == g_INSTANCE) {
         
         g_INSTANCE  = [[SecurityUtils alloc] __init];

         objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                                  (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x06,
                                  g_INSTANCE,
                                  OBJC_ASSOCIATION_RETAIN_NONATOMIC);

      } /* End if () */
   });
   
   return g_INSTANCE;
}

// RSA创建私钥
+ (SecKeyRef)getRSAPrivateKey {
   
   int                            nErr                                     = EFAULT;
   
   SecKeyRef                      stPrivateKey                             = nil;
   
   NSData                        *stTag                                    = nil;
   NSDictionary                  *stAttributes                             = nil;
   
   CFErrorRef                     cfError                                  = NULL;
   
   __TRY;
   
   //   stTag = [[NSString stringWithFormat:@"%@.keys.mykey", [UIApplication sharedApplication].appBundleID] dataUsingEncoding:NSUTF8StringEncoding];
   stTag = [[NSString stringWithFormat:@"%@.keys.mykey", [IDEAIdentifier identifier]] dataUsingEncoding:NSUTF8StringEncoding];
   
   stAttributes   = @{
      (id)kSecAttrKeyType        : (id)kSecAttrKeyTypeRSA,
      (id)kSecAttrKeySizeInBits  : @(1024),
      (id)kSecPrivateKeyAttrs    : @{
            (id)kSecAttrIsPermanent    : (@YES),
            (id)kSecAttrApplicationTag : stTag,
      },
   };
   
   stPrivateKey   = SecKeyCreateRandomKey((__bridge CFDictionaryRef)stAttributes,
                                          &cfError);
   if (!stPrivateKey) {
      
      NSError  *stError = (__bridge_transfer NSError *)cfError;
      CFBridgingRelease(cfError);  // ARC takes ownership
      // Handle the error. . .
      LogError((@"getPrivateKeyError - %@", stError));
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return stPrivateKey;
}

// RSA根据私钥获取公钥
+ (SecKeyRef)getRSAPublicKeyWithPrivateKey:(SecKeyRef)aPrivateKey {
   
   return SecKeyCopyPublicKey(aPrivateKey);
}

+ (NSData *)getKeyBitsFromKey:(SecKeyRef)aKey {
   
   CFErrorRef   stCFError  = NULL;
   NSData      *stKeyData  = (NSData*)CFBridgingRelease(  // ARC takes ownership
                                                        SecKeyCopyExternalRepresentation(aKey, &stCFError)
                                                        );
   if (!stKeyData) {
      
      NSError  *stErr   = CFBridgingRelease(stCFError);  // ARC takes ownership
      
      // Handle the error. . .
      LogError((@"getKeyBitsFromKeyError - %@", stErr));
      
   } /* End if () */
   
   return stKeyData;
}

NS_INLINE size_t encodeLength(unsigned char * buf, size_t length) {
   
   // encode length in ASN.1 DER format
   if (length < 128) {
      buf[0] = length;
      return 1;
   }
   
   size_t i = (length / 256) + 1;
   buf[0] = i + 0x80;
   for (size_t j = 0 ; j < i; ++j) {
      buf[i - j] = length & 0xFF;
      length = length >> 8;
   }
   
   return i + 1;
}

+ (NSString *)getKeyForJavaServer:(NSData*)aKeyBits {
   
   static const unsigned char _encodedRSAEncryptionOID[15] = {
      
      /* Sequence of length 0xd made up of OID followed by NULL */
      0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
      0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00
      
   };
   
   // That gives us the "BITSTRING component of a full DER
   // encoded RSA public key - We now need to build the rest
   
   unsigned char   aucBuilder[15]      = {0};
   NSMutableData  *stEncKey            = [NSMutableData data];
   int             nBitstringEncLength = 0;
   
   // When we get to the bitstring - how will we encode it?
   
   if  ([aKeyBits length ] + 1  < 128) {
      nBitstringEncLength = 1 ;
   }
   else {
      nBitstringEncLength = (int)(([aKeyBits length] + 1) / 256) + 2;
   }
   
   // Overall we have a sequence of a certain length
   aucBuilder[0] = 0x30;    // ASN.1 encoding representing a SEQUENCE
   // Build up overall size made up of -
   // size of OID + size of bitstring encoding + size of actual key
   size_t i = sizeof(_encodedRSAEncryptionOID) + 2 + nBitstringEncLength +
   [aKeyBits length];
   size_t j = encodeLength(&aucBuilder[1], i);
   [stEncKey appendBytes:aucBuilder length:j +1];
   
   // First part of the sequence is the OID
   [stEncKey appendBytes:_encodedRSAEncryptionOID
                length:sizeof(_encodedRSAEncryptionOID)];
   
   // Now add the bitstring
   aucBuilder[0] = 0x03;
   j = encodeLength(&aucBuilder[1], [aKeyBits length] + 1);
   aucBuilder[j+1] = 0x00;
   [stEncKey appendBytes:aucBuilder length:j + 2];
   
   // Now the actual key
   [stEncKey appendData:aKeyBits];
   
   // base64 encode encKey and return
   return [stEncKey base64EncodedStringWithOptions:0];
   
}

+ (NSData *)getHMACMD5:(NSData *)aData key:(NSData *)aKeyData {
   size_t    nDataLength   = aData.length;
   NSData   *stKeyData     = aKeyData;
   size_t    nKeyLength    = stKeyData.length;
   
   unsigned char   aResult[CC_MD5_DIGEST_LENGTH]   = {0};
   
   CCHmac(kCCHmacAlgMD5, [stKeyData bytes], nKeyLength, [aData bytes], nDataLength, aResult);
   
#if __Debug__
   for (int H = 0; H < CC_MD5_DIGEST_LENGTH; H ++) {
       printf("%d ",aResult[H]);
   }
   printf("\n-------%s-------\n",aResult);
#endif /* __Debug__ */
   
   //这里需要将result 转base64编码，再传回去
   NSData *stData = [[NSData alloc] initWithBytes:aResult length:sizeof(aResult)];
   
   //    NSString *base64 = [data1 base64EncodedStringWithOptions:0];
   return stData;
}

// 根据秘钥的base64字符串转换为秘钥key
+ (SecKeyRef)getRSAKeyWithBase64:(NSString *)aBase64 isPrivateKey:(BOOL)isPrivateKey {
   
   NSData         *stData     = [[NSData alloc]initWithBase64EncodedString:aBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
   
   // The key is assumed to be public, 2048-bit RSA
   NSDictionary   *stOptions  = nil;
   
   if (isPrivateKey) {
      
      stOptions =@{
         (id)kSecAttrKeyType: (id)kSecAttrKeyTypeRSA,
         (id)kSecAttrKeyClass: (id)kSecAttrKeyClassPrivate,
         (id)kSecAttrKeySizeInBits: @1024,
      };
   }
   else {
      stOptions =@{
         (id)kSecAttrKeyType: (id)kSecAttrKeyTypeRSA,
         (id)kSecAttrKeyClass: (id)kSecAttrKeyClassPublic,
         (id)kSecAttrKeySizeInBits: @1024,
      };
   }
   CFErrorRef error = NULL;
   SecKeyRef key = SecKeyCreateWithData((__bridge CFDataRef)stData,
                                        (__bridge CFDictionaryRef)stOptions,
                                        &error);
   if (!key) {
      NSError *err = CFBridgingRelease(error);  // ARC takes ownership
      // Handle the error. . .
   }
   
   return key;
}

+ (NSData *)decryptMessageRSA:(NSData *)aMsgData withPrivateKey:(SecKeyRef)aPrivateKey {
   
   NSData         *stMsgData           = aMsgData;
   size_t          nCipherBufferSize   = SecKeyGetBlockSize(aPrivateKey);
   size_t          nKeyBufferSize      = [stMsgData length];
   
   NSMutableData  *stBits              = [NSMutableData dataWithLength:nKeyBufferSize];
   OSStatus        nSanityCheck        = SecKeyDecrypt(aPrivateKey,
                                                       kSecPaddingPKCS1,
                                                       (const uint8_t *) [stMsgData bytes],
                                                       nCipherBufferSize,
                                                       [stBits mutableBytes],
                                                       &nKeyBufferSize);
   
   if (nSanityCheck != 0) {
      
      NSError *stError = [NSError errorWithDomain:NSOSStatusErrorDomain
                                             code:nSanityCheck
                                         userInfo:nil];
      
      LogError((@"Error: %@", [stError description]));
      
      return nil;
      
   } /* End if () */
   
   NSAssert(nSanityCheck == noErr, @"Error decrypting, OSStatus == %ld.", (long)nSanityCheck);
   
   [stBits setLength:nKeyBufferSize];
   
   return stBits;
}

@end

@implementation SecurityUtils (deCrypt)

+ (int)getStringIndex:(NSString *)result {
   
   NSString *hexString[] = {@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"a", @"b", @"c", @"d", @"e", @"f"};

   if (1 == result.length) {
      
      for (int H = 0; H < sizeof(hexString) / sizeof(NSString *); H++) {
         NSString *szHex = hexString[H];
         
         if ([hexString[H] equalsIgnoreCase:result]) {
            
            return H;
            
         } /* End if () */
         
      } /* End for () */
      
   } /* End if () */
   
   return -1;
}

+ (NSString *)deCrypt:(NSString *)data {
   
   NSMutableString   *resultBuilder = [NSMutableString string];

   for (int index = 0; index < data.length - 1; index += 2) {
      NSString * firstchar = [data substringFromIndex:index toIndex:index+1];
//      NSString * firstchar = data.substring(index, index + 1);
      
      NSString * nextchar = [data substringFromIndex:index+1 toIndex:index+2];
//      NSString * nextchar = data.substring(index + 1, index + 2);
      int firstValue = [SecurityUtils getStringIndex:firstchar] << 4;
      int nextvalue = [SecurityUtils getStringIndex:nextchar];
      int result = firstValue + nextvalue - 4;
      
      [resultBuilder appendString:[NSString stringWithFormat:@"%c", (char)result]];
      
   }
   
   return resultBuilder;

   return nil;
}

@end

