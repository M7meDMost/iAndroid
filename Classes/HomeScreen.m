//
//  HomeScreen.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeScreen.h"
#import <Foundation/NSXMLParser.h>
#import <TargetConditionals.h>



@implementation HomeScreen

-(IBAction)launchNoti {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	//[widgetView removeFromSuperview];
	[theWindow addSubview:NotiView.view];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionMoveIn];
	[animation setSubtype:kCATransitionFromBottom];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"OpenNoti"];
}


-(IBAction)loadMenu {
	/*
	menu.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController:menu animated:YES];
	 */
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	//[homeView removeFromSuperview];
	[theWindow addSubview:menuView.view];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransition];
	[animation setSubtype:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"OpenMenu"];
	
}

//==================== NEW MORE EFFICIENT APP LAUCH METHOD ========================//

-(IBAction)loadApplication {
	NSAutoreleasePool* applicationPool = [[NSAutoreleasePool alloc] init];
	
	if (!isOn) {
	
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
}


//================================ BACKEND CLASSES ===============================//



-(void)updateTime { //Let's do a clock widget!//
    NSDateFormatter *MinuteFormatter = [[NSDateFormatter alloc] init];
    [MinuteFormatter setDateFormat:@"mm"];
    [MinuteFormatter setLocale:[NSLocale currentLocale]];
    
    minutes.text = [MinuteFormatter stringFromDate:[NSDate date]];
    
    [MinuteFormatter release];
    NSDateFormatter *hourFormatter = [[NSDateFormatter alloc] init];
    [hourFormatter setDateFormat:@"hh"];
    [hourFormatter setLocale:[NSLocale currentLocale]];
    
    time.text = [hourFormatter stringFromDate:[NSDate date]];
	
    [hourFormatter release]; 
    
}


-(IBAction)search {
	
	

	NSString *query = [searchURL.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", query]];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	[GoogleWeb loadRequest:request];
	
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	//[widgetView removeFromSuperview];
	[theWindow addSubview:searchView];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromBottom];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"GoogleSearchOpened"];
}

-(IBAction)closeWidget {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	
	
	// remove the current view and replace with myView1
	//[widgetView removeFromSuperview];
	[searchView removeFromSuperview];	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [self.view superview];
	
	// remove the current view and replace with myView1
	//[widgetView removeFromSuperview];
	[searchView removeFromSuperview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromTop];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"GoogleSearchClosed"];
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

