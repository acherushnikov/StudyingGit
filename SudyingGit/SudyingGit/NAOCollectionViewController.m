//
//  NAOCollectionViewController.m
//  SudyingGit
//
//  Created by Андрей on 16.11.2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "NAOCollectionViewController.h"
#import "NAOCollectionViewCell.h"
#import "NAOHeaderCollectionReusableView.h"
#import "NAOFooterCollectionReusableView.h"

static NSString *const NAOCollectionViewCellIdentifier = @"NAOCollectionViewCell";
static NSString *const NAOCollectionViewHeaderIdentifier = @"NAOCollectionViewHeader";
static NSString *const NAOCollectionViewFooterIdentifier = @"NAOCollectionViewFooter";

@interface NAOCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation NAOCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(200, 200);
    layout.minimumLineSpacing = 50;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.footerReferenceSize = CGSizeMake(100, 100);
    layout.headerReferenceSize = CGSizeMake(100, 100);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];

    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    [self.collectionView registerClass:[NAOCollectionViewCell class] forCellWithReuseIdentifier:NAOCollectionViewCellIdentifier];
    
    [self.collectionView registerClass:[NAOHeaderCollectionReusableView  class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NAOCollectionViewFooterIdentifier];
    
    [self.collectionView registerClass:[NAOFooterCollectionReusableView  class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NAOCollectionViewHeaderIdentifier];
    
    [self.view addSubview:self.collectionView];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NAOCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: NAOCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.label.text = [NSString stringWithFormat:@"%li", indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(150, 150);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 20, 10, 10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if(kind == UICollectionElementKindSectionHeader){
        NAOHeaderCollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NAOCollectionViewHeaderIdentifier forIndexPath:indexPath];
        view.backgroundColor = UIColor.clearColor;
        view.label.text = [NSString stringWithFormat:@"header - %li", indexPath.section];
        return view;
    } else {
        NAOFooterCollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NAOCollectionViewFooterIdentifier forIndexPath:indexPath];
        view.backgroundColor = UIColor.yellowColor;
        view.label.text = [NSString stringWithFormat:@"footer - %li", indexPath.section];
        return view;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* view = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.backgroundColor = UIColor.blueColor;
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor greenColor];
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.backgroundColor = UIColor.greenColor;
    } completion:^(BOOL finished) {
        self.view.backgroundColor = [UIColor greenColor];
    }];
    
    NSLog(@"%@", indexPath);
}

@end
