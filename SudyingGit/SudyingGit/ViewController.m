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
#import "NightViewController.h"

#import "CustomViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
	[super viewDidLoad];
    
    self.navigationItem.title = @"Hello, world!";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    
	PainViewController *painViewController = [PainViewController new];
	[self.navigationController pushViewController:painViewController animated:YES];

	TestViewController *testViewController = [TestViewController new];
	[self.navigationController pushViewController:testViewController animated:YES];

  NewViewController *newViewController = [NewViewController new];
  [self.navigationController pushViewController:newViewController animated:YES];
    
    CustomViewController *customVC = [CustomViewController new];
    [self.navigationController pushViewController:customVC animated:YES];

}




- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)showMyController:(UIButton *)sender {
    
    NightViewController *newViewController = [NightViewController new];
    [self.navigationController pushViewController:newViewController animated:YES];
    
}
@end
