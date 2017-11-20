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
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
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
    self.tableView = [UITableView new];
    self.button1 = [UIButton new];
    self.button2 = [UIButton new];
    self.button1.backgroundColor = UIColor.blackColor;
    self.button2.backgroundColor = UIColor.cyanColor;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
    [self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    
    NSArray* button1Constrains = @[
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:15],
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeLeading
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeLeading
                                                               multiplier:1.0
                                                                 constant:15],
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.button2
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0
                                                                 constant:-15],
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:44],
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.button2
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:0],
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.button2
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:0],
                                   [NSLayoutConstraint constraintWithItem:self.button1
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.button2
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:0]
                                   ];
    NSArray* button2Constrains = @[
                                   [NSLayoutConstraint constraintWithItem:self.button2
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeTrailing
                                                               multiplier:1.0
                                                                 constant:-15]];
    
    NSArray* tableViewConstrains = @[[NSLayoutConstraint constraintWithItem:self.tableView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.button1
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:15],
                                     [NSLayoutConstraint constraintWithItem:self.tableView
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:-15],
                                     [NSLayoutConstraint constraintWithItem:self.tableView
                                                                  attribute:NSLayoutAttributeLeading
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeLeading
                                                                 multiplier:1.0
                                                                   constant:-15],
                                     [NSLayoutConstraint constraintWithItem:self.tableView
                                                                  attribute:NSLayoutAttributeTrailing
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeTrailing
                                                                 multiplier:1.0
                                                                   constant:-15]];
    
    [self.view addConstraints:button1Constrains];
    [self.view addConstraints:button2Constrains];
    [self.view addConstraints:tableViewConstrains];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

//    self.tableView.frame = self.view.frame;
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
    
//    CGSize detailTextLabelSize = [self.descriptionPersonLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.firstNameLabel.frame), CGFLOAT_MAX)];
//    NSNumber *detailTextLabelHeight = [NSNumber numberWithFloat:detailTextLabelSize.height];
    
    return [CASPersonTableViewCell cellHeight:person.personDescription];
}

@end


