//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "MEKPersonTableViewCell.h"
#import "SBTPerson.h"

static NSString *const MEKCellIdentifier = @"CellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <SBTPerson*> *personList;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) NSLayoutConstraint *bottomConstrant;
@property (nonatomic, strong) NSLayoutConstraint *topConstrant;
@property (nonatomic, strong) NSLayoutConstraint *leftConstrant;
@property (nonatomic, strong) NSLayoutConstraint *rightConstrant;

@property (nonatomic, strong) NSLayoutConstraint *bottomLeftButtonConstrant;
@property (nonatomic, strong) NSLayoutConstraint *topLeftButtonConstrant;
@property (nonatomic, strong) NSLayoutConstraint *leftLeftButtonConstrant;

@property (nonatomic, strong) NSLayoutConstraint *middleButtonsConstrant;
@property (nonatomic, strong) NSLayoutConstraint *widthButtonsConstrant;

@property (nonatomic, strong) NSLayoutConstraint *bottomRightButtonConstrant;
@property (nonatomic, strong) NSLayoutConstraint *topRightButtonConstrant;
@property (nonatomic, strong) NSLayoutConstraint *rightRightButtonConstrant;


-(void)setupConstraints;

@end

@implementation ViewController


-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColor.grayColor;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[MEKPersonTableViewCell class] forCellReuseIdentifier:MEKCellIdentifier];
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview: self.tableView];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftButton.backgroundColor = UIColor.greenColor;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton setTitle:@"Left" forState:UIControlStateNormal];
    [self.view addSubview:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightButton.backgroundColor = UIColor.redColor;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton setTitle:@"Right" forState:UIControlStateNormal];
    [self.view addSubview:self.rightButton];
    
    [self setupConstraints];
}

-(void)setupConstraints
{
    self.bottomConstrant = [NSLayoutConstraint
                            constraintWithItem:self.tableView
                            attribute:NSLayoutAttributeBottom
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeBottom
                            multiplier:1.0
                            constant:0];
    
    self.topConstrant = [NSLayoutConstraint
                            constraintWithItem:self.tableView
                            attribute:NSLayoutAttributeTop
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0
                            constant:74];
    
    self.leftConstrant = [NSLayoutConstraint
                          constraintWithItem:self.tableView
                          attribute:NSLayoutAttributeLeft
                          relatedBy:NSLayoutRelationEqual
                          toItem:self.view
                          attribute:NSLayoutAttributeLeft
                          multiplier:1.0
                          constant:0];
    
    self.rightConstrant = [NSLayoutConstraint
                          constraintWithItem:self.tableView
                          attribute:NSLayoutAttributeRight
                          relatedBy:NSLayoutRelationEqual
                          toItem:self.view
                          attribute:NSLayoutAttributeRight
                          multiplier:1.0
                          constant:0];
    
    [self.view addConstraints:@[self.bottomConstrant, self.topConstrant, self.leftConstrant, self.rightConstrant]];
    
    
    
    self.bottomLeftButtonConstrant = [NSLayoutConstraint
                            constraintWithItem:self.leftButton
                            attribute:NSLayoutAttributeBottom
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.tableView
                            attribute:NSLayoutAttributeTop
                            multiplier:1.0
                            constant:-15];
    
    self.topLeftButtonConstrant = [NSLayoutConstraint
                         constraintWithItem:self.leftButton
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.view
                         attribute:NSLayoutAttributeTop
                         multiplier:1.0
                         constant:15];
    
    self.leftLeftButtonConstrant = [NSLayoutConstraint
                          constraintWithItem:self.leftButton
                          attribute:NSLayoutAttributeLeft
                          relatedBy:NSLayoutRelationEqual
                          toItem:self.view
                          attribute:NSLayoutAttributeLeft
                          multiplier:1.0
                          constant:15];
    
    self.middleButtonsConstrant = [NSLayoutConstraint
                           constraintWithItem:self.leftButton
                           attribute:NSLayoutAttributeRight
                           relatedBy:NSLayoutRelationEqual
                           toItem:self.rightButton
                           attribute:NSLayoutAttributeLeft
                           multiplier:1.0
                           constant:-15];
    
    self.widthButtonsConstrant = [NSLayoutConstraint
                                   constraintWithItem:self.leftButton
                                   attribute:NSLayoutAttributeWidth
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.rightButton
                                   attribute:NSLayoutAttributeWidth
                                   multiplier:1.0
                                   constant:0];
    
    
    self.bottomRightButtonConstrant = [NSLayoutConstraint
                                      constraintWithItem:self.rightButton
                                      attribute:NSLayoutAttributeBottom
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:self.tableView
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:-15];
    
    self.topRightButtonConstrant = [NSLayoutConstraint
                                   constraintWithItem:self.rightButton
                                   attribute:NSLayoutAttributeTop
                                   relatedBy:NSLayoutRelationEqual
                                   toItem:self.view
                                   attribute:NSLayoutAttributeTop
                                   multiplier:1.0
                                   constant:15];
    
    self.rightRightButtonConstrant = [NSLayoutConstraint
                                    constraintWithItem:self.rightButton
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                    constant:-15];
    
    [self.view addConstraints:@[self.leftLeftButtonConstrant, self.topLeftButtonConstrant, self.bottomLeftButtonConstrant, self.middleButtonsConstrant, self.topRightButtonConstrant, self.bottomRightButtonConstrant, self.rightRightButtonConstrant, self.widthButtonsConstrant]];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //self.tableView.frame = self.view.frame;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MEKPersonTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MEKCellIdentifier forIndexPath:indexPath];
    cell.firstNameLabel.text = @"Matvey";
    cell.lastNameLabel.text = @"Kravtsov";
    cell.descriptionPersonLabel.text = @"bio";

    return cell;
}


@end
