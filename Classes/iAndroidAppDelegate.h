//
//  iAndroidAppDelegate.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/1/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>



@class iAndroidViewController;
@class LockScreen;

@interface iAndroidAppDelegate : NSObject <UIApplicationDelegate, NSXMLParserDelegate> {
    UIWindow *window;
    iAndroidViewController *viewController;
	LockScreen *lockController;
	IBOutlet UITextField* IAIDField;
	
	NSString* IAIDstring;
	NSString* versionNumber;
	NSString* UDIDString;
	
	UIAlertView* blockedAlert;
	UIAlertView* updateAlert;
	UIAlertView* iAIDAlert;
	
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iAndroidViewController *viewController;
@property (nonatomic, retain) NSString* IAIDstring;
@property (nonatomic, retain) IBOutlet LockScreen *lockController;

-(void)assignIAID;
-(void)beginParsing;
-(void)checkBlock;



@end

