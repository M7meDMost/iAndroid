//
//  iAndroidAppDelegate.m
//  iAndroid
//
//  Created by Guillermo Moran on 5/1/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "iAndroidAppDelegate.h"
#import "iAndroidViewController.h"
#import "LockScreen.h"
#import <Foundation/NSXMLParser.h>

@implementation iAndroidAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize lockController;
@synthesize IAIDstring;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
	
	if (![[NSUserDefaults standardUserDefaults]
		  boolForKey:@"TestmodeOn"]) {
		[window addSubview:viewController.view];
		[window makeKeyAndVisible];
	}
	
	else {
		[window addSubview:lockController.view];
		[window makeKeyAndVisible];
	}
	
	//system("mkdir /var/mobile/Media/iAndroidSavedDocs"); <---- meh
	
	versionNumber = @"2.0"; //REMEMBER TO UPDATE THIS
	UDIDString = [[UIDevice currentDevice]uniqueIdentifier];
	
	NSUserDefaults *IAIDdefaults = [NSUserDefaults standardUserDefaults]; 
	
	IAIDstring = [IAIDdefaults valueForKey:@"IAIDKey"]; 
	
	if(![[NSUserDefaults standardUserDefaults] boolForKey:@"assignedIAID"]) {
		[self assignIAID];
		
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"assignedIAID"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	} 
	else {
		nil;
	}
	
	[self beginParsing];
	[self checkBlock];
	
		
	NSLog(@"Your IAID is: %@",IAIDstring);
	
	return YES;
	
}

//======================== ASSIGN THE CUSTOM IAID =======================//

-(void)assignIAID {
	
	NSUserDefaults *IAIDDefaults = [NSUserDefaults standardUserDefaults];
	
	
	int randomNumber1;
	int randomNumber2;
	int randomNumber3;
	int randomNumber4;
	int randomNumber5;
	int randomNumber6;
	int randomNumber7;
	int randomNumber8;
	int randomNumber9;
	int randomNumber10;
	
	randomNumber1 =  6 + arc4random() % 5;
	NSString* number1 = [NSString stringWithFormat: @"%d",randomNumber1];
	
	randomNumber2 =  4 + arc4random() % 7;
	NSString* number2 = [NSString stringWithFormat: @"%d",randomNumber2];
	
	randomNumber3 =  4 + arc4random() % 3;
	NSString* number3 = [NSString stringWithFormat: @"%d",randomNumber3];
	
	randomNumber4 =  3 + arc4random() % 7;
	NSString* number4 = [NSString stringWithFormat: @"%d",randomNumber4];
	
	randomNumber5 =  3 + arc4random() % 2;
	NSString* number5 = [NSString stringWithFormat: @"%d",randomNumber5];
	
	randomNumber6 =  4 + arc4random() % 6;
	NSString* number6 = [NSString stringWithFormat: @"%d",randomNumber6];
	
	randomNumber7 =  2 + arc4random() % 9;
	NSString* number7 = [NSString stringWithFormat: @"%d",randomNumber7];
	
	randomNumber8 =  1 + arc4random() % 5;
	NSString* number8 = [NSString stringWithFormat: @"%d",randomNumber8];
	
	randomNumber9 =  3 + arc4random() % 8;
	NSString* number9 = [NSString stringWithFormat: @"%d",randomNumber9];
	
	randomNumber10 =  2 + arc4random() % 6;
	NSString* number10 = [NSString stringWithFormat: @"%d",randomNumber10];
	
	IAIDstring = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",number1,number2,number3,number4,number5,number6,number7,number8,number9,number10];
	
	NSLog(@"Your iAndroid Identifier is: %@",IAIDstring);
	
	
	[IAIDDefaults setObject:IAIDstring forKey:@"IAIDKey"];
	
	[IAIDDefaults synchronize];
	
	NSLog(@"Your IAID is: %@",IAIDstring);
	
	iAIDAlert = [[UIAlertView alloc] initWithTitle:@"IAID Assigned!" message:[NSString stringWithFormat:@"Your iAndroid Identifier (iAID) has been assigned!\n\n Your iAID is: %@",IAIDstring] delegate:self cancelButtonTitle:@"Awesome!" otherButtonTitles:nil];
	[iAIDAlert show];
	[iAIDAlert release];
	
	//===================================== SUBMIT IAID & UDID TO ME =========================================//
	
	NSString* UDID = [[UIDevice currentDevice]uniqueIdentifier];
	NSString* deviceName = [[UIDevice currentDevice]name];
	NSString* name = [NSString stringWithFormat:@"%@--%@---%@",deviceName,IAIDstring,UDID];
	
	

	
	NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"clock" ofType:@"png"]];
	NSString *urlString = @"http://fr0stdev.co.cc/iandroiddata/upload.php";
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\n",name]] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:data]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:body];
	
	//NSString* fileName = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@-backup.txt\"\n",UDID];
	
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	NSLog(@"%@",returnString);

	 
	
	
}

