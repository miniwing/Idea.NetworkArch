//
//  NetworkManager.m
//  NetworkService
//
//  Created by Harry on 2022/3/18.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import <AFNetworking/AFNetworking.h>

#import "NetworkManager.h"
#import "NetworkManager+Inner.h"

@implementation NetworkManager

+ (instancetype)sharedInstance {
   
   static NetworkManager   *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      /**
       * 多framework引用可能会多次创建, 对象会不一样, 因此托管给一个系统对象。
       */
#if FRAMEWORK_DUPLICATE
      g_INSTANCE  = (NetworkManager *)objc_getAssociatedObject([NSUserDefaults standardUserDefaults],
                                                               (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x0A);
#endif /* FRAMEWORK_DUPLICATE */
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[NetworkManager alloc] __init];
         
         LogDebug((@"+[NetworkManager sharedInstance] : INSTANCE : %@", g_INSTANCE));
         
#if FRAMEWORK_DUPLICATE
         objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                                  (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x0A,
                                  g_INSTANCE,
                                  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif /* FRAMEWORK_DUPLICATE */
         
      } /* End if () */
   });
   
   return g_INSTANCE;
}

- (void)dealloc {
   
   __LOG_FUNCTION;
   
#if FRAMEWORK_DUPLICATE
   // Custom dealloc
   objc_setAssociatedObject([NSUserDefaults standardUserDefaults],
                            (__bridge const void *)([NSUserDefaults standardUserDefaults]) + 0x05,
                            nil,
                            OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif /* FRAMEWORK_DUPLICATE */
   
   __SUPER_DEALLOC;
   
   return;
}

- (instancetype)__init {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
   
   self  = [super init];
   
   if (self) {
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

@end
