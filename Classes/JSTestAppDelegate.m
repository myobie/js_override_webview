//
//  JSTestAppDelegate.m
//  JSTest
//
//  Created by Nathan Herald on 2/21/09.
//  Copyright The Myobie Corporation 2009. All rights reserved.
//

#import "JSTestAppDelegate.h"
#import "JSTestViewController.h"

@implementation JSTestAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	
	if([[url resourceSpecifier] length] > 0) { 
		viewController.label.text = [[url resourceSpecifier] substringFromIndex:2]; 
		[viewController runOriginalJavascript];
	} else {
		viewController.label.text = @"You didn't search for anything.";
	}
	
	NSLog(@"handled an url");
	
	return YES; 
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
