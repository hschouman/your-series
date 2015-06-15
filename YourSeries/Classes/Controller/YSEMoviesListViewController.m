//
//  ViewController.m
//  YourSeries
//
//  Created by Hugo Schouman on 29/05/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSEMoviesListViewController.h"

// View
#import "YSESerieTableViewCell.h"

// Controller
#import "YSEMovieDetailsViewController.h"

// Service
#import "YSEMoviesService.h"

// Constant
NSString *const YSEMovieDetailsViewControllerSegueIdentifier = @"YSEMovieDetailsViewControllerSegueIdentifier";

@interface YSEMoviesListViewController ()

/********************************************************************************/
#pragma mark - Properties

@property (strong, nonatomic) NSArray *topTenMovies;

@end

@implementation YSEMoviesListViewController

/********************************************************************************/
#pragma mark - Birth & Death

- (void)viewDidLoad {
    [super viewDidLoad];
    [YSEMoviesService fetchTopTenSeriesWithSuccess:^(NSArray *movies){
        self.topTenMovies = movies;
        [self.tableView reloadData];
    } failure:^(NSArray *errors) {
        NSError *error = errors.firstObject;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        [alertView show];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    YSEMovieDetailsViewController *viewController = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    YSEMovie *movie = [self.topTenMovies objectAtIndex:path.row];
    if (movie) {
        viewController.movie = movie;
    }
}

/********************************************************************************/
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.topTenMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSESerieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YSESerieTableViewCellIdentifier"];
    YSEMovie *movie = [self.topTenMovies objectAtIndex:indexPath.row];
    [cell configureWithMovie:movie];
    return cell;
}

@end
