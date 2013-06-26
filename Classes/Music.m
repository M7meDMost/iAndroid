//
//  Music.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Music.h"


@implementation Music




-(IBAction)selectSong {
	// instantiate a music player
	
	MPMusicPlayerController *myPlayer =
	
    [MPMusicPlayerController applicationMusicPlayer];
	
	
	
	// assign a playback queue containing all media items on the device
	
	[myPlayer setQueueWithQuery: [MPMediaQuery songsQuery]];
	
	
	
	// start playing from the beginning of the queue
	
	[myPlayer play];
	[myPlayer release];
}

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
	
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://myousic.me/"]]];
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
	[webView release];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;	
	webView = nil;
}


- (void)dealloc {
    [super dealloc];
	[Music release];
	
	[webView release];

}


@end
