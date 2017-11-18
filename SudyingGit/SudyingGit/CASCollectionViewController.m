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
@property (strong, nonatomic) UIButton* firstButton;
@property (strong, nonatomic) UIButton* secondButton;
@property (strong, nonatomic) UIView* buttonsView;
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
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false;
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    
    self.buttonsView = [UIView new];
    self.firstButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.secondButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.view addSubview:self.buttonsView];
    [self.buttonsView addSubview:self.firstButton];
    [self.buttonsView addSubview:self.secondButton];
    
    NSDictionary* views = @{@"buttonView": self.buttonsView, @"collectionView": self.collectionView};
    
    NSArray* verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonView]-20-[collectionView]-20-|" options:0 metrics:nil views:views];
    
    NSArray* horizontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonView]-20-|" options:0 metrics:nil views:views];
    
    NSArray* horizontalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[collectionView]-20-|" options:0 metrics:nil views:views];
    
    NSDictionary* buttonViews = @{@"firstButton": self.firstButton, @"secondButton": self.secondButton};
    
    NSArray* verticalButtonConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[firstButton]-20-|" options:0 metrics:0 views:buttonViews];
    NSArray* verticalButtonConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[secondButton]-20-|" options:0 metrics:nil views:buttonViews];
    
    NSArray* horizontalButtonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[firstButton(==secondButton)]-20-[secondButton(==firstButton)]-20-|" options:0 metrics:nil views:buttonViews];
    
    [self.view addConstraints:verticalConstraints];
    [self.view addConstraints:horizontalConstraints1];
    [self.view addConstraints:horizontalConstraints2];

    [self.buttonsView addConstraints:verticalButtonConstraints1];
    [self.buttonsView addConstraints:verticalButtonConstraints2];
    [self.buttonsView addConstraints:horizontalButtonConstraints];
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
