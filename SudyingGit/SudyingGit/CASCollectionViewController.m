//
//  CASCollectionViewController.m
//  SudyingGit
//
//  Created by Ilya Lunkin on 16/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "CASCollectionViewController.h"
#import "CASCollectionViewCell.h"
#import "CASCollectionReusableView.h"


static NSString *const CollectionViewID = @"CASCollectionViewCell";
static NSString *const CollectionViewSupplyID = @"CASCollectionViewSupplyCell";


@interface CASCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *albums;
@property (nonatomic, strong) UIView *buttonsView;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *leftButton;

@end

@implementation CASCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.albums = @[
                    @[
                        @{ @"title": @"12424j" }
                    ],
                    @[],
                    @[
                        @{ @"key": @1 },
                        @{}
                    ],
                    @[
                        @{}
                    ]
                ];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(175, 175);
    layout.minimumLineSpacing = 50;
    
    [layout setFooterReferenceSize:CGSizeMake(100, 50)];
    [layout setHeaderReferenceSize:CGSizeMake(150, 25)];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame    collectionViewLayout:layout];
	self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.backgroundColor = UIColor.greenColor;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
	
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
    
    [self.collectionView registerClass:[CASCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewSupplyID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewSupplyID];
    
    [self.view addSubview:self.collectionView];
	
	[self.view setNeedsUpdateConstraints];
	[self.view layoutIfNeeded];
}

- (void)updateViewConstraints
{
	
//	NSDictionary *views = NSDictionaryOfVariableBindings(self.leftButton,self.rightButton);
	
	NSDictionary *views = @{
						  @"leftButton" : self.leftButton,
						  @"rightButton" : self.rightButton,
						  @"buttonsView" : self.buttonsView,
						  @"collectionView" : self.collectionView
						  };
	
	
	NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftButton]-15-[rightButton]-15-|" options:0 metrics:nil views:views];
	
	NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"[leftButton(==rightButton)]" options:0 metrics:nil views:views];
	

	NSArray *verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[leftButton(44)]-15-|" options:0 metrics:nil views:views];
	NSArray *verticalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[rightButton(44)]-15-|" options:0 metrics:nil views:views];
	
	[self.view addConstraints:horizontalConstraints];
	[self.view addConstraints:equalWidthConstraints1];
	[self.view addConstraints:verticalConstraints1];
	[self.view addConstraints:verticalConstraints2];
	
	NSArray *horizontalConstraintsButtonsView = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonsView]-0-|" options:0 metrics:nil views:views];

	
	NSArray *horizontalConstraintsCollectionView = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collectionView]-0-|" options:0 metrics:nil views:views];
	
	NSArray *verticalConstraintsCollectionView = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[buttonsView]-0-[collectionView]-0-|" options:0 metrics:nil views:views];
	
	[self.view addConstraints:horizontalConstraintsButtonsView];
	[self.view addConstraints:verticalConstraintsCollectionView];
	[self.view addConstraints:horizontalConstraintsCollectionView];
	
	
	
	
//	// левая кнопка
//	NSLayoutConstraint *leftButtonLeftConstraint = [NSLayoutConstraint
//													constraintWithItem:self.leftButton
//													attribute:NSLayoutAttributeLeft
//													relatedBy:NSLayoutRelationEqual
//													toItem:self.buttonsView
//													attribute:
//													NSLayoutAttributeLeft
//													multiplier:1.0
//													constant:15];
//
//	NSLayoutConstraint *leftButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton
//																			   attribute:NSLayoutAttributeTop
//																			   relatedBy:NSLayoutRelationEqual
//																				  toItem:self.buttonsView
//																			   attribute:NSLayoutAttributeTop
//																			  multiplier:1
//																				constant:15.f];
//
//
//	NSLayoutConstraint *leftButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton
//																				  attribute:NSLayoutAttributeBottom
//																				  relatedBy:NSLayoutRelationEqual
//																					 toItem:self.buttonsView
//																				  attribute:NSLayoutAttributeBottom
//																				 multiplier:1
//																				   constant:15.f];
//
//	/* Fixed Height */
//	NSLayoutConstraint *heightLeftButtonConstraint = [NSLayoutConstraint constraintWithItem:self.leftButton
//																				  attribute:NSLayoutAttributeHeight
//																				  relatedBy:NSLayoutRelationEqual
//																					 toItem:nil
//																				  attribute:NSLayoutAttributeHeight
//																				 multiplier:1.0
//																				   constant:44.f];
//
//
//
//
//
//	//Правая кнопка
//
//	NSLayoutConstraint *rightButtonRightConstraint = [NSLayoutConstraint
//													  constraintWithItem:self.rightButton
//													  attribute:NSLayoutAttributeRight
//													  relatedBy:NSLayoutRelationEqual
//													  toItem:self.buttonsView
//													  attribute:
//													  NSLayoutAttributeRight
//													  multiplier:1.0
//													  constant:-15];
//
//
//
//
//
//	NSLayoutConstraint *rightButtonTopConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton
//																				attribute:NSLayoutAttributeTop
//																				relatedBy:NSLayoutRelationEqual
//																				   toItem:self.buttonsView
//																				attribute:NSLayoutAttributeTop
//																			   multiplier:1
//																				 constant:15.f];
//
//
//	NSLayoutConstraint *rightButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton
//																				   attribute:NSLayoutAttributeBottom
//																				   relatedBy:NSLayoutRelationEqual
//																					  toItem:self.buttonsView
//																				   attribute:NSLayoutAttributeBottom
//																				  multiplier:1
//																					constant:15.f];
//
//	NSLayoutConstraint *heightRightButtonConstraint = [NSLayoutConstraint constraintWithItem:self.rightButton
//																				   attribute:NSLayoutAttributeHeight
//																				   relatedBy:NSLayoutRelationEqual
//																					  toItem:nil
//																				   attribute:NSLayoutAttributeHeight
//																				  multiplier:1.0
//																					constant:44.f];
//
//
//
//	NSLayoutConstraint *equal = [NSLayoutConstraint
//								 constraintWithItem:self.rightButton
//								 attribute:NSLayoutAttributeLeft
//								 relatedBy:NSLayoutRelationEqual
//								 toItem:self.leftButton
//								 attribute:
//								 NSLayoutAttributeRight
//								 multiplier:1.0
//								 constant:15];
//
//
//	NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.leftButton attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
	
	// Задаем констренты для button View
	/* Fixed Height */
