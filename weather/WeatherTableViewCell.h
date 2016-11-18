//
//  WeatherTableViewCell.h
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface WeatherTableViewCell : UITableViewCell

@property (nonatomic, strong) Weather *weather;
+ (WeatherTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
