//
//  BlueTalk.m
//  iAndroid
//
//  Created by Guillermo Moran on 7/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BlueTalk.h"


@implementation BlueTalk

@synthesize currentSession;
@synthesize txtMessage;
@synthesize connect;
@synthesize disconnect;

-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[connect setHidden:NO];
    [disconnect setHidden:YES];
	[latestMsg setEditable:NO];
    [super viewDidLoad];
}

-(IBAction) btnConnect:(id) sender {
    picker_obj = [[GKPeerPickerController alloc] init];
    picker_obj.delegate = self;
    picker_obj.connectionTypesMask = GKPeerPickerConnectionTypeNearby;      
	
    [connect setHidden:YES];
    [disconnect setHidden:NO];    
    [picker_obj show];    
}


- (void)peerPickerController:(GKPeerPickerController *)picker 
didConnectPeer:(NSString *)peerID 
toSession:(GKSession *) session {
    self.currentSession = session;
    session.delegate = self;
    [session setDataReceiveHandler:self withContext:nil];
	picker_obj.delegate =nil;
	
    [picker_obj dismiss];
    [picker_obj autorelease];
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    picker_obj.delegate = nil;
    [picker_obj autorelease];
    
    [connect setHidden:NO];
    [disconnect setHidden:YES];
}

-(IBAction) btnDisconnect:(id) sender {
    [self.currentSession disconnectFromAllPeers];
    [self.currentSession release];
    currentSession = nil;
    
    [connect setHidden:NO];
    [disconnect setHidden:YES];
}

- (void)session:(GKSession *)session 
peer:(NSString *)peerID 
didChangeState:(GKPeerConnectionState)state {
    switch (state)
    {
        case GKPeerStateConnected:
            NSLog(@"connected");
            break;
        case GKPeerStateDisconnected:
            NSLog(@"disconnected");
            [self.currentSession release];
            currentSession = nil;
            
            [connect setHidden:NO];
            [disconnect setHidden:YES];
            break;
    }
}

- (void) mySendDataToPeers:(NSData *) data
{
    if (currentSession) 
        [self.currentSession sendDataToAllPeers:data 
                                   withDataMode:GKSendDataReliable 
                                          error:nil];    
}

-(IBAction) btnSend:(id) sender
{
    //---convert an NSString object to NSData---
    NSData* data;
    NSString *str = [NSString stringWithString:txtMessage.text];
    data = [str dataUsingEncoding: NSASCIIStringEncoding];        
    [self mySendDataToPeers:data];   
	
	[sender resignFirstResponder];
}

- (void) receiveData:(NSData *)data 
fromPeer:(NSString *)peer 
inSession:(GKSession *)session 
context:(void *)context {
	
    //---convert the NSData to NSString---
    NSString* msg;
    msg = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message Received!" 
                                                    message:msg 
                                                   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];  
	
	latestMsg.text = [NSString stringWithFormat:@"%@\nMessage Recieved: %@",latestMsg.text,msg];
}
	


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[txtMessage release];
    [currentSession release];
    [super dealloc];
}


@end
