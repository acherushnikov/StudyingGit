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
@property (nonatomic, copy) NSMutableArray <SBTPerson *>* personList;
@property (nonatomic, strong) UIButton *addCellButton;
@property (nonatomic, strong) UIButton *deleteCellButton;
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
		
        _personList =[[NSMutableArray alloc] initWithObjects:firstPerson, secondPerson, nil];
        //_personList = @[firstPerson, secondPerson];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor yellowColor];
	self.tableView = [UITableView new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
	[self.view addSubview:self.tableView];
    
    self.addCellButton = [UIButton new];
    self.addCellButton.backgroundColor = [UIColor blueColor];
    [self.addCellButton setTitle:@"Добавить ячейку" forState:UIControlStateNormal];
    self.addCellButton.layer.cornerRadius = 5.0f;
    self.addCellButton.layer.masksToBounds = YES;
    [self.addCellButton addTarget:self action:@selector(addCellToTableView)forControlEvents:UIControlEventTouchDown];
    self.addCellButton.translatesAutoresizingMaskIntoConstraints =NO;
    
    [self.view addSubview:self.addCellButton];
    
    self.deleteCellButton = [UIButton new];
    self.deleteCellButton.backgroundColor = [UIColor blueColor];
    [self.deleteCellButton setTitle:@"Удалить ячейку" forState:UIControlStateNormal];
    self.deleteCellButton.layer.cornerRadius = 5.0f;
    self.deleteCellButton.layer.masksToBounds = YES;
    [self.deleteCellButton addTarget:self action:@selector(deleteCellToTableView)forControlEvents:UIControlEventTouchDown];
    self.deleteCellButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.deleteCellButton];
    
    [self.addCellButton mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.top.equalTo(self.view.mas_top).with.offset(35.0);
            make.left.equalTo(self.view.mas_left).with.offset(15.0);
            make.right.equalTo(self.deleteCellButton.mas_left).with.offset(-15.0);
            make.height.equalTo(@44);
        }
    ];
    
    [self.deleteCellButton mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.top.equalTo(self.view.mas_top).with.offset(35.0);
            make.width.equalTo(self.addCellButton);
            make.right.equalTo(self.view.mas_right).with.offset(-15.0);
            make.height.equalTo(@44);
        }
    ];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.top.equalTo(self.addCellButton.mas_bottom).with.offset(15.0);
            make.bottom.equalTo(self.view.mas_bottom);
            make.left.equalTo(self.view.mas_left);
            make.right.equalTo(self.view.mas_right);
            
        }
    ];
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//
//    self.tableView.frame = self.view.frame;
//}

#pragma mark - Animation

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSArray <UITableViewCell *>*cells = [self.tableView visibleCells];
    for (UITableViewCell *cell in cells)
    {
        CABasicAnimation *shake  = [CABasicAnimation animationWithKeyPath:@"position"];
        [shake setDuration:0.1];
        [shake setRepeatCount:5];
        [shake setAutoreverses:YES];
        [shake setFromValue:[NSValue valueWithCGPoint: CGPointMake(cell.center.x - 1,cell.center.y)]];
        [shake setToValue:[NSValue valueWithCGPoint: CGPointMake(cell.center.x + 1, cell.center.y)]];
        [cell.layer addAnimation:shake forKey:@"position"];
    }
}


#pragma mark - CellActivity

-(void)addCellToTableView
{
    SBTPerson *person = [SBTPerson new];
    person.personCellType = CASPersonCellTypeCustom;
    person.firstName = @"Иван";
    person.lastName = @"Иванов";
    person.personDescription = @"Товарищи! укрепление и развитие структуры требуют определения и уточнения дальнейших направлений развития. С другой стороны рамки и место обучения кадров играет важную роль в формировании систем массового участия.";
    person.personCellType = CASPersonCellTypeCustom;
    
    [self.personList insertObject:person atIndex:0];

    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
    [self.tableView endUpdates];
}

-(void)deleteCellToTableView
{
    if (self.personList.count > 1)
    {
        [self.personList removeObjectAtIndex:0];
        
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

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
//    SBTPerson *person = self.personList[indexPath.row];
//    if (person.personCellType == CASPersonCellTypeCustom)
//    {
//        CASPersonTableViewCell *cell = [CASPersonTableViewCell new];
//        cell.descriptionPersonLabel.text = person.personDescription;
//
//        return [cell cellHeight: person.personDescription];
//
//    }
//    return 44;
    return UITableViewAutomaticDimension;
}

@end
