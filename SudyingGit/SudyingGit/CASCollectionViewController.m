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
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation CASCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.leftButton = [UIButton new];
    [self.leftButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.leftButton setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.leftButton];
    [self.leftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.rightButton = [UIButton new];
    [self.rightButton setTitle:@"Delete" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.rightButton setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.rightButton];
    [self.rightButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *buttons = @{
                              @"leftButton": self.leftButton,
                              @"rightButton": self.rightButton
                              };
//    NSLog(@"%@", buttons);
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftButton]-30-[rightButton(==leftButton)]-15-|" options:0 metrics:nil views:buttons];
    NSArray *leftButtonVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[leftButton(44)]-15-|" options:0 metrics:nil views:buttons];
    NSArray *rightButtonVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[rightButton(44)]-15-|" options:0 metrics:nil views:buttons];
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:leftButtonVerticalConstraints];
    [self.view addConstraints:rightButtonVerticalConstraints];
    
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
    
    NSDictionary *collectionView = @{ @"collectionView": self.collectionView };
    
    NSArray *collectionViewConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-74-[collectionView]" options:0 metrics:nil views:collectionView];
    [self.view addConstraints:collectionViewConstraints];
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
