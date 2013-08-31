//
// Created by azu on 2013/08/31.
//


#import "LocalNotificationManager.h"
#import "ExampleScheduleDataSource.h"


const struct LocalNotificationAttributes LocalNotification = {
    .weeklyWork = @"LocalNotification.weeklyWork"
};

@implementation LocalNotificationManager

#pragma mark - Scheduler
- (void)scheduleLocalNotifications {
    // 一度通知を全てキャンセルする
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // 通知を設定していく...
    [self scheduleWeeklyWork];

#if DEBUG
    for (UILocalNotification *notification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        NSLog(@"Notifications : %@ '%@'",
            [dateFormatter stringFromDate:notification.fireDate],
            notification.alertBody
        );
    }
#endif
}

- (ExampleScheduleDataSource *)scheduleDataSource {
    NSAssert(_scheduleDataSource != nil, @"通知登録のデータソースが設定されてない！");
    return _scheduleDataSource;
}

// 例: weeklyWorkSchedule の時間を通知登録する
- (void)scheduleWeeklyWork {
    // NSDateの配列が返ってくる
    NSArray *schedules = [self.scheduleDataSource weeklyWorkSchedule];
    for (NSDate *date in schedules) {
        [self makeNotification:date alertBody:@"Work Schedule" userInfo:@{
            @"key" : LocalNotification.weeklyWork
        }];
    }
}

#pragma mark - helper
- (void)makeNotification:(NSDate *) fireDate alertBody:(NSString *) alertBody userInfo:(NSDictionary *) userInfo {
    // 現在より前の通知は設定しない
    if (fireDate == nil || [fireDate timeIntervalSinceNow] <= 0) {
        return;
    }
    [self schedule:fireDate alertBody:alertBody userInfo:userInfo];
}

- (void)schedule:(NSDate *) fireDate alertBody:(NSString *) alertBody userInfo:(NSDictionary *) userInfo {
    // ローカル通知を作成する
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    [notification setFireDate:fireDate];
    // タイムゾーンを指定する
    [notification setTimeZone:[NSTimeZone systemTimeZone]];
    // メッセージを設定する
    [notification setAlertBody:alertBody];
    [notification setUserInfo:userInfo];
    // 効果音は標準の効果音を利用する
    [notification setSoundName:UILocalNotificationDefaultSoundName];
    // ボタンの設定
    [notification setAlertAction:@"Open"];
    // ローカル通知を登録する
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
@end