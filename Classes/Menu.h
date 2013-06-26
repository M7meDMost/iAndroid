//
//  Menu.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Applications.h"


@interface Menu : UIViewController {

	

	//-----------------Icons/Labels----------------//
	
	IBOutlet UIButton *settingsButton;
	IBOutlet UIButton *phoneButton;
	IBOutlet UIButton *twitterButton;
	IBOutlet UIButton *facebookButton;
	IBOutlet UIButton *cameraButton;
	IBOutlet UIButton *musicButton;
	IBOutlet UIButton *paintButton;
	IBOutlet UIButton *calculatorButton;
	IBOutlet UIButton *browserButton;
	IBOutlet UIButton *terminalButton;
	IBOutlet UIButton *bluetalkButton;

	IBOutlet UILabel *settingsLabel;
	IBOutlet UILabel *phoneLabel;
	IBOutlet UILabel *twitterLabel;
	IBOutlet UILabel *facebookLabel;
	IBOutlet UILabel *cameraLabel;
	IBOutlet UILabel *musicLabel;
	IBOutlet UILabel *paintLabel;
	IBOutlet UILabel *calculatorLabel;
	IBOutlet UILabel *browserLabel;
	IBOutlet UILabel *terminaLabel;
	
	//================= MUSIC PLAYER WIDGET =================//
	IBOutlet UIButton *playButton;
	IBOutlet UIButton *pauseButton;
	IBOutlet UIButton *forwardButton;
	IBOutlet UIButton *backButton;
	IBOutlet UILabel *songTitle;

		
}

	
//----------------Backend-------------//
	
-(IBAction)returnToHome;
-(IBAction)musicPressed;

//================ NEW APPLICATION LAUNCH METHODS =============//
-(IBAction)loadApplication;
	
@end
