//
//  Phone.m
//  iAndroid
//
//  Created by MAXHASADHD on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Phone.h"


@implementation Phone
@synthesize one,two,three,four,five,six,seven,eight,nine,zero,pound,star;

//Application Control
-(IBAction)quit {
	[self dismissModalViewControllerAnimated:YES];
}

//Phone Code
-(IBAction)whichBtn {
    if (one.highlighted) {
        Number.text = [NSString stringWithFormat:@"%@1", Number.text];
    }
    if (two.highlighted) {
        Number.text = [NSString stringWithFormat:@"%@2", Number.text];
    }
    if (three.highlighted) {
        Number.text = [NSString stringWithFormat:@"%@3", Number.text];
    }
    if (four.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@4", Number.text];
    }
    if (five.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@5", Number.text];
    }
    if (six.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@6", Number.text];
    }
    if (seven.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@7", Number.text];
    }
    if (eight.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@8", Number.text];
    }
    if (nine.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@9", Number.text];
    }
    if (zero.highlighted) {
         Number.text = [NSString stringWithFormat:@"%@0", Number.text];
    }
	if (pound.highlighted) {
		Number.text = [NSString stringWithFormat:@"%@#", Number.text];
    }
	if (star.highlighted) {
		Number.text = [NSString stringWithFormat:@"%@*", Number.text];
    }
     
}
-(IBAction)call {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",Number.text]]];
}
-(IBAction)clearScreen {
	Number.text = @"";
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
	[Phone release];
	
	[one release];
	one = nil;
	[two release];
	two = nil;
	[three release];
	three = nil;
	[four release];
	four = nil;
	[five release];
	five = nil;
	[six release];
	six = nil;
	[seven release];
	seven = nil;
	[eight release];
	eight = nil;
	[nine release];
	nine = nil;
	[pound release];
	pound = nil;
	[star release];
	star = nil;
	[Number release];
	Number = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	[Phone release];
	
	[one release];
	one = nil;
	[two release];
	two = nil;
	[three release];
	three = nil;
	[four release];
	four = nil;
	[five release];
	five = nil;
	[six release];
	six = nil;
	[seven release];
	seven = nil;
	[eight release];
	eight = nil;
	[nine release];
	nine = nil;
	[pound release];
	pound = nil;
	[star release];
	star = nil;
	[Number release];
	Number = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
