//
//  VMZCollectionViewController.m
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 16.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import "VMZCollectionViewController.h"
#import "VMZCollectionViewCell.h"
#import "VMZCollectionReusableView.h"

static NSString* const CollectionViewID = @"VMZCollectionView";
static NSString* const CollectionViewFooterID = @"VMZCollectionViewFooter";
static NSString* const CollectionViewHeaderID = @"VMZCollectionViewHeader";

@interface VMZCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton* leftBtn;
@property (nonatomic, strong) UIButton* rightBtn;
@property (nonatomic, strong) UICollectionView* collectionView;

@end

@implementation VMZCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 150);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 5;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor darkGrayColor];
    [self.collectionView registerClass:[VMZCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    [self.collectionView registerClass:[VMZCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewFooterID];
    [self.collectionView registerClass:[VMZCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewHeaderID];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    
    self.leftBtn = [UIButton new];
    self.leftBtn.titleLabel.text = @"Left button";
    self.leftBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton new];
    self.rightBtn.titleLabel.text = @"Right button";
    self.rightBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.rightBtn];
    
    [self createConstraints];
    
    //log(@"OK");
}

- (void)createConstraints {
    self.leftBtn.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightBtn.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_leftBtn, _rightBtn, _collectionView);
    NSArray *horizontalConstraints = [NSLayoutConstraint
                                     constraintsWithVisualFormat:@"H:|-15-[_leftBtn]-15-[_rightBtn]-15-|"
                                     options:0 metrics:nil views:views];
    NSArray *equalWidthConstraints = [NSLayoutConstraint
                                      constraintsWithVisualFormat:@"[_leftBtn(==_rightBtn)]"
                                      options:0 metrics:nil views:views];
    NSArray *verticalConstraints =[NSLayoutConstraint
                                   constraintsWithVisualFormat:@"V:|-15-[_leftBtn]-15-[_collectionView]-0-|"
                                   options:0 metrics:nil views:views];
    NSArray *verticalConstraints2 =[NSLayoutConstraint
                                   constraintsWithVisualFormat:@"V:|-15-[_rightBtn]-15-[_collectionView]-0-|"
                                   options:0 metrics:nil views:views];
    NSArray *horizontalConstraints2 =[NSLayoutConstraint
                                     constraintsWithVisualFormat:@"H:|-0-[_collectionView]-0-|"
                                     options:0 metrics:nil views:views];
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
    [self.view addConstraints:verticalConstraints2];
    [self.view addConstraints:equalWidthConstraints];
    [self.view addConstraints:horizontalConstraints2];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VMZCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    cell.label.text = [NSString stringWithFormat:@"Cell #%li", indexPath.item];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    NSString* identifier = kind == UICollectionElementKindSectionFooter ? CollectionViewFooterID : CollectionViewHeaderID;
    UICollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    return view;
}

#pragma end

#pragma mark - UICollectionViewDelegateFlowLayout

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100,200);
}
*/
 
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 20, 10, 20);
}

#pragma end

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
