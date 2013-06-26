//
//  Applications.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Browser.h"
#import "Settings.h"
#import "Phone.h"
#import "Facebook.h"
#import "Twitter.h"
#import "FullScreenCameraExampleController.h"
#import "Music.h"
#import "Paint.h"
#import "Calculator.h"
#import "AppLauncher.h"
#import "NotificationView.h"
#import "ShutDownView.h"
#import "Music.h"
#import "BlueTalk.h"

@interface Applications : NSObject {

	 Browser *browser;
	 Settings *settings;
     Phone *phone;
	 FullScreenCameraExampleController *camera;
	 Facebook *facebook;
	 Twitter *twitter;
	 Music *music;
	 Paint *paint;
	 Calculator *calculator;
	 AppLauncher *terminal;
	BlueTalk *text;
	
}

@property (nonatomic,retain) UIViewController *browser;
@property (nonatomic,retain) Settings *settings;
@property (nonatomic,retain) Phone *phone;
@property (nonatomic,retain) FullScreenCameraExampleController *camera;
@property (nonatomic,retain) Facebook *facebook;
@property (nonatomic,retain) Twitter *twitter;
@property (nonatomic,retain) Music *music;
@property (nonatomic,retain) Paint *paint;
@property (nonatomic,retain) Calculator *calculator;
@property (nonatomic,retain) AppLauncher *terminal;
@property (nonatomic,retain) BlueTalk *text;


@end
