//
//  JSTestAppDelegate.h
//  JSTest
//
//  Created by Nathan Herald on 2/21/09.
//  Copyright The Myobie Corporation 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSTestViewController;

@interface JSTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JSTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JSTestViewController *viewController;

@end

