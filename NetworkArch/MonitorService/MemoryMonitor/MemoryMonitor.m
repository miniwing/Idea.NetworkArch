//
//  MemoryMonitor.m
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "MemoryMonitor.h"

@implementation MemoryMonitor

+ (instancetype)sharedInstance {
   
   static MemoryMonitor    *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[MemoryMonitor alloc] __init];
         LogDebug((@"+[MemoryMonitor sharedInstance] : INSTANCE : %@", g_INSTANCE));
         
      } /* End if () */
   });
   
   return g_INSTANCE;
}

- (void)dealloc {
   
   __LOG_FUNCTION;

   // Custom dealloc
   [self stopMonitor];
   
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

- (void)startMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;
      
   __CATCH(nErr);
   
   return;
}

- (void)stopMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   __CATCH(nErr);
   
   return;
}

/// Total physical memory in byte. (-1 when error occurs)
- (int64_t)total {
   
   return [UIDevice currentDevice].memoryTotal;
}

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
- (int64_t)used {
   
   return [UIDevice currentDevice].memoryUsed;
}

/// Free memory in byte. (-1 when error occurs)
- (int64_t)free {
   
   return [UIDevice currentDevice].memoryFree;
}

@end
