//
//  PhotoshopAppDelegate.h
//  Photoshop
//
//  Created by John on 11-08-20.
//  Copyright 2011 Handi Mobility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoshopAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
