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
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, assign) CATransform3D transform;
@property (nonatomic, copy) NSMutableArray <SBTPerson *>* personList;

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
		firstPerson.lastName = @"Джобс Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал";
		firstPerson.personDescription = @"Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал";
		
		SBTPerson *secondPerson = [SBTPerson new];
		firstPerson.personCellType = CASPersonCellTypeCustom;
		secondPerson.firstName = @"Тим";
		secondPerson.lastName = @"Кук";
		secondPerson.personDescription = @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст";
		
        _personList = [NSMutableArray arrayWithObjects:firstPerson, secondPerson, nil];
        
        CGFloat rotationAngleDegrees = -15;
        CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
        CGPoint offsetPositioning = CGPointMake(-20, -20);
        
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, 0.0, 0.0, 1.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
        _transform = transform;
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
    
    self.button1.titleLabel.text = @"Добавить";
    self.button1.backgroundColor = UIColor.blueColor;
    self.button2.titleLabel.text = @"Удалить";
    self.button2.backgroundColor = UIColor.redColor;
    
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;

    
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CASCellIdentifier];
	[self.tableView registerClass:[CASPersonTableViewCell class] forCellReuseIdentifier:CASPersonTableViewCellIdentifier];
    
	[self.view addSubview:self.tableView];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(15);
        make.left.equalTo(self.view.mas_left).with.offset(15);
        make.right.equalTo(self.button2.mas_left).with.offset(-15);
        make.height.mas_equalTo(44);
    }];
    
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(15);
        make.width.equalTo(self.button1.mas_width);
        make.right.equalTo(self.view.mas_right).with.offset(-15);
        make.height.equalTo(self.button1.mas_height);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.button1.mas_bottom).with.offset(10);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.button1 addTarget:self action:@selector(appendTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(deleteTouched) forControlEvents:UIControlEventTouchUpInside];
}

-(void)appendTouched {
    [self.tableView beginUpdates];
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    SBTPerson *person = [SBTPerson new];
    person.firstName = @"Тим2";
    person.lastName = @"Кук2";
    person.personCellType = CASPersonCellTypeCustom;
    person.personDescription = @"Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст";
    [self.personList insertObject:person atIndex:path.row];
    [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    [self.tableView endUpdates];
}

-(void)deleteTouched {
    if (self.personList.count > 0) {
        [self.tableView beginUpdates];
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.personList removeObjectAtIndex:path.row];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationBottom];
        [self.tableView endUpdates];
    }
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
    return UITableViewAutomaticDimension;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
  
}


-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSArray* indexes = [self.tableView indexPathsForVisibleRows];
    
    for(int i = 0; i < indexes.count; i ++){
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexes[i]];
        
        [UIView animateWithDuration:0.3 animations:^{
            CATransform3D rotation = CATransform3DMakeRotation( (60.0*M_PI)/180, 0.0, 0.7, 0.7);
            cell.layer.transform = rotation;
        }];
        NSLog(@"%f, %f",velocity.x, velocity.y);
        [UIView animateWithDuration:0.5 delay:0.1 options:0 animations:^{
            cell.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    [UIView animateWithDuration:0.3 animations:^{
        CATransform3D rotation = CATransform3DMakeRotation( (60.0*M_PI)/180, 0.0, 0.7, 0.7);
        cell.layer.transform = rotation;
    }];

    [UIView animateWithDuration:0.5 delay:0.1 options:0 animations:^{
        cell.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

@end
