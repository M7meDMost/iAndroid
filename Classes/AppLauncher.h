//
//  AppLauncher.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Browser.h"
#import "Settings.h"
#import "Phone.h"
#import "Facebook.h"
#import "Twitter.h"
#import "FullScreenCameraExampleController.h"
#import "Music.h"
#import "Paint.h"
#import "Calculator.h"
#import "AppLauncher.h"
#import "MediaPlayer.h"
#import "ShutDownView.h"

@interface AppLauncher : UIViewController {
	IBOutlet UITextField *command;
	IBOutlet UITextView *response;
	
	IBOutlet UISegmentedControl *testingMode;
	IBOutlet UIView *testView;
	IBOutlet UIView *helpView;
	
	//================APPLICATION CLASSES================//
	IBOutlet Browser *browser;
	IBOutlet Settings *settings;
    IBOutlet Phone *phone;
	IBOutlet FullScreenCameraExampleController *camera;
	IBOutlet Facebook *facebook;
	IBOutlet Twitter *twitter;
	IBOutlet MediaPlayer *music;
	IBOutlet Paint *paint;
	IBOutlet Calculator *calculator;
	IBOutlet ShutDownView *shutDown;
	
	

	
}
-(IBAction)launch:(id)sender;
-(IBAction)finished:(id)sender;
-(IBAction)closeTestView;
-(IBAction)bootselectionChanged:(id)sender;
-(IBAction)quit;
-(IBAction)closeHelpView;
@end
