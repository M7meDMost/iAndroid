//
//  StatusBarTime.h
//  iAndroid
//
//  Created by Guillermo Moran on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StatusBarTime : UIViewController {
	NSTimer *myTicker;
	IBOutlet UILabel *clockLabel;
}
- (void)runTimer;
- (void)showActivity;
@end
