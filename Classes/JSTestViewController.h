//
//  JSTestViewController.h
//  JSTest
//
//  Created by Nathan Herald on 2/21/09.
//  Copyright The Myobie Corporation 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTestViewController : UIViewController {
	IBOutlet UILabel *label;
	IBOutlet UIWebView *webView;
	IBOutlet UIButton *button;
	
	NSString *js;
	BOOL injected;
}

@property (nonatomic, retain) NSString *js;
@property (nonatomic, retain) UILabel *label;

- (IBAction) inject:(id)sender;
- (void) setupJavascript;
- (void) runOriginalJavascript;

@end

