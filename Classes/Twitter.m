//
//  Twitter.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Twitter.h"


@implementation Twitter

-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];
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
	
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobile.twitter.com/"]]];
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
   	[self.view release];
	self.view = nil;
	[Twitter release];
	
	[webView release];
	webView = nil;
}


- (void)dealloc {
    [super dealloc];
	[Twitter release];
	
	[webView release];
	webView = nil;
}


@end
