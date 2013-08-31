//
// Created by azu on 2013/08/31.
//


#import <Foundation/Foundation.h>

@class ExampleScheduleDataSource;


@interface LocalNotificationManager : NSObject
@property(nonatomic, strong) ExampleScheduleDataSource *scheduleDataSource;
// ローカル通知を登録する
- (void)scheduleLocalNotifications;
@end