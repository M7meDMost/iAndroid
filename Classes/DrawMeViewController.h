#import <UIKit/UIKit.h>

@interface DrawMeViewController : UIViewController {
	CGPoint lastPoint;
	UIImageView *drawImage;
	BOOL mouseSwiped;	
	int mouseMoved;

	UIButton *redButton;
	UIButton *greenButton;
	UIButton *blueButton;
	
	UIButton *redPaint;
	UIButton *greenPaint;
	UIButton *bluePaint;
	
	
}
@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIButton *redButton;
@property (nonatomic, retain) IBOutlet UIButton *greenButton;
@property (nonatomic, retain) IBOutlet UIButton *blueButton;

@property (nonatomic, retain) IBOutlet UIButton *redPaint;
@property (nonatomic, retain) IBOutlet UIButton *greenPaint;
@property (nonatomic, retain) IBOutlet UIButton *bluePaint;

- (IBAction)doRedButton;
- (IBAction)about;
- (IBAction)doGreenButton;
- (IBAction)doBlueButton;
- (IBAction)doRedPaint;
- (IBAction)doGreenPaint;
- (IBAction)doBluePaint;


@end
