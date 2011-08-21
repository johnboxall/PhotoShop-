//
//  FirstViewController.h
//  Photoshop
//
//  Created by John on 11-08-20.
//  Copyright 2011 Handi Mobility. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> 
{
    UIImagePickerController *imagePickerController;
    UIWebView *webView;
}

@property (nonatomic, retain) UIImagePickerController *imagePickerController;
@property (nonatomic, retain) UIWebView *webView;

@end
