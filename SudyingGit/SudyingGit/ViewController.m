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
		firstPerson.personCellType = CASPersonCellTypeDefault;
		firstPerson.firstName = @"Стив";
		firstPerson.lastName = @"Джобс";
		//firstPerson.personDescription = @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал";
		
		SBTPerson *secondPerson = [SBTPerson new];
		firstPerson.personCellType = CASPersonCellTypeCustom;
		secondPerson.firstName = @"Тим";
		secondPerson.lastName = @"Кук";
		//secondPerson.personDescription = @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст";
		
		_personList = @[firstPerson, secondPerson];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.tableView = [[UITableView alloc]init];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
	[self.view addSubview:self.tableView];
    UIView *buttonView = [[UIView alloc]init];
    
    
    UIButton *deleteButton = [UIButton new];
    [buttonView addSubview:deleteButton];
    deleteButton.backgroundColor  = [UIColor greenColor];
    
    UIButton *addButton = [UIButton new];
    addButton.backgroundColor = [UIColor orangeColor];
    
    [buttonView addSubview:addButton];
    buttonView.backgroundColor = [UIColor redColor];
    [self.view addSubview:buttonView];
    
    buttonView.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints =NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints =NO;
    addButton.translatesAutoresizingMaskIntoConstraints = NO;
    deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftButtonTopConstraint = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    
    NSLayoutConstraint *leftButtonLeftConstraint = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15.0];
    
    
    NSLayoutConstraint *leftButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *leftButtonRightConstraint = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:deleteButton attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-15.0];
    
    
    
    NSLayoutConstraint *rightButtonTopConstraint = [NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
    
    //NSLayoutConstraint *rightButtonLeftConstraint = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeRight multiplier:1.0 constant:15.0];
    
    
    NSLayoutConstraint *rightButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *rightButtonRightConstraint = [NSLayoutConstraint constraintWithItem:deleteButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:buttonView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *heigts = [NSLayoutConstraint constraintWithItem:addButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:deleteButton attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    
    
    
    
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
    
    NSLayoutConstraint *topButtonViewConstr = [NSLayoutConstraint constraintWithItem:buttonView
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeTop
                                                                           multiplier:1.0
                                                                             constant:0.0];
    
    NSLayoutConstraint *heightButtonView = [NSLayoutConstraint constraintWithItem:buttonView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1.0
                                                                         constant:74.0];
    
    
    NSLayoutConstraint *leftLeadingTable = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1.0
                                                                         constant:0.0];
    
    NSLayoutConstraint *rightLeadingTable = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                         attribute:NSLayoutAttributeRight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeRight
                                                                        multiplier:1.0
                                                                          constant:0.0];
    

    
    NSLayoutConstraint *topTable = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:buttonView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:0.0];
    
    NSLayoutConstraint *bottomTable = [NSLayoutConstraint constraintWithItem:self.tableView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:0.0];
    
    
    //[buttonView addConstraints:@[leftLeadingButtonViewConstraint,rightLeadingButtonViewConstraint,heightButtonView,topButtonVieewConstr]];
    //[self.tableView addConstraints:@[bottomTable,topTable,rightLeadingTable,leftLeadingTable]];
    
    /* 4. Add the constraints to button's superview*/
    [self.view addConstraints:@[bottomTable,topTable,rightLeadingTable,rightButtonViewConstraint,leftLeadingTable,topButtonViewConstr,leftButtonViewConstraint]];
    [buttonView addConstraints:@[heightButtonView]];
    
    
    [buttonView addConstraints:@[leftButtonTopConstraint,leftButtonBottomConstraint,leftButtonLeftConstraint,leftButtonRightConstraint]];
    [buttonView addConstraints:@[rightButtonTopConstraint,rightButtonBottomConstraint,rightButtonRightConstraint,heigts]];
    
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
