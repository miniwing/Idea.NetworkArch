//
//  NetworkMonitor.m
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "NetworkMonitor.h"
#import "NetworkMonitor+Inner.h"

@implementation NetworkMonitor

+ (instancetype)sharedInstance {
   
   static NetworkMonitor   *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[NetworkMonitor alloc] __init];
         LogDebug((@"+[NetworkMonitor sharedInstance] : INSTANCE : %@", g_INSTANCE));
         
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

      _iBytes = _oBytes = _allFlow = 0;
      
   } /* End if () */
   
   __CATCH(nErr);
   
   return self;
}

- (void)startMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   if (nil == _timer) {
      
      @weakify(self);
      _timer   = [NSTimer timerWithTimeInterval:0.5f
                                        repeats:YES
                                          block:^(NSTimer * _Nonnull aTimer) {
         
         @strongify(self);
         [self monitor];
         
         return;
      }];
      
      [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
      
   } /* End if () */
   
   [_timer fire];
   
   __CATCH(nErr);
   
   return;
}

- (void)stopMonitor {
   
   int                            nErr                                     = EFAULT;
   
   __TRY;

   if ([_timer isValid]) {
      
      [_timer invalidate];

   } /* End if () */
   
   _timer   = nil;
   
   __CATCH(nErr);
   
   return;
}

- (void)monitor {
   
   struct ifaddrs * ifa_list = 0;
   struct ifaddrs * ifa = 0;
   
   if (getifaddrs(&ifa_list) == -1) {
      
      return;
   }
   
   uint32_t iBytes = 0;
   uint32_t oBytes = 0;
   
   uint32_t wifiIBytes = 0;
   uint32_t wifiOBytes = 0;
   
   uint32_t wwanIBytes = 0;
   uint32_t wwanOBytes = 0;
   
   struct IF_DATA_TIMEVAL time = { 0 };
   
   for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
      
      if (AF_LINK != ifa->ifa_addr->sa_family) {
         continue;
      }
      
      if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING)) {
         continue;
      }
      
      if (ifa->ifa_data == 0) {
         continue;
      }
      
      // Not a loopback device.
      // network flow
      
      if (strncmp(ifa->ifa_name, "lo", 2)) {
         
         struct if_data *if_data = (struct if_data *)ifa->ifa_data;
         
         iBytes += if_data->ifi_ibytes;
         oBytes += if_data->ifi_obytes;
         
         time = if_data->ifi_lastchange;
      }
      
      // wifi flow
      
      if (0 == strcmp(ifa->ifa_name, "en0")) {
         
         struct if_data *if_data = (struct if_data *)ifa->ifa_data;
         
         wifiIBytes += if_data->ifi_ibytes;
         wifiOBytes += if_data->ifi_obytes;
      }
      
      //3G and gprs flow
      
      if (0 == strcmp(ifa->ifa_name, "pdp_ip0")) {
         
         struct if_data *if_data = (struct if_data *)ifa->ifa_data;
         
         wwanIBytes += if_data->ifi_ibytes;
         wwanOBytes += if_data->ifi_obytes;
      }
   }
   
   freeifaddrs(ifa_list);
   
   if (_iBytes != 0) {
      _downloadSpeed = iBytes - _iBytes;
   }
   
   _iBytes = iBytes;
   
   if (_oBytes != 0) {
      
      _uploadSpeed = oBytes - _oBytes;
   }
   
   _oBytes = oBytes;
   
   if (0 == _uploadStartBytes) {
      
      _uploadStartBytes = oBytes;
   }
   
   if (0 == _downloadStartBytes) {
      
      _downloadStartBytes = iBytes;
   }
   
   NSUInteger uploadSegment = (oBytes - _uploadStartBytes) - _uploadBytes;
   NSUInteger downloadSegment = (iBytes - _downloadStartBytes) - _downloadBytes;
   
   self.uploadBytes = oBytes - _uploadStartBytes;
   self.downloadBytes = iBytes - _downloadStartBytes;
   
   [self.uploadHistory addObject:@(uploadSegment)];
   [self.uploadHistory keepTail:MAX_HISTORY];
   
   [self.downloadHistory addObject:@(uploadSegment)];
   [self.downloadHistory keepTail:MAX_HISTORY];
   
   return;
}

@end
