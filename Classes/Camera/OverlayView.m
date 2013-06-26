//
//  OverlayView.m
//  CameraOverlay
//
//  Created by Andreas Katzian on 12.05.10.
//  Copyright 2010 Blackwhale GmbH. All rights reserved.
//

#import "OverlayView.h"



@implementation OverlayView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //clear the background color of the overlay
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
		
        //load an image to show in the overlay
        UIImage *crosshair = [UIImage imageNamed:@"crosshair.png"];
        UIImageView *crosshairView = [[UIImageView alloc] 
									 initWithImage:crosshair];
        crosshairView.frame = CGRectMake(0, 40, 320, 300);
		crosshairView.contentMode = UIViewContentModeCenter;
        [self addSubview:crosshairView];
        [crosshairView release];
		
        //add a simple button to the overview
        //with no functionality at the moment
		UIButton *TakePicture = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[TakePicture setImage:[UIImage imageNamed:@"TakePic.png"] forState:UIControlStateNormal];
		TakePicture.backgroundColor = [UIColor clearColor];
		TakePicture.frame = CGRectMake(130, 426, 47, 44);
		[TakePicture addTarget:self action:@selector(onSingleTap) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:TakePicture];
		[TakePicture release];
		
		UIButton *exit
		= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[exit setImage:[UIImage imageNamed:@"App_Home.png"] forState:UIControlStateNormal];
		exit.backgroundColor = [UIColor clearColor];
		exit.frame = CGRectMake(10, 426, 47, 44);
		[exit addTarget:self action:@selector(quit) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:exit];
		[exit release];
    }
    return self;
}

-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];
}




- (void)dealloc {
    [super dealloc];
}


@end
