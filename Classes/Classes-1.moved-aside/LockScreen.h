//
//  LockScreen.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LockScreen : UIViewController {
	UIButton *testItButton;
	SlideToCancelViewController *slideToCancel;
}

@property (nonatomic, retain) IBOutlet UIButton *testItButton;

- (IBAction) testIt;


@end
