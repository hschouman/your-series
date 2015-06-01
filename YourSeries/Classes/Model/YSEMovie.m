//
//  YSEMovie.m
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSEMovie.h"

// WS Key

NSString *const YSEMovieWSKeyDirectors = @"directors";
NSString *const YSEMovieWSKeyDirectorsName = @"name";
NSString *const YSEMovieWSKeyFimlLocations = @"filmingLocations";
NSString *const YSEMovieWSKeyGenres = @"genres";
NSString *const YSEMovieWSKeyPlot = @"plot";
NSString *const YSEMovieWSKeyRating = @"rating";
NSString *const YSEMovieWSKeyRuntime = @"runtime";
NSString *const YSEMovieWSKeyYear = @"year";

@implementation YSEMovie


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    
    if (self)
    {
        NSArray *directorsDictionaries = [dictionary objectForKey:YSEMovieWSKeyDirectors];
        NSMutableArray *directorsMutableArray = [[NSMutableArray alloc] init];
        for (NSDictionary *director in directorsDictionaries) {
            [directorsMutableArray addObject:[director objectForKey:YSEMovieWSKeyDirectorsName]];
        }
        _directors = directorsMutableArray;
        _filmingLocations = [dictionary objectForKey:YSEMovieWSKeyFimlLocations];
        _genres = [dictionary objectForKey:YSEMovieWSKeyGenres];
        _plot = [dictionary objectForKey:YSEMovieWSKeyPlot];
        _rating = [dictionary objectForKey:YSEMovieWSKeyRating];
        NSArray *runtimes = [dictionary objectForKey:YSEMovieWSKeyRuntime];
        _runtime = runtimes.firstObject;
        _year = [dictionary objectForKey:YSEMovieWSKeyYear];
    }
    return self;
}

@end
