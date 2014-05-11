//
//  WallPicturesViewController.h
//  ParseTest
//
//  Created by Joan Barrull Ribalta on 5/11/14.
//  Copyright (c) 2014 Joan Barrull Ribalta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallPicturesViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, retain) NSArray *wallObjectsArray;
@property (nonatomic, strong) IBOutlet UIScrollView *wallScroll;

@end
