//
//  SliderController.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SliderController : UIViewController {
	UIImageView *sliderBackground;
	UISlider *slider;
	UILabel *label;
	NSTimer *animationTimer;
	id <SlideToCancelDelegate> delegate;
	BOOL touchIsDown;
	CGFloat gradientLocations[3];
	int animationTimerCount;
}

@property (nonatomic, assign) id <SlideToCancelDelegate> delegate;

// This property is set to NO (disabled) on creation.
// The caller must set it to YES to animate the slider.
// It should be set to NO (disabled) when the view is not visible, in order
// to turn off the timer and conserve CPU resources.
@property (nonatomic) BOOL enabled;

// Access the UILabel, e.g. to change text or color
@property (nonatomic, readonly) UILabel *label;

@end

@protocol SlideToCancelDelegate

@required
- (void) cancelled;

@end
