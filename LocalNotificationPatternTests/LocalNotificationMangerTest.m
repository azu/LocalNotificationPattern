//
// Created by azu on 2013/08/31.
//


#import <SenTestingKit/SenTestingKit.h>
#import "LocalNotificationManager.h"

// テスト用にLocalNotificationManagerを継承したモッククラスを作る
@interface LocationNotificationManagerSpy : LocalNotificationManager
@property(nonatomic) NSMutableArray *schedules;

- (UILocalNotification *)notificationAtIndex:(NSUInteger) index;

// stub method
- (void)schedule:(NSDate *) fireDate alertBody:(NSString *) alertBody userInfo:(NSDictionary *) userInfo;
@end

@implementation LocationNotificationManagerSpy
- (NSMutableArray *)schedules {
    if (_schedules == nil) {
        _schedules = [NSMutableArray array];
    }
    return _schedules;
}

- (UILocalNotification *)notificationAtIndex:(NSUInteger) index {
    if (index < [self.schedules count]) {
        return self.schedules[index];
    }
    return nil;
}

// 通知を登録するメソッドを乗っ取り、呼ばれたことを記録する(いわゆるspy)
- (void)schedule:(NSDate *) fireDate alertBody:(NSString *) alertBody userInfo:(NSDictionary *) userInfo {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = fireDate;
    notification.alertBody = alertBody;
    notification.userInfo = userInfo;
    [self.schedules addObject:notification];
}
@end

// 実際のテストクラス
@interface LocalNotificationMangerTest : SenTestCase
@end

@implementation LocalNotificationMangerTest {
}

@end
