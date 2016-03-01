//
//  REMHTTPSessionManager+Chain.h
//  Maris
//
//  Created by ツナミ 龍 on 16/1/22.
//  Copyright © 2016年 Scott Petit. All rights reserved.
//

#import "REMHTTPSessionManager.h"
#import "MarisClient.h"

@interface REMHTTPSessionManager (Chain)

+ (REMHTTPSessionManager *(^)(NSString *host))make;

- (MarisClient *(^)(NSString *path))client;

@end
