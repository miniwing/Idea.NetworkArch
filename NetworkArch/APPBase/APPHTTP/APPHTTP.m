//
//  APPHTTP.m
//  APPBase
//
//  Copyright © 2021 Harry. All rights reserved.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "APPHTTP.h"

@interface APPHTTP ()

@end

@implementation APPHTTP

+ (NSTimeInterval)timeoutInterval {
   
   return 30;
}

+ (NSString *)USER_AGENT {
   
   static NSString         *g_USER_AGENT  = nil;
   static dispatch_once_t   stOnceToken   = 0;
   
   dispatch_once(&stOnceToken, ^{
      // TODO unknown in user-agent
      // bundleIdentifier/version (unknow, systemName systemVersion, model, Scale/scaleNumber)
      // User-Agent Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43
      NSString *szIdentifier     = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey];
      
      NSString *szVersion        = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
      NSString *szBuild          = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
      NSString *szSystemName     = [[UIDevice currentDevice] systemName];
      NSString *szSystemVersion  = [[UIDevice currentDevice] systemVersion];
      char     *aBuffer[256]     = { 0 };
      
      size_t    nSize            = sizeof(aBuffer);
      sysctlbyname("hw.machine", aBuffer, &nSize, NULL, 0);
      
      NSString *szPlatform       = [NSString stringWithCString:(const char*)aBuffer
                                                      encoding:NSUTF8StringEncoding];
      
      g_USER_AGENT   = [NSString stringWithFormat:@"%@/%@(%@, %@ %@, %@, Scale/%.1f)",
                        szIdentifier,
                        szVersion,
                        szBuild,
                        szSystemName,
                        szSystemVersion,
                        szPlatform,
                        ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.0)];
   });
   
   return g_USER_AGENT;
}

+ (NSString *)AF_USER_AGENT {
   
   static NSString         *g_USER_AGENT  = nil;
   static dispatch_once_t   stOnceToken   = 0;
   
   dispatch_once(&stOnceToken, ^{
      
      // TODO unknown in user-agent
      // bundleIdentifier/version (unknow, systemName systemVersion, model, Scale/scaleNumber)
      // User-Agent Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43
#if TARGET_OS_IOS
      g_USER_AGENT   = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", @"com.zhenl.biquRead", [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
#elif TARGET_OS_TV
      g_USER_AGENT   = [NSString stringWithFormat:@"%@/%@ (%@; tvOS %@; Scale/%0.2f)", @"com.zhenl.biquRead", [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
#elif TARGET_OS_WATCH
      g_USER_AGENT   = [NSString stringWithFormat:@"%@/%@ (%@; watchOS %@; Scale/%0.2f)", @"com.zhenl.biquRead", [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[WKInterfaceDevice currentDevice] model], [[WKInterfaceDevice currentDevice] systemVersion], [[WKInterfaceDevice currentDevice] screenScale]];
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
      g_USER_AGENT   = [NSString stringWithFormat:@"%@/%@ (Mac OS X %@)", @"com.zhenl.biquRead", [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[NSProcessInfo processInfo] operatingSystemVersionString]];
#endif
      if (g_USER_AGENT) {
         
         if (![g_USER_AGENT canBeConvertedToEncoding:NSASCIIStringEncoding]) {
            
            NSMutableString *szUserAgent = [g_USER_AGENT mutableCopy];
            if (CFStringTransform((__bridge CFMutableStringRef)(szUserAgent), NULL, (__bridge CFStringRef)@"Any-Latin; Latin-ASCII; [:^ASCII:] Remove", false)) {
               g_USER_AGENT = szUserAgent;
               
            } /* End if () */
            
         } /* End if () */
         
      } /* End if () */
   });
   
   return g_USER_AGENT;
}

+ (NSURLSessionConfiguration *)DEFAULT_SESSION_CONFIGURATION {
   NSURLSessionConfiguration *stConfiguration  = [NSURLSessionConfiguration defaultSessionConfiguration];
   
   stConfiguration.HTTPShouldSetCookies      = YES;
   stConfiguration.HTTPShouldUsePipelining   = NO;
   
   stConfiguration.requestCachePolicy        = NSURLRequestUseProtocolCachePolicy;
   stConfiguration.allowsCellularAccess      = YES;
   stConfiguration.timeoutIntervalForRequest = 60.0;
   
   // set the default HTTP headers
   [stConfiguration.HTTPAdditionalHeaders setValue:[APPHTTP USER_AGENT] forKey:@"User-Agent"];
   
   return stConfiguration;
}

@end
