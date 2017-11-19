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

@property (nonatomic, strong) UIView* containerView;
@property (nonatomic, strong) UIButton* addButton;
@property (nonatomic, strong) UIButton* deleteButton;
@end

@implementation ViewController


- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.addButton];
    [self.containerView addSubview:self.deleteButton];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.estimatedRowHeight = 100.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    [self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:SKBoxerCellIdentifier];
    
    //Anchors tableView
    [[self.tableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:true];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.f] setActive:true];
    [[self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:true];
    [[self.tableView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor] setActive:true];
    
    [self setupContainerView];
}

#pragma mark - Private methods

- (void)setupContainerView
{
    
    //Anchors containerView
    [[self.containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:true];
    [[self.containerView.topAnchor constraintEqualToAnchor:self.view.topAnchor] setActive:true];
    [[self.containerView.bottomAnchor constraintEqualToAnchor:self.tableView.topAnchor] setActive:true];
    [[self.containerView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:true];
    
    //Anchors addButton
    [[self.addButton.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor constant:-10.f] setActive:true];
    [[self.addButton.leftAnchor constraintEqualToAnchor:self.containerView.leftAnchor constant:10.f] setActive:true];
    [[self.addButton.widthAnchor constraintEqualToConstant:100.f] setActive:true];
    [[self.addButton.heightAnchor constraintEqualToConstant:20.f] setActive:true];
    
    //Anchors deleteButton
    [[self.deleteButton.centerYAnchor constraintEqualToAnchor:self.addButton.centerYAnchor] setActive:true];
    [[self.deleteButton.rightAnchor constraintEqualToAnchor:self.containerView.rightAnchor constant:-10.f] setActive:true];
    [[self.deleteButton.bottomAnchor constraintEqualToAnchor:self.addButton.bottomAnchor] setActive:true];
    [[self.deleteButton.widthAnchor constraintEqualToAnchor:self.addButton.widthAnchor] setActive:true];
}

#pragma mark - Getters UI

- (UIView *)containerView
{
    
    if (!_containerView) {
        
        UIView* view = [[UIView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = [UIColor redColor];
        
        _containerView = view;
    }
    
    return _containerView;
    
}

- (UIButton *)addButton
{
    if (!_addButton) {
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.translatesAutoresizingMaskIntoConstraints = false;
        
        button.backgroundColor = [UIColor yellowColor];
        
        _addButton = button;
    }
    
    return _addButton;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.translatesAutoresizingMaskIntoConstraints = false;
        
        button.backgroundColor = [UIColor orangeColor];
        
        _deleteButton = button;
    }
    
    return _deleteButton;
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
