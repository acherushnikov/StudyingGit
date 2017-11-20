//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"

#import "CASPersonTableViewCell.h"
#import "SKBoxer.h"
#import <Masonry/Masonry.h>

static NSString * const SKBoxerCellIdentifier = @"SKBoxerCell";
static CGFloat const SKHeightBetweenCells = 20.f;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* boxers;

@property (nonatomic, strong) UIView* containerView;
@property (nonatomic, strong) UIButton* addButton;
@property (nonatomic, strong) UIButton* deleteButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    //[self.tableView insertRow]
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.addButton];
    [self.containerView addSubview:self.deleteButton];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.estimatedRowHeight = self.tableView.rowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:SKBoxerCellIdentifier];
    
    self.boxers = [NSMutableArray new];
    
    //Anchors tableView
    [[self.tableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:true];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.f] setActive:true];
    [[self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor] setActive:true];
    [[self.tableView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor] setActive:true];
    
    [self setupContainerView];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0.f, 0.f, 170.f, 0.f);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 150.f, 0.f);
}

#pragma mark - Handlers buttons

- (void)addRowForIndexPath
{

    [self.tableView beginUpdates];
    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

- (void)deleteRowForIndexPath{
    
}

#pragma mark - Anchors

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
    [[self.addButton.widthAnchor constraintEqualToAnchor:self.containerView.widthAnchor multiplier:1.f/3.f] setActive:true];
    [[self.addButton.heightAnchor constraintEqualToAnchor:self.containerView.heightAnchor multiplier:1.f/5.f] setActive:true];
    
    //Anchors deleteButton
    [[self.deleteButton.centerYAnchor constraintEqualToAnchor:self.addButton.centerYAnchor] setActive:true];
    [[self.deleteButton.rightAnchor constraintEqualToAnchor:self.containerView.rightAnchor constant:-10.f] setActive:true];
    [[self.deleteButton.widthAnchor constraintEqualToAnchor:self.addButton.widthAnchor] setActive:true];
}

#pragma mark - Getters UI

- (UIView *)containerView
{
    
    if (!_containerView) {
        
        UIView* view = [[UIView alloc] init];
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = [UIColor whiteColor];
        
        _containerView = view;
    }
    
    return _containerView;
    
}

- (UIButton *)addButton
{
    if (!_addButton) {
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(addRowForIndexPath) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Add Row" forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = true;
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.layer.cornerRadius = 10.f;
        button.backgroundColor = [UIColor grayColor];
        
        _addButton = button;
    }
    
    return _addButton;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(deleteRowForIndexPath) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Delete Row" forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = true;
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.layer.cornerRadius = 10.f;
        button.backgroundColor = [UIColor grayColor];
        
        _deleteButton = button;
    }
    
    return _deleteButton;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.alpha = 0;
    cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 10);

    [UIView animateWithDuration:1.f animations:^{
        cell.alpha = 1.f;
        cell.layer.transform = CATransform3DIdentity;
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.boxers count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CASPersonTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:SKBoxerCellIdentifier];
    
    cell.boxerPhotoImageView.image = [UIImage imageNamed:@"image"];
    cell.descriptionBoxerLabel.text = @"Его первый профессиональный боксерский поединок в среднем весе произошел в 1935 или 1936 году. Свои первые 13 боев Арчи выиграл нокаутом. На протяжении долгой, красочной карьеры спортсмена, умный и опасный боксер совершил 220 боев. Из них 136 завершил нокаутом – рекордная отметка в истории бокса.";
    cell.nameBoxerLabel.text = @"Арчи Мур (1913-1998) – американский боксер, родился в городе Беноит, штат Миссисипи. При рождении им было получено имя Арчи Ли Райт. Он заявил, что родился в 1916 году в Коллинсвилле, штат Иллинойс.";

    [cell.nameBoxerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:11.f]];
    [cell.descriptionBoxerLabel setFont:[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:11.f]];
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
