//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "CASPersonTableViewCell.h"
#import "ViewController+ViewController_JSON.h"

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
    self.tableView.allowsSelection = NO;
    
    [self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:SKBoxerCellIdentifier];
    
    self.boxers = [NSMutableArray new];
    
    for (NSDictionary* dict in [self generateJSON]) {
        
        SKBoxer* boxer = [[SKBoxer alloc] initWithDictionary:dict];
        [self.boxers addObject:boxer];
    }
    
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

- (void)addRowForIndexPath:(UIButton *)sender
{
    
    NSDictionary* paramsBoxer = [[self generateJSON] objectAtIndex:arc4random_uniform(28)];
    
    SKBoxer* boxer = [[SKBoxer alloc] initWithDictionary:paramsBoxer];
    
    NSInteger newSectionIndex = 0;
    
    [self.boxers insertObject:boxer atIndex:0];
    
    [self.tableView beginUpdates];
    
    NSIndexSet* insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
    
    UITableViewRowAnimation animation = UITableViewRowAnimationFade;
    
    [self.tableView insertSections:insertSections
                  withRowAnimation:animation];
    
    [self.tableView insertSections:insertSections withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    
    [self delayEvents];
}

- (void)deleteRowForIndexPath:(UIButton *)sender
{
    
    if (self.boxers.count > 0) {
        
        NSInteger deleteRowIndex = 0;
        
        [self.boxers removeObjectAtIndex:deleteRowIndex];
        
        [self.tableView beginUpdates];
        
        NSIndexSet* deleteSection = [NSIndexSet indexSetWithIndex:deleteRowIndex];
        [self.tableView deleteSections:deleteSection withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        
        [self delayEvents];
    }
}

- (void)delayEvents
{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });
}

#pragma mark - Constraints

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
    
    SKBoxer* boxer = self.boxers[indexPath.section];
    
    cell.boxerPhotoImageView.image = [UIImage imageNamed:boxer.boxerImageName];
    cell.nameBoxerLabel.text = boxer.boxerName;
    cell.descriptionBoxerLabel.text = boxer.boxerDescription;

    [cell.nameBoxerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:11.f]];
    [cell.descriptionBoxerLabel setFont:[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:11.f]];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.alpha = 0;
    cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -300, 0, 0);

    [UIView animateWithDuration:1.f animations:^{
        cell.alpha = 1.f;
        cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
        cell.layer.transform = CATransform3DIdentity;
    }];
}

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
        [button addTarget:self action:@selector(addRowForIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Add Boxer" forState:UIControlStateNormal];
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
        [button addTarget:self action:@selector(deleteRowForIndexPath:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Delete Boxer" forState:UIControlStateNormal];
        button.showsTouchWhenHighlighted = true;
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.layer.cornerRadius = 10.f;
        button.backgroundColor = [UIColor grayColor];
        
        _deleteButton = button;
    }
    
    return _deleteButton;
}

@end
