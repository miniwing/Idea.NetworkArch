//
//  DownloadManager.m
//  CocoaDownloader
//
//  Created by smile on 2018/12/12.
//  Copyright © 2018 ixuea(http://a.ixuea.com/y). All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager

//static   DownloadManager   *sharedInstance = nil;

//+ (DownloadManager *)sharedInstance {
//
//   return [self sharedInstance:nil];
//}

+ (DownloadManager *)instance {
   
   return [[self alloc] initWithConfig:nil];
}

//+ (DownloadManager *)sharedInstance:(DownloadConfig *)config {
//
//   if (!sharedInstance) {
//
//      sharedInstance = [[self alloc] initWithConfig:config];
//
//   } /* End if () */
//
//   return sharedInstance;
//}

+ (DownloadManager *)instanceWithConfig:(DownloadConfig *)aConfig {
   
   return [[self alloc] initWithConfig:nil];
}

- (instancetype)initWithConfig:(DownloadConfig *)aConfig {
   
   if (self = [super init]) {
      
      if (aConfig) {
         
         self.config = aConfig;
         
      } /* End if () */
      else {
         
         self.config=[[DownloadConfig alloc] init];
         
      } /* End else */
      
      self.databaseController = [DatabaseController sharedInstance:self.config];
      
//        self.operationQueue=[[NSOperationQueue alloc] init];
//        self.operationQueue.maxConcurrentOperationCount=self.config.self.operationQueue;
      
      self.dispatch           = [[DownloadDispatch alloc] initDatabaseController:self.databaseController];
      
      self.cacheDownloadTask  = [[NSMutableDictionary alloc] init];
      
      self.downloadingCaches  = [[NSMutableArray alloc] init];
      
      //将数据库中，除下载完成的任务状态改为暂停
      [self.databaseController pauseAllDownloading];
      
      NSArray  *stAllDownloading = [self.databaseController findAllDownloading];
      
      if (stAllDownloading) {
         
         [self.downloadingCaches addObjectsFromArray:stAllDownloading];
         
      } /* End if () */
      
   } /* End if () */
   
   return self;
}

- (void)download:(DownloadInfo *)aDownloadInfo {
   
   [self.downloadingCaches addObject:aDownloadInfo];
   
   [self prepareDownload:aDownloadInfo];
   
   return;
}

- (void)prepareDownload:(DownloadInfo *)aDownloadInfo {
   
   if ([self.cacheDownloadTask count]>= self.config.downloadTaskNumber) {
      
      aDownloadInfo.status=DownloadStatusWait;
   }
   else {
      DownloadTask   *stDownloadTask   = [[DownloadTask alloc] initOperationQueue:self.operationQueue
                                                                         dispatch:self.dispatch
                                                                         download:aDownloadInfo
                                                                           config:self.config
                                                                         delegate:self];
      
      [self.cacheDownloadTask setObject:stDownloadTask forKey:aDownloadInfo.id];
      [aDownloadInfo setStatus:DownloadStatusPrepareDownload];
      [stDownloadTask start];
   }
   
   [self.dispatch onStatusChanged:aDownloadInfo];
   
   return;
}

- (void)pause:(DownloadInfo *)aDownloadInfo {
   
   if ([self isExecute]) {
      
      [self pauseInner:aDownloadInfo];
   }
   
   return;
}

- (void)pauseAll {
   
   for (DownloadInfo *stDownloadInfo in self.downloadingCaches) {
      
      [self pauseInner:stDownloadInfo];
   }
   
   return;
}

- (void)pauseInner:(DownloadInfo *)aDownloadInfo {
   
   [aDownloadInfo setStatus:DownloadStatusPaused];
   [self.cacheDownloadTask removeObjectForKey:aDownloadInfo.id];
   [self.dispatch onStatusChanged:aDownloadInfo];
   [self prepareDownloadNextTask];
   
   return;
}

- (void)resume:(DownloadInfo *)aDownloadInfo {
   
   if ([self isExecute]) {
      
      [self prepareDownload:aDownloadInfo];
   }
   
   return;
}

- (void)resumeAll {
   
   for (DownloadInfo *stDownloadInfo in self.downloadingCaches) {
      
      [self prepareDownload:stDownloadInfo];
   }
   
   return;
}

- (void)remove:(DownloadInfo *)aDownloadInfo {
   
   [aDownloadInfo setStatus:DownloadStatusNone];
   [self.cacheDownloadTask removeObjectForKey:aDownloadInfo.id];
   [self.downloadingCaches removeObject:aDownloadInfo];
   [self.databaseController remove:aDownloadInfo];
   
   //获取文件管理器
   NSFileManager *manager = [NSFileManager defaultManager];
   
   //删除下载的文件
   [manager removeItemAtPath:aDownloadInfo.path error:nil];
   
   [self.dispatch onStatusChanged:aDownloadInfo];
   
   [self prepareDownloadNextTask];
   
   return;
}

- (DownloadInfo *)findDownloadInfo:(NSString *)aID {
   
   DownloadInfo   *stDownloadInfo   = nil;
   
   for (DownloadInfo *stInfo in self.downloadingCaches) {
      
      if ([stInfo.id isEqualToString:aID]) {
         
         stDownloadInfo=stInfo;
         break;
      }
   }
   
   if(!stDownloadInfo) {
      
      stDownloadInfo=[self.databaseController findDownloadInfo:aID];
   }
   
   return stDownloadInfo;
}

- (NSArray *)findAllDownloading {
   return self.downloadingCaches;
}

- (NSArray *)findAllDownloaded {
   LogDebug((@"download manager findAllDownloaded"));
   return [self.databaseController findAllDownloaded];
}

- (void)prepareDownloadNextTask {
   
   for (DownloadInfo *stDownloadInfo in self.downloadingCaches) {
      
      if (DownloadStatusWait==stDownloadInfo.status) {
         
         [self prepareDownload:stDownloadInfo];
         
         break;
      }
   }
   
   return;
}

- (BOOL)isExecute {
   //获取当前时间0秒后的时间，就是当前
   NSDate         *stDate           = [NSDate dateWithTimeIntervalSinceNow:0];
   
   //转为时间戳
   NSTimeInterval  currentTimeMillis= [stDate timeIntervalSince1970];
   
   if (currentTimeMillis-self.lastExecuteTime>MIN_EXECUTE_INTERVAL) {
      
      self.lastExecuteTime=currentTimeMillis;
      
      return YES;
   }
   
   return NO;
}

- (void)onDownloadSuccess:(DownloadInfo *)aDownloadInfo {
   
   [self.cacheDownloadTask removeObjectForKey:aDownloadInfo.id];
   [self.downloadingCaches removeObject:aDownloadInfo];
   [self prepareDownloadNextTask];
   
   return;
}

- (void)onDownloadFail:(DownloadInfo *)aDownloadInfo {
   
   [self onDownloadSuccess:aDownloadInfo];
   
   return;
}

//+ (void)destroy {
//
//   if (sharedInstance) {
//      [sharedInstance pauseAll];
//      sharedInstance=nil;
//   }
//}

- (void)dealloc {

   [self pauseAll];

   return;
}

@end
