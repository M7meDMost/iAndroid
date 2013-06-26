    //
//  StatusBarTime.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StatusBarTime.h"


@implementation StatusBarTime

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self runTimer];
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
	[StatusBarTime release];
	[clockLabel release];
	clockLabel = nil;
}

- (void)runTimer {
	// This starts the timer which fires the showActivity
	// method every 0.5 seconds
	myTicker = [NSTimer scheduledTimerWithTimeInterval: 0.5
												target: self
											  selector: @selector(showActivity)
											  userInfo: nil
											   repeats: YES];
	
}

// This method is run every 0.5 seconds by the timer created
// in the function runTimer
- (void)showActivity {
	
	NSDateFormatter *formatter =
	[[[NSDateFormatter alloc] init] autorelease];
    NSDate *date = [NSDate date];
	
    // This will produce a time that looks like "12:15 PM".
    [formatter setTimeStyle:NSDateFormatterShortStyle];
	
	// This sets the label with the updated time.
	[clockLabel setText:[formatter stringFromDate:date]];
	
}

@end