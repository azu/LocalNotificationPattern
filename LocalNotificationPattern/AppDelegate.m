//
//  AppDelegate.m
//  LocalNotificationPattern
//
//  Created by azu on 2013/08/31.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalNotificationManager.h"
#import "ExampleScheduleDataSource.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *) application didFinishLaunchingWithOptions:(NSDictionary *) launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *) application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

}

- (void)applicationDidEnterBackground:(UIApplication *) application {
    // バックグラウンドに移行際に通知を設定する
    LocalNotificationManager *notificationManager = [[LocalNotificationManager alloc] init];
    notificationManager.scheduleDataSource = [[ExampleScheduleDataSource alloc] init];
    [notificationManager scheduleLocalNotifications];
}

- (void)applicationWillEnterForeground:(UIApplication *) application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *) application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

}

- (void)applicationWillTerminate:(UIApplication *) application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

}

@end