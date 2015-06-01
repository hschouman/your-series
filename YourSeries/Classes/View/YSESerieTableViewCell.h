//
//  YSESerieTableViewCell.h
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import <UIKit/UIKit.h>

// Model
#import "YSEMovie.h"

@interface YSESerieTableViewCell : UITableViewCell

/********************************************************************************/
#pragma mark - Configure

- (void)configureWithMovie:(YSEMovie *)movie;

@end
