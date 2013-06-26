//
//  FullScreenCameraExampleController.h
//  HelpfulUtilities
//
//  Created by P. Mark Anderson on 8/9/09.
//  Copyright 2009 Bordertown Labs, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTLFullScreenCameraController.h"
#import "MBProgressHUD.h"

@class CameraQuitController;
@interface FullScreenCameraExampleController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
  BTLFullScreenCameraController *camera;
  UIView *overlayView;
  BOOL cameraMode;
	
	

}

@property (nonatomic, retain) BTLFullScreenCameraController *camera;
@property (nonatomic, retain) UIView *overlayView;
@property (nonatomic, retain) UILabel *overlayLabel;
@property (assign) BOOL cameraMode;
@property (nonatomic) CGPoint startTouchPosition;

- (void)initCamera;
- (void)toggleAugmentedReality;
- (void)startCamera;
-(IBAction)onSingleTap;
-(IBAction)quit;


@end
