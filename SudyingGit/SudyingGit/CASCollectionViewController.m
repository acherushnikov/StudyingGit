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
static const CGFloat SMAButtonsOffset = 15.f;



@interface CASCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *albums;
@property (nonatomic, strong) UIView *buttonsView;
@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *secondButton;

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
    
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.collectionView registerClass:[CASCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewSupplyID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewSupplyID];
    
    [self.view addSubview:self.collectionView];
    
    
    
    self.buttonsView = [UIView new];
    self.buttonsView.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonsView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.buttonsView];
    
    
    self.firstButton = [UIButton new];
    self.firstButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstButton.backgroundColor = UIColor.orangeColor;
    [self.firstButton addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    self.secondButton = [UIButton new];
    self.secondButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondButton.backgroundColor = UIColor.orangeColor;
    
    [self.buttonsView addSubview:self.firstButton];
    [self.buttonsView addSubview:self.secondButton];
    

    NSDictionary *views = @{@"buttonsView":self.buttonsView, @"collectionView":self.collectionView};
    NSDictionary *metrics = @{@"offset": @15};

    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offset-[buttonsView]-offset-[collectionView]-offset-|" options:0 metrics:metrics views:views];
    
    NSArray *horizontalConstraints1 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[buttonsView]-offset-|"  options:0 metrics:metrics views:views];
    NSArray *horizontalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[collectionView]-offset-|" options:0 metrics:metrics views:views];
    
    NSDictionary *buttonViews = @{@"firstButton":self.firstButton, @"secondButton":self.secondButton};
    
    NSArray *verticalButtonConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offset-[firstButton]-offset-|" options:0 metrics:metrics views:buttonViews];
    NSArray *verticalButtonConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offset-[secondButton]-offset-|" options:0 metrics:metrics views:buttonViews];
    
    NSArray *horizontalButtonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[firstButton(==secondButton)]-offset-[secondButton(==firstButton)]-offset-|" options:0 metrics:metrics views:buttonViews];

    
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

# pragma mark - Actions

//- (void)addCell() {
//
//}

@end
