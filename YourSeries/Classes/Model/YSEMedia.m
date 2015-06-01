//
//  YSEMedia.m
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSEMedia.h"

// WS Keys
NSString *const YSEMediaTitleWSKey = @"title";
NSString *const YSEMediaUrlPosterWSKey = @"urlPoster";
NSString *const YSEMediaidIMDBWSKey = @"idIMDB";

@implementation YSEMedia

/********************************************************************************/
#pragma mark - Configure

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:NSDictionary.class])
    {
        return nil;
    }
    
    self = [super init];
    
    if (self)
    {
        _title = [dictionary objectForKey:YSEMediaTitleWSKey];
        _urlPoster = [dictionary objectForKey:YSEMediaUrlPosterWSKey];
        _idIMDB = [dictionary objectForKey:YSEMediaidIMDBWSKey];
    }
    return self;
}

@end
