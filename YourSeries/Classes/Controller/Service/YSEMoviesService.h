//
//  YSESeriesService.h
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import <Foundation/Foundation.h>

// Model
#import "YSEMovie.h"

@interface YSEMoviesService : NSObject

/********************************************************************************/
#pragma mark - Services

+ (void)fetchTopTenSeriesWithSuccess:(void (^)(NSArray *movies))success
                             failure:(void (^)(NSArray *errors))failure;

+ (void)detailsForMovieWithidIMDB:(NSString *)idIMDB
                          success:(void (^)(YSEMovie *movie))success
                          failure:(void (^)(NSArray *errors))failure;

@end
