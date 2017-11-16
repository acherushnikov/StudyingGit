//
//  ZAMCollectionViewController.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//


#import "ZAMCollectionViewController.h"
#import "ZAMCollectionViewCell.h"
#import "ZAMCollectionReusableViewHeader.h"
#import "ZAMCollectionReusableViewFooter.h"

static NSString *const CollectionViewId = @"ZAMCollectionView";
static NSString *const CustomCollectionViewId = @"ZAMCollectionViewCustom";
static NSString *const FooterID = @"ZAMColleasff";
static NSString *const HeaderID = @"ZAMCasfaf";




@interface ZAMCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation ZAMCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    //layout.minimumInteritemSpacing = 50;
    //layout.minimumLineSpacing = 33;
    //layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    //layout.itemSize = CGSizeMake(1000, 30);
    layout.footerReferenceSize = CGSizeMake(200, 100);
    layout.headerReferenceSize = CGSizeMake(100, 25);
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionViewId];
    [self.collectionView registerClass:[ZAMCollectionViewCell class] forCellWithReuseIdentifier:CustomCollectionViewId];
    
    [[self collectionView]registerClass:[ZAMCollectionReusableViewFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID];
    [[self collectionView]registerClass:[ZAMCollectionReusableViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];

    
    [self.view addSubview:_collectionView];
}


#pragma mark - CollectionView delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZAMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CustomCollectionViewId forIndexPath:indexPath];

    cell.someLabel.text = [NSString stringWithFormat:@"sect #%ld #%ld",indexPath.section+1,indexPath.row+1];
    cell.someLabel.textColor = [UIColor redColor];
    cell.someLabel.font = [UIFont systemFontOfSize:22];
    cell.backgroundColor = [UIColor blueColor];
    
    return  cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(150, 150);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(25, 25, 25, 25);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reus;
    
    if (kind==UICollectionElementKindSectionFooter) {
        ZAMCollectionReusableViewFooter *foot = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:FooterID forIndexPath:indexPath];
        foot.footerLabel.text=[NSString stringWithFormat:@"footer #%ld",indexPath.section];
        foot.backgroundColor=[UIColor greenColor];
        foot.footerLabel.textAlignment= NSTextAlignmentRight;
        foot.footerLabel.backgroundColor = [UIColor grayColor];
        reus=foot;
    }
    else
    {
        ZAMCollectionReusableViewHeader *head = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderID forIndexPath:indexPath];
        head.headerLabel.text=[NSString stringWithFormat:@"header #%ld",indexPath.section];
        head.backgroundColor=[UIColor orangeColor];
        head.headerLabel.textAlignment= NSTextAlignmentRight;
        head.headerLabel.backgroundColor = [UIColor grayColor];
        reus=head;
    }
    return reus;
}

@end
