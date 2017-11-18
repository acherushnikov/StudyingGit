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


static NSString *const CASCellIdentifier = @"CellIdentifier";
static NSString *const CASPersonTableViewCellIdentifier = @"CASPersonTableViewCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <SBTPerson *>* personList;

@end

@implementation ViewController

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		SBTPerson *firstPerson = [SBTPerson new];
		firstPerson.personCellType = CASPersonCellTypeCustom ;
		firstPerson.firstName = @"Стив";
		firstPerson.lastName = @"Джобс";
		firstPerson.personDescription = @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал";
		
		SBTPerson *secondPerson = [SBTPerson new];
		secondPerson.personCellType = CASPersonCellTypeCustom;
		secondPerson.firstName = @"Тим";
		secondPerson.lastName = @"Кук";
		secondPerson.personDescription = @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст";
		
		_personList = @[firstPerson, secondPerson];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
    
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
    
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UIView *statusBarBackground = [[UIView alloc]initWithFrame: CGRectMake(0, 0,
                                              CGRectGetWidth(self.view.frame),
                                              CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame))];
    
    statusBarBackground.backgroundColor=[UIColor blueColor];
    [self.view addSubview:statusBarBackground];
    
    UIView *buttonView = [[UIView alloc]init];
    
    UIButton *deleteButton = [UIButton new];
    [deleteButton addTarget:self action:@selector(deleteRow) forControlEvents:UIControlEventTouchDown];
    [deleteButton setTitle:@"DEL" forState:UIControlStateNormal];
    [buttonView addSubview:deleteButton];
    deleteButton.backgroundColor  = [UIColor greenColor];
    
    UIButton *addButton = [UIButton new];
    addButton.backgroundColor = [UIColor orangeColor];
    [addButton addTarget:self action:@selector(addRow) forControlEvents:UIControlEventTouchDown];
    [addButton setTitle:@"ADD" forState:UIControlStateNormal];
    
    [buttonView addSubview:addButton];
    buttonView.backgroundColor = [UIColor redColor];
    [self.view addSubview:buttonView];
    
    buttonView.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints =NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints =NO;
    addButton.translatesAutoresizingMaskIntoConstraints = NO;
    deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftButtonTopConstraint = [NSLayoutConstraint constraintWithItem:addButton
                                                                               attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    
    NSLayoutConstraint *leftButtonLeftConstraint = [NSLayoutConstraint constraintWithItem:addButton
                                                                                attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15.0];
    
    
    NSLayoutConstraint *leftButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:addButton
                                                                                  attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *leftButtonRightConstraint = [NSLayoutConstraint constraintWithItem:addButton
                                                                                 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:deleteButton attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-15.0];
    
    
    
    NSLayoutConstraint *rightButtonTopConstraint = [NSLayoutConstraint constraintWithItem:deleteButton
                                                                                attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    
    NSLayoutConstraint *rightButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:deleteButton
                                                                                   attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *rightButtonRightConstraint = [NSLayoutConstraint constraintWithItem:deleteButton
                                                                                  attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *heightsButtonConstraint = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual toItem:deleteButton attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    
    
    
    
    NSLayoutConstraint *leftButtonViewConstraint = [NSLayoutConstraint constraintWithItem:buttonView
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:0.0];
    
    NSLayoutConstraint *rightButtonViewConstraint = [NSLayoutConstraint constraintWithItem:buttonView
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:0.0];
    
    NSLayoutConstraint *topButtonViewConstraint = [NSLayoutConstraint constraintWithItem:buttonView
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:20.0];
    
    NSLayoutConstraint *heightButtonViewConstraint = [NSLayoutConstraint constraintWithItem:buttonView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1.0
                                                                         constant:74.0];
    
    
    NSLayoutConstraint *leftTableConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1.0
                                                                         constant:0.0];
    
    NSLayoutConstraint *rightTableConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                         attribute:NSLayoutAttributeRight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeRight
                                                                        multiplier:1.0
                                                                          constant:0.0];
    
    
    
    NSLayoutConstraint *topTableConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:buttonView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:0.0];
    
    NSLayoutConstraint *bottomTableConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:0.0];
    
    
    //[buttonView addConstraints:@[leftLeadingButtonViewConstraint,rightLeadingButtonViewConstraint,heightButtonView,topButtonVieewConstr]];
    //[self.tableView addConstraints:@[bottomTable,topTable,rightLeadingTable,leftLeadingTable]];
    
    /* 4. Add the constraints to button's superview*/
    [self.view addConstraints:@[bottomTableConstraint,topTableConstraint,rightTableConstraint,rightButtonViewConstraint,leftTableConstraint,topButtonViewConstraint,leftButtonViewConstraint]];
    [buttonView addConstraints:@[heightButtonViewConstraint]];
    
    
    [buttonView addConstraints:@[leftButtonTopConstraint,leftButtonBottomConstraint,leftButtonLeftConstraint,leftButtonRightConstraint]];
    [buttonView addConstraints:@[rightButtonTopConstraint,rightButtonBottomConstraint,rightButtonRightConstraint,heightsButtonConstraint]];
    
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.personList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell;
	SBTPerson *person = self.personList[indexPath.row];
	
	if (person.personCellType == CASPersonCellTypeDefault)
	{
		cell = [tableView dequeueReusableCellWithIdentifier:CASCellIdentifier forIndexPath:indexPath];
	}
	else
	{
		cell = [tableView dequeueReusableCellWithIdentifier:CASPersonTableViewCellIdentifier forIndexPath:indexPath];
	}
	
	if (person.personCellType == CASPersonCellTypeDefault)
	{
		cell.textLabel.text = person.firstName;
	}
	else
	{
		CASPersonTableViewCell *personCell = (id)cell;
		personCell.firstNameLabel.text = person.firstName;
		personCell.lastNameLabel.text = person.lastName;
		personCell.descriptionPersonLabel.text = person.personDescription;		
	}

	return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @20, @-20, @20, @0 ,@20, @-20, @20,@0];
    animation.keyTimes = @[ @0, @(1 / 8.0), @(2 / 8.0), @(3 / 8.0), @(4 / 8.0), @(5 / 8.0), @(6 / 8.0), @(7 / 8.0), @1 ];
    animation.duration = 0.5;
    
    animation.additive = YES;
    
    [cell.layer addAnimation:animation forKey:@"shake"];
}
#pragma mark - Buttons events
-(void)addRow
{
    NSMutableArray *arr = [self.personList mutableCopy];
    if (arr.count) {
        SBTPerson *person = self.personList[0];
        [arr addObject:person];
        self.personList = [arr copy];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)deleteRow
{
    if (self.personList.count) {
        NSMutableArray *arr = [self.personList mutableCopy];
        [arr removeLastObject];
        self.personList = [arr copy];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
}




@end
