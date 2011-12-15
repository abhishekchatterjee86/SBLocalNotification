//
//  SBLocalNotificationViewController.h
//  SBLocalNotification
//
//  Created by abhishek chatterjee on 07/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SBLocalNotificationViewController : UIViewController {

	UIDatePicker *mDatePicker;
    UITextField	 *mAlertBodyField;
    UILabel		 *mAlertNotification;
}

extern NSString *kRemindMeNotificationDataKey;

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) IBOutlet UITextField	*alertBodyField;
@property (nonatomic, retain) IBOutlet UILabel		*alertNotification;

- (IBAction) scheduleNotification:(id)sender;
- (void) clearNotification;
- (void) showReminder:(NSString *)text;

@end
