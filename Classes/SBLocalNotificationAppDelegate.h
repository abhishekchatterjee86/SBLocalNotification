//
//  SBLocalNotificationAppDelegate.h
//  SBLocalNotification
//
//  Created by abhishek chatterjee on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBLocalNotificationViewController.h"

@interface SBLocalNotificationAppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow *window;
	SBLocalNotificationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SBLocalNotificationViewController *viewController;

@end

