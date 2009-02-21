//
//  JSTestViewController.m
//  JSTest
//
//  Created by Nathan Herald on 2/21/09.
//  Copyright The Myobie Corporation 2009. All rights reserved.
//

#import "JSTestViewController.h"

@implementation JSTestViewController

@synthesize js, label;

- (void) viewDidLoad {
	injected = NO;
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]];
	[self setupJavascript];
    [super viewDidLoad];
}

- (void) inject:(id)sender {
	if (! injected) {
		[webView stringByEvaluatingJavaScriptFromString:js];
		injected = YES;
		button.enabled = NO;
		label.text = @"Injected! Now try to search.";
	}
}

- (void) runOriginalJavascript {
	[webView stringByEvaluatingJavaScriptFromString:@"do_original()"];
}

- (void) setupJavascript {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// jquery.js
	NSString *jqueryFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"jquery.js"];
	
	BOOL jqueryFileExists = [fileManager fileExistsAtPath:jqueryFilePath];
	
	if (! jqueryFileExists) {
		NSLog(@"The jquery file does not exist.");
		return;
	}
	
	NSData *jqueryFileData = [fileManager contentsAtPath:jqueryFilePath];
	NSString *jqueryFileContentsAsString = [[NSString alloc] initWithData:jqueryFileData encoding:NSASCIIStringEncoding];
	
	// injection.js
	NSString *injectionFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"injection.js"];
	
	BOOL injectionFileExists = [fileManager fileExistsAtPath:injectionFilePath];
	
	if (! injectionFileExists) {
		NSLog(@"The injection file does not exist.");
		return;
	}
	
	NSData *injectionFileData = [fileManager contentsAtPath:injectionFilePath];
	NSString *injectionFileContentsAsString = [[NSString alloc] initWithData:injectionFileData encoding:NSASCIIStringEncoding];
	
	// concat the two files
	self.js = [jqueryFileContentsAsString stringByAppendingString:injectionFileContentsAsString];
}

- (void) webViewDidFinishLoad:(UIWebView *)theWebView {
	button.enabled = YES;
	label.text = @"OK, inject away.";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[js release];
	[label release];
    [super dealloc];
}

@end