//	NSLayoutConstraint *heightButtonConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
//																			  attribute:NSLayoutAttributeHeight
//																			  relatedBy:NSLayoutRelationEqual
//																				 toItem:nil
//																			  attribute:NSLayoutAttributeHeight
//																			 multiplier:1.0
//																			   constant:74.f];
//	
//	
//	NSLayoutConstraint *topButtonConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
//																		   attribute:NSLayoutAttributeTop
//																		   relatedBy:NSLayoutRelationEqual
//																			  toItem:self.view
//																		   attribute:NSLayoutAttributeTop
//																		  multiplier:1
//																			constant:0];
//	
//	NSLayoutConstraint *leftButtonViewConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
//																				attribute:NSLayoutAttributeLeading
//																				relatedBy:NSLayoutRelationEqual
//																				   toItem:self.view
//																				attribute:NSLayoutAttributeLeading
//																			   multiplier:1.0
//																				 constant:0];
//	
//	NSLayoutConstraint *rightViewButtonConstraint = [NSLayoutConstraint constraintWithItem:self.buttonsView
//																				 attribute:NSLayoutAttributeTrailing
//																				 relatedBy: NSLayoutRelationEqual
//																					toItem:self.view
//																				 attribute:NSLayoutAttributeTrailing
//																				multiplier:1.f
//																				  constant:0];
//	
//	// Настройка таблицы
//	
//	NSLayoutConstraint *rightTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
//																				attribute:NSLayoutAttributeRight
//																				relatedBy: NSLayoutRelationEqual
//																				   toItem:self.view
//																				attribute:NSLayoutAttributeRight
//																			   multiplier:1.f
//																				 constant:0];
//	
//	NSLayoutConstraint *leftTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
//																			   attribute:NSLayoutAttributeLeft
//																			   relatedBy: NSLayoutRelationEqual
//																				  toItem:self.view
//																			   attribute:NSLayoutAttributeLeft
//																			  multiplier:1.f
//																				constant:0];
//	
//	
//	NSLayoutConstraint *topTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
//																			  attribute:NSLayoutAttributeTop
//																			  relatedBy: NSLayoutRelationEqual
//																				 toItem:self.buttonsView
//																			  attribute:NSLayoutAttributeBottom
//																			 multiplier:1.f
//																			   constant:0];
//	
//	NSLayoutConstraint *bottomTableViewConstraint = [NSLayoutConstraint constraintWithItem:self.collectionView
//																				 attribute:NSLayoutAttributeBottom
//																				 relatedBy: NSLayoutRelationEqual
//																					toItem:self.view
//																				 attribute:NSLayoutAttributeBottom
//																				multiplier:1.f
//																				  constant:0];
//	
//	
//	
//	
//	[self.view addConstraints:@[ rightViewButtonConstraint, leftButtonViewConstraint, heightButtonConstraint, topButtonConstraint, rightTableViewConstraint, leftTableViewConstraint, topTableViewConstraint, bottomTableViewConstraint]];
//	
	//rightButtonTopConstraint,heightLeftButtonConstraint,heightRightButtonConstraint,leftButtonLeftConstraint,leftButtonTopConstraint,rightButtonRightConstraint,heightLeftButtonConstraint,leftButtonBottomConstraint,height,equal,rightButtonBottomConstraint
	
	
	[super updateViewConstraints];
}


#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CASCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID
                                forIndexPath:indexPath];
    
    cell.textLabel.text = self.albums[indexPath.section][indexPath.row][@"title"];
    cell.backgroundColor = UIColor.redColor;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CASCollectionReusableView *reusableView;
    
    if (kind == UICollectionElementKindSectionFooter)
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CollectionViewSupplyID forIndexPath:indexPath];
        reusableView.backgroundColor = UIColor.blueColor;
    }
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CollectionViewSupplyID forIndexPath:indexPath];
        reusableView.backgroundColor = UIColor.blackColor;
    }
    
    reusableView.lolLabel.text = @"1235";
    
    return reusableView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.albums.count - 1 < section)
    {
        return 0;
    }
    
    
    NSArray *photos = self.albums[section];
    if (![photos isKindOfClass:[NSArray class]])
    {
        return 0;
    }
    
    return ((NSArray *)self.albums[section]).count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.albums.count;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}


/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
*/
@end
