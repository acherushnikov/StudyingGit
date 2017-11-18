//
//  MEKCollectionViewController.m
//  SudyingGit
//
//  Created by Matvey Kravtsov on 16/11/2017.
//  Copyright © 2017 none. All rights reserved.
//

#import "MEKCollectionViewController.h"
#import "MEKCollectionViewCell.h"

static NSString *const CollectionViewID = @"MEKCollectionView";


@interface MEKCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation MEKCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 150);
    //layout.minimumLineSpacing
    layout.minimumLineSpacing = 50;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = UIColor.blueColor;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[MEKCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    
    [self.view addSubview:self.collectionView];
    
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftButton.backgroundColor = UIColor.greenColor;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton setTitle:@"Left" forState:UIControlStateNormal];
    [self.view addSubview:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightButton.backgroundColor = UIColor.redColor;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton setTitle:@"Right" forState:UIControlStateNormal];
    [self.view addSubview:self.rightButton];
    
    [self setupConstraints];
}

-(void) setupConstraints
{
    NSDictionary *views = @{@"collectionView": self.collectionView, @"leftButtom" : self.leftButton, @"rightButton" : self.rightButton};
    
    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-74-[collectionView]-0-|" options:0 metrics:nil views:views];
    
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collectionView]-0-|" options:0 metrics:nil views:views];
    
    NSArray *vLeftButtonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[leftButtom]-15-[collectionView]|" options:0 metrics:nil views:views];
    
    NSArray *vRightButtonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[rightButton]-15-[collectionView]|" options:0 metrics:nil views:views];
    
    NSArray *hButtonsConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[leftButtom(==rightButton)]-15-[rightButton]-15-|" options:0 metrics:nil views:views];
    
    [NSLayoutConstraint activateConstraints:vConstraints];
    [NSLayoutConstraint activateConstraints:hConstraints];
    [NSLayoutConstraint activateConstraints:vLeftButtonConstraints];
    [NSLayoutConstraint activateConstraints:vRightButtonConstraints];
    [NSLayoutConstraint activateConstraints:hButtonsConstraints];
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MEKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"row - %lu", indexPath.row];
    
    cell.backgroundColor = UIColor.redColor;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(25, 25, 25, 25);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(100, 100);
//}

@end
