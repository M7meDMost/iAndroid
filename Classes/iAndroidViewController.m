//
//  iAndroidViewController.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/1/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "iAndroidViewController.h"

@implementation iAndroidViewController

/*
 //expiration code begins
 //#ifdef BETA_EXPIRATION
- (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 
 NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
 [dateFormatter setDateFormat:@"MM dd yyyy"];
 NSLocale *localeUS = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
 [dateFormatter setLocale:localeUS];
 
 NSDate *compileDate = [dateFormatter dateFromString:[NSString stringWithUTF8String:__DATE__]];
 NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit 
 fromDate:compileDate 
 toDate:[NSDate date] 
 options:0];
 // Expired after 1 weeks
 if ([components week] > 0) {
 UIAlertView *expirationAlert = [[UIAlertView alloc] initWithTitle:@"Beta test expired!" 
 message:@"Thanks for testing iAndroid!!! -Fr0st" 
 delegate:self 
 cancelButtonTitle:@"OK" 
 otherButtonTitles:nil];
 [expirationAlert show];
 [expirationAlert release];
 }   
 }
 
 #pragma mark UIAlertViewDelegate
 - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 exit(0);
 }
 
 //#endif
 //expiration code ends
 */
 


-(IBAction)verboseboot {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon!" message:@"This feature is being worked on and is coming soon! -Fr0st" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	/*
	 [self.view addSubview:normal];
	 myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseamountVERBOSE) userInfo:nil repeats:YES];

	 */
}

-(IBAction)normalboot {
	[self.view addSubview:normal];
	myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseamount) userInfo:nil repeats:YES];
	
}


-(void) increaseamount {
	normalnumber = normalnumber +0.004;
	if (normalnumber >=1) {
		LockScreen *lockscreen = [[[LockScreen alloc] initWithNibName:@"LockScreen" bundle:nil] autorelease];
		lockscreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:lockscreen animated:YES];
				
	}
	normalProgress.progress = normalnumber;

}

