//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
<<<<<<< HEAD
#import "PainViewController.h"
#import "TestViewController.h"
#import "NewViewController.h"
=======
>>>>>>> 473525179a3c3474b74e174cc01ecddfa8904bdf
#import "TemaViewController.h"

#import "CustomViewController.h"
@interface ViewController ()

@end

@implementation ViewController

<<<<<<< HEAD

- (void)viewDidLoad
{
	[super viewDidLoad];	
	PainViewController *painViewController = [PainViewController new];
	[self.navigationController pushViewController:painViewController animated:YES];

	TestViewController *testViewController = [TestViewController new];
	[self.navigationController pushViewController:testViewController animated:YES];

  NewViewController *newViewController = [NewViewController new];
  [self.navigationController pushViewController:newViewController animated:YES];
    
    CustomViewController *customVC = [CustomViewController new];
    [self.navigationController pushViewController:customVC animated:YES];
    TemaViewController *tvc = [TemaViewController new];
    [self.navigationController pushViewController:tvc animated:YES];

=======
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    TemaViewController *tvc = [TemaViewController new];
    [self.navigationController pushViewController:tvc animated:YES];
>>>>>>> 473525179a3c3474b74e174cc01ecddfa8904bdf
}



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
