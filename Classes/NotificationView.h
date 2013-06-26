//
//  NotificationView.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShutDownView.h"


@class LockScreen;
@interface NotificationView : UIViewController {
	IBOutlet ShutDownView *powerOff;
	IBOutlet LockScreen *lockscreen;
	
	NSTimer *batteryTimer;
	IBOutlet UILabel *batteryCurrentState;
	IBOutlet UILabel *batteryCurrentCharge;
	IBOutlet UILabel *IAIDLabel;
}
-(IBAction)close;
-(IBAction)lock;
-(IBAction)shutOff;
@end