-(IBAction)toggleEditMode {
	if ([[NSUserDefaults standardUserDefaults]
		 boolForKey:@"TestmodeOn"]) {
	
		if (isOn == NO) {
			isOn = YES;
			[self viewDidLoad];
			editModeLabel.hidden = NO;
		}
		else {
			isOn = NO;
			[self viewDidLoad];
			editModeLabel.hidden = YES;
	
		}
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; 
	
	 //ADD SUPPORT FOR DRAGGING THE ICONS AROUND (SUPER ALPHA), only on testmode!
	
	if ([[NSUserDefaults standardUserDefaults]
		  boolForKey:@"TestmodeOn"]) {
		
		
		
		if (isOn == YES) {
			
	 [settingsButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [phoneButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [twitterButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [facebookButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [cameraButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [musicButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [paintButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	 
	 [bluetalkButton addTarget:self action:@selector(wasDragged:withEvent:) 
	 forControlEvents:UIControlEventTouchDragInside];
	}
			
	}
	 
	 
	
	//==================== LOAD THE SCROLL VIEW ====================//
	
	[HomeScroll setScrollEnabled:YES];
	[HomeScroll setContentSize:CGSizeMake(960, 0)];
	[HomeScroll setContentOffset:CGPointMake(320, 0) animated:NO]; //Set Scrollview in the middle
	
	
    //=================================== LOAD THE WIDGETS ==============================//
	[self loadWallpaper]; //Load HS wallpaper
	
	[self loadWeatherWidget]; //Load the weather widget
	
	[self loadWebWidget];//Load the Web Widget
	


	//===================================== ACTIVATE THE WEATHER WIDGET =========================================//
		
		weatherControl.selectedSegmentIndex = [defaults integerForKey:@"weatherKey"]; 
	
		place.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"locationKey"];
	
	if ([place.text isEqualToString:@""]) {
		weatherControl.selectedSegmentIndex = 0;
		}
	
	if (weatherControl.selectedSegmentIndex == 1) {
		
		[self beginParsing];
		timer = [NSTimer scheduledTimerWithTimeInterval:3600.0 target:self selector:@selector(weatherAutoRefresh) userInfo:nil repeats:NO];
		
	}
		 
	else {
		locationName.text = @"Cupertino";
		degrees.text = @"70°";
		current.image = [UIImage imageNamed:@"sunny.png"];
		lowLabel.text = @"70°";
		highLabel.text = @"70°";
		   
	}
}



 
- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event
{
	// get the touch
	UITouch *touch = [[event touchesForView:settingsButton] anyObject];
	UITouch *touch1 = [[event touchesForView:phoneButton] anyObject];
	UITouch *touch2 = [[event touchesForView:twitterButton] anyObject];
	UITouch *touch3 = [[event touchesForView:facebookButton] anyObject];
	UITouch *touch4 = [[event touchesForView:cameraButton] anyObject];
	UITouch *touch5 = [[event touchesForView:musicButton] anyObject];
	UITouch *touch6 = [[event touchesForView:paintButton] anyObject];
	UITouch *touch7 = [[event touchesForView:calculatorButton] anyObject];
	UITouch *touch8 = [[event touchesForView:bluetalkButton] anyObject];
	
	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint previousLocation1 = [touch1 previousLocationInView:button];
	CGPoint previousLocation2 = [touch2 previousLocationInView:button];
	CGPoint previousLocation3 = [touch3 previousLocationInView:button];
	CGPoint previousLocation4 = [touch4 previousLocationInView:button];
	CGPoint previousLocation5 = [touch5 previousLocationInView:button];
	CGPoint previousLocation6 = [touch6 previousLocationInView:button];
	CGPoint previousLocation7 = [touch7 previousLocationInView:button];
	CGPoint previousLocation8 = [touch8 previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGPoint location1 = [touch1 locationInView:button];
	CGPoint location2 = [touch2 locationInView:button];
	CGPoint location3 = [touch3 locationInView:button];
	CGPoint location4 = [touch4 locationInView:button];
	CGPoint location5 = [touch5 locationInView:button];
	CGPoint location6 = [touch6 locationInView:button];
	CGPoint location7 = [touch7 locationInView:button];
	CGPoint location8 = [touch8 locationInView:button];
	
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
	
	CGFloat delta_x1 = location1.x - previousLocation1.x;
	CGFloat delta_y1 = location1.y - previousLocation1.y;
	
	CGFloat delta_x2 = location2.x - previousLocation2.x;
	CGFloat delta_y2 = location2.y - previousLocation2.y;
	
	CGFloat delta_x3 = location3.x - previousLocation3.x;
	CGFloat delta_y3 = location3.y - previousLocation3.y;
	
	CGFloat delta_x4 = location4.x - previousLocation4.x;
	CGFloat delta_y4 = location4.y - previousLocation4.y;
	
	CGFloat delta_x5 = location5.x - previousLocation5.x;
	CGFloat delta_y5 = location5.y - previousLocation5.y;
	
	CGFloat delta_x6 = location6.x - previousLocation6.x;
	CGFloat delta_y6 = location6.y - previousLocation6.y;
	
	CGFloat delta_x7 = location7.x - previousLocation7.x;
	CGFloat delta_y7 = location7.y - previousLocation7.y;
	
	CGFloat delta_x8 = location8.x - previousLocation8.x;
	CGFloat delta_y8 = location8.y - previousLocation8.y;
	
	
	
	// move button
	
	if (settingsButton.highlighted) {
	settingsButton.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
	}
	else if (phoneButton.highlighted) {
	phoneButton.center = CGPointMake(button.center.x + delta_x1, button.center.y + delta_y1);
	}
	else if (twitterButton.highlighted) {
	twitterButton.center = CGPointMake(button.center.x + delta_x2, button.center.y + delta_y2);
	}
	else if (facebookButton.highlighted) {
	facebookButton.center = CGPointMake(button.center.x + delta_x3, button.center.y + delta_y3);
	}
	else if (cameraButton.highlighted) {
	cameraButton.center = CGPointMake(button.center.x + delta_x4, button.center.y + delta_y4);
	}
	else if (musicButton.highlighted) {
	musicButton.center = CGPointMake(button.center.x + delta_x5, button.center.y + delta_y5);
	}
	else if (paintButton.highlighted) {
	paintButton.center = CGPointMake(button.center.x + delta_x6, button.center.y + delta_y6);
	}
	else if (calculatorButton.highlighted) {
	calculatorButton.center = CGPointMake(button.center.x + delta_x7, button.center.y + delta_y7);
	}
	else if (bluetalkButton.highlighted) {
	bluetalkButton.center = CGPointMake(button.center.x + delta_x8, button.center.y + delta_y8);
	}

}
 


-(void)loadWebWidget {
	if (widgetControl.selectedSegmentIndex == 0) {
		[FBWidget loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://touch.facebook.com"]]];
	}
	else {
		[FBWidget loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.twitter.com"]]];
	}
}

-(void)loadWeatherWidget {
	//Clock Widget Code
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //day of week
    [dateFormatter setDateFormat:@"hh"];
    // MM=month,dd=day,EEE=shortNameOfWeek, EEEE=longNameOfWeek
    [dateFormatter setLocale:[NSLocale currentLocale]];
    time.text = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter release];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    //day of week
    [dateFormatter2 setDateFormat:@"mm"];
    // MM=month,dd=day,EEE=shortNameOfWeek, EEEE=longNameOfWeek
    [dateFormatter2 setLocale:[NSLocale currentLocale]];
    minutes.text = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter2 release];
	
	NSDateFormatter *day = [[NSDateFormatter alloc] init];
    //day of week
    [day setDateFormat:@"dd"];
    // MM=month,dd=day,EEE=shortNameOfWeek, EEEE=longNameOfWeek
    [day setLocale:[NSLocale currentLocale]];
    dayLabel.text = [day stringFromDate:[NSDate date]];
    [day release];
	
	NSDateFormatter *weekname = [[NSDateFormatter alloc] init];
    //day of week
    [weekname setDateFormat:@"EEE"];
    // MM=month,dd=day,EEE=shortNameOfWeek, EEEE=longNameOfWeek
    [weekname setLocale:[NSLocale currentLocale]];
	weekNameLabel.text = [NSString stringWithFormat:@"%@,",[weekname stringFromDate:[NSDate date]]];
    [weekname release];
	
	NSDateFormatter *month = [[NSDateFormatter alloc] init];
    //day of week
    [month setDateFormat:@"MM"];
    // MM=month,dd=day,EEE=shortNameOfWeek, EEEE=longNameOfWeek
    [month setLocale:[NSLocale currentLocale]];
    monthLabel.text = [month stringFromDate:[NSDate date]];
    [month release];
	
	//Change Month//
	if ([monthLabel.text isEqualToString:@"01"]) {
		monthLabel.text = @"Jan";
	}
	if ([monthLabel.text isEqualToString:@"02"]) {
		monthLabel.text = @"Feb";
	}
	if ([monthLabel.text isEqualToString:@"03"]) {
		monthLabel.text = @"Mar";
	}
	if ([monthLabel.text isEqualToString:@"04"]) {
		monthLabel.text = @"Apr";
	}
	if ([monthLabel.text isEqualToString:@"05"]) {
		monthLabel.text = @"May";
	}
	if ([monthLabel.text isEqualToString:@"06"]) {
		monthLabel.text = @"Jun";
	}
	if ([monthLabel.text isEqualToString:@"07"]) {
		monthLabel.text = @"Jul";
	}
	if ([monthLabel.text isEqualToString:@"08"]) {
		monthLabel.text = @"Aug";
	}
	if ([monthLabel.text isEqualToString:@"09"]) {
		monthLabel.text = @"Sep";
	}
	if ([monthLabel.text isEqualToString:@"10"]) {
		monthLabel.text = @"Oct";
	}
	if ([monthLabel.text isEqualToString:@"11"]) {
		monthLabel.text = @"Nov";
	}
	if ([monthLabel.text isEqualToString:@"12"]) {
		monthLabel.text = @"Dec";
	}
	
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}	

-(void)loadWallpaper {
	
	if (TARGET_IPHONE_SIMULATOR) {
		BGImage.image = [UIImage imageNamed:@"panoramic.png"];
	} 
	else {
		
		// system("mkdir /var/mobile/Media/iAndroidSavedDocs"); <-- Create  Directory (Done via Installation now)
		
		NSString *path1 = @"/var/mobile/Media/iAndroidSavedDocs";
		NSString *documentsDirectory = path1;
		NSString* path = [documentsDirectory stringByAppendingPathComponent: 
						  [NSString stringWithString: @"BGImage.png"] ];
		BGImage.image = [UIImage imageWithContentsOfFile:path];
		
	}	
}
	

//========================= WEATHER WIDGET CONTROL CODE ========================//

-(void)weatherAutoRefresh {
	timer = [NSTimer scheduledTimerWithTimeInterval:3600.0 target:self selector:@selector(beingParsing) userInfo:nil repeats:YES];
}

-(IBAction)refreshWeather {
	[self beginParsing];
}
	
- (void)beginParsing {
		
		
	NSAutoreleasePool *XMLPool = [[NSAutoreleasePool alloc] init];

	NSString* address = @"http://weather.yahooapis.com/forecastrss?p=";

	NSString * loc = [place.text stringByReplacingOccurrencesOfString:@" " withString:@""];
	
	NSString * request = [NSString stringWithFormat:@"%@%@&u=f",address,loc];
		
	NSData* XMLdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:request]];
	NSXMLParser* parser = [[NSXMLParser alloc] initWithData: XMLdata];
	
	[parser setDelegate:self];
	[parser parse];
	[parser release];
	[XMLPool drain];
}
	
//======================== PARSE THE XML TO RETRIEVE TEH GOODZ ================================//

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	
	NSLog(@"Found Element:%@",elementName);
	
	if ([elementName isEqualToString:@"yweather:condition"]) {
			
		NSString* currentTemp = [attributeDict valueForKey:@"temp"];   
		NSString* conditionCode = [attributeDict valueForKey:@"code"];
		
		degrees.text = [NSString stringWithFormat:@"%@°",currentTemp];
		
		//-------------- Determine What Image To Use --------------//
		
		if ([conditionCode isEqualToString:@"0"]) {
			current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"1"]) {
			current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"2"]) {
			current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"3"]) {
			current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"4"]) {
			current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"5"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"6"]) {
			current.image = [UIImage imageNamed:@"sleet.png"];
		}
		else if ([conditionCode isEqualToString:@"7"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"8"]) {
			current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"9"]) {
			current.image = [UIImage imageNamed:@"showers.png"];
		}
		else if ([conditionCode isEqualToString:@"10"]) {
			current.image = [UIImage imageNamed:@"showers.png"];
		}
		else if ([conditionCode isEqualToString:@"11"]) {
			current.image = [UIImage imageNamed:@"showers.png"];
		}
		else if ([conditionCode isEqualToString:@"12"]) {
			current.image = [UIImage imageNamed:@"showers.png"];
		}
		else if ([conditionCode isEqualToString:@"13"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"14"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"15"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"16"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"17"]) {
			current.image = [UIImage imageNamed:@"hail.png"];
		}
		else if ([conditionCode isEqualToString:@"18"]) {
			current.image = [UIImage imageNamed:@"sleet.png"];
		}
		else if ([conditionCode isEqualToString:@"19"]) {
			current.image = [UIImage imageNamed:@"fog.png"];
		}
		else if ([conditionCode isEqualToString:@"20"]) {
			current.image = [UIImage imageNamed:@"fog.png"];
		}
		else if ([conditionCode isEqualToString:@"21"]) {
			current.image = [UIImage imageNamed:@"fog.png"];
		}
		else if ([conditionCode isEqualToString:@"22"]) {
			current.image = [UIImage imageNamed:@"fog.png"];
		}
		else if ([conditionCode isEqualToString:@"23"]) {
			current.image = [UIImage imageNamed:@"dunno.png"];
		}
		else if ([conditionCode isEqualToString:@"24"]) {
			current.image = [UIImage imageNamed:@"sunny.png"];
		}
		else if ([conditionCode isEqualToString:@"25"]) {
			current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"26"]) {
		 current.image = [UIImage imageNamed:@"cloudy1.png"];
		}
		else if ([conditionCode isEqualToString:@"27"]) {
		 current.image = [UIImage imageNamed:@"cloudy1_night.png"];
		}
		else if ([conditionCode isEqualToString:@"28"]) {
		 current.image = [UIImage imageNamed:@"cloudy1.png"];
		}
		else if ([conditionCode isEqualToString:@"29"]) {
		 current.image = [UIImage imageNamed:@"cloudy1_night.png"];
		}
		else if ([conditionCode isEqualToString:@"30"]) {
		 current.image = [UIImage imageNamed:@"cloudy1.png"];
		}
		else if ([conditionCode isEqualToString:@"31"]) {
		 current.image = [UIImage imageNamed:@"sunny_night.png"];
		}
		else if ([conditionCode isEqualToString:@"32"]) {
		 current.image = [UIImage imageNamed:@"sunny.png"];
		}
		else if ([conditionCode isEqualToString:@"33"]) {
		 current.image = [UIImage imageNamed:@"sunny_night.png"];
		}
		else if ([conditionCode isEqualToString:@"34"]) {
			current.image = [UIImage imageNamed:@"sunny.png"];
		}
		else if ([conditionCode isEqualToString:@"35"]) {
		 current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"36"]) {
		 current.image = [UIImage imageNamed:@"sunny.png"];
		}
		else if ([conditionCode isEqualToString:@"37"]) {
		 current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"38"]) {
		 current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"39"]) {
		 current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"40"]) {
		 current.image = [UIImage imageNamed:@"showers.png"];
		}
		else if ([conditionCode isEqualToString:@"41"]) {
		 current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"42"]) {
		 current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"43"]) {
		 current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"44"]) {
		 current.image = [UIImage imageNamed:@"cloudy1.png"];
		}
		else if ([conditionCode isEqualToString:@"45"]) {
		 current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"46"]) {
		 current.image = [UIImage imageNamed:@"snow1.png"];
		}
		else if ([conditionCode isEqualToString:@"47"]) {
		 current.image = [UIImage imageNamed:@"tstorm3.png"];
		}
		else if ([conditionCode isEqualToString:@"3200"]) {
		 current.image = [UIImage imageNamed:@"dunno.png"];
		}
		

		 
	}
	if ([elementName isEqualToString:@"yweather:condition"]) {
		
		NSString* currentConditions = [attributeDict valueForKey:@"text"];    
		
		
		conditions.text = currentConditions;
	}
	if ([elementName isEqualToString:@"yweather:location"]) {
		
		NSString* city = [attributeDict valueForKey:@"city"];    
	
		
		locationName.text = city;
	}
	if ([elementName isEqualToString:@"yweather:forecast"]) {
		
		NSString* lows = [attributeDict valueForKey:@"low"]; 
		NSString* highs = [attributeDict valueForKey:@"high"];
		
		lowLabel.text = [NSString stringWithFormat:@"L:%@°",lows];
		highLabel.text = [NSString stringWithFormat:@"H:%@°",highs];
	}

}
	


