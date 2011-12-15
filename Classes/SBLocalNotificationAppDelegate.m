//
//  SBLocalNotificationAppDelegate.m
//  SBLocalNotification
//
//  Created by abhishek chatterjee on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SBLocalNotificationAppDelegate.h"

@implementation SBLocalNotificationAppDelegate

@synthesize window;
@synthesize viewController;

NSString *kRemindMeNotificationDataKey = @"kRemindMeNotificationDataKey";

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
	Class cls = NSClassFromString(@"UILocalNotification");
	if (cls) {
		UILocalNotification *notification = [launchOptions objectForKey:
											 UIApplicationLaunchOptionsLocalNotificationKey];
		
		if (notification) {
			NSString *reminderText = [notification.userInfo 
									  objectForKey:kRemindMeNotificationDataKey];
			[viewController showReminder:reminderText];
		}
	}
	
	application.applicationIconBadgeNumber = 0;
    
	[self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
	/*
	 Sent to the delegate when a running application receives a local notification.
	 The delegate can implement this method if it wants to be notified that a local notification occurred. 
	 For example, if the application is a calendar application, it can enumerate its list of calendar events to determine which ones have due dates that have transpired or are about to transpire soon. 
	 It can also reset the application icon badge number, and it can access any custom data in the local-notification object’s userInfo dictionary.
	*/
	
	application.applicationIconBadgeNumber = 0;
	NSString *reminderText = [notification.userInfo
							  objectForKey:kRemindMeNotificationDataKey];
	[viewController showReminder:reminderText];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
	[viewController release];
    [super dealloc];
}


@end
