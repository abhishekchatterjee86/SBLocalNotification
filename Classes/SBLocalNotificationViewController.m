//
//  SBLocalNotificationViewController.m
//  SBLocalNotification
//
//  Created by abhishek chatterjee on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SBLocalNotificationViewController.h"

@implementation SBLocalNotificationViewController

@synthesize datePicker = mDatePicker;
@synthesize alertBodyField = mAlertBodyField;
@synthesize alertNotification = mAlertNotification;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (void)dealloc {
	
	self.datePicker = nil;
	self.alertBodyField = nil;
	self.alertNotification = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark === Text Field Delegate ===
#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}

#pragma mark -
#pragma mark === View Actions ===
#pragma mark -

/*!
    @method     :clearNotification
    @abstract   Cancels the delivery of the specified scheduled local notification.
    @discussion 
*/

- (void)clearNotification {
	
	//Fetch particular UILocalNotification object from scheduledLocalNotifications array.
	/*NSString *myIDToCancel = self.alertBodyField.text;
	
	UILocalNotification *notificationToCancel=nil;
	
	for(UILocalNotification *aNotif in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
		if([aNotif.userInfo objectForKey:kRemindMeNotificationDataKey] isEqualToString:myIDToCancel]) {
			notificationToCancel=aNotif;
			break;
		}
	}
	[[UIApplication sharedApplication] cancelLocalNotification:notificationToCancel];*/
	
	//Cancels the delivery of all scheduled local notifications.
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
}

/*!
    @method     :scheduleNotification:
    @abstract   Schedules a local notification for delivery at its encapsulated date and time.
    @discussion 
*/

- (IBAction) scheduleNotification:(id)sender {
	
	[self.alertBodyField resignFirstResponder];
	
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
	
	Class cls = NSClassFromString(@"UILocalNotification");
	if (cls != nil) {
		
		//Create the localNotification object
		UILocalNotification *notif = [[cls alloc] init];
		
		//Set the date when the alert will be launched using the date adding the time the user selected on the timer
		notif.fireDate = [NSDate dateWithTimeIntervalSinceNow:[self.datePicker countDownDuration]];
		
		//The time zone of the notification’s fire date.
		notif.timeZone = [NSTimeZone defaultTimeZone];
		
		//The message displayed in the notification alert.
		notif.alertBody = @"Did you forget something?";
		
		//The title of the action button or slider.
		notif.alertAction = @"Show me";
		
		//The name of the file containing the sound to play when an alert is displayed.
		notif.soundName = @"Walkie Talkie Static.caf"; //UILocalNotificationDefaultSoundName;
		
		//Identifies the image used as the launch image when the user taps (or slides) the action button (or slider).
		notif.alertLaunchImage = @"apple-iphone-wallpaper.jpg";
		
		//The number to display as the application’s icon badge.
		notif.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
		
		//A dictionary for passing custom information to the notified application.
		//You may add arbitrary key-value pairs to this dictionary. However, the keys and values must be valid property-list types; if any are not, an exception is raised.
		NSDictionary *userDict = [NSDictionary dictionaryWithObject:self.alertBodyField.text forKey:kRemindMeNotificationDataKey];
		notif.userInfo = userDict;
		
		//The calendar interval at which to reschedule the notification.
		//If you assign an calendar unit such as weekly (NSWeekCalendarUnit) or yearly (NSYearCalendarUnit), the system reschedules the notification for delivery at the specified interval. 
		//The default value is 0, which means don't repeat.
		notif.repeatInterval = 0.0;
		
		//Schedules a local notification
		[[UIApplication sharedApplication] scheduleLocalNotification:notif];
		
		[notif release];
		
		[self.alertNotification setHidden:NO];
	}
}

#pragma mark -
#pragma mark === Public Methods ===
#pragma mark -

- (void)showReminder:(NSString *)text {
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
														message:text delegate:nil
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}


@end
