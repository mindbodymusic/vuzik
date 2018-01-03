#import "ofConfigView.h"
#include "ofxiPhoneExtras.h"

@implementation ofConfigView

-(void)viewDidLoad {
    
	ofApp = (testApp*) ofGetAppPtr();
}

-(IBAction)pushPinkButton:(id)sender {
    
    ofApp->setPod( 0 );
    self.view.hidden = YES;
}

-(IBAction)pushRedButton:(id)sender {
    
    ofApp->setPod( 1 );
    self.view.hidden = YES;
}

-(IBAction)pushOrangeButton:(id)sender {
    
    ofApp->setPod( 2 );
    self.view.hidden = YES;
}

-(IBAction)pushYellowButton:(id)sender {
    
    ofApp->setPod( 3 );
    self.view.hidden = YES;
}

-(IBAction)pushGreenButton:(id)sender {
    
    ofApp->setPod( 4 );
    self.view.hidden = YES;
}

-(IBAction)pushBlueButton:(id)sender {
    
    ofApp->setPod( 5 );
    self.view.hidden = YES;
}

-(IBAction)pushNavyButton:(id)sender {
    
    ofApp->setPod( 6 );
    self.view.hidden = YES;
}

-(IBAction)pushGrayButton:(id)sender {
    
    ofApp->setPod( 7 );
    self.view.hidden = YES;
}

-(IBAction)pushCancelButton:(id)sender {
    
    self.view.hidden = YES;
}

@end
