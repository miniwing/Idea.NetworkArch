//
//  CPUMonitor.m
//  MonitorService
//
//  Created by Harry on 2022/11/20.
//
//  Mail: miniwing.hz@gmail.com
//  TEL : +(852)53054612
//

#import "CPUMonitor.h"

@implementation CPUMonitor

+ (instancetype)sharedInstance {
   
   static CPUMonitor       *g_INSTANCE = nil;
   static dispatch_once_t   onceToken;
   
   dispatch_once(&onceToken, ^(void) {
      
      if (nil == g_INSTANCE) {
         
         g_INSTANCE = [[CPUMonitor alloc] __init];
         LogDebug((@"+[CPUMonitor sharedInstance] : INSTANCE : %@", g_INSTANCE));
         
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

- (NSInteger)core {
   
   return [UIDevice currentDevice].cpuCount;
}

- (float)appUsage {
   
   return [UIDevice currentDevice].cpuAppUsage;
}

- (float)systemUsage {

//   LogDebug((@"+[CPUMonitor systemUsage] : %.2f, %.2f", UIDevice.cpuAppUsage, UIDevice.cpuSystemUsage));

   return [UIDevice currentDevice].cpuSystemUsage;
//   return MIN([UIDevice currentDevice].cpuAppUsage + [UIDevice currentDevice].cpuSystemUsage, 1.0f);
//   return [UIDevice currentDevice].cpuUsage / [UIDevice currentDevice].cpuCount;
}

- (float)appUsageEx {
   
   kern_return_t            kr               = KERN_SUCCESS;
   task_info_data_t         tinfo            = {0};
   mach_msg_type_number_t   task_info_count  = {0};
   
   task_info_count = TASK_INFO_MAX;
   kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
   if (kr != KERN_SUCCESS) {
      
      return -1;
   }
   
   task_basic_info_t        basic_info       = {0};
   thread_array_t           thread_list      = {0};
   mach_msg_type_number_t   thread_count     = {0};
   
   thread_info_data_t       thinfo           = {0};
   mach_msg_type_number_t   thread_info_count= {0};
   
   thread_basic_info_t      basic_info_th    = {0};
   uint32_t                 stat_thread      = 0; // Mach threads
   
   basic_info = (task_basic_info_t)tinfo;
   
   // get threads in the task
   kr = task_threads(mach_task_self(), &thread_list, &thread_count);
   if (kr != KERN_SUCCESS) {
      return -1;
   }
   if (thread_count > 0) {
      stat_thread += thread_count;
   }
   
   long   tot_sec    = 0;
   long   tot_usec   = 0;
   float  tot_cpu    = 0;
   
   for (int j = 0; j < thread_count; j++) {
      
      thread_info_count = THREAD_INFO_MAX;
      kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                       (thread_info_t)thinfo, &thread_info_count);
      if (kr != KERN_SUCCESS) {
         return -1;
      }
      
      basic_info_th = (thread_basic_info_t)thinfo;
      
      if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
         tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
         tot_usec = tot_usec + basic_info_th->user_time.microseconds + basic_info_th->system_time.microseconds;
         tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE * 1.0;
      }
      
   } // for each thread
   
   kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
   assert(kr == KERN_SUCCESS);
   
//   app_cpu = tot_cpu;
   return tot_cpu;
}

- (float)systemUsageEx {

   static host_cpu_load_info_data_t  previous_info = {0};

   kern_return_t                     kr            = KERN_SUCCESS;
   mach_msg_type_number_t            count         = HOST_CPU_LOAD_INFO_COUNT;
   host_cpu_load_info_data_t         info          = {0};
   
//   count = HOST_CPU_LOAD_INFO_COUNT;
   
   kr = host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, (host_info_t)&info, &count);
   if (kr != KERN_SUCCESS) {
      return -1;
   }
   
   natural_t user   = info.cpu_ticks[CPU_STATE_USER]   - previous_info.cpu_ticks[CPU_STATE_USER];
   natural_t nice   = info.cpu_ticks[CPU_STATE_NICE]   - previous_info.cpu_ticks[CPU_STATE_NICE];
   natural_t system = info.cpu_ticks[CPU_STATE_SYSTEM] - previous_info.cpu_ticks[CPU_STATE_SYSTEM];
   natural_t idle   = info.cpu_ticks[CPU_STATE_IDLE]   - previous_info.cpu_ticks[CPU_STATE_IDLE];
   natural_t total  = user + nice + system + idle;
      
   previous_info    = info;
   
   return (user + nice + system) * 1.0 / total;
}

@end
