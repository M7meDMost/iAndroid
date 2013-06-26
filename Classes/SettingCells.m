//
//  SettingCells.m
//  iAndroid
//
//  Created by MAXHASADHD on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingCells.h"


@implementation SettingCells
@synthesize name,DetailDiscloser,description;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
	[SettingCells release];
	
	[name release];
	name = nil;
	[description release];
	description = nil;
	[DetailDiscloser release];
	DetailDiscloser = nil;
}

@end
