//
//  YSESeriesService.h
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSESeriesService : NSObject

+ (void)fetchTopTenSeriesWithSuccess:(void (^)(NSArray *movies))success
                             failure:(void (^)(NSArray *errors))failure;

+ (NSArray *)parseTopTenMoviesResponse:(NSDictionary *)dictionary;

@end
