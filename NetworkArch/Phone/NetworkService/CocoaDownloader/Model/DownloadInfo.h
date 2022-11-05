//
//  DownloadInfo.h
//  Download task data
//  It contains download data, download url, save path, download progress, status, error, etc.
//
//  Created by smile on 2018/12/12.
//  Copyright © 2018 ixuea(http://a.ixuea.com/y). All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Download status

 - DownloadStatusNone: No download started.
 - DownloadStatusPrepareDownload: Prepare Download.
 - DownloadStatusDownloading: Downloading.
 - DownloadStatusWait: Waiting for download,Over the maximum number of downloads, other tasks are waiting. If other tasks are downloaded, the tasks waiting will automatically be downloaded.
 - DownloadStatusPaused: Donwload pause.
 - DownloadStatusCompleted: Download completed.
 - DownloadStatusError: When the download goes wrong, you can get detailed error information through the error field.
 */
typedef NS_ENUM(NSUInteger, DownloadStatus) {
   
    DownloadStatusNone,
    DownloadStatusPrepareDownload,
    DownloadStatusDownloading,
    DownloadStatusWait,
    DownloadStatusPaused,
    DownloadStatusCompleted,
    DownloadStatusError
};

NS_ASSUME_NONNULL_BEGIN

@interface DownloadInfo : NSObject

/**
 Download Id,it should be globally unique.
 */
@property (nonatomic, strong)    NSString       * id;

/**
 Download url.
 */
@property (nonatomic, strong)    NSString       * uri;

/**
 Save path, it's the relative documents path.
 */
@property (nonatomic, strong)    NSString       * path;

/**
 Download progress, unit byte.
 */
@property (nonatomic, assign)    long             progress;

/**
 File total size, unit byte.
 */
@property (nonatomic, assign)    long             size;

/**
 Download status, the default value is DownloadStatusNone,@see DownloadStatus for the possible values.
 */
@property (nonatomic, assign)    DownloadStatus   status;

/**
 Does the server support breakpoint download? It is not currently in use.
 */
@property (nonatomic, assign)    BOOL             supportRange;

/**
 Download info create time, You need to set it up by yourself, Used to sort the query download list by default in reverse order.
 */
@property (nonatomic, assign)    double           createdAt;

/**
 When the download is wrong, it may be valuable.
 */
@property (nonatomic, strong)    NSError        * error;

/**
 Download callback,progress, status, etc. callback.
 */
@property (nonatomic, copy)      void             (^downloadBlock)(DownloadInfo *downloadInfo);

@end

NS_ASSUME_NONNULL_END
