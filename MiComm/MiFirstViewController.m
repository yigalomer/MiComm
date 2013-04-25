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
  
	for (int i=1001; i < 1010; ++i) {
		UIButton *button = (UIButton *)[self.view viewWithTag:i];
		[button addTarget:self action:@selector(imageWasSelected:) forControlEvents:UIControlEventTouchUpInside];
		//[button setBackgroundImage:im forState:UIControlStateNormal];
    button.enabled = YES;
	}
  
}


- (void)imageWasSelected:(id)sender {
  
	UIButton *selectedButton = (UIButton *)sender;
	//guessed.enabled = NO;
  
  [self startTransitionAnimationForButton :selectedButton] ;
  
  [self startCamera ] ;

  
}




- (void) startTransitionAnimationForButton:(UIButton *)button {


  CATransition *transition = [[CATransition alloc] init];
  transition.duration = 0.5;
  transition.type = kCATransitionFromBottom;
  
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
   
  [button.layer addAnimation:transition forKey:@"Fade"];
  
  [CATransaction begin];
  [CATransaction commit];

}


- (void) startCamera {

  // Set up the image picker controller and add it to the view
  self.imagePickerController = [[UIImagePickerController alloc] init];
  //self.imagePickerController.delegate = self;
  //self.imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
  
  
  UIView *overlay = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  overlay.backgroundColor = [UIColor blueColor];
  overlay.alpha = 0.3;
  overlay.opaque = NO;
  
  
  self.imagePickerController = [[UIImagePickerController alloc] init];
  self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
  self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
  self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
  self.imagePickerController.showsCameraControls = YES;
  self.imagePickerController.navigationBarHidden = YES;
  self.imagePickerController.toolbarHidden = YES;
  self.imagePickerController.wantsFullScreenLayout = YES;
  
  
  [self presentModalViewController:self.imagePickerController animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
