//
//  HomeScreen.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Applications.h"
#import "Menu.h"




@interface HomeScreen : UIViewController <NSXMLParserDelegate> {
	
	//------------Backend classes--------------//
	
	IBOutlet UIScrollView *HomeScroll;
	IBOutlet UILabel *time;
    IBOutlet UILabel *minutes;
    NSTimer *timer;
	IBOutlet UIWebView *FBWidget;
	IBOutlet Menu *menuView;
	IBOutlet UIView *portrait;
	IBOutlet UIView *landscape;
	IBOutlet UISegmentedControl *widgetControl;
	
	IBOutlet NotificationView *NotiView;
	
	IBOutlet UIView *loadView;
	
	BOOL isOn;
	
	
	//------------------Buttons/Labels-----------------//
	
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
	
	IBOutlet UIButton *editModeButton;
	IBOutlet UILabel *editModeLabel;
	
	
	//---------------Google Widget--------------//
	
	IBOutlet UITextField *searchURL;
	IBOutlet UIWebView *GoogleWeb;
	IBOutlet UIView *searchView;
	IBOutlet UIButton *googleRefresh;
	IBOutlet UIButton *googleBack;
	IBOutlet UIButton *googleForward;
	
	
    //---------------Background----------------//
	
    IBOutlet UIImageView *BGImage;
	IBOutlet UIScrollView *wallpaperScroll;
	
	//---------------Weather Widget------------//
	IBOutlet UILabel *degrees;
	IBOutlet UILabel *locationName;
	IBOutlet UILabel *conditions;
	IBOutlet UITextField *place;
	IBOutlet UIImageView *current;
	IBOutlet UISegmentedControl *weatherControl;
	IBOutlet UILabel *weekNameLabel;
	IBOutlet UILabel *monthLabel;
	IBOutlet UILabel *dayLabel;
	IBOutlet UILabel *lowLabel;
	IBOutlet UILabel *highLabel;
	


	
}




//-------------Google Search--------------//

-(IBAction)search;
-(IBAction)closeWidget;

//============= SYSTEM APPLICATION ===============//

-(IBAction)launchNoti;
-(IBAction)loadMenu;
-(IBAction)toggleEditMode;

//=============== WALLPAPER SCROLL VIEW =================//

-(void)updateWallpaperScroll;

//============= NEW APP LOADING METHOD (MORE EFFICIENT?) =================//

-(IBAction)loadApplication;

//=================== REFRESH WEATHER WIDGET ===================//

-(IBAction)refreshWeather;
-(void)beginParsing;

//=================== SYSTEM LOAD STUFF ==============//

-(void)loadWebWidget; //Load the web widget
-(void)loadWeatherWidget; //Load weather widget
-(void)loadWallpaper; //Load the homescreen wallpaper


@end
