//
//  MarisClient.m
//  Maris
//
//  Created by ツナミ 龍 on 16/1/22.
//  Copyright © 2016年 Scott Petit. All rights reserved.
//

#import "MarisClient.h"


@interface MarisClient ( )

@property (nonatomic, strong) REMHTTPSessionManager *sm;

@property (nonatomic, strong) NSString *hostString;
@property (nonatomic, strong) NSString *pathString;
@property (nonatomic, strong) NSDictionary *queries;
@property (nonatomic, strong) NSDictionary *headers;
@property (nonatomic, strong) Class modelClass;
@property (nonatomic, strong) NSString *keyPathString;
@property (nonatomic, assign) SessionManagerSuccess successBlock;
@property (nonatomic, assign) SessionManagerFailure failureBlock;
@property (nonatomic, assign) DownloadProgress progressBlock;

@end

@implementation MarisClient

+ (MarisClient *)make {
    MarisClient *chainable = [[MarisClient alloc] init];
    return chainable;
}

#pragma mark -

- (MarisClient *(^)(REMHTTPSessionManager *manager))manager
{
    return ^(REMHTTPSessionManager *manager) {
        self.sm = manager;
        return self;
    };
}

- (MarisClient *(^)(NSString *host))host
{
    return ^(NSString *host) {
        self.hostString = host;
        return self;
    };
}

- (MarisClient *(^)(NSString *path))path
{
    return ^(NSString *path) {
        self.pathString = path;
        return self;
    };
}

- (MarisClient *(^)(NSDictionary *params))query
{
    return ^(NSDictionary *params) {
        self.queries = params;
        return self;
    };
}

- (MarisClient *(^)(NSDictionary *params))header
{
    return ^(NSDictionary *params) {
        self.headers = params;
        return self;
    };
}

- (MarisClient *(^)(__unsafe_unretained Class class))model
{
    return ^(__unsafe_unretained Class class) {
        self.modelClass = class;
        return self;
    };
}

- (MarisClient *(^)(NSString *keyPath))keyPath
{
    return ^(NSString *keyPath) {
        self.keyPathString = keyPath;
        return self;
    };
}

- (MarisClient *(^)(SessionManagerSuccess block))success
{
    return ^(SessionManagerSuccess block) {
        self.successBlock = block;
        return self;
    };
}

- (MarisClient *(^)(SessionManagerFailure block))failure
{
    return ^(SessionManagerFailure block) {
        self.failureBlock = block;
        return self;
    };
}

- (MarisClient *(^)(DownloadProgress block))progress
{
    return ^(DownloadProgress block) {
        self.progressBlock = block;
        return self;
    };
}

- (MarisClient *(^)())get
{
    return ^() {
        [self.headers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.sm.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
        [self.sm GET:self.pathString
          parameters:self.queries
            progress:self.progressBlock
          modelClass:self.modelClass
             keyPath:self.keyPathString
             success:self.successBlock
             failure:self.failureBlock];
        return self;
    };
}


@end
