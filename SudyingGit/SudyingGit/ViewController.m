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
@property (nonatomic, strong) UIView *buttonsView;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *leftButton;

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
	
	
	self.buttonsView = [UIView new];
	self.buttonsView.backgroundColor = UIColor.redColor;
	self.buttonsView.translatesAutoresizingMaskIntoConstraints = NO;
	
	self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom ];
	self.rightButton.backgroundColor = UIColor.whiteColor;
	self.rightButton.titleLabel.text = @"Правая кнопка";
	self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
	
	
	self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom ];
	self.leftButton.backgroundColor = UIColor.blackColor;
	self.leftButton.titleLabel.text = @"Левая кнопка";
	self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.buttonsView addSubview:self.rightButton];
	[self.buttonsView addSubview:self.leftButton];
	
	[self.view addSubview: self.buttonsView];
	self.view.backgroundColor = [UIColor whiteColor];
	self.tableView = [UITableView new];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
	[self.view addSubview:self.tableView];
	
	

	[self.view setNeedsUpdateConstraints];
	[self.view layoutIfNeeded];
	
}



- (void)updateViewConstraints
{
	

	
	// [self.buttonsView setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	// левая кнопка
	NSLayoutConstraint *leftButtonLeftConstraint = [NSLayoutConstraint
												 constraintWithItem:self.leftButton
												 attribute:NSLayoutAttributeLeft
												 relatedBy:NSLayoutRelationEqual
												 toItem:self.buttonsView
												 attribute:
												 NSLayoutAttributeLeft
												 multiplier:1.0
												 constant:15];

	NSLayoutConstraint *leftButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton
																		   attribute:NSLayoutAttributeTop
																		   relatedBy:NSLayoutRelationEqual
																			  toItem:self.buttonsView
																		   attribute:NSLayoutAttributeTop
																		  multiplier:1
																			constant:15.f];


	NSLayoutConstraint *leftButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton
																			   attribute:NSLayoutAttributeBottom
																			   relatedBy:NSLayoutRelationEqual
																				  toItem:self.buttonsView
																			   attribute:NSLayoutAttributeBottom
																			  multiplier:1
																				constant:15.f];

	/* Fixed Height */
	NSLayoutConstraint *heightLeftButtonConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton
																			  attribute:NSLayoutAttributeHeight
																			  relatedBy:NSLayoutRelationEqual
																				 toItem:nil
																			  attribute:NSLayoutAttributeHeight
																			 multiplier:1.0
																			   constant:44.f];

	
	
	
	
	 //Правая кнопка

	NSLayoutConstraint *rightButtonRightConstraint = [NSLayoutConstraint
													constraintWithItem:self.rightButton
													attribute:NSLayoutAttributeRight
													relatedBy:NSLayoutRelationEqual
													toItem:self.buttonsView
													attribute:
													NSLayoutAttributeRight
													multiplier:1.0
													constant:-15];
	

	
	

	NSLayoutConstraint *rightButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton
																			   attribute:NSLayoutAttributeTop
																			   relatedBy:NSLayoutRelationEqual
																				  toItem:self.buttonsView
																			   attribute:NSLayoutAttributeTop
																			  multiplier:1
																				constant:15.f];


	NSLayoutConstraint *rightButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton
																					attribute:NSLayoutAttributeBottom
																					relatedBy:NSLayoutRelationEqual
																					   toItem:self.buttonsView
																					attribute:NSLayoutAttributeBottom
																				   multiplier:1
																					 constant:15.f];

	NSLayoutConstraint *heightRightButtonConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton
																					 attribute:NSLayoutAttributeHeight
																					 relatedBy:NSLayoutRelationEqual
																						toItem:nil
																					 attribute:NSLayoutAttributeHeight
																					multiplier:1.0
																					  constant:44.f];
	
	
	
	NSLayoutConstraint *equal = [NSLayoutConstraint
								 constraintWithItem:self.rightButton
								 attribute:NSLayoutAttributeLeft
								 relatedBy:NSLayoutRelationEqual
								 toItem:self.leftButton
								 attribute:
								 NSLayoutAttributeRight
								 multiplier:1.0
								 constant:15];
	

	NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.leftButton attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
	
	// Задаем констренты для button View
	/* Fixed Height */
	NSLayoutConstraint *heightButtonConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
																			  attribute:NSLayoutAttributeHeight
																			  relatedBy:NSLayoutRelationEqual
																				 toItem:nil
																			  attribute:NSLayoutAttributeHeight
																			 multiplier:1.0
																			   constant:74.f];
	
	
	NSLayoutConstraint *topButtonConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
																		   attribute:NSLayoutAttributeTop
																		   relatedBy:NSLayoutRelationEqual
																			  toItem:self.view
																		   attribute:NSLayoutAttributeTop
																		  multiplier:1
																			constant:0];
	
	NSLayoutConstraint *leftButtonViewConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
																			attribute:NSLayoutAttributeLeading
																			relatedBy:NSLayoutRelationEqual
																			   toItem:self.view
																			attribute:NSLayoutAttributeLeading
																		   multiplier:1.0
																			 constant:0];
	
	NSLayoutConstraint *rightViewButtonConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
																			attribute:NSLayoutAttributeTrailing
																			relatedBy: NSLayoutRelationEqual
																			   toItem:self.view
																			attribute:NSLayoutAttributeTrailing
																		   multiplier:1.f
																			 constant:0];
	
	// Настройка таблицы
	
	NSLayoutConstraint *rightTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
													 attribute:NSLayoutAttributeRight
													 relatedBy: NSLayoutRelationEqual
														toItem:self.view
													 attribute:NSLayoutAttributeRight
													multiplier:1.f
													  constant:0];
	
	NSLayoutConstraint *leftTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
																				attribute:NSLayoutAttributeLeft
																				relatedBy: NSLayoutRelationEqual
																				   toItem:self.view
																				attribute:NSLayoutAttributeLeft
																			   multiplier:1.f
																				 constant:0];
	
	
	NSLayoutConstraint *topTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
																			   attribute:NSLayoutAttributeTop
																			   relatedBy: NSLayoutRelationEqual
																				  toItem:self.buttonsView
																			   attribute:NSLayoutAttributeBottom
																			  multiplier:1.f
																				constant:0];
	
	NSLayoutConstraint *bottomTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.tableView
																			  attribute:NSLayoutAttributeBottom
																			  relatedBy: NSLayoutRelationEqual
																				 toItem:self.view
																			  attribute:NSLayoutAttributeBottom
																			 multiplier:1.f
																			   constant:0];
	
	
	
	
	[self.view addConstraints:@[ rightViewButtonConstraint, leftButtonViewConstraint, heightButtonConstraint, topButtonConstraint, rightButtonTopConstraint, heightLeftButtonConstraint, rightButtonBottomConstraint, heightRightButtonConstraint, leftButtonLeftConstraint,leftButtonTopConstraint,rightButtonRightConstraint, heightLeftButtonConstraint,leftButtonBottomConstraint,height, equal, rightTableViewConstraint, leftTableViewConstraint, topTableViewConstraint, bottomTableViewConstraint]];
	
	//
	
	
		[super updateViewConstraints];
}

- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	
	//self.tableView.frame = self.view.frame;
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
