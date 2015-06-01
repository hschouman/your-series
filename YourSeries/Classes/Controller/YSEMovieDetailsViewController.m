//
//  YSEMovieDetailsViewController.m
//  YourSeries
//
//  Created by Hugo Schouman on 01/06/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSEMovieDetailsViewController.h"

// Service
#import "YSESeriesService.h"

@interface YSEMovieDetailsViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *posterImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;


@end

@implementation YSEMovieDetailsViewController

/********************************************************************************/
#pragma mark - Birth & Death

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicatorView startAnimating];
    [self fetDetailsInfosOnTheMovie];
}

/********************************************************************************/
#pragma mark - Configure

- (void)fetDetailsInfosOnTheMovie
{
    [YSESeriesService detailsForMovieWithidIMDB:self.movie.idIMDB success:^(YSEMovie *movie) {
        [self stopActivityIndicator];
        self.movie = movie;
        [self configureWithMovie];
    } failure:^(NSArray *errors) {
        [self stopActivityIndicator];
    }];
}

- (void)configureWithMovie
{
    [self.titleLabel setText:self.movie.title];
    NSURL *posterUrl = [NSURL URLWithString:self.movie.urlPoster];
    NSData *posterData = [NSData dataWithContentsOfURL:posterUrl];
    if (posterData) {
        [self.posterImageView setImage:[UIImage imageWithData:posterData]];
    }
}

/********************************************************************************/
#pragma mark - Privates

- (void)stopActivityIndicator
{
    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView setHidden:YES];
    [self.titleLabel setHidden:NO];
    [self.posterImageView setHidden:NO];
}


@end
