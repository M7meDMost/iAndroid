//
//  WallpaperSettings.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WallpaperSettings : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	IBOutlet UIButton *choosePhoto;
	IBOutlet UIImageView *homeWallpaper;
	NSArray *data;
}
-(IBAction)getPhoto:(id)sender;

@property (nonatomic, retain) IBOutlet UIButton * choosePhoto;
@property (nonatomic, retain) UIImagePickerController *imgPicker;

@end
