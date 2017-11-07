//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "PainViewController.h"
#import "TestViewController.h"
#import "NewViewController.h"
#import "BadViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
	[super viewDidLoad];	
	PainViewController *painViewController = [PainViewController new];
	[self.navigationController pushViewController:painViewController animated:YES];

	TestViewController *testViewController = [TestViewController new];
	[self.navigationController pushViewController:testViewController animated:YES];

  NewViewController *newViewController = [NewViewController new];
  [self.navigationController pushViewController:newViewController animated:YES];
    
    BadViewController* badVievController = [BadViewController new];
    [self.navigationController pushViewController:badVievController animated:YES];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
