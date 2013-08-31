//
// Created by azu on 2013/08/31.
//


#import <Foundation/Foundation.h>
// 次にローカル通知登録ために使うデータを返してくれるようなクラス
@interface ExampleScheduleDataSource : NSObject
// 現在から1週間のスケジュールを返してくれる
- (NSArray *)weeklyWorkSchedule;
@end