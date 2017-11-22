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
#import <Masonry/Masonry.h>


static NSString *const CollectionViewID = @"CASCollectionViewCell";
static NSString *const CollectionViewSupplyID = @"CASCollectionViewSupplyCell";


@interface CASCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSMutableArray *albums;
@property (nonatomic, strong) UIView *buttonsView;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation CASCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.albums = [NSMutableArray arrayWithArray: @[
                    @[
                        @{ @"title": @"12424j" }
                    ],
                    @[
                        @{ @"title": @"12424j" }
                    ],
                    @[
                        @{ @"title": @"12424j" },
                    ],
                    @[
                        @{ @"title": @"12424j" },
                    ]
                ]];
    
    self.layout = [UICollectionViewFlowLayout new];
    self.layout.itemSize = CGSizeMake(175, 175);
    self.layout.minimumLineSpacing = 50;
    
    [self.layout setFooterReferenceSize:CGSizeMake(100, 50)];
    [self.layout setHeaderReferenceSize:CGSizeMake(150, 25)];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame    collectionViewLayout:self.layout];
	self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.backgroundColor = UIColor.whiteColor;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
	
	self.buttonsView = [UIView new];
	self.buttonsView.translatesAutoresizingMaskIntoConstraints = NO;
	
	self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setTitle:@"Удалить ячейку" forState:UIControlStateNormal];
    self.rightButton.backgroundColor = UIColor.blackColor;
	self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[self.leftButton setTitle:@"Добавить ячейку" forState:UIControlStateNormal];
    self.leftButton.backgroundColor = UIColor.blackColor;
	[self.buttonsView addSubview:self.rightButton];
	[self.buttonsView addSubview:self.leftButton];
    
    [self.rightButton addTarget:self action:@selector(deleteCellAction) forControlEvents: UIControlEventTouchUpInside];
    
    [self.leftButton addTarget:self action:@selector(addCellAction) forControlEvents:UIControlEventTouchUpInside];

	
	[self.view addSubview: self.buttonsView];
	self.view.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[CASCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewSupplyID];
    [self.collectionView registerClass:[CASCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewSupplyID];
    
    [self.view addSubview:self.collectionView];
	
	[self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    
    
    
    
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 15, 15, 15);
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttonsView.mas_top).with.offset(padding.top); //with is an optional semantic filler
        make.right.equalTo(self.buttonsView.mas_right).with.offset(-padding.right);
        make.height.mas_equalTo(44);
        make.bottom.equalTo(self.buttonsView.mas_bottom).with.offset(-padding.bottom);
    }];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttonsView.mas_top).with.offset(padding.top); //with is an optional semantic filler
        make.left.equalTo(self.buttonsView.mas_left).with.offset(padding.left);
        make.height.mas_equalTo(44);
        make.width.equalTo(self.rightButton);
        make.bottom.equalTo(self.buttonsView.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(self.rightButton.mas_left).with.offset(-padding.right);
    }];
    
    [self.buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(74);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.buttonsView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];

	
//    NSDictionary *views = @{
//                          @"leftButton" : self.leftButton,
//                          @"rightButton" : self.rightButton,
//                          @"buttonsView" : self.buttonsView,
//                          @"collectionView" : self.collectionView
//                          };
//
//    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftButton]-15-[rightButton]-15-|" options:0 metrics:nil views:views];
//
//    NSArray *equalWidthConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"[leftButton(==rightButton)]" options:0 metrics:nil views:views];
//
//
//    NSArray *verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[leftButton(44)]-15-|" options:0 metrics:nil views:views];
//    NSArray *verticalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[rightButton(44)]-15-|" options:0 metrics:nil views:views];
//
//    [self.view addConstraints:horizontalConstraints];
//    [self.view addConstraints:equalWidthConstraints1];
//    [self.view addConstraints:verticalConstraints1];
//    [self.view addConstraints:verticalConstraints2];
//
//    NSArray *horizontalConstraintsButtonsView = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonsView]-0-|" options:0 metrics:nil views:views];
//
//
//    NSArray *horizontalConstraintsCollectionView = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collectionView]-0-|" options:0 metrics:nil views:views];
//
//    NSArray *verticalConstraintsCollectionView = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[buttonsView]-0-[collectionView]-0-|" options:0 metrics:nil views:views];
//
//    [self.view addConstraints:horizontalConstraintsButtonsView];
//    [self.view addConstraints:verticalConstraintsCollectionView];
//    [self.view addConstraints:horizontalConstraintsCollectionView];
	
	[super updateViewConstraints];
}

#pragma mark - UIButton Action

- (void)deleteCellAction
{
    if (self.albums.count)
    {
        [self.albums removeObjectAtIndex:0];
        [self.collectionView reloadData];
    }
}

- (void)setAlbums:(NSMutableArray *)albums {
    
    if (_albums != albums)
    {
        _albums = [albums mutableCopy];
    }
    
    return;
}

- (void)addCellAction
{
    NSArray *addElemet = @[@{ @"title": @"Новый элемент"}];
    
    [self.albums insertObject:addElemet atIndex:0];
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CASCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID
                                forIndexPath:indexPath];
    
    cell.textLabel.text = self.albums[indexPath.section][indexPath.row][@"title"];
    cell.backgroundColor = UIColor.blackColor;
    
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

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-30.0f, 0.0f, 0.0f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(30.0f, 0.0f, 0.0f)]];
    animation.autoreverses = YES;
    animation.repeatCount = 2.0f;
    animation.duration = 0.1f;
    [cell.layer addAnimation:animation forKey:nil];
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
