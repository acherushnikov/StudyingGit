//
//  DTMCollectionViewController.m
//  SudyingGit
//
//  Created by user on 16.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "DTMCollectionViewController.h"
#import "DTMCollectionViewCell.h"


static NSString *const CollectionViewID = @"DTMCollectionViewCell";
static NSString *const CollectionSupplyID = @"DTMCollectionSupply";

@interface DTMCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
//@property ()

@end

@implementation DTMCollectionViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 150);
    layout.minimumLineSpacing = 50;
    
    [layout setFooterReferenceSize:CGSizeMake(100, 50)];
    [layout setFooterReferenceSize:CGSizeMake(25, 75)];
    
    
    //self.collectionView = [UICollectionView new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    //self.collectionView.frame = self.view.frame;
    
    self.collectionView.backgroundColor = [UIColor greenColor];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    
    [self.collectionView registerClass:[DTMCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionSupplyID];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionSupplyID];
    
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UICollectionsDataSourses




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//     UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID forIndexPath:indexPath];
//
//    cell.backgroundColor = [UIColor redColor];
//
    
    DTMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID forIndexPath:indexPath];
    
//    cell.aLabel.text = @"Timur";
//    cell.backgroundColor = [UIColor redColor];
    
    cell.aLabel.text = [NSString stringWithFormat:@"row - %lu | section - %lu", indexPath.row, indexPath.section];
    cell.backgroundColor = [UIColor redColor];
    
    
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionSupplyID forIndexPath:indexPath];
        
        UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(headerView.frame), CGRectGetHeight(headerView.frame))];
        
        headerLabel.text = @"header";
        headerLabel.backgroundColor = [UIColor yellowColor];
        
        [headerView addSubview: headerLabel];
        reusableView = headerView;
    }
    else
    {
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionSupplyID forIndexPath:indexPath];
        
        UILabel* footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(footerView.frame), CGRectGetHeight(footerView.frame))];
        
        footerLabel.text = @"footer";
        footerLabel.backgroundColor = [UIColor yellowColor];
        
        
        [footerView addSubview:footerLabel];
        reusableView = footerView;
    }
    
    return reusableView;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

#pragma mark - UICollectionViewDelegateFromLayouts

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(25, 25, 25, 25);
//
//}

@end
