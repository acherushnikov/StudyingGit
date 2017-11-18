//
//  DKNCollectionViewController.m
//  SudyingGit
//
//  Created by Deniz Kaplan on 16.11.17.
//  Copyright © 2017 none. All rights reserved.
//

#import "DKNCollectionViewController.h"
#import "DKNCollectionViewCell.h"
#import "DKNHeaderCollectionReusableView.h"
#import "DKNFooterCollectionReusableView.h"

static NSString* const CollectionViewID = @"DKNCollectionViewID";
static NSString* const CollectionViewSupplyID = @"DKNCollectionSupplyID";
static NSString* const CollectionViewSupplyID1 = @"DKNCollectionSupplyID1";

@interface DKNCollectionViewController () <UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) DKNCollectionViewCell *customCell;
@property (nonatomic, strong) NSArray *albums;
@property (nonatomic, strong) UIButton *buttonAdd;
@property (nonatomic, strong) UIButton *buttonDelete;


@end

@implementation DKNCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    
    self.albums = @[@[@{@"title":@"SomeThing"}],
                    @[],
                    @[@{},@{},@{}],
                    @[@{}]];
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 150);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    layout.footerReferenceSize = CGSizeMake(200, 100);
    layout.headerReferenceSize = CGSizeMake(100, 120);
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.buttonAdd = [UIButton new];
    self.buttonDelete = [UIButton new];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonAdd setTitle:@"Button add" forState:UIControlStateNormal];
    [self.buttonDelete setTitle:@"Button delete" forState:UIControlStateNormal];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.buttonAdd.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonDelete.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonAdd.backgroundColor = [UIColor redColor];
    self.buttonDelete.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.buttonAdd];
    [self.view addSubview:self.buttonDelete];
    [self.collectionView registerClass:[DKNFooterCollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:CollectionViewSupplyID];
    [self.collectionView registerClass:[DKNHeaderCollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CollectionViewSupplyID1];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[DKNCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewID];
    
    NSDictionary *viewForConstraint = @{@"collectionView" : self.collectionView,
                                        @"view" : self.view,
                                        @"buttonAdd" : self.buttonAdd,
                                        @"buttonDelete" : self.buttonDelete
                                        };
    
    NSArray <NSLayoutConstraint *> *collectionViewConstraintLeftRight = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collectionView]-0-|" options:0 metrics:nil views:viewForConstraint];
    
   NSArray <NSLayoutConstraint *>  *collectionViewConstraintTopBottom = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-74-[collectionView]-0-|" options:0 metrics:nil views:viewForConstraint];
    
    NSArray <NSLayoutConstraint *>  *collectionViewConstraintButtonAddTop = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonAdd]|" options:0 metrics:nil views:viewForConstraint];
        NSArray <NSLayoutConstraint *>  *collectionViewConstraintButtonDelete = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonDelete]|" options:0 metrics:nil views:viewForConstraint];
     NSArray <NSLayoutConstraint *>  *collectionViewConstraintButtonDeleteToButtonAdd = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[buttonAdd(==buttonDelete)]-15-[buttonDelete]-15-|" options:0 metrics:nil views:viewForConstraint];
    
    for (NSLayoutConstraint *constraint in collectionViewConstraintTopBottom)
    {
    [self.view addConstraint:constraint];
    }
    for (NSLayoutConstraint *constraint2 in collectionViewConstraintLeftRight)
    {
        [self.view addConstraint:constraint2];
    }
       for (NSLayoutConstraint *constraint3 in collectionViewConstraintButtonAddTop)
       {
          [self.view addConstraint:constraint3];
       }
    for (NSLayoutConstraint *constraint4 in collectionViewConstraintButtonDelete)
    {
        [self.view addConstraint:constraint4];
    }
    for (NSLayoutConstraint *constraint5 in collectionViewConstraintButtonDeleteToButtonAdd)
    {
        [self.view addConstraint:constraint5];
    }
    
    
}
#pragma mark - UICollectionDataSource



- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
 
    DKNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewID forIndexPath:indexPath];
   
//    cell.textLabel.text = [NSString stringWithFormat:@"sec-%lu | row-%lu" ,indexPath.section, indexPath.row];
    cell.textLabel.text = self.albums[indexPath.section][indexPath.row][@"title"];
    
    
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ((NSArray *)self.albums[section]).count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.albums.count;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    DKNHeaderCollectionReusableView *reusableViewH;
     DKNFooterCollectionReusableView *reusableViewF;
    UICollectionReusableView *reusableView;
    if (kind == UICollectionElementKindSectionFooter)
    {
        reusableViewF = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CollectionViewSupplyID forIndexPath:indexPath];
        
        //reusableView.backgroundColor = UIColor.yellowColor;
         return reusableViewF;
       
    }
   
   if (kind == UICollectionElementKindSectionHeader)
      {
          reusableViewH = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:CollectionViewSupplyID1 forIndexPath:indexPath];
  
         // reusableView.backgroundColor = UIColor.cyanColor;
           return reusableViewH;
      }
    
    
    
   return reusableView;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}



//-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGSize size = CGSizeMake(100, 100);
//    return size;
//}

@end
