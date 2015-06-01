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

// Constant
NSString *const YSEMovieDetailsViewControllerListSeparator = @", ";

@interface YSEMovieDetailsViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *posterImageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *filmingPlacesLabel;
@property (strong, nonatomic) IBOutlet UILabel *filmingPlacesTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *directorsTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *directorsLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;

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
        [self displayDetails];
        self.movie = movie;
        [self configureWithMovie];
    } failure:^(NSArray *errors) {
        [self displayDetails];
    }];
}

- (void)configureWithMovie
{
    NSString *title = [NSString stringWithFormat:@"%@ (%@)",self.movie.title, self.movie.year];
    [self.titleLabel setText:title];
    NSURL *posterUrl = [NSURL URLWithString:self.movie.urlPoster];
    NSData *posterData = [NSData dataWithContentsOfURL:posterUrl];
    if (posterData) {
        [self.posterImageView setImage:[UIImage imageWithData:posterData]];
    }
    [self.timeLabel setText:self.movie.runtime];
    [self.filmingPlacesLabel setText:[self.movie.filmingLocations componentsJoinedByString:YSEMovieDetailsViewControllerListSeparator]];
    [self.directorsLabel setText:[self.movie.directors componentsJoinedByString:YSEMovieDetailsViewControllerListSeparator]];
    [self.descriptionTextView setText:self.movie.plot];
}

/********************************************************************************/
#pragma mark - Privates

- (void)displayDetails
{
    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView setHidden:YES];
    
    [self.titleLabel setHidden:NO];
    [self.posterImageView setHidden:NO];
    [self.timeLabel setHidden:NO];
    [self.filmingPlacesTitleLabel setHidden:NO];
    [self.filmingPlacesLabel setHidden:NO];
    [self.directorsTitleLabel setHidden:NO];
    [self.directorsLabel setHidden:NO];
    [self.descriptionTextView setHidden:NO];
}


@end
