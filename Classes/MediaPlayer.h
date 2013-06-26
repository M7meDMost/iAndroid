//
//  MediaPlayer.h
//  iAndroid
//
//  Created by Guillermo Moran on 7/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MediaPlayer : UIViewController {
	IBOutlet UITableView *mediaList;
	IBOutlet MPMoviePlayerViewController *mMoviePlayer;
	IBOutlet UITableViewCell *cell;
	
}

@end
