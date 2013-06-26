//
//  AppLauncher.m
//  iAndroid
//
//  Created by Guillermo Moran on 6/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppLauncher.h"
#import "Applications.h"

@implementation AppLauncher

-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)launch:(id)sender; {
	if ([command.text hasPrefix:@"run"]) {
		if ([command.text hasSuffix:@"browser"]) {
			browser.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:browser animated:YES];
			[browser autorelease];
		}
		if ([command.text hasSuffix:@"settings"]) {
			settings.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:settings animated:YES];
		}
		if ([command.text hasSuffix:@"phone"]) {
			phone.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:phone animated:YES];
		}
		if ([command.text hasSuffix:@"camera"]) {
			camera.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:camera animated:YES];
		}
		if ([command.text hasSuffix:@"facebook"]) {
			facebook.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:facebook animated:YES];
		}
		if ([command.text hasSuffix:@"twitter"]) {
				twitter.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
				[self presentModalViewController:twitter animated:YES];
		}
		if ([command.text hasSuffix:@"music"]) {
			music.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:music animated:YES];
		}
		if ([command.text hasSuffix:@"paint"]) {
			paint.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:paint animated:YES];
		}
		if ([command.text hasSuffix:@"calculator"]) {
			calculator.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			[self presentModalViewController:calculator animated:YES];
		}
	}
	
	else  if ([command.text hasPrefix:@"testmode"]){
		if ([command.text hasSuffix:@"off"]) {
				[[NSUserDefaults standardUserDefaults] setBool:NO
														forKey:@"TestmodeOn"];
			[[NSUserDefaults standardUserDefaults] synchronize];
			response.text = [NSString stringWithFormat:@"%@ \n\n>_iAndroid Terminal: Testmode set to OFF",response.text];
		}
		else if ([command.text hasSuffix:@"on"]) {
			[[NSUserDefaults standardUserDefaults] setBool:YES
														forKey:@"TestmodeOn"];
			[[NSUserDefaults standardUserDefaults] synchronize];
			response.text = [NSString stringWithFormat:@"%@ \n\n>_iAndroid Terminal: Testmode set to ON",response.text];
		}
	
	}

	else if ([command.text hasPrefix:@"killall"]) {
		if ([command.text hasSuffix:@"SpringBoard"]) {
			system("killall SpringBoard");
		}
	}
	else if ([command.text hasPrefix:@"exit"]) {
		[self dismissModalViewControllerAnimated:YES];
	}
	else if ([command.text hasPrefix:@"shutoff"]) {
		shutDown.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:shutDown animated:YES];;
	}
	
	else if ([command.text hasPrefix:@"help"]) {
	
		response.text = [NSString stringWithFormat:@"%@ \n\n >_ iAndroid Terminal: \nCommand List:\nexit - exits the terminal application\nrun AppName - Executes designated application\nshutoff - Shuts down the iAndroid System\nkillall SpringBoard - resprings the device\nhelp - displays this dialog\nclear - Clears the Terminal Log",response.text];
					
	}
	else if ([command.text hasPrefix:@"clear"]) {
		response.text = @"";
	}
	else {
	
	response.text = [NSString stringWithFormat:@"%@\n\n'%@' COMMAND NOT FOUND",response.text,command.text];
	
	[sender resignFirstResponder];
	}
}

-(IBAction)finished:(id)sender {
	[sender resignFirstResponder];
	
}

-(IBAction)closeTestView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [testView superview];
	
	// remove the current view and replace with myView1
	[testView removeFromSuperview];
	//[theWindow addSubview:testView];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"OpenTestView"];
}

-(IBAction)closeHelpView {
	// get the view that's currently showing
	//UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [helpView superview];
	
	// remove the current view and replace with myView1
	[helpView removeFromSuperview];
	//[theWindow addSubview:testView];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"CloseHelp"];
}

-(IBAction)bootselectionChanged:(id)sender {
	[[NSUserDefaults standardUserDefaults] synchronize];
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
	
	[response setEditable:NO];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	testingMode.selectedSegmentIndex = [defaults integerForKey:@"testingMode"]; 
	
	
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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
