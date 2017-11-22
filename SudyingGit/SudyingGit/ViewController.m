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
		firstPerson.personCellType = CASPersonCellTypeCustom;
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
	
}



- (void)updateViewConstraints
{

	UIEdgeInsets padding = UIEdgeInsetsMake(15, 15, 15, 15);
		
	[self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.buttonsView.mas_top).with.offset(padding.top); //with is an optional semantic filler
		make.right.equalTo(self.buttonsView.mas_right).with.offset(-padding.right);
		make.height.mas_equalTo(44);
		make.bottom.equalTo(self.buttonsView.mas_bottom).with.offset(-padding.bottom);
	}];
    
	[self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.equalTo(self.buttonsView.mas_top).with.offset(padding.top); //with is an optional semantic filler
		make.left.equalTo(self.buttonsView.mas_left).with.offset(padding.left);
		make.height.mas_equalTo(44);
		make.width.equalTo(self.rightButton);
		make.bottom.equalTo(self.buttonsView.mas_bottom).with.offset(-padding.bottom);
		make.right.equalTo(self.rightButton.mas_left).with.offset(-padding.right);
	}];
    
    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(74);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.buttonsView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];

    [super updateViewConstraints];
}

- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
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
    
    return [CASPersonTableViewCell cellHeight:person.personDescription];
}

@end
