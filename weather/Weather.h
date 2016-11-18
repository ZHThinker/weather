//
//  WeatherInformation.h
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *temp;
@property (nonatomic, copy) NSString *WD;
@property (nonatomic, copy) NSString *WS;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *SD;

+ (void)loadWeatherInformationWithCallBack:(void(^)(NSArray *, NSError *))callBack keepFirst:(BOOL)isKeepFirst;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weatherWithDict:(NSDictionary *)dict;
@end