-(void) increaseamountVERBOSE {
	verbosenumber = verbosenumber +0.004;
	if (verbosenumber >=1) {
		LockScreen *lockscreen = [[[LockScreen alloc] initWithNibName:@"LockScreen" bundle:nil] autorelease];
		lockscreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController:lockscreen animated:YES];
		
	}
	verboseProgress.progress = verbosenumber;
	
}



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	//=====================block Unique Device Identifier=====================//
	if ([[[UIDevice currentDevice]uniqueIdentifier]isEqualToString:@"YOUR UDID GOES HERE"]) {
		UIAlertView *UDIDalert = [[UIAlertView alloc] initWithTitle:@"Welcome!" message:@"Your UDID has been blocked and iAndroid has restricted access to you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[UDIDalert show];
		[UDIDalert release];
	}
	
	
	NSUserDefaults *settings = [NSUserDefaults standardUserDefaults]; 
	
	verboseControl.selectedSegmentIndex = [settings integerForKey:@"bootKey"]; 
	testMode.selectedSegmentIndex = [settings integerForKey:@"testingMode"]; 
	
	
	//-----------------------BOOT TYPE CONTROL---------------------------//
	
		if (verboseControl.selectedSegmentIndex == 0) {
			[self.view addSubview:normal];
			myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseamount) userInfo:nil repeats:YES];
		}
		else {
			[self.view addSubview:verbose];
			myTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(increaseamountVERBOSE) userInfo:nil repeats:YES];
		}

	
	
	
	//================================== BOOT LOGO CONTROL ANIMATIONS =============//
	NSAutoreleasePool *bootPool = [[NSAutoreleasePool alloc]init];
	
	bootlogo.animationImages = [NSArray arrayWithObjects:
								[UIImage imageNamed:@"1.tiff"],
								[UIImage imageNamed:@"2.tiff"],
								[UIImage imageNamed:@"3.tiff"],
								[UIImage imageNamed:@"4.tiff"],
								[UIImage imageNamed:@"5.tiff"],
								[UIImage imageNamed:@"6.tiff"],
								[UIImage imageNamed:@"7.tiff"],
								[UIImage imageNamed:@"8.tiff"],
								[UIImage imageNamed:@"9.tiff"],
								[UIImage imageNamed:@"10.tiff"],
								[UIImage imageNamed:@"11.tiff"],
								[UIImage imageNamed:@"12.tiff"],
								[UIImage imageNamed:@"13.tiff"],
								[UIImage imageNamed:@"14.tiff"],
								[UIImage imageNamed:@"15.tiff"],
								[UIImage imageNamed:@"16.tiff"],
								[UIImage imageNamed:@"17.tiff"],
								[UIImage imageNamed:@"18.tiff"], nil];
								
	bootlogo.animationDuration = 1.60;
	bootlogo.animationRepeatCount = 0;
	[bootlogo startAnimating];
	
		
	
	
	
	//===================================== VERBOSE BOOT ANIMATIONS ====================================//
	
	verboseboot.animationImages = [NSArray arrayWithObjects:
								   [UIImage imageNamed:@"verbose-2 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-3 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-4 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-5 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-6 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-7 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-8 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-5 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-6 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-7 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-8 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-9 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-10 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-11 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-12 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-13 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-14 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-15 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-16 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-17 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-18 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-19 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-20 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-21 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-22 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-23 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-24 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-25 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-26 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-27 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-28 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-29 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-30 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-31 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-32 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-33 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-34 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-35 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-36 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-37 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-38 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-39 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-40 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-41 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-42 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-43 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-44 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-45 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-46 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-47 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-48 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-49 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-50 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-51 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-52 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-53 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-54 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-55 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-56 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-57 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-58 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-59 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-60 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-61 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-62 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-63 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-64 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-65 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-66 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-67 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-68 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-69 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-70 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-71 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-72 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-73 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-74 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-75 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-76 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-77 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-78 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-79 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-80 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-81 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-82 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-83 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-84 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-85 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-86 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-87 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-88 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-89 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-90 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-91 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-92 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-93 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-94 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-95 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-96 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-97 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-98(dragged).tiff"],
								   [UIImage imageNamed:@"verbose-99 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-100 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-101 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-102 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-103 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-104 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-105 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-106 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-107 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-108 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-109 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-110 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-111 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-112 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-113 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-114 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-115 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-116 (dragged).tiff"],
								   [UIImage imageNamed:@"verbose-117 (dragged).tiff"],
								[UIImage imageNamed:@"118.tiff"], nil];
	
	verboseboot.animationDuration = 26;
	verboseboot.animationRepeatCount = 1;
	[verboseboot startAnimating];
	[bootPool drain];
	
									
							

}

- (void)alertView:(UIAlertView *)UDIDalert clickedButtonAtIndex:(NSInteger)buttonIndex {
	exit(0);
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	
	if (UIInterfaceOrientation == UIInterfaceOrientationPortrait) {
		//
	}
	else {
		//
	}

    return NO;
}
*/


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	[home release];
	[normal release];
	[verbose release];
	[normalProgress release];

	[verboseProgress release];

	[myTimer release];

	[bootlogo release];

	[verboseboot release];
	
	[verboseControl release];
	
	
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	
	home = nil;
	
	normal = nil;
	
	verbose = nil;
	
	normalProgress = nil;
	
	verboseProgress = nil;

	myTimer = nil;
	
	bootlogo = nil;
	
	verboseboot = nil;
	
	verboseControl = nil;
}


- (void)dealloc {
    [super dealloc];
	[iAndroidViewController release];
	[home release];
	[normal release];
	[verbose release];
	[normalProgress release];
	[verboseProgress release];
	[myTimer release];
	[bootlogo release];
	[verboseboot release];
	[verboseControl release];
	
}

@end
