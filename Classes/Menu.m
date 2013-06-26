//
//  Menu.m
//  iAndroid
//
//  Created by Guillermo Moran on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu.h"
#import <MediaPlayer/MediaPlayer.h>


@implementation Menu

-(IBAction)returnToHome {
	/*
	 menu.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	 [self presentModalViewController:menu animated:YES];
	 */
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	[self.view removeFromSuperview];
	//[theWindow addSubview:homeView];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransition];
	[animation setSubtype:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"OpenMenu"];
	
}

//============================ APPLICATION LAUNCH METHOD =======================//


-(IBAction)loadApplication {
	NSAutoreleasePool* applicationPool = [[NSAutoreleasePool alloc] init];
	
	if (settingsButton.highlighted) {
		Settings *settingsApp = [[[Settings alloc] initWithNibName:@"Settings" bundle:nil] autorelease];
		settingsApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:settingsApp animated:YES];
	}
	else if (phoneButton.highlighted) {
		Phone *phoneApp = [[[Phone alloc] initWithNibName:@"Phone" bundle:nil] autorelease];
		phoneApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:phoneApp animated:YES];
	}
	else if (twitterButton.highlighted) {
		Twitter *twitterApp = [[[Twitter alloc] initWithNibName:@"Twitter" bundle:nil] autorelease];
		twitterApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:twitterApp animated:YES];
	}
	else if (facebookButton.highlighted) {
		Facebook *facebookApp = [[[Facebook alloc] initWithNibName:@"Facebook" bundle:nil] autorelease];
		facebookApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:facebookApp animated:YES];
	}
	else if (cameraButton.highlighted) {
		if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
			
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera Not Available!" message:@"This feature is only available with devices with a Camera!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
			
		}
		
		else {
			
			FullScreenCameraExampleController *cameraApp = [[[FullScreenCameraExampleController alloc] initWithNibName:nil bundle:nil] autorelease];
			cameraApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:cameraApp animated:YES];
		}
	}
	else if (musicButton.highlighted) {
		Music *musicApp = [[[Music alloc] initWithNibName:@"Music" bundle:nil] autorelease];
		musicApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:musicApp animated:YES];
	}
	else if (paintButton.highlighted) {
		Paint *paintApp = [[[Paint alloc] initWithNibName:@"Paint" bundle:nil] autorelease];
		paintApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:paintApp animated:YES];
	}
	else if (calculatorButton.highlighted) {
		Calculator *calculatorApp = [[[Calculator alloc] initWithNibName:@"Calculator" bundle:nil] autorelease];
		calculatorApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:calculatorApp animated:YES];
	}
	else if (browserButton.highlighted) {
		Browser *browserApp = [[[Browser alloc] initWithNibName:@"Browser" bundle:nil] autorelease];
		browserApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:browserApp animated:YES];
	}
	else if (terminalButton.highlighted) {
		AppLauncher *terminalApp = [[[AppLauncher alloc] initWithNibName:@"AppLauncher" bundle:nil] autorelease];
		terminalApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:terminalApp animated:YES];
	}
	else if (bluetalkButton.highlighted) {
		BlueTalk *BTApp = [[[BlueTalk alloc] initWithNibName:@"BlueTalk" bundle:nil] autorelease];
		BTApp.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:BTApp animated:YES];
	}
	[applicationPool drain];
}


//============================= MUSIC PLAYER WIDGET =======================//

-(IBAction)musicPressed {
	
	MPMusicPlayerController *MenuPlayer =
	
    [MPMusicPlayerController applicationMusicPlayer];
	
	[MenuPlayer setQueueWithQuery: [MPMediaQuery songsQuery]];

	if (playButton.highlighted) {
		[MenuPlayer play];
		[pauseButton setHidden:NO];
		[playButton setHidden:YES];
		
			MPMediaItem *currentItem = MenuPlayer.nowPlayingItem;
		NSString *tmp = [NSString stringWithFormat:@"%@",[currentItem
														  valueForProperty:MPMediaItemPropertyTitle]];
		songTitle.text = tmp;
	}
	else if (pauseButton.highlighted){
		[MenuPlayer pause];
		[playButton setHidden:NO];
		[pauseButton setHidden:YES];
		
	}
	else if (forwardButton.highlighted) {
		[MenuPlayer skipToNextItem];
			MPMediaItem *currentItem = MenuPlayer.nowPlayingItem;
		NSString *tmp = [NSString stringWithFormat:@"%@",[currentItem
														  valueForProperty:MPMediaItemPropertyTitle]];
		songTitle.text = tmp;
	}
	else if (backButton.highlighted) {
		[MenuPlayer skipToPreviousItem];
			MPMediaItem *currentItem = MenuPlayer.nowPlayingItem;
		NSString *tmp = [NSString stringWithFormat:@"%@",[currentItem
														  valueForProperty:MPMediaItemPropertyTitle]];
		songTitle.text = tmp;
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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
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
	
	
		
	[settingsButton release];
	[phoneButton release];
	[twitterButton release];
	[facebookButton release];
	[cameraButton release];
	[musicButton release];
	[paintButton release];
	[calculatorButton release];
	[browserButton release];
	[terminalButton release];
	[settingsLabel release];
	[phoneLabel release];
	[twitterLabel release];
	[facebookLabel release];
	[cameraLabel release];
	[musicLabel release];
	[paintLabel release];
	[calculatorLabel release];
	[browserLabel release];
	[terminaLabel release];
}

@end
