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
		secondPerson.personCellType = CASPersonCellTypeCustom;
		secondPerson.firstName = @"Тим";
		secondPerson.lastName = @"Кук";
		secondPerson.personDescription = @"Товарищи! рамки и место обучения кадров позволяет оценить значение дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянный количественный рост и сфера нашей активности играет важную роль в формировании систем массового участия. Равным образом начало повседневной работы по формированию позиции требуют от нас анализа существенных финансовых и административных условий. Не следует, однако забывать, что консультация с широким активом влечет за собой процесс внедрения и модернизации соответствующий условий активизации. Таким образом дальнейшее развитие различных форм деятельности способствует подготовки и реализации соответствующий условий активизации.Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст";
		
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
	[self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	
	self.tableView.frame = self.view.frame;
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
    else
    {

        CASPersonTableViewCell *personCell = [CASPersonTableViewCell new];
            personCell.firstNameLabel.text = person.firstName;
            personCell.lastNameLabel.text = person.lastName;
            personCell.descriptionPersonLabel.text = person.personDescription;
    
        
        NSString *firstNameText = person.firstName;
        CGFloat height = [self heightOfAttributedText:firstNameText];
        
        NSString *lastName = person.lastName;
        height += [self heightOfAttributedText:lastName];
        
        NSString * description = person.personDescription;
        height += [self heightOfAttributedText:description];
        
        
        CASPersonTableViewCell* unusedCell = [CASPersonTableViewCell new];
        height +=3*[unusedCell cellOffset];
        
        return height  ;
    }

}

- (CGFloat) heightOfAttributedText: (NSString*) text
{
    
        CGFloat width = 300;
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:20];
        NSAttributedString *attributedText =
        [[NSAttributedString alloc] initWithString:text
                                        attributes:@{NSFontAttributeName: font}];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        CGFloat height = size.height;
    
    
    return height;
}

@end
