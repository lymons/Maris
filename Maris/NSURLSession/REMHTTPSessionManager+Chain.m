//
//  REMHTTPSessionManager+Chain.m
//  Maris
//
//  Created by ツナミ 龍 on 16/1/22.
//  Copyright © 2016年 Scott Petit. All rights reserved.
//

#import "REMHTTPSessionManager+Chain.h"

@implementation REMHTTPSessionManager (Chain)

+ (REMHTTPSessionManager *(^)(NSString *host))make
{
    return ^(NSString *host) {
        REMHTTPSessionManager *chainable = [[REMHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:host]];
        return chainable;
    };
}

- (REMHTTPSessionManager *(^)(NSDictionary *params))gernalHeader
{
    return ^(NSDictionary *params) {
        //
        return self;
    };
}

- (MarisClient *(^)(NSString *path))client
{
    return ^(NSString *path) {
        MarisClient *chainable = MarisClient.make.manager(self).path(path);
        return chainable;
    };
}

@end
