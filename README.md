# weather
基于AFNetworking框架，实现多次网络请求中只保留第一次或最后一次请求。

```objective-c
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
    } keepFirst:NO];
 }
```
我们在控制器中用for循环发出20个请求，如果`keepFirst`参数为NO,控制台输出为：

![保留最后一次请求](http://upload-images.jianshu.io/upload_images/740137-164d95026295d131.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如果`keepFirst`参数为YES,控制台输出为：

![保留第一次请求](http://upload-images.jianshu.io/upload_images/740137-26bd7833365bd62c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)