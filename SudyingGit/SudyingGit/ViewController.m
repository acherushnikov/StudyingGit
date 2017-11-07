//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"
@interface ViewController ()
@property(strong, nonatomic) UIButton* button;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 25)];
    self.button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.button];
    
    NewViewController* vc = [[NewViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
