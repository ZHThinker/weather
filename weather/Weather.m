//
//  WeatherInformation.m
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import "Weather.h"
#import "NetworkTools.h"

@implementation Weather

+ (void)loadWeatherInformationWithCallBack:(void (^)(NSArray *, NSError *))callBack keepFirst:(BOOL)isKeepFirst {
    [[NetworkTools shareNetworkTools] loadWeatherInformationWithCallBack:^(NSDictionary *dict, NSError *error) {
        if (error) {
            callBack(nil, error);
            return;
        }
        NSMutableArray *marray = [[NSMutableArray alloc] init];
        NSDictionary *weatherinfo = dict[@"weatherinfo"];
        Weather *weather = [Weather weatherWithDict:weatherinfo];
        
        [marray addObject:weather];
        callBack(marray.copy, nil);
    } keepFirst:isKeepFirst];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weatherWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
@end
