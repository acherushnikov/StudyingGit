//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"

static NSString *const DTMCellIdentifier = @"CellIdentifier";
static NSString *const DTMPersonCellIdentifier = @"CellIdentifier";


@interface ViewController () <UITableViewDataSource>

//@property (nonatomic, copy) NSArray <SBTPerson *> *personList;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.button2];
    
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    [self.view addConstraint:constraint];
    
    NSLayoutConstraint *constraint12 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    [self.view addConstraint:constraint12];
    
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15.0];
    [self.view addConstraint:constraint2];
    
    NSLayoutConstraint *constraint13 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant: - 15.0];
    [self.view addConstraint:constraint13];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeLeft multiplier:1.0 constant: - 15.0];
    [self.view addConstraint:constraint3];
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint4];
    
//    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -15.0];
//    [self.view addConstraint:constraint4];
    
    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44];
    [self.view addConstraint:constraint5];
    
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint6];
    
    
    NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.button1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
    [self.view addConstraint:constraint8];
    
    NSLayoutConstraint *constraint9 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:constraint9];
    
    NSLayoutConstraint *constraint10 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [self.view addConstraint:constraint10];
    
    NSLayoutConstraint *constraint11 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:constraint11];
    
    
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DTMCellIdentifier];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DTMPersonCellIdentifier];
}

#pragma mark - UITable

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: DTMCellIdentifier forIndexPath: indexPath];
    //cell.accessoryType = UITableViewRow
    cell.textLabel.text = @"Hello";
    return cell;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
