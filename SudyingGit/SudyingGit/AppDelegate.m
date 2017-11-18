//
//  AppDelegate.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MVMCollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [UIWindow new];
    
    MVMCollectionViewController *rootViewController = [MVMCollectionViewController new];
    //ViewController *rootViewController = [ViewController new];
    self.window.rootViewController = rootViewController;
    
    [self.window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	
}


- (void)applicationWillTerminate:(UIApplication *)application {
	
}


@end
