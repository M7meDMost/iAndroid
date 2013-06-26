//
//  Paint.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Paint : UIViewController {
	CGPoint lastPoint;
	UIImageView *drawImage;
	BOOL mouseSwiped;	
	int mouseMoved;
	IBOutlet UISegmentedControl *paintControl;
	
		
	
}
@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIButton *redButton;
@property (nonatomic, retain) IBOutlet UIButton *greenButton;
@property (nonatomic, retain) IBOutlet UIButton *blueButton;

@property (nonatomic, retain) IBOutlet UIButton *redPaint;
@property (nonatomic, retain) IBOutlet UIButton *greenPaint;
@property (nonatomic, retain) IBOutlet UIButton *bluePaint;

- (IBAction)doRedButton;
- (IBAction)about;
- (IBAction)doGreenButton;
- (IBAction)doBlueButton;
- (IBAction)doRedPaint;
-(void)checkColor;

-(IBAction)quit;


@end
