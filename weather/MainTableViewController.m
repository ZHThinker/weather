//
//  MainTableViewController.m
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import "MainTableViewController.h"
#import "WeatherTableViewCell.h"
#import "Weather.h"

@interface MainTableViewController ()
@property (nonatomic, strong) NSArray *weather;
@property (nonatomic, strong) NSArray *testArray;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    [self loadData];
}

- (void)loadData {
    [self.refreshControl endRefreshing];
    
    for (int i = 0; i < 20; i++) {
        
        [Weather loadWeatherInformationWithCallBack:^(NSArray *array, NSError *error) {
            if (error) {
                NSLog(@"%@", error);
                return;
            } else {
                self.testArray = [self.testArray arrayByAddingObjectsFromArray:array];
                self.weather = self.testArray;
                NSLog(@"-------------------------%d", i);
            }
        } keepFirst:YES];
    }
}

- (void)setWeather:(NSMutableArray *)weather {
    _weather = weather;
    [self.tableView reloadData];
}

- (void)prepareUI {
    self.tableView.rowHeight = 67;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.title = @"郑州天气";
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weather.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherTableViewCell *cell = [WeatherTableViewCell cellWithTableView:tableView];
    Weather *weather = self.weather[indexPath.row];
    
    cell.weather = weather;
    return cell;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (NSArray *)testArray {
    if (_testArray == nil) {
        _testArray = [[NSArray alloc] init];
    }
    return _testArray;
}
@end
