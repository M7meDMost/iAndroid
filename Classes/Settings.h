//
//  Settings.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>

#import "Browser.h"
#import "WallpaperSettings.h"
@class SettingCells;



@interface Settings : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate> {

    IBOutlet UITextField *homepage;
	IBOutlet UIView *mainView;
	IBOutlet UIImageView *homeWallpaper;
	IBOutlet UIView *wallpaperView;
    IBOutlet UIView *homepageView;
    IBOutlet UIView *settingsview;
	IBOutlet WallpaperSettings *WPSettings;
    IBOutlet UIViewController *home; 
	IBOutlet UIView *aboutView;
	IBOutlet UISegmentedControl *verboseControl;
	IBOutlet UILabel *switchLabel;
	IBOutlet UIView *verboseView;
	IBOutlet UIView *widgetView;
	IBOutlet UISegmentedControl *widgetControl;
	IBOutlet UITextField *place;
	IBOutlet UISegmentedControl *weatherControl;
	

	//=================Table View===================//
    IBOutlet UITableViewCell *Cells;
    IBOutlet UITableView *table;
	
    NSArray *data;
	NSArray *descriptions;
}

-(IBAction)quit;
-(IBAction)backFromHomePageView;
-(IBAction)backFromWallpaperView;
-(IBAction)backFromAboutView;
-(IBAction)backFromVerboseView;
-(IBAction)backFromWidgetView;

-(IBAction)legal;

//Widget Codez
- (IBAction)selectionChanged:(id)sender;
- (IBAction)widgetSelectionChanged:(id)sender;
- (IBAction)weatherSelectionChanged:(id)sender;

-(IBAction) setLocation:(id)sender;


//Homepage Code
-(IBAction)doneEditing2:(id)sender;






@end
