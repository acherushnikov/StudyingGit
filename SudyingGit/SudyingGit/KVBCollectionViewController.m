//
//  KVBCollectionViewController.m
//  SudyingGit
//
//  Created by admin on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "KVBCollectionViewController.h"
#import "KVBCollectionViewCell.h"
#import "KVBHeaderCollectionReusableView.h"
static NSString *const KVBCollectionViewID = @"KVBCollectionID";
static NSString *const KVBCollectionViewSupplyID = @"KVBCollectionSupplyID";


@interface KVBCollectionViewController () <UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray* albums;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation KVBCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(200, 200);
    layout.minimumLineSpacing = 50;
    [layout setFooterReferenceSize:CGSizeMake(25, 100)];
    [layout setHeaderReferenceSize:CGSizeMake(25, 100)];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    //self.collectionView.frame = self.view.frame;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.albums = @[@[@"123", @"456"],@[@"str2"],@[@"123", @"456"],@[@"123", @"456",@"123", @"456"]];
    
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    [self.collectionView registerClass:[KVBCollectionViewCell class] forCellWithReuseIdentifier:KVBCollectionViewID];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[KVBHeaderCollectionReusableView  class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:KVBCollectionViewSupplyID];
    
    [self.collectionView registerClass:[KVBHeaderCollectionReusableView  class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:KVBCollectionViewSupplyID];
    UIButton *leftButton = [UIButton new];
    leftButton.backgroundColor = UIColor.grayColor;
    leftButton.titleLabel.text = @"B1";
    
    self.leftButton = leftButton;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton new];
    rightButton.backgroundColor = UIColor.greenColor;
    rightButton.titleLabel.text = @"B2";
    
    self.rightButton = rightButton;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:rightButton];
    //
    
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.leftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.rightButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UICollectionView* collectionView = self.collectionView;

    NSDictionary *views = NSDictionaryOfVariableBindings(collectionView, leftButton,rightButton);
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftButton]-15-[rightButton]-15-|" options:0 metrics:nil views:views];
    NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"[rightButton(==leftButton)]" options:0 metrics:nil views:views];
    NSArray *heightForButton1       = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[rightButton(==44)]" options:0 metrics:nil views:views];
    NSArray *heightForButton2       = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[leftButton(==44)]" options:0 metrics:nil views:views];

    NSArray *verticalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[leftButton]-15-[collectionView]-0-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[rightButton]-15-[collectionView]-0-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraintsColl =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collectionView]-0-|" options:0 metrics:nil views:views];

    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:equalWidthConstraints1];
    [self.view addConstraints:heightForButton1];
    [self.view addConstraints:heightForButton2];
    [self.view addConstraints:verticalConstraints1];
    [self.view addConstraints:verticalConstraints2];
    [self.view addConstraints:verticalConstraintsColl];
    // Do any additional setup after loading the view.
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    KVBCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:KVBCollectionViewID       forIndexPath:indexPath];
    collectionCell.backgroundColor = [UIColor whiteColor];
    collectionCell.label.text = [NSString stringWithFormat:@"sec %li row %li", indexPath.section, indexPath.row];
    return collectionCell;
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if(self.albums.count + 1< section)
    {
        return nil;
    }
    
    
    
    return [[self.albums objectAtIndex:section] count];
}


- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.albums.count;
}

#pragma mark -UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
    return insets;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Sected section = %li row = %li", indexPath.section , indexPath.row);
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark -Data source
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        KVBHeaderCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:KVBCollectionViewSupplyID forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor blueColor];
        reusableView.label.text = @"Header";
        return reusableView;

    }
    else{
        KVBHeaderCollectionReusableView *reusableView1 = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:KVBCollectionViewSupplyID forIndexPath:indexPath];
        reusableView1.backgroundColor = [UIColor greenColor];
        reusableView1.label.text = @"Footer";
        return reusableView1;
    }
}

@end