/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if(((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || 
        (interfaceOrientation == UIInterfaceOrientationLandscapeRight))){
		
        self.view = landscape;
		
    }
	else if(((interfaceOrientation == UIInterfaceOrientationPortrait) || 
              (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown))){
		
        self.view = portrait;
		
    }
	
    return YES;
}
 */

//=========================== RELEASE MEMORY AND STUFF =========================//

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	[HomeScroll release];
	[time release];
	[minutes release];
	[FBWidget release];
	[menuView release];
	[widgetControl release];
	[NotiView release];
	[settingsButton release];
	[phoneButton release];
	[twitterButton release];
	[facebookButton release];
	[cameraButton release];
	[musicButton  release];
	[paintButton release];
	[calculatorButton release];
	[browserButton release];
	[terminalButton release];
	[bluetalkButton release];
	[searchURL release];
	[GoogleWeb release];
	[searchView release];
	[googleRefresh release];
	[googleBack release];
	[googleForward release];
	[BGImage release];
	[degrees release];
	[locationName release];
	[conditions release];
	[place release];
	[current release];
	[weatherControl release];
	[weekNameLabel release];
	[monthLabel release];
	[dayLabel release];
	[lowLabel release];
	[highLabel release];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	//[super viewDidUnload];
	HomeScroll = nil;
	time = nil;
	minutes = nil;
	FBWidget = nil;
	menuView = nil;
	portrait = nil;
	landscape = nil;
	widgetControl = nil;
	NotiView = nil;
	loadView = nil;
	settingsButton = nil;
	phoneButton = nil;
	twitterButton = nil;
	facebookButton = nil;
	cameraButton = nil;
	musicButton = nil;
	paintButton = nil;
	calculatorButton = nil;
	browserButton = nil;
	terminalButton = nil;
	bluetalkButton = nil;
	searchURL = nil;
	GoogleWeb = nil;
	searchView = nil;
	googleRefresh = nil;
	googleBack = nil;
	googleForward = nil;
	BGImage = nil;
	degrees = nil;
	locationName = nil;
	conditions = nil;
	place = nil;
	current = nil;
	weatherControl = nil;
	weekNameLabel = nil;
	monthLabel = nil;
	dayLabel = nil;
	lowLabel = nil;
	highLabel = nil;
	
}


- (void)dealloc {
    [super dealloc];
	[HomeScroll release];
	[time release];
	[minutes release];
	[FBWidget release];
	[menuView release];
	[widgetControl release];
	[NotiView release];
	[settingsButton release];
	[phoneButton release];
	[twitterButton release];
	[facebookButton release];
	[cameraButton release];
	[musicButton  release];
	[paintButton release];
	[calculatorButton release];
	[browserButton release];
	[terminalButton release];
	[bluetalkButton release];
	[searchURL release];
	[GoogleWeb release];
	[searchView release];
	[googleRefresh release];
	[googleBack release];
	[googleForward release];
	[BGImage release];
	[degrees release];
	[locationName release];
	[conditions release];
	[place release];
	[current release];
	[weatherControl release];
	[weekNameLabel release];
	[monthLabel release];
	[dayLabel release];
	[lowLabel release];
	[highLabel release];

}



@end
