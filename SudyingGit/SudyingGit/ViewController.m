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
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, copy) NSArray <SBTPerson *>* personList;

@end

@implementation ViewController

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		SBTPerson *firstPerson = [SBTPerson new];
		firstPerson.personCellType = CASPersonCellTypeDefault;
		firstPerson.firstName = @"Стив";
		firstPerson.lastName = @"Джобс";
		firstPerson.personDescription = @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал";
		
		SBTPerson *secondPerson = [SBTPerson new];
		firstPerson.personCellType = CASPersonCellTypeCustom;
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
    //[self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.leftButton = [UIButton new];
    [self.leftButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.leftButton setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.leftButton];
    [self.leftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *leftButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    [self.view addConstraint:leftButtonTopConstraint];
    NSLayoutConstraint *leftButtonLeftConstraint =[NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15.0];
    [self.view addConstraint:leftButtonLeftConstraint];
    NSLayoutConstraint *leftButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44.0];
    [self.view addConstraint:leftButtonHeightConstraint];
    
    self.rightButton = [UIButton new];
    [self.rightButton setTitle:@"Delete" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.rightButton setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.rightButton];
    [self.rightButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *rightButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    [self.view addConstraint:rightButtonTopConstraint];
    NSLayoutConstraint *rightButtonHeightConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44.0];
    [self.view addConstraint:rightButtonHeightConstraint];
    NSLayoutConstraint *rightButtonRightConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15.0];
    [self.view addConstraint:rightButtonRightConstraint];
    
    self.tableView = [UITableView new];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
    
    
    [self.view addSubview:self.tableView];
    NSLayoutConstraint *tableViewYConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.leftButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15.0];
    [self.view addConstraint:tableViewYConstraint];
    
    NSLayoutConstraint *tableViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewLeftConstraint];
    
    NSLayoutConstraint *tableViewRightConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewRightConstraint];
    
    NSLayoutConstraint *tableViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:tableViewBottomConstraint];
    
    NSLayoutConstraint *leftButtonWidthConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.tableView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-15.0];
    [self.view addConstraint:leftButtonWidthConstraint];
    
    NSLayoutConstraint *rightButtonLeftConstraint =[NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.tableView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:15.0];
    [self.view addConstraint:rightButtonLeftConstraint];
    
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
	SBTPerson *person = self.personList[indexPath.row];
	if (person.personCellType == CASPersonCellTypeDefault)
	{
		return 44;
	}
	
    return 44;
}

@end
