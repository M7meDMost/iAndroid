//
//  ShutDownView.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShutDownView : UIViewController {
	IBOutlet UIProgressView *Progress;
	double number;
	NSTimer *myTimer;
}

@end