-(void)checkBlock {
	NSArray* blockedIDs = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:@"http://fr0stdev.co.cc/iandroiddata/blockedID.plist"]];
	if (blockedIDs)
	{
		// process sources
		for (NSDictionary* src in blockedIDs)
		{
			//NSString *blockedID = [NSURL URLWithString:[src objectForKey:@"blocked"]];
			NSString *identifier = [src objectForKey:@"blocked"];
			NSString *blockedUDID = [src objectForKey:@"UDID"];
			if ([identifier isEqualToString:IAIDstring]){
				blockedAlert = [[UIAlertView alloc] initWithTitle:@"IAID Blocked" message:@"Your iAndroid Identifier (iAID) has been blocked! iAndroid cannot be used by you." delegate:self cancelButtonTitle:@"Ok :(" otherButtonTitles:nil];
				[blockedAlert show];
				[blockedAlert release];
				
			}
			if ([blockedUDID isEqualToString:UDIDString]){
				blockedAlert = [[UIAlertView alloc] initWithTitle:@"UDID Blocked" message:@"Your UDID (Unique Device Identifier) has been blocked by fr0st. You can no longer use this application until the block is removed." delegate:self cancelButtonTitle:@"Ok :(" otherButtonTitles:nil];
				[blockedAlert show];
				[blockedAlert release];
				
			}
		}
	}
}


//========================= PARSE THE XML DOCUMENT ========================//

- (void)beginParsing {
	
	
	NSAutoreleasePool *XMLPool = [[NSAutoreleasePool alloc] init];
	
	NSString* address = @"http://fr0stdev.co.cc/iAndroid.xml";
	
	
	NSData* XMLdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:address]];
	NSXMLParser* parser = [[NSXMLParser alloc] initWithData: XMLdata];
	
	[parser setDelegate:self];
	[parser parse];
	[parser release];	
	[address release];
	[XMLPool drain];
}

//======================== CHECK IF IAID IS BLOCKED ================================//

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	
	NSLog(@"Found Element:%@",elementName);
	
	if ([elementName isEqualToString:@"data"]) {
		
		NSString* isNeeded = [attributeDict valueForKey:@"needed"];
		NSString* body = [attributeDict valueForKey:@"body"];
		NSString* version = [attributeDict valueForKey:@"version"];
		NSString* title = [attributeDict valueForKey:@"title"];
		
		if ([isNeeded isEqualToString:@"YES"]) {
			if (![versionNumber isEqualToString:version]) {
			updateAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",title] message:[NSString stringWithFormat:@"%@ \n\nNew Version: %@",body,version] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[updateAlert show];
			[updateAlert release];
			
			NSLog(@"Update Available!");
			}
		}
	}
}






- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alert == blockedAlert) {
		exit(0);
	}
}

		
- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	
	
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
	[blockedAlert release];
    [super dealloc];
}


@end
