//
//  Phone.h
//  iAndroid
//
//  Created by MAXHASADHD on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Phone : UIViewController {
    //MaxHasADHD's work
    IBOutlet UIButton *one;
    IBOutlet UIButton *two;
    IBOutlet UIButton *three;
    IBOutlet UIButton *four;
    IBOutlet UIButton *five;
    IBOutlet UIButton *six;
    IBOutlet UIButton *seven;
    IBOutlet UIButton *eight;
    IBOutlet UIButton *nine;
    IBOutlet UIButton *zero;
	IBOutlet UIButton *pound;
	IBOutlet UIButton *star;

    IBOutlet UILabel *Number;
}
@property (nonatomic, retain) UIButton *one;
@property (nonatomic, retain) UIButton *two;
@property (nonatomic, retain) UIButton *three;
@property (nonatomic, retain) UIButton *four;
@property (nonatomic, retain) UIButton *five;
@property (nonatomic, retain) UIButton *six;
@property (nonatomic, retain) UIButton *seven;
@property (nonatomic, retain) UIButton *eight;
@property (nonatomic, retain) UIButton *nine;
@property (nonatomic, retain) UIButton *zero;
@property (nonatomic, retain) UIButton *pound;
@property (nonatomic, retain) UIButton *star;


-(IBAction)whichBtn;
-(IBAction)call;
-(IBAction)clearScreen;
-(IBAction)quit;


@end
