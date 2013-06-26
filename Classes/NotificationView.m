//
//  NotificationView.m
//  iAndroid
//
//  Created by Guillermo Moran on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NotificationView.h"
#import <QuartzCore/QuartzCore.h>
#import "LockScreen.h"
#import "iAndroidAppDelegate.h"

@implementation NotificationView
-(IBAction)shutOff {
	powerOff.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController:powerOff animated:YES];
	[self.view removeFromSuperview];
}

-(IBAction)close {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	[self.view removeFromSuperview];
	//[theWindow addSubview:];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionReveal];
	[animation setSubtype:kCATransitionFromTop];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"closeNotiCenter"];
}

-(IBAction)lock {
	lockscreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController:lockscreen animated:YES];
	[self.view removeFromSuperview];
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	
	
	UIDevice *device = [UIDevice currentDevice];
	[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
	
	// Print current status
	[UIDevice currentDevice].batteryLevel;
	
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryStatus) name:@"UIDeviceBatteryLevelDidChangeNotification" object:device];
	batteryTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(batteryStatus) userInfo:nil repeats:YES];
	
	NSUserDefaults *IAIDdefaults = [NSUserDefaults standardUserDefaults];  
	IAIDLabel.text = [IAIDdefaults valueForKey:@"IAIDKey"]; 
}

- (void)batteryStatus
{
	NSString* currentCharge = [NSString stringWithFormat:@"%0.2f", [[UIDevice currentDevice] batteryLevel]];  
	NSString* percent = [currentCharge stringByReplacingOccurrencesOfString:@"0." withString:@""];
	NSString* currentPercentage = [NSString stringWithFormat:@"%@ Percent Of Battery Remaining!",percent]; 
	batteryCurrentCharge.text = currentPercentage;
		

																							
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
