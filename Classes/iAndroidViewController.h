//
//  iAndroidViewController.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/1/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreen.h"
#import "LockScreen.h"

@interface iAndroidViewController : UIViewController {
	//Boot Preference Code
	
	IBOutlet UIView *normal;
	IBOutlet UIView *verbose;
	IBOutlet UIProgressView *normalProgress;
	double normalnumber;
	IBOutlet UIProgressView *verboseProgress;
	double verbosenumber;
	IBOutlet HomeScreen *home;
	NSTimer *myTimer;
	IBOutlet UIImageView *bootlogo;
	IBOutlet UIImageView *verboseboot;
	IBOutlet UIView *bootSelector;
	IBOutlet UISegmentedControl *verboseControl;
	IBOutlet UISegmentedControl *testMode;
	
	
}
-(IBAction)verboseboot;
-(IBAction)normalboot;
-(void)increaseamount;
-(void)increaseamountVERBOSE;

@end

