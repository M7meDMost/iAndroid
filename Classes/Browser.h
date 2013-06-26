//
//  Browser.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"



@interface Browser : UIViewController {
	IBOutlet UIWebView *webView;
	IBOutlet UITextField *webAdress;
	IBOutlet UIActivityIndicatorView *active;
	IBOutlet UILabel *clockLabel;
	NSTimer *myTicker;
}

-(IBAction)closeText;
-(IBAction)alertMe;
-(IBAction)quit;
-(IBAction)openNoti;
- (void) runTimer;
- (void)showActivity;
@end

