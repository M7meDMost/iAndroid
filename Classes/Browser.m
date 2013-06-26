//
//  Browser.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Browser.h"



@implementation Browser



-(IBAction)home {
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com/"]]];
}
-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];	
}
/*
-(IBAction)search {
	google.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:google animated:YES];
}
*/

-(IBAction)alertMe; {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About" message:@"Navigator Version 2.1b2 and the Two-Tab browsing system are created by Guillermo Moran. Copyright © 2010 PolarBear Studios. All Rights Reserved. For more of my creations add the source 'cydia.myrepospace.com/polarbear/' to Cydia, or follow me on twitter @Guillermo_Moran." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	[alert show];
	[alert release];
	
}

-(IBAction)closeText {
	
	// make sure url starts with “http://”
	if (! [webAdress.text hasPrefix:@"http://"]) {
		[webAdress setText:[NSString stringWithFormat:@"http://%@", webAdress.text]];
	}
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[webAdress text]]]];
	
	
}






/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
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
	
	//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com/"]]];
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(checkLoad) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(checkNotLoad) userInfo:nil repeats:YES];
	webAdress.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"homepageKey"];
	

	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webAdress.text]]];
}

//this code is telling it to load up the homepage.text string inside of the UITextField and then the webView loads whats insidde of that text


- (void)checkLoad {
	if (webView.loading) {
		[active startAnimating];
	}
	

}
- (void)checkNotLoad {
	if (!(webView.loading)) {
		[active stopAnimating];
	}
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return NO;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	[webView release];
	[webAdress release];
	[active release];
	[clockLabel release];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;

	webView = nil;
	webAdress = nil;
	active = nil;
	clockLabel = nil;
	
}


- (void)dealloc {
    [super dealloc];
	[webView release];
	[webAdress release];
	[active release];
	[clockLabel release];

	
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
	
    // This will produce a time that looks like "12:15:00 PM".
    [formatter setTimeStyle:NSDateFormatterShortStyle];
	
	// This sets the label with the updated time.
	[clockLabel setText:[formatter stringFromDate:date]];
	
}


@end
