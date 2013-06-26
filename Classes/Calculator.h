//
//  Calculator.h
//  iAndroid
//
//  Created by Guillermo Moran on 6/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Calculator : UIViewController {
	float result;
	IBOutlet UILabel *calculatorScreen;
	int currentOperation;
	float currentNumber;
	
	
}
-(IBAction)buttonDigitPressed:(id)sender;
-(IBAction)buttonOperationPressed:(id)sender;
-(IBAction)cancelInput;
-(IBAction)cancelOperation;
-(IBAction)quit;
@end
