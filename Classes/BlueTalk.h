//
//  BlueTalk.h
//  iAndroid
//
//  Created by Guillermo Moran on 7/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>


@interface BlueTalk : UIViewController <GKPeerPickerControllerDelegate,GKSessionDelegate> {
	GKSession *currentSession;
    IBOutlet UITextField *txtMessage;
    IBOutlet UIButton *connect;
    IBOutlet UIButton *disconnect;
	
	IBOutlet UITextView *latestMsg;
	
	
	GKPeerPickerController *picker_obj;
	
	
}
@property (nonatomic, retain) GKSession *currentSession;
@property (nonatomic, retain) UITextField *txtMessage;
@property (nonatomic, retain) UIButton *connect;
@property (nonatomic, retain) UIButton *disconnect;

-(IBAction) btnSend:(id) sender;
-(IBAction) btnConnect:(id) sender;
-(IBAction) btnDisconnect:(id) sender;
//-(IBAction)switchoffbluetooth:(id)sender;

-(IBAction)quit;
@end
