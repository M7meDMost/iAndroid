//
//  SettingCells.h
//  iAndroid
//
//  Created by MAXHASADHD on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingCells : UITableViewCell {
    
    IBOutlet UILabel *name;
	IBOutlet UILabel *description;
    IBOutlet UIButton *DetailDiscloser;
    
}
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *description;
@property (nonatomic, retain) UIButton *DetailDiscloser;

@end
