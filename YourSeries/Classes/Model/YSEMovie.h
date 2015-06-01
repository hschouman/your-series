//
//  YSEMovie.h
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YSEMedia.h"

@interface YSEMovie : YSEMedia

@property (strong, nonatomic) NSArray *directors;
@property (strong, nonatomic) NSArray *filmingLocations;
@property (strong, nonatomic) NSArray *genres;
@property (strong, nonatomic) NSString *plot;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *runtime;
@property (strong, nonatomic) NSNumber *year;

@end
