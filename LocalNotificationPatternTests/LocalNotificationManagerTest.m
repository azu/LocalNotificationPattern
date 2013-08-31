//
// Created by azu on 2013/08/31.
//


#import <SenTestingKit/SenTestingKit.h>
#import "LocalNotificationManager.h"
#import "ExampleScheduleDataSource.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"
#import "NSDate+Escort.h"

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
@interface LocalNotificationManagerTest : SenTestCase
@end

@interface LocalNotificationManagerTest ()
@property(nonatomic, strong) LocationNotificationManagerSpy *managerSpy;
@end

@implementation LocalNotificationManagerTest {
}
- (void)setUp {
    [super setUp];
    self.managerSpy = [[LocationNotificationManagerSpy alloc] init];
}

- (void)tearDown {
    self.managerSpy = nil;
    [super tearDown];
}

- (void)testWeeklyWorkSchedule {
    // 通知に登録される日付オブジェクト
    NSDate *expectedDate = [[NSDate date] dateByAddingDays:5];
    NSArray *expectedScheduleDates = @[
        expectedDate
    ];
    // データソースをモックに差し替える
    id dataSourceMock = [OCMockObject mockForClass:[ExampleScheduleDataSource class]];
    [[[dataSourceMock stub] andReturn:expectedScheduleDates] weeklyWorkSchedule];
    self.managerSpy.scheduleDataSource = dataSourceMock;
    // 設定
    [self.managerSpy scheduleLocalNotifications];
    // 期待するもの
    // self.managerSpy.schedules には登録されるUILocalNotificationが入る
    for (UILocalNotification *localNotification in self.managerSpy.schedules) {
        STAssertEquals(localNotification.fireDate, expectedDate,
        @"通知に登録されたものはexpectedDateである");
    }
}
@end
