//
//  CameraController.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraController.h"
#import "OverlayView.h"

//transform values for full screen support
#define CAMERA_TRANSFORM_X 1
#define CAMERA_TRANSFORM_Y 1.12412

//iphone screen dimensions
#define SCREEN_WIDTH  320
#define SCREEN_HEIGTH 480


@implementation CameraController

- (IBAction) showCameraOverlay:(id)sender {
	
	//create an overlay view instance
	OverlayView *overlay = [[OverlayView alloc]
							initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH)];
	
	//create a new image picker instance
	UIImagePickerController *picker = 
	[[UIImagePickerController alloc] init];
	//set source to video!
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	//hide all controls
	picker.showsCameraControls = NO;
	picker.navigationBarHidden = YES;
	picker.toolbarHidden = YES;
	//make the video preview full size
	picker.wantsFullScreenLayout = YES;
	picker.cameraViewTransform =
	CGAffineTransformScale(picker.cameraViewTransform,
						   CAMERA_TRANSFORM_X,
						   CAMERA_TRANSFORM_Y);
	//set our custom overlay view
	picker.cameraOverlayView = overlay;
	
	//show picker
	[self presentModalViewController:picker animated:YES];	
	
}




- (void)dealloc {
    [super dealloc];
}


@end
