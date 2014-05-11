//
//  ViewController.m
//  ParseTest
//
//  Created by Joan Barrull Ribalta on 5/9/14.
//  Copyright (c) 2014 Joan Barrull Ribalta. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseButton:(id)sender {
    NSLog(@" button pressed");
    //Open a UIImagePickerController to select the picture
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self.navigationController presentModalViewController:imgPicker animated:YES];
    
}

- (IBAction)uploadImage:(id)sender {
    NSLog(@" upload");
    //Upload a new picture
    NSData *pictureData = UIImagePNGRepresentation(self.imageToUpload.image);
    PFFile *file = [PFFile fileWithName:@"img" data:pictureData];
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded){
            //Add the image to the object, and add the comment and the user
            PFObject *imageObject = [PFObject objectWithClassName:@"WallImageObject"];
            [imageObject setObject:file forKey:@"image"];
            [imageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                //4
                if (succeeded){
                    //Go back to the wall
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else{
                    NSString *errorString = [[error userInfo] objectForKey:@"error"];
                    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [errorAlertView show];
                }
            }];
        }
        else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
        
        
    }progressBlock:^(int percentDone) {
        NSLog(@"Uploaded: %d %%", percentDone);
    }];

}

- (IBAction)goWall:(id)sender {
    [self performSegueWithIdentifier:@"wall" sender:self];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo
{
    [picker dismissModalViewControllerAnimated:YES];
    //Place the image in the imageview
    self.imageToUpload.image = img;
}
@end
