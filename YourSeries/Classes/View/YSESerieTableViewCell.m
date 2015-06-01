//
//  YSESerieTableViewCell.m
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSESerieTableViewCell.h"

@interface YSESerieTableViewCell ()

// UI
@property (strong, nonatomic) IBOutlet UILabel *serieTitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *serieImageView;

@end

@implementation YSESerieTableViewCell


/********************************************************************************/
#pragma mark - Configure

- (void)configureWithMovie:(YSEMovie *)movie
{
    [self.serieTitleLabel setText:movie.title];
    
    if (movie.urlPoster)
    {
        // Sync
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:movie.urlPoster]];
        [self.serieImageView setImage:[UIImage imageWithData:data]];
        
        // Async version
//        dispatch_async(dispatch_get_global_queue(0,0), ^{
//            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:movie.urlPoster]];
//            if ( data == nil )
//                return;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.serieImageView setImage:[UIImage imageWithData:data]];
//            });
//        });
    }

}

@end
