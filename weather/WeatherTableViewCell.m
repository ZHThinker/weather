//
//  WeatherTableViewCell.m
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import "WeatherTableViewCell.h"

#define WEATHERCELL @"weatherCell"

@interface WeatherTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UILabel *SD;
@property (weak, nonatomic) IBOutlet UILabel *WD;
@property (weak, nonatomic) IBOutlet UILabel *WS;

@end

@implementation WeatherTableViewCell

- (void)setWeather:(Weather *)weather {
    _weather = weather;
    self.city.text = weather.city;
    self.temp.text = weather.temp;
    self.SD.text = weather.SD;
    self.WD.text = weather.WD;
    self.WS.text = weather.WS;
}

+ (WeatherTableViewCell *)cellWithTableView:(UITableView *)tableView {
    
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WEATHERCELL];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
@end
