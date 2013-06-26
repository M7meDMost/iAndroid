//
//  Settings.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"
#import "SettingCells.h"

@implementation Settings

-(IBAction)legal {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Other Legal Stuff" message:@"iAndroid is based off of Google's Android Operating System. Android and all of it's icons, artwork, and components remain property of Google. iAndroid does not really run Android." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (IBAction)selectionChanged:(id)sender {
	NSInteger index = ((UISegmentedControl*)sender).selectedSegmentIndex;
	
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
	
	
	[settings setInteger:index forKey:@"bootKey"];
	

	[settings synchronize];
}

- (IBAction)widgetSelectionChanged:(id)sender {
	NSInteger index = ((UISegmentedControl*)sender).selectedSegmentIndex;
	
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
	
	
	[settings setInteger:index forKey:@"widgetKey"];
	
	
	[settings synchronize];
}

-(IBAction)setLocation:(id)sender {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject:place.text forKey:@"locationKey"];
	
	[defaults synchronize];
	
	
	
}

-(IBAction)weatherSelectionChanged:(id)sender {
	NSInteger index = ((UISegmentedControl*)sender).selectedSegmentIndex;
	
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
	
	
	[settings setInteger:index forKey:@"weatherKey"];
	
	
	[settings synchronize];
}



	
//=============================== TABLE VIEW CONTROL ===================//


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
	//return [descriptions count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
		// get the view that's currently showing
		//UIView *currentView = self.view;
		// get the the underlying UIWindow, or the view containing the current view view
		UIView *theWindow = [settingsview superview];
		
		// remove the current view and replace with myView1
		[settingsview removeFromSuperview];
		[theWindow addSubview:homepageView];
		
		// set up an animation for the transition between the views
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.5];
		[animation setType:kCATransitionPush];
		[animation setSubtype:kCATransitionFromRight];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToHomePageView"];
	}
    if (indexPath.row == 1) {
		// get the view that's currently showing
		//UIView *currentView = self.view;
		// get the the underlying UIWindow, or the view containing the current view view
		UIView *theWindow = [settingsview superview];
		
		// remove the current view and replace with myView1
		[settingsview removeFromSuperview];
		[theWindow addSubview:wallpaperView];
		
		// set up an animation for the transition between the views
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.5];
		[animation setType:kCATransitionPush];
		[animation setSubtype:kCATransitionFromRight];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToWallpaperView"];
    }
	if (indexPath.row == 2) {
		// get the view that's currently showing
		//UIView *currentView = self.view;
		// get the the underlying UIWindow, or the view containing the current view view
		UIView *theWindow = [settingsview superview];
		
		// remove the current view and replace with myView1
		[settingsview removeFromSuperview];
		[theWindow addSubview:aboutView];
		
		// set up an animation for the transition between the views
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.5];
		[animation setType:kCATransitionPush];
		[animation setSubtype:kCATransitionFromRight];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToAboutView"];
    }
	if (indexPath.row == 3) {
		// get the view that's currently showing
		//UIView *currentView = self.view;
		// get the the underlying UIWindow, or the view containing the current view view
		UIView *theWindow = [settingsview superview];
		
		// remove the current view and replace with myView1
		[settingsview removeFromSuperview];
		[theWindow addSubview:verboseView];
		
		// set up an animation for the transition between the views
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.5];
		[animation setType:kCATransitionPush];
		[animation setSubtype:kCATransitionFromRight];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToVerboseView"];
	}
	if (indexPath.row == 4) {
		// get the view that's currently showing
		//UIView *currentView = self.view;
		// get the the underlying UIWindow, or the view containing the current view view
		UIView *theWindow = [settingsview superview];
		
		// remove the current view and replace with myView1
		[settingsview removeFromSuperview];
		[theWindow addSubview:widgetView];
		
		// set up an animation for the transition between the views
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.5];
		[animation setType:kCATransitionPush];
		[animation setSubtype:kCATransitionFromRight];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		[[theWindow layer] addAnimation:animation forKey:@"SwitchToWidgetView"];
	}
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellString = @"SettingCells";
    
    SettingCells *cell = (SettingCells *) [table dequeueReusableCellWithIdentifier:cellString];
    if (cell == nil) {
        NSArray *topLevelObject = [[NSBundle mainBundle] loadNibNamed:@"SettingCells" owner:self options:nil];
        for (id currentObject in topLevelObject) {
            if ([currentObject isKindOfClass:[SettingCells class]]) {
                cell = (SettingCells *) currentObject;
                break;
            }
        }
    }
    
    cell.name.text = [data objectAtIndex:indexPath.row];
	cell.description.text = [descriptions objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    if (indexPath.row == 0) {
    }
    
    
    return cell;
}

