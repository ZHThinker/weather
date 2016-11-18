//
//  NetworkTools.m
//  weather
//
//  Created by 张衡 on 15/11/3.
//  Copyright © 2015年 张衡. All rights reserved.
//

#import "NetworkTools.h"

static NSString *errorDomainName = @"com.friends.www";

@interface NetworkTools ()
@property (nonatomic, strong) NSMutableDictionary *datas;
@end

@implementation NetworkTools

- (void)loadWeatherInformationWithCallBack:(callBack)callBack keepFirst:(BOOL)isKeepFirst {

    NSString *string = @"data/sk/101180101.html";
    [self requestMethod:@"GET" URLString:string params:nil finish:callBack keepFirst:isKeepFirst];
    
}

// get和post的封装
- (void)requestMethod:(NSString *)method URLString:(NSString *)string params:(NSDictionary *)params finish:(callBack)callBack keepFirst:(BOOL)isKeepFirst {
    
    // 成功回调
    void(^successBlock)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
        
        [self.datas removeObjectForKey:string];
        if (responseObject) {
            callBack(responseObject, nil);
        } else {
            NSError *error = [[NSError alloc] initWithDomain:errorDomainName code:-1990 userInfo:@{@"error" : @"请求成功，但数据为空"}];
            callBack(nil, error);
        }
    };
    // 失败回调
    void(^failBlock)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.datas removeObjectForKey:string];
        if ([error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"cancelled"]) {
            return;
        }
        callBack(nil, error);
    };
    
    NSURLSessionDataTask *originalTask = [self.datas objectForKey:string];
    if (isKeepFirst && originalTask) {
        return;
    }
    
    [originalTask cancel];
    NSURLSessionDataTask *task = nil;
    if ([method isEqualToString:@"GET"]) {
        task = [self GET:string parameters:params success:successBlock failure:failBlock];
    }
    if ([method isEqualToString:@"POST"]) {
        task = [self POST:string parameters:params success:successBlock failure:failBlock];
    }
    [self.datas setValue:task forKey:string];
}


+ (instancetype)shareNetworkTools {
    
    static NetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/"];
        instance = [[NetworkTools alloc] initWithBaseURL:url];
        [AFJSONRequestSerializer serializer];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", nil];
    });
    return instance;
}

- (NSMutableDictionary *)datas {
    if (_datas == nil) {
        _datas = [NSMutableDictionary dictionary];
    }
    return _datas;
}
@end
