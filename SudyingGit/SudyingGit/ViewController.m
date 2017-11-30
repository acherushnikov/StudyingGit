//
//  ViewController.m
//  SudyingGit
//
//  Created by Alexander Cherushnikov on 07.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "ViewController.h"
#import "DTMPersonTableViewCell.h"
#import "SBTPerson.h"

static NSString *const DTMCellIdentifier = @"CellIdentifier";
static NSString *const DTMPersonCellIdentifier = @"PersonCellIdentifier";


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <SBTPerson *> *personList;

@end

@implementation ViewController


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        SBTPerson *firstPerson = [SBTPerson new];
        firstPerson.personCellType = DTMPersonTableViewCellTypeCustom;
        firstPerson.firstName = @"Стив";
        firstPerson.lastName = @"Джобс";
        firstPerson.personDescription = @"Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.";
        
        SBTPerson *secondPerson = [SBTPerson new];
        secondPerson.personCellType = DTMPersonTableViewCellTypeDefault;
        secondPerson.firstName = @"Тим";
        secondPerson.lastName = @"Кук";
        secondPerson.personDescription = @"Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток";
        
        _personList = @[firstPerson, secondPerson];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.button1];

    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.button2];
    
    
    self.tableView = [UITableView new];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DTMCellIdentifier];
    [self.tableView registerClass:[DTMPersonTableViewCell class] forCellReuseIdentifier:DTMPersonCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//
//-(void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//
////    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
//
//
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
//    [self.view addConstraint:constraint];
//
//    NSLayoutConstraint *constraint12 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:15.0];
//    [self.view addConstraint:constraint12];
//
//    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15.0];
//    [self.view addConstraint:constraint2];
//
//    NSLayoutConstraint *constraint13 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant: - 15.0];
//    [self.view addConstraint:constraint13];
//
//    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeLeft multiplier:1.0 constant: - 15.0];
//    [self.view addConstraint:constraint3];
//
//    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
//    [self.view addConstraint:constraint4];
//
//    //    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -15.0];
//    //    [self.view addConstraint:constraint4];
//
//    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44];
//    [self.view addConstraint:constraint5];
//
//    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
//    [self.view addConstraint:constraint6];
//
//
//    NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.button1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15];
//    [self.view addConstraint:constraint8];
//
//    NSLayoutConstraint *constraint9 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
//    [self.view addConstraint:constraint9];
//
//    NSLayoutConstraint *constraint10 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
//    [self.view addConstraint:constraint10];
//
//    NSLayoutConstraint *constraint11 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
//    [self.view addConstraint:constraint11];
//
//    return;
//}


-(void)viewDidLayoutSubviews
{
    //NSDictionary *views = NSDictionaryOfVariableBindings(self.button1, self.button2, self.tableView);

    NSDictionary *views = @{ @"leftButton": self.button1,
                             @"rightButton": self.button2,
                             @"table": self.tableView};

    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftButton(==rightButton)]-15-[rightButton]-15-|" options:0 metrics:nil views:views]];

    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[table]-0-|" options:0 metrics:nil views:views]];

    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[leftButton(==44)]-15-[table]-0-|" options:0 metrics:nil views:views]];

    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[rightButton(==44)]-15-[table]-0-|" options:0 metrics:nil views:views]];

    return;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //required
{
    return self.personList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath //required
{
    UITableViewCell *cell;
    //NSLog(@"indexPath.row = %ld", (long)indexPath.row);
    SBTPerson *person = self.personList[indexPath.row];
    
    if(person.personCellType == DTMPersonTableViewCellTypeDefault)
        cell = [tableView dequeueReusableCellWithIdentifier: DTMCellIdentifier forIndexPath: indexPath];
    else
        cell = [tableView dequeueReusableCellWithIdentifier: DTMPersonCellIdentifier forIndexPath: indexPath];
    
    
    
    if (person.personCellType == DTMPersonTableViewCellTypeDefault)
    {
        cell.textLabel.text = person.firstName;
    }
    else
    {
        DTMPersonTableViewCell *personCell = (id)cell;
        personCell.firstNameLabel.text = person.firstName;
        personCell.lastNameLabel.text = person.lastName;
        personCell.descriptionLabel.text = person.personDescription;
    }
    
   
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView //optional
{
    return 1;
}


#pragma mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBTPerson *person = self.personList[indexPath.row];

    if(person.personCellType == DTMPersonTableViewCellTypeDefault)
        return 44;
    
    if (person.personCellType == DTMPersonTableViewCellTypeCustom)
    {
        //костыль для рассчета высоты ячейки
        DTMPersonTableViewCell *cell = [[DTMPersonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DTMCellIdentifier];

        cell.firstNameLabel.text = person.firstName;
        cell.lastNameLabel.text = person.lastName;
        cell.descriptionLabel.text = person.personDescription;
        [cell layoutSubviews];
        
        CGFloat height = cell.elementsOffset * 4 + cell.firstNameLabel.frame.size.height + cell.lastNameLabel.frame.size.height + cell.descriptionLabel.frame.size.height;
        
//        CGFloat height;
//
//        UILabel *fakeDescriptionLabel = [UILabel alloc] initWithFrame:CGRectMake(0, 0, , );
//
//        fakeDescriptionLabel.text = person.personDescription;
//        [fakeDescriptionLabel sizeToFit];
//
//        height = 44 + fakeDescriptionLabel.frame.size.height;
//
        return height;
    }
  
    return 44;
}

@end
