//
//  INetworkManager.h
//  NetworkService
//
//  Created by Harry on 2022/3/11.
//
//  Mail: miniwing.hz@gmail.com
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

#import <IDEAServiceManager/IDEAServiceManager.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, Status) {
   
    StatusNone,
    StatusPrepareDownload,
    StatusDownloading,
    StatusWait,
    StatusPaused,
    StatusCompleted,
    StatusError
};

@protocol INetworkManager <IDEAIService>

@property (nonatomic, readonly)              NSString                            * downloadStartedNotification;
@property (nonatomic, readonly)              NSString                            * downloadFinishedNotification;
@property (nonatomic, readonly)              NSString                            * downloadCancelledNotification;
@property (nonatomic, readonly)              NSString                            * downloadPausedNotification;
@property (nonatomic, readonly)              NSString                            * downloadFailedNotification;

- (void)download:(NSString *)aURL
          toPath:(NSString *)aPath
       withBlock:(void (^)(NSString *aURL, NSString *aPath, Status eStatus, NSUInteger aProgress, NSUInteger aSize))block;

@end

NS_ASSUME_NONNULL_END