//================================== NAVIGATION CONTROL ===================================//
-(IBAction)backFromVerboseView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [verboseView superview];
	
	// remove the current view and replace with myView1
	[verboseView removeFromSuperview];
	[theWindow addSubview:settingsview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchBackFromVerboseView"];
}


-(IBAction)backFromHomePageView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [homepageView superview];
	
	// remove the current view and replace with myView1
	[homepageView removeFromSuperview];
	[theWindow addSubview:settingsview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchBackFromHPView"];
}
-(IBAction)backFromWallpaperView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [wallpaperView superview];
	
	// remove the current view and replace with myView1
	[wallpaperView removeFromSuperview];
	[theWindow addSubview:settingsview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchBackFromWallpaper"];
}

-(IBAction)backFromAboutView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [aboutView superview];
	
	// remove the current view and replace with myView1
	[aboutView removeFromSuperview];
	[theWindow addSubview:settingsview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchBackFromAbout"];
}

-(IBAction)backFromWidgetView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [widgetView superview];
	
	// remove the current view and replace with myView1
	[widgetView removeFromSuperview];
	[theWindow addSubview:settingsview];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchBackFromWidgets"];
}



-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)doneEditing2:(id)sender {
	if (! [homepage.text hasPrefix:@"http://"]) {
		[homepage setText:[NSString stringWithFormat:@"http://%@", homepage.text]];
	}
	
	
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject:homepage.text forKey:@"homepageKey"];
	
	[defaults synchronize];
	

	
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults]; 
	
	if ([place.text isEqualToString:@""]) {
		
		weatherControl.selectedSegmentIndex = 0;
		
		
	}
	
	homepage.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"homepageKey"];
	place.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"locationKey"];
	
	
	
	verboseControl.selectedSegmentIndex = [settings integerForKey:@"bootKey"]; 
	widgetControl.selectedSegmentIndex = [settings integerForKey:@"widgetKey"]; 
	weatherControl.selectedSegmentIndex = [settings integerForKey:@"weatherKey"];
	 

	
	
    //============================== TABLE VIEW CONTROLLERS =====================================//
	
    data = [[NSArray arrayWithObjects:@"Web Browser Settings",@"Wallpaper Settings",@"About iAndroid",@"Boot Control", @"Widget Controls",nil]retain];
	descriptions = [[NSArray arrayWithObjects:@"Set up the Web Browser!",@"Set your Homescreen Wallpaper",@"Credits and Stuff",@"iAndroid Boot Preferences", @"Set up your Homescreen Widgets",nil]retain];
    UILabel *headerLBL = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)]autorelease];
    headerLBL.text = @" iAndroid Settings";
    headerLBL.textColor = [UIColor whiteColor];
    headerLBL.backgroundColor = [UIColor grayColor];
    table.tableHeaderView = headerLBL;
	
	//===============Wallpaper Preview==========//
	NSString *path1 = @"/var/mobile/Media/iAndroidSavedDocs";
    NSString *documentsDirectory = path1;
    NSString* path = [documentsDirectory stringByAppendingPathComponent: 
                      [NSString stringWithString: @"BGImage.png"] ];
    homeWallpaper.image = [UIImage imageWithContentsOfFile:path];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
   	[Settings release];
	
	[homepage release];
	homepage = nil;
	[mainView release];
	mainView = nil;
	[homeWallpaper release]; 
	homeWallpaper = nil;
	[wallpaperView release];
	wallpaperView = nil;
	[homepageView release];
	homepageView = nil;
	[settingsview release];
	settingsview = nil;
	[WPSettings release];
	WPSettings = nil;
	[home release];
	home = nil;
	[aboutView release];
	aboutView = nil;
	[verboseControl release];
	verboseControl = nil;
	[switchLabel release];
	switchLabel = nil;
	[verboseView release];
	verboseView = nil;
	[widgetView release];
	widgetView = nil;
	[widgetControl release];
	widgetControl = nil;
}


- (void)dealloc {
    [super dealloc];
	[Settings release];
	
	[homepage release];
	homepage = nil;
	[mainView release];
	mainView = nil;
	[homeWallpaper release]; 
	homeWallpaper = nil;
	[wallpaperView release];
	wallpaperView = nil;
	[homepageView release];
	homepageView = nil;
	[settingsview release];
	settingsview = nil;
	[WPSettings release];
	WPSettings = nil;
	[home release];
	home = nil;
	[aboutView release];
	aboutView = nil;
	[verboseControl release];
	verboseControl = nil;
	[switchLabel release];
	switchLabel = nil;
	[verboseView release];
	verboseView = nil;
	[widgetView release];
	widgetView = nil;
	[widgetControl release];
	widgetControl = nil;
}



@end
