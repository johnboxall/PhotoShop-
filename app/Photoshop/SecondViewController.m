//
//  SecondViewController.m
//  Photoshop
//
//  Created by John on 11-08-20.
//  Copyright 2011 Handi Mobility. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
    //webFrame.origin.y -= 20.0;	// shift the display up so that it covers the default open space from the content view
    
   // UIWebView *aWebView = [[[UIWebView alloc] initWithFrame:webFrame] autorelease];
    //self.webView = aWebView;
   /* 
    self.webView = [[UIWebView alloc] init];
    
    [super viewDidLoad];
    
    [self setView: webView];
    
    NSString *urlAddress = @"http://www.google.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    
    */
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

@end
