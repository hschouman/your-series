//
//  YSESeriesService.m
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSEMoviesService.h"

// Manager
#import "AFHTTPRequestOperationManager.h"

// Model
#import "YSEMovie.h"

// Constants
NSString *const YSEMoviesServiceTopTenUrl = @"http://www.myapifilms.com/imdb/top";
NSString *const YSEMoviesServiceDetailsUrl = @"http://www.myapifilms.com/imdb?idIMDB=";

@implementation YSEMoviesService

/********************************************************************************/
#pragma mark - Services

+ (void)fetchTopTenSeriesWithSuccess:(void (^)(NSArray *movies))success
                             failure:(void (^)(NSArray *errors))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:YSEMoviesServiceTopTenUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (success) {
            success([YSEMoviesService parseTopTenMoviesResponse:responseObject]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (error) {

        }
    }];
}

+ (void)detailsForMovieWithidIMDB:(NSString *)idIMDB
                          success:(void (^)(YSEMovie *movie))success
                          failure:(void (^)(NSArray *errors))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSString *url = [NSString stringWithFormat:@"%@%@", YSEMoviesServiceDetailsUrl, idIMDB];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (success) {
            YSEMovie *movie = [[YSEMovie alloc] initWithDictionary:responseObject];
            success(movie);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (error) {
            
        }
    }];
}

/********************************************************************************/
#pragma mark - Parsing Responses

+ (NSArray *)parseTopTenMoviesResponse:(NSDictionary *)dictionary
{
    NSMutableArray *movies = [NSMutableArray new];
    
    for (id jsonMovie in dictionary)
    {
        YSEMovie *movie = [[YSEMovie alloc] initWithDictionary:jsonMovie];
        if (movie)
        {
            [movies addObject:movie];
        }
    }
    return movies;
}

@end
