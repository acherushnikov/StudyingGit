//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "CASPersonTableViewCell.h"
#import "SBTPerson.h"
#import <Masonry/Masonry.h>

static NSString * const SKBoxerCellIdentifier = @"SKBoxerCell";
static CGFloat const SKHeightBetweenCells = 15.f;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, copy) NSArray* boxers;
@end

@implementation ViewController


- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.estimatedRowHeight = 100.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:SKBoxerCellIdentifier];
    
    [[self.tableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:true];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.f] setActive:true];
    [[self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:true];
    [[self.tableView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor] setActive:true];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:SKBoxerCellIdentifier];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SKHeightBetweenCells;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

@end
