//
//  AppDelegate.m
//  ParseTest
//
//  Created by Joan Barrull Ribalta on 5/9/14.
//  Copyright (c) 2014 Joan Barrull Ribalta. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [Parse setApplicationId:@"rRUxiXW8F5hn3UaVKy5A2wygSbbcc4QP9g6TyLIQ" clientKey:@"PCyUquAQeQvia0Vgm0ZQZHs34x6bUX1iRZeieywX"];
    
    [Parse setApplicationId:@"rRUxiXW8F5hn3UaVKy5A2wygSbbcc4QP9g6TyLIQ" clientKey:@"PCyUquAQeQvia0Vgm0ZQZHs34x6bUX1iRZeieywX"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    PFObject *miPersona = [PFObject objectWithClassName:@"Persona"];
    [miPersona setObject:@"Miguel" forKey:@"nombre"];
    [miPersona setObject:@"Díaz Rubio" forKey:@"apellidos"];
    [miPersona setObject:@32 forKey:@"edad"];
    [miPersona save];
    
    PFObject *anotherPlayer = [PFObject objectWithClassName:@"Player"];
    [anotherPlayer setObject:@"John" forKey:@"Name"];
    [anotherPlayer setObject:@1860 forKey:@"Score"];
    [anotherPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (succeeded){
            NSLog(@"Object Uploaded!");
        }
        else{
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
        
    }];

    
    PFQuery *query = [PFQuery queryWithClassName:@"Player"]; //1
    [query whereKey:@"Name" equalTo:@"John"];//2
    [query whereKey:@"Score" greaterThan:[NSNumber numberWithInt:1000]]; //3
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {//4
        if (!error) {
            NSLog(@"Successfully retrieved: %@", objects);
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
    }];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
