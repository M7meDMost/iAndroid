//
//  LockScreen.m
//  iAndroid
//
//  Created by Guillermo Moran on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LockScreen.h"


@implementation LockScreen
-(IBAction)unlock:(UISlider*)sender {
	if (unlocker.value == 1) {
		HomeScreen *home = [[[HomeScreen alloc] initWithNibName:@"HomeScreen" bundle:nil] autorelease];
		home.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:home animated:YES];
		
	}
	else {
		unlocker.value = 0;
	}

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
	UIImage *thumbImage = [UIImage imageNamed:@"Unlocker.png"];
	[unlocker setThumbImage:thumbImage forState:UIControlStateNormal];
	[unlocker setMinimumTrackImage:[UIImage imageNamed:@"clear.png"] forState:UIControlStateNormal];
	[unlocker setMaximumTrackImage:[UIImage imageNamed:@"clear.png"] forState:UIControlStateNormal];
	
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
	[unlocker release];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    unlocker = nil;
}


- (void)dealloc {
    [super dealloc];
	[unlocker release];
	
}


@end
