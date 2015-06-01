//
//  YSEMedia.h
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSEMedia : NSObject

/********************************************************************************/
#pragma mark - Properties

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *urlPoster;
@property (strong, nonatomic) NSString *idIMDB;

/********************************************************************************/
#pragma mark - Methods

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
