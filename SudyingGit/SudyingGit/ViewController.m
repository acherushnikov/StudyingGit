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
static CGFloat   const KVBElementOffset = 15.f;
static CGFloat   const KVBButtonHeight = 44.f;

static NSString *KVBNames[] = {@"Matt", @"Alex", @"Bob", @"Kurt", @"Jay" };
static NSString *KVBLastName[] = {@"Leno", @"Fisher", @"Marley", @"Nash", @"Madden" };
static NSString *KVBDescriptions[] = {
    @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является ",
    @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал",
    @"Mar используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текстley",
    @"Здесь ваш текст",
    @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал"
    };


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray <SBTPerson *>* personList;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

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
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
    
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
    
    
	[self.view addSubview:self.tableView];
    
    self.leftButton = [UIButton new];
    self.leftButton.backgroundColor = UIColor.grayColor;
  
    [self.leftButton setTitle:@"Delete" forState:UIControlStateNormal];
    [self.leftButton setShowsTouchWhenHighlighted:YES];
    [self.leftButton addTarget:self
                        action:@selector(deletePerson)
              forControlEvents:UIControlEventTouchDown];
    

    [self.view addSubview:self.leftButton];
    
    
    self.rightButton = [UIButton new];
    self.rightButton.backgroundColor = UIColor.grayColor;
   
    [self.rightButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.rightButton setShowsTouchWhenHighlighted:YES];
    [self.rightButton addTarget:self
                         action:@selector(insertPerson)
               forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.rightButton];
    
    [self setConstrains];
    
    
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.personList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell;
	SBTPerson *person = self.personList[indexPath.row];
    
	if (person.personCellType == CASPersonCellTypeDefault)
	{
		
        cell = [tableView dequeueReusableCellWithIdentifier:CASCellIdentifier forIndexPath:indexPath];
	}
	else
	{
		cell = [tableView dequeueReusableCellWithIdentifier:CASPersonTableViewCellIdentifier forIndexPath:indexPath];
        
	}
    
    [cell prepareForReuse];
	
	if (person.personCellType == CASPersonCellTypeDefault)
	{
        UITableViewCell *defaultCell = cell;
        defaultCell.textLabel.text = person.firstName;
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}

#pragma mark - Masonry

- (void) setConstrains
{
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(KVBElementOffset);
        make.left.equalTo(self.view.mas_left).with.offset(KVBElementOffset);
        make.right.equalTo(self.rightButton.mas_left).with.offset(-KVBElementOffset);
        make.bottom.equalTo(self.tableView.mas_top).with.offset(-KVBElementOffset);
        make.height.mas_equalTo(KVBButtonHeight);
        make.width.equalTo(self.rightButton.mas_width);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(KVBElementOffset);
        make.right.equalTo(self.view.mas_right).offset(-KVBElementOffset);
        make.bottom.equalTo(self.tableView.mas_top).offset(-KVBElementOffset);
        make.height.mas_equalTo(KVBButtonHeight);
    }];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    NSArray *arrayOfVisibleIndexPaths = [self.tableView indexPathsForVisibleRows];
    NSIndexPath *currentPath = arrayOfVisibleIndexPaths.lastObject;
    if (indexPath.row == currentPath.row)
    {
        NSArray * pathArray = @[ [NSValue valueWithCGPoint:CGPointMake(cell.center.x, cell.center.y)], [NSValue valueWithCGPoint:CGPointMake(cell.center.x + 20, cell.center.y)], [NSValue valueWithCGPoint:CGPointMake(cell.center.x-20, cell.center.y)], [NSValue valueWithCGPoint:CGPointMake(cell.center.x, cell.center.y)], ];
    
        CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        pathAnimation.values = pathArray;
        pathAnimation.duration = 2.0;
        
        [cell.layer addAnimation:pathAnimation forKey:@"position"];

        
    }
        
}


#pragma mark - Button actions

- (void) insertPerson
{
    
    NSInteger random = (arc4random() / 100) % 100;
    SBTPerson *newPerson = [SBTPerson new];
    
    if(random < 50)
    {
        newPerson.personCellType = CASPersonCellTypeCustom;
    }
    else
    {
        newPerson.personCellType = CASPersonCellTypeDefault;
    }
    
    newPerson.firstName = KVBNames[arc4random()% 5];
    newPerson.lastName  = KVBLastName[arc4random()% 5];
    newPerson.personDescription = KVBDescriptions[arc4random()% 5];
    
    
    NSMutableArray *newPersonArray= [NSMutableArray arrayWithArray:self.personList];
    
    [self.tableView beginUpdates];
    
    
    [newPersonArray addObject: newPerson];
    
    self.personList = [NSArray arrayWithArray:newPersonArray];
    
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.personList.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
    


    
    [self.tableView endUpdates];
    
    if(![self isVisible:newIndexPath])
    {
         [self.tableView scrollToRowAtIndexPath:newIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
    
}



- (void) deletePerson
{
    if(self.personList.count >1)
    {
        [self.tableView beginUpdates];
    
        NSMutableArray *newPersonArray= [NSMutableArray arrayWithArray:self.personList];
    
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.personList.count - 1 inSection:0];
        
        [newPersonArray removeLastObject];
    
        self.personList = newPersonArray;
    
        [self.tableView deleteRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationRight];
    
        
        [self.tableView endUpdates];
    }
    
}

-(BOOL) isVisible: (NSIndexPath *) indexPath
{
    NSArray *arrayOfVisibleIndexPaths = [self.tableView indexPathsForVisibleRows];

    if([arrayOfVisibleIndexPaths lastObject]!= indexPath)
    {
        return NO;
    }
    else
    {
        return  YES;
    }
}



@end
