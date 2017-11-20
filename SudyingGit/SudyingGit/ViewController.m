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
//#import "Masonry.h"


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
		//firstPerson.personCellType = CASPersonCellTypeDefault;
        firstPerson.personCellType = CASPersonCellTypeCustom;
		firstPerson.firstName = @"Стив";
		firstPerson.lastName = @"Джобс";
		firstPerson.personDescription = @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века.\n\n\n";
		
		SBTPerson *secondPerson = [SBTPerson new];
		secondPerson.personCellType = CASPersonCellTypeCustom;
		secondPerson.firstName = @"Тим";
		secondPerson.lastName = @"Кук";
		secondPerson.personDescription = @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации.";
		
        SBTPerson *thirdPerson = [SBTPerson new];
        thirdPerson.personCellType = CASPersonCellTypeCustom;
        thirdPerson.firstName = @"Тони";
        thirdPerson.lastName = @"Старк";
        thirdPerson.personDescription = @"При создании связей типа Action и Outlet разрешены соединения типа один-ко-многим. То есть мы могли добавить на нашу форму еще несколько элементов и связать их с нажатием на кнопку. В этом случае вызов Touch Up Inside приводил к реакции сразу нескольких элементов.";
		
        _personList = @[firstPerson, secondPerson, thirdPerson];
        //_personList = @[firstPerson];
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
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
	[self.view addSubview:self.tableView];
    
    
    self.leftbutton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.leftbutton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftbutton setTitle:@"Delete" forState:UIControlStateNormal];
    self.leftbutton.backgroundColor = UIColor.cyanColor;
    [self.leftbutton addTarget:self action:@selector(delButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftbutton];
    
    NSLayoutConstraint *leftButtonTopConstr = [NSLayoutConstraint constraintWithItem:self.leftbutton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15];
    [self.view addConstraint:leftButtonTopConstr];
    
    NSLayoutConstraint *leftButtonLeftConstr = [NSLayoutConstraint constraintWithItem:self.leftbutton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15];
    [self.view addConstraint:leftButtonLeftConstr];
    
    NSLayoutConstraint *leftButtonBottomConstr = [NSLayoutConstraint constraintWithItem:self.leftbutton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44];
    [self.view addConstraint:leftButtonBottomConstr];
    
    NSLayoutConstraint *leftButtonRightConstr = [NSLayoutConstraint constraintWithItem:self.leftbutton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:-10];
    [self.view addConstraint:leftButtonRightConstr];
    
    self.rightbutton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.rightbutton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightbutton setTitle:@"Add" forState:UIControlStateNormal];
    self.rightbutton.backgroundColor = UIColor.blueColor;
    [self.rightbutton addTarget:self action:@selector(addButtonAction:toTable:toTheCell:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rightbutton];
    
    NSLayoutConstraint *rightButtonTopConstr = [NSLayoutConstraint constraintWithItem:self.rightbutton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15];
    [self.view addConstraint:rightButtonTopConstr];
    
    NSLayoutConstraint *rightButtonRightConstr = [NSLayoutConstraint constraintWithItem:self.rightbutton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15];
    [self.view addConstraint:rightButtonRightConstr];
    
    NSLayoutConstraint *rightButtonBottomConstr = [NSLayoutConstraint constraintWithItem:self.rightbutton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44];
    [self.view addConstraint:rightButtonBottomConstr];
    
    NSLayoutConstraint *rightButtonLeftConstr = [NSLayoutConstraint constraintWithItem:self.rightbutton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:10];
    [self.view addConstraint:rightButtonLeftConstr];
    
    NSLayoutConstraint *tableTop = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.leftbutton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
    [self.view addConstraint:tableTop];
    
    NSLayoutConstraint *tableLeft = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [self.view addConstraint:tableLeft];
    
    NSLayoutConstraint *tableRight = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:tableRight];
    
    NSLayoutConstraint *tableBottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:tableBottom];
    /*
    self.testbutton =[UIButton buttonWithType:UIButtonTypeCustom];
    self.testbutton.frame = CGRectMake(150, 300, 100, 100);
    self.testbutton.backgroundColor = [UIColor lightGrayColor];*/
    /*
     NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30],
     NSForegroundColorAttributeName: [UIColor orangeColor]
     };
     NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"But" attributes:attributes];
     [self.testbutton setAttributedTitle:title forState:UIControlStateNormal];
     */
    /*
    [self.testbutton setTitle:@"Button" forState:UIControlStateNormal];
    [self.testbutton setTitle:@"Button Pressed" forState:UIControlStateHighlighted];
    [self.testbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.testbutton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];*/
    //[self.testbutton];
    /*UIEdgeInsets insets = UIEdgeInsetsMake(50, 50, 0, 0);
     self.testbutton.titleEdgeInsets = insets;*/
    /*
    [self.view addSubview:self.testbutton];
    [self.testbutton addTarget:self action:@selector(ActionTest:) forControlEvents:UIControlEventTouchUpInside];
    [self.testbutton addTarget:self action:@selector(ActionTest2:) forControlEvents:UIControlEventTouchUpOutside];*/
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    self.tableView.frame = self.view.frame;
//}

#pragma mark - Actions

- (void)delButtonAction:(UIButton*) but
{
    NSLog(@"Del button pressed");
    BOOL isEditing = self.tableView.editing;
    [self.tableView setEditing:!isEditing];
    if (isEditing) {
        [but setTitle:@"Del" forState:UIControlStateNormal];
    }
    else{
        [but setTitle:@"Done" forState:UIControlStateNormal];
    }
};
- (void)addButtonAction:(UIButton*)sender toTable:(UITableView *)tableView toTheCell:(NSIndexPath *)indexPath
{
    NSLog(@"Add button pressed");
    BOOL isEditing = self.tableView.editing;
    [self.tableView setEditing:!isEditing];
    
    //UITableViewCell *cell;
    CASPersonTableViewCell *addingNewCell = [[CASPersonTableViewCell alloc] initWithStyle:CASPersonCellTypeCustom reuseIdentifier:@"test"];
    addingNewCell.firstNameLabel.text = @"Новый";
    addingNewCell.lastNameLabel.text = @"Персонаж";
    addingNewCell.descriptionPersonLabel.text =@"omnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom";
    //addingNewCell.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    //[addingNewCell layoutSubviews];
    //[self.tableView insertSections:addingNewCell withRowAnimation:UITableViewRowAnimationLeft];
    [self.view addSubview:addingNewCell];
};

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
	
    return 150;
}

@end
