//
//  FirstViewController.m
//  Photoshop
//
//  Created by John on 11-08-20.
//  Copyright 2011 Handi Mobility. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

@synthesize imagePickerController, webView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.imagePickerController = [[[UIImagePickerController alloc] init] autorelease];
    self.imagePickerController.delegate = self;
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum ; //UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:imagePickerController animated:YES];
    
    
    
    self.webView = [[UIWebView alloc] init];
    //[self setView: webView];
    
    CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
    
    self.webView.frame = webFrame;//CGRectMake(20, 40, 728, 964);
    
    [self.view addSubview:webView];
    
    
    NSString *urlAddress = @"http://www.google.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
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

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

// this get called when an image has been chosen from the library or taken from the camera
//
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    //string data
    NSString *post = @"message=Uploading HackVan PhotoShop Image!";
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];

    //file data
    ///NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
   // NSString *fullPathToFile = [documentsDirectory stringByAppendingPathComponent:@"ImageFile.png"];
    NSData *imageData = UIImagePNGRepresentation (image);
    
    //request
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL: [NSURL URLWithString:@"http://10.18.201.210/upload"]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSString*userAgent = [NSString stringWithString:@"Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3"];  
    [request addValue:userAgent forHTTPHeaderField: @"User-Agent"];
//    
    
    
    //POST body
    NSMutableData *postbody = [NSMutableData data]; 
    
    //append string data
    [postbody appendData:postData];
    
    //append file
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postbody appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"photo\"; filename=\"ImageFile.png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postbody appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[NSData dataWithData:imageData]];
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:postbody];
    
    //set content length
    NSString *postLength = [NSString stringWithFormat:@"%d", [postbody length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    NSError        *error = nil;
    NSURLResponse  *response = nil;
    
    //send and receive
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    // Get JSON as a NSString from NSData response
    NSString *json_string = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
    
    NSLog(json_string);
    
    [self dismissModalViewControllerAnimated:YES];
    
    NSString *urlAddress = @"http://www.google.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    //NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    //[webView loadRequest:requestObj];
    
    [webView loadHTMLString:json_string baseURL:url];
    
    // give the taken picture to our delegate
    //if (self.delegate)
     //   [self.delegate didTakePicture:image];
    
    //if (![self.cameraTimer isValid])
     //   [self finishAndUpdate];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //[self.delegate didFinishWithCamera];    // tell our delegate we are finished with the picker
}

@end
