//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "ZHVViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

    ZHVViewController* cntrl = [ZHVViewController new];
    [self.navigationController pushViewController:cntrl animated:true];
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];

}


@end
