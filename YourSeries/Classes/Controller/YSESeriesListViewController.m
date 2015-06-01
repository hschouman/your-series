//
//  ViewController.m
//  YourSeries
//
//  Created by Hugo Schouman on 29/05/2015.
//  Copyright (c) 2015 octo. All rights reserved.
//

#import "YSESeriesListViewController.h"

// View
#import "YSESerieTableViewCell.h"

// Service
#import "YSESeriesService.h"

@interface YSESeriesListViewController ()

/********************************************************************************/
#pragma mark - Properties

@property (strong, nonatomic) NSArray *topTenMovies;

@end

@implementation YSESeriesListViewController

/********************************************************************************/
#pragma mark - Birth & Death

- (void)viewDidLoad {
    [super viewDidLoad];
    [YSESeriesService fetchTopTenSeriesWithSuccess:^(NSArray *movies){
        self.topTenMovies = movies;
        [self.tableView reloadData];
    } failure:^(NSArray *errors) {
        NSError *error = errors.firstObject;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"Fermer" otherButtonTitles:nil];
        [alertView show];
    }];
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

/********************************************************************************/
#pragma mark - UITableViewDelegate


@end
