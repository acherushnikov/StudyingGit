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
    
    self.collectionView.backgroundColor = UIColor.greenColor;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[CASCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewSupplyID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewSupplyID];
    
    [self.view addSubview:self.collectionView];
    
    self.leftbutton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.leftbutton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftbutton setTitle:@"Delete" forState:UIControlStateNormal];
    self.leftbutton.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:self.leftbutton];
    
    self.rightbutton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.rightbutton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightbutton setTitle:@"Add" forState:UIControlStateNormal];
    self.rightbutton.backgroundColor = UIColor.blueColor;
    [self.view addSubview:self.rightbutton];
    
    NSDictionary *dict =  @{
                                @"LeftB": self.leftbutton,
                                @"RightB": self.rightbutton,
                                @"CollectionV": self.collectionView
                            };
    
    NSArray *ButtonsSideConstr = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[LeftB]-15-[RightB]-15-|" options: 0 metrics:nil views:dict];
    [self.view addConstraints: ButtonsSideConstr];
    
//    NSArray *ButtonsTopConstr = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[LeftB(44)]|" options: 0 metrics:nil views:dict];
//    [self.view addConstraints: ButtonsTopConstr];

    NSArray *leftButtonsHeightConstr = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[LeftB(44)]|" options: 0 metrics:nil views:dict];
    [self.view addConstraints:leftButtonsHeightConstr];
    
    NSArray *rightButtonsHeightConstr = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[RightB(44)]|" options: 0 metrics:nil views:dict];
    [self.view addConstraints:rightButtonsHeightConstr];
    
//    NSArray *collectionHeightConstr = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[CollectionV(100)]|" options: 0 metrics:nil views:dict];
//    [self.view addConstraints:collectionHeightConstr];
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
