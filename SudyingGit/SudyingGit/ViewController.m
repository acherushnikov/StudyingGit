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
#import "DKNCollectionViewController.h"

static NSString *const CASCellIdentifier = @"CellIdentifier";
static NSString *const CASPersonTableViewCellIdentifier = @"CASPersonTableViewCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <SBTPerson *>* personList;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *buttonAdd;
@property (nonatomic, strong) UIButton *buttonDelete;


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
	self.tableView = [UITableView new];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
      self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:self.tableView];
    
    self.buttonAdd = [UIButton new];
    self.buttonAdd.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonDelete = [UIButton new];
        self.buttonDelete.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonDelete isEqual:self.buttonAdd];
  

    self.buttonAdd.backgroundColor = [UIColor redColor];
      self.buttonDelete.backgroundColor = [UIColor orangeColor];
    [self.buttonAdd setTitle:@"Button add" forState:UIControlStateNormal];
    [self.buttonDelete setTitle:@"Button delete" forState:UIControlStateNormal];
    [self.view addSubview:self.buttonAdd];
    [self.view addSubview:self.buttonDelete];
    
    
   
    NSLayoutConstraint * buttonAddConstraintLeft =[NSLayoutConstraint
                                                   constraintWithItem:self.buttonAdd
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1.0 constant:15];
    NSLayoutConstraint * buttonAddConstraintTop =[NSLayoutConstraint
                                                  constraintWithItem:self.buttonAdd
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0 constant:15];
    
    NSLayoutConstraint * buttonAddConstraintHeight = [NSLayoutConstraint                constraintWithItem:self.buttonAdd
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:0
                                                               multiplier:1.0
                                                                 constant:44];
    NSLayoutConstraint * buttonDeleteConstraintRight =[NSLayoutConstraint        constraintWithItem:self.buttonDelete
                                                                               attribute:NSLayoutAttributeRight
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeRight
                                                                              multiplier:1.0 constant:-15];
    NSLayoutConstraint * buttonDeleteConstraintTop =[NSLayoutConstraint constraintWithItem:self.buttonDelete
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0 constant:15];
    
    NSLayoutConstraint * buttonDeleteConstraintHeight = [NSLayoutConstraint constraintWithItem:self.buttonDelete
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:0
                                                                                 multiplier:1.0
                                                                                   constant:44];
    NSLayoutConstraint *buttonDeleteConstraintGap = [NSLayoutConstraint
                                                    constraintWithItem:self.buttonAdd attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.buttonDelete attribute:NSLayoutAttributeLeft multiplier:1 constant: -15];
    
NSLayoutConstraint *buttonsWidth = [NSLayoutConstraint
                                    constraintWithItem:self.buttonDelete attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.buttonAdd attribute:NSLayoutAttributeWidth multiplier:1 constant:0];

    [self.view addConstraints:@[buttonAddConstraintTop,
                                buttonAddConstraintLeft,
                                buttonAddConstraintHeight,
                                buttonDeleteConstraintTop,
                                buttonDeleteConstraintRight,
                                buttonDeleteConstraintHeight,
                                buttonsWidth,
                                buttonDeleteConstraintGap
                               ]];
  
    NSLayoutConstraint *tableConstraintTop = [NSLayoutConstraint
                                              constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:74];
    NSLayoutConstraint *tableConstraintLeft = [NSLayoutConstraint
                                              constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *tableConstraintRight = [NSLayoutConstraint
                                              constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    NSLayoutConstraint *tableConstraintBottom = [NSLayoutConstraint
                                                constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];

   [self.view addConstraints:@[tableConstraintTop,tableConstraintLeft,tableConstraintRight, tableConstraintBottom]];

    
    


    
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
    CASPersonTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	SBTPerson *person = self.personList[indexPath.row];
	if (person.personCellType == CASPersonCellTypeDefault)
	{
		return 44;
	}
   
    if (cell)
    {
        return [cell tableCellAdjustableHeight];
    }
    return 44;
	
}

@end
