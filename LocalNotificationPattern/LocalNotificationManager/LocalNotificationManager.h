//
// Created by azu on 2013/08/31.
//


#import <Foundation/Foundation.h>

@class ExampleScheduleDataSource;

/*
 通知から起動する際に、UILocalNotification.userInfoの値を見て
 どの通知から来たのを知るためにkey情報
  */
extern const struct LocalNotificationAttributes {
    __unsafe_unretained NSString *weeklyWork;
} LocalNotificationAttributes;

@interface LocalNotificationManager : NSObject
@property(nonatomic, strong) ExampleScheduleDataSource *scheduleDataSource;
// ローカル通知を登録する
- (void)scheduleLocalNotifications;
@end