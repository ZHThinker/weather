//
//  NetworkTools.h
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^callBack)(NSDictionary *, NSError *);

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype)shareNetworkTools;

- (void)loadWeatherInformationWithCallBack:(callBack)callBack keepFirst:(BOOL)isKeepFirst;
@end
