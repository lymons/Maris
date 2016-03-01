//
//  MarisClient.h
//  Maris
//
//  Created by ツナミ 龍 on 16/1/22.
//  Copyright © 2016年 Scott Petit. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "REMHTTPSessionManager.h"

typedef void (^SessionManagerSuccess)(NSURLSessionDataTask *dataTask, id responseObject);
typedef void (^SessionManagerFailure)(NSURLSessionDataTask *dataTask, NSError *error);
typedef void (^DownloadProgress)(NSProgress *downloadProgress);

@interface MarisClient : NSObject
{

}

+ (MarisClient *)make;

- (MarisClient *(^)(REMHTTPSessionManager *manager))manager;
- (MarisClient *(^)(NSString *path))path;
- (MarisClient *(^)(NSDictionary *params))query;
- (MarisClient *(^)(NSDictionary *params))header;
- (MarisClient *(^)(__unsafe_unretained Class class))model;
- (MarisClient *(^)(NSString *keyPath))keyPath;
- (MarisClient *(^)(SessionManagerSuccess block))success;
- (MarisClient *(^)(SessionManagerFailure block))failure;
- (MarisClient *(^)(DownloadProgress block))progress;

- (MarisClient *(^)())get;

@end

@interface MarisClientGet : MarisClient

@end
