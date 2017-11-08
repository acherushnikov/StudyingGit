//
//  NightViewController.m
//  SudyingGit
//
//  Created by Никита on 08.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "NightViewController.h"

@interface NightViewController ()

@end

@implementation NightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Hello, night controller!";
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
