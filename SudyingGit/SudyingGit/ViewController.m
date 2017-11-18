//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "MVMPersonTableViewCell.h"
#import "SBTPerson.h"

static NSString *const MVMCellIndentifier = @"CellIndentifier";
static NSString *const MVMPersonTableViewCellIdentifier = @"PersonTableViewCellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <SBTPerson *> *personList;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;

@end

@implementation ViewController

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        SBTPerson *firstPerson = [SBTPerson new];
        firstPerson.personCellType = MVMPersonCellTypeCustom;
        firstPerson.firstName = @"Стив";
        firstPerson.lastName = @"Джобс";
        firstPerson.personDescription = @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал";

        SBTPerson *secondPerson = [SBTPerson new];
        secondPerson.personCellType = MVMPersonCellTypeCustom;
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
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.button1 = [UIButton new];
    self.button2 = [UIButton new];
    
    self.button1.backgroundColor = [UIColor redColor];
    self.button2.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    
    
    self.tableView = [UITableView new];
    
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;

    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MVMCellIndentifier];
    [self.tableView registerClass:[MVMPersonTableViewCell class] forCellReuseIdentifier:MVMPersonTableViewCellIdentifier];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = @{@"tableView": self.tableView, @"button1": self.button1,@"button2": self.button2, @"view": self.view};

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-94-[tableView]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[button1(==button2)]-15-[button2]-15-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-35-[button1]-15-[tableView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-35-[button2]-15-[tableView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
    
}



//-(void)viewDidLayoutSubviews

//{
//    [super viewDidLayoutSubviews];
//
//    //self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
//
//    self.tableView.frame = self.view.frame;
//}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.personList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;
    SBTPerson *person = self.personList[indexPath.row];
    
    if(person.personCellType == MVMPersonCellTypeDefault)
    {
        cell= [tableView dequeueReusableCellWithIdentifier:MVMCellIndentifier forIndexPath: indexPath];
    }
    else
    {
        cell= [tableView dequeueReusableCellWithIdentifier:MVMPersonTableViewCellIdentifier forIndexPath: indexPath];
    }
    
    if(person.personCellType == MVMPersonCellTypeDefault)
    {
        cell.textLabel.text = person.firstName;
    }
    else
    {
        MVMPersonTableViewCell *personCell = (id)cell;
        personCell.firstNameLabel.text = person.firstName;
        personCell.lastNameLabel.text = person.lastName;
        personCell.descriptionPersonLabel.text = person.personDescription;
    }
    
    return cell;
}

#pragma makr  - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBTPerson *person = self.personList[indexPath.row];
    if (person.personCellType == MVMPersonCellTypeCustom)
    {
        MVMPersonTableViewCell *cell = [MVMPersonTableViewCell new];
        cell.descriptionPersonLabel.text = person.personDescription;
        
        return [cell cellHeight];
    }
    else
    {
        return 44.0f;
    }
}
@end
