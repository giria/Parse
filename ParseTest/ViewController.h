//
//  ViewController.h
//  ParseTest
//
//  Created by Joan Barrull Ribalta on 5/9/14.
//  Copyright (c) 2014 Joan Barrull Ribalta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageToUpload;
- (IBAction)chooseButton:(id)sender;

- (IBAction)uploadImage:(id)sender;
- (IBAction)goWall:(id)sender;

@end
