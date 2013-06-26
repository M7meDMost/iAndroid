//
//  LockScreen.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreen.h"

@interface LockScreen : UIViewController {
	IBOutlet UISlider *unlocker;
	
}
-(IBAction)unlock:(UISlider*)sender;
@end
