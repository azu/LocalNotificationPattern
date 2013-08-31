//
// Created by azu on 2013/08/31.
//


#import "ExampleScheduleDataSource.h"
#import "NSDate+Escort.h"


@implementation ExampleScheduleDataSource {

}

- (NSArray *)weeklyWorkSchedule {
    return @[
        [NSDate date],
        [NSDate dateTomorrow]
    ];
}

@end