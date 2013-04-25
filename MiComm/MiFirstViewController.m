//
//  MiFirstViewController.m
//  MiComm
//
//  Created by Yigal Omer on 4/22/13.
//  Copyright (c) 2013 Yigal Omer. All rights reserved.
//

#import "MiFirstViewController.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface MiFirstViewController ()

 
@property (strong, nonatomic) UIImagePickerController* imagePickerController;


@end

@implementation MiFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  /*CGColorSpaceRef csp = CGColorSpaceCreateDeviceRGB();
	CGColorRef col1 = [UIColor cyanColor].CGColor;
	CGFloat comps[4] = {0};
	memcpy(comps, CGColorGetComponents(col1), 4 * sizeof(CGFloat));
	comps[0] = 0.75;
	CGColorRef col2 = CGColorCreate(csp, comps);
  comps[0] = 0;
  for (int i=0; i < 3; ++i) comps[i] *= .7;
  col1 = CGColorCreate(csp, comps);
	//CGColorRef col2 = [UIColor whiteColor].CGColor;
	const CGColorRef cols[] = {col1, col2};
	CFArrayRef collist = CFArrayCreate(nil, (const void **)cols, sizeof(cols)/sizeof(CGColorRef), NULL);
	CGFloat locs[] = {.99,0.0};

  
  
  
	UIButton *b1 = (UIButton *)[self.view viewWithTag:1001];
	CGContextRef ctx = CGBitmapContextCreate(nil, b1.bounds.size.width, b1.bounds.size.height, 8, 4 * b1.bounds.size.width, csp, kCGImageAlphaPremultipliedLast);
	CGGradientRef grad = CGGradientCreateWithColors(csp, collist, locs);
  
	CGContextDrawRadialGradient(ctx, grad, CGPointMake(b1.bounds.size.width/2,b1.bounds.size.height/2), 1, CGPointMake(b1.bounds.size.width/2,b1.bounds.size.height/2), b1.bounds.size.width/2, kCGGradientDrawsAfterEndLocation);
	CGImageRef bg = CGBitmapContextCreateImage(ctx);*/
  
  
  //UIImage *im = [UIImage imageNamed:@"monkey_toy"];

  
	for (int i=1001; i < 1010; ++i) {
		UIButton *button = (UIButton *)[self.view viewWithTag:i];
		[button addTarget:self action:@selector(imageWasSelected:) forControlEvents:UIControlEventTouchUpInside];
		//[button setBackgroundImage:im forState:UIControlStateNormal];
    button.enabled = YES;
	}
  
  }

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

- (void)imageWasSelected:(id)sender {
  
	UIButton *selectedButton = (UIButton *)sender;
	//guessed.enabled = NO;
  
  
  // The transform matrix
  //CGAffineTransform transform =  CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(360));
  //selectedButton.transform = transform;

	
	CATransition *trans = [[CATransition alloc] init];
	trans.duration = 0.5;
	trans.type = kCATransitionFromBottom;
  
  
  //self.animationStoppedBeforeTime = NO;
  /*CABasicAnimation *fullRotation;
  fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
  fullRotation.fromValue = [NSNumber numberWithFloat:0];
  fullRotation.toValue = [NSNumber numberWithFloat:(2.0f*(CGFloat)M_PI)];
  fullRotation.duration = 0.75f;
  fullRotation.repeatCount = HUGE_VALF;
  fullRotation.removedOnCompletion = YES;
  fullRotation.delegate = self;
  [selectedButton.layer addAnimation:fullRotation forKey:@"360"];*/
  
  
	[selectedButton.layer addAnimation:trans forKey:@"flip"];
	
	[CATransaction begin];
	[CATransaction commit];
  
 
  
  
  
  
  
  // Set up the image picker controller and add it to the view
  self.imagePickerController = [[UIImagePickerController alloc] init];
  //self.imagePickerController.delegate = self;
  //self.imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
  
  //[window addSubview:imagePickerController.view];
  
  
  
  UIView *overlay = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  overlay.backgroundColor = [UIColor blueColor];
  overlay.alpha = 0.3;
  overlay.opaque = NO;
  
  //imagePicker.mediaTypes = mediaTypes;
  self.imagePickerController.sourceType  = UIImagePickerControllerSourceTypeCamera ;

  self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
  
  self.imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
  
  
  self.imagePickerController.cameraOverlayView = overlay;
  
  
  
  // Set up the image view and add it to the view but make it hidden
  //imageView = [[UIImageView alloc] initWithFrame:[window bounds]];
  //imageView.hidden = YES;
  
  //[window addSubview:imageView];
  
  
  
  
   
  
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
