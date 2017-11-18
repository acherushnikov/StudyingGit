//
//  MVMCollectionViewController.m
//  SudyingGit
//
//  Created by Вероника on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "MVMCollectionViewController.h"
#import "MVMCollectionViewCell.h"
#import "MVMCollectionReusableView.h"

static NSString *const MVMCollectionviewID= @"MVMCollectionviewID";
static  NSString *const MVMCollectionViewFooterAndHeaderID = @"MVMCollectionViewFooterAndHeaderID";

@interface MVMCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *album;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;

@end

@implementation MVMCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button1 = [UIButton new];
    self.button2 = [UIButton new];
    
    self.button1.backgroundColor = [UIColor blueColor];
    self.button2.backgroundColor = [UIColor blueColor];

    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.album = @[ @[@{@"title":@"photo"}], @[], @[@{}, @{}], @[@{}]];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    layout.itemSize = CGSizeMake(175, 175);
    //layout.minimumInteritemSpacing = 50;
    layout.minimumLineSpacing = 50;
    [layout setFooterReferenceSize:CGSizeMake(CGRectGetWidth(self.view.frame)- 50, 25)];
    [layout setHeaderReferenceSize:CGSizeMake(CGRectGetWidth(self.view.frame)- 50, 25)];
    //[layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    self.collectionView.backgroundColor = [UIColor greenColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[MVMCollectionViewCell class]  forCellWithReuseIdentifier:MVMCollectionviewID];
    
    [self.collectionView registerClass:[MVMCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:MVMCollectionViewFooterAndHeaderID];
    
    [self.collectionView registerClass:[MVMCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MVMCollectionViewFooterAndHeaderID];
    
    [self.view addSubview:self.collectionView];
    
    
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *topButton1 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:35.0];
    
    NSLayoutConstraint *heightButton1 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:44.0];
    
    NSLayoutConstraint *leftButton1 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15.0];
    
    NSLayoutConstraint *rightButton1 = [NSLayoutConstraint constraintWithItem:self.button1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.button2 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:-15.0];
    
    NSLayoutConstraint *topButton2 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:35.0];
    
    NSLayoutConstraint *heightButton2 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:44.0];
    
    NSLayoutConstraint *widthButton2 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.button1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *rightButton2 = [NSLayoutConstraint constraintWithItem:self.button2 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15.0];

    NSLayoutConstraint *topCollectionView = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:94.0];
    
    NSLayoutConstraint *downCollectionView = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *leftCollectionView = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *rightCollectionView = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];

    [self.view addConstraints:@[leftCollectionView, topCollectionView ,rightCollectionView, downCollectionView, topButton1, leftButton1, rightButton1, heightButton1, topButton2, widthButton2, rightButton2, heightButton2]];

}

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MVMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MVMCollectionviewID forIndexPath:indexPath];
    
    cell.label.text = self.album[indexPath.section][indexPath.row][@"title"];
    
    //cell.label.text = [NSString stringWithFormat:@"section - %lu, row - %lu", indexPath.section, indexPath.row];//номер элемента в секции. объект попал в релизпул????? счетчик увеличивается, если вызывается alloc, new, copy
    
    cell.backgroundColor =[UIColor redColor];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(self.album.count - 1 < section)
    {
        return 0;
    }
    
    NSArray *photos = self.album[section];
    
    if(![photos isKindOfClass:[NSArray class]])
    {
        return 0;
    }
    
    return photos.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.album.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MVMCollectionReusableView *reusableView;
    if (kind == UICollectionElementKindSectionFooter)
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:MVMCollectionViewFooterAndHeaderID forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor purpleColor];
        reusableView.label.text = @"3333";
    }
    if (kind == UICollectionElementKindSectionHeader)
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:MVMCollectionViewFooterAndHeaderID forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor orangeColor];
    }
    return reusableView;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(25, 25, 25, 25);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", indexPath);
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(100, 100);
//}


@end
