    //
//  WallpaperSettings.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WallpaperSettings.h"


@implementation WallpaperSettings
@synthesize imgPicker;
@synthesize choosePhoto;

-(IBAction) getPhoto:(id) sender {
	UIImagePickerController * picker = [[[UIImagePickerController alloc] init] autorelease];
	picker.delegate = self;
	
	if((UIButton *) sender == choosePhoto) {
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	} else {
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
	
	[self presentModalViewController:picker animated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {	homeWallpaper.image = image;
    if (image != nil)
    {
        image = homeWallpaper.image;
        //system("mkdir /var/mobile/Media/iAndroidSavedDocs");
        NSString *path1 = @"/var/mobile/Media/iAndroidSavedDocs";
        NSString *documentsDirectory = path1;
        NSString* path = [documentsDirectory stringByAppendingPathComponent: 
                          [NSString stringWithString: @"BGImage.png"] ];
        NSData* data1 = UIImagePNGRepresentation(homeWallpaper.image);
        [data1 writeToFile:path atomically:YES];
    }
    [picker dismissModalViewControllerAnimated:YES];
    

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[WallpaperSettings release];
	
	[imgPicker release];
	imgPicker = nil;
	[choosePhoto release];
	choosePhoto = nil;
}


@end
