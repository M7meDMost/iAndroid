//
//  FullScreenCameraExampleController.m
//  HelpfulUtilities
//
//  Created by P. Mark Anderson on 8/9/09.
//  Copyright 2009 Bordertown Labs, LLC. All rights reserved.
//

#import "FullScreenCameraExampleController.h"
#import "HomeScreen.h"

#ifdef BTL_INCLUDE_IMAGE_SHARING
#import "BTLImageShareController.h"
#endif

// horizontal onSwipe
#define HORIZ_SWIPE_DRAG_MIN 180
#define VERT_SWIPE_DRAG_MAX 100

// vertical onSwipe
#define HORIZ_SWIPE_DRAG_MAX 100
#define VERT_SWIPE_DRAG_MIN 250

#define OVERLAY_ALPHA 100.0f
#define BINOCS_TAG 99
#define BINOCS_BUTTON_TAG 100

@implementation FullScreenCameraExampleController

@synthesize camera, cameraMode, overlayView, overlayLabel, startTouchPosition;


- (void)loadView {  
	self.navigationController.toolbarHidden = YES;
	self.navigationController.navigationBarHidden = YES;
	[UIApplication sharedApplication].statusBarHidden = YES;

  self.overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
  self.overlayView.opaque = NO;
  self.overlayView.alpha = OVERLAY_ALPHA;

  self.view = self.overlayView;
}

- (void) viewDidAppear:(BOOL)animated { 
  [self initCamera];
  [self startCamera];
    UIImageView *cameraBezel = [[UIImageView alloc] initWithFrame:CGRectMake(0, 480, 320, 60)];
    cameraBezel.backgroundColor = [UIColor clearColor];
    [self.overlayView addSubview:cameraBezel];
    [cameraBezel release];
    
	
    UIButton *TakePicture = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [TakePicture setImage:[UIImage imageNamed:@"TakePic.png"] forState:UIControlStateNormal];
    TakePicture.backgroundColor = [UIColor clearColor];
    TakePicture.frame = CGRectMake(120, 420, 70, 71);
    [TakePicture addTarget:self action:@selector(onSingleTap) forControlEvents:UIControlEventTouchUpInside];
    [self.overlayView addSubview:TakePicture];
    [TakePicture release];
	
	UIButton *exit
	= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [exit setImage:[UIImage imageNamed:@"App_Home_White.png"] forState:UIControlStateNormal];
    exit.backgroundColor = [UIColor clearColor];
    exit.frame = CGRectMake(10, 416, 47, 30); //orig 44
    [exit addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
    [self.overlayView addSubview:exit];
    [exit release];
    
}

- (void) initCamera {  
  if ([BTLFullScreenCameraController isAvailable]) {  
	
    NSLog(@"Initializing camera.");
    BTLFullScreenCameraController *tmpCamera = [[BTLFullScreenCameraController alloc] init];
    [tmpCamera.view setBackgroundColor:[UIColor grayColor]];
    [tmpCamera setCameraOverlayView:self.overlayView];
		tmpCamera.overlayController = self;

#ifdef BTL_INCLUDE_IMAGE_SHARING
		BTLImageShareController *shareController = [[BTLImageShareController alloc] init];
		shareController.delegate = self;
		[self.view addSubview:shareController.view];
		tmpCamera.shareController = shareController;		
#endif

    self.camera = tmpCamera;
    [tmpCamera release];
  } else {
    NSLog(@"Camera not available.");
  }
}

- (void)startCamera {
	[self setView:self.camera.view];
	
	//[self presentModalViewController:self.camera animated:YES];
	
}


-(void)toggleAugmentedReality {
  if ([BTLFullScreenCameraController isAvailable]) {  
    self.cameraMode = !self.cameraMode;
    if (self.cameraMode == YES) {
      NSLog(@"Setting view to camera");
      if (!self.camera) { [self initCamera]; }
      
      [self startCamera];
      
    } else {
      NSLog(@"Setting view to overlay");
      // TODO: figure out why the non-modal camera view is not working
      //self.view = self.overlayView;      
      [self.camera dismissModalViewControllerAnimated:YES];
      self.camera = nil;
    }    

    [self.overlayView becomeFirstResponder];
  } else {
    NSLog(@"Unable to activate camera");
  }
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(IBAction)quit {
	//===========FAILED ATTEMPTS====================//
	
	
	//[self presentModalViewController:home animated:YES];
	
	[self dismissModalViewControllerAnimated:YES];
	/*
	HomeScreen *home = [[[HomeScreen alloc] initWithNibName:@"HomeScreen" bundle:nil] autorelease];
		
	
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	//[self.view removeFromSuperview];
	[theWindow addSubview:home.view];
	[overlayView removeFromSuperview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"ExitCamera"];
	 */

	
}

#pragma mark 
#pragma mark Touches

-(IBAction)onSingleTap {
	
	[camera takePicture];
}


- (void)previewClosed:(id)sender {
	self.view.alpha = OVERLAY_ALPHA;
	UIButton *binocsButton = (UIButton*)[self.view viewWithTag:BINOCS_BUTTON_TAG];
	binocsButton.hidden = NO;
}


- (void)dealloc {
	[FullScreenCameraExampleController release];
  [overlayView release];
	overlayView = nil;
  [overlayLabel release];
	overlayLabel = nil;
  [camera release];
	camera = nil;
  [super dealloc];
	
}


@end
