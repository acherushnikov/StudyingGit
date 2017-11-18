//
//  TableViewController.m
//  tableViewTest
//
//  Created by Вячеслав Живетьев on 14.11.2017.
//  Copyright © 2017 Base team. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

static NSString *const VMZCellIdentifier = @"reusableCell";

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* leftBtn;
@property (nonatomic, strong) UIButton* rightBtn;

@end

@implementation TableViewController

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //self.tableView.frame = self.view.frame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [UITableView new];
    [self.tableView setFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:VMZCellIdentifier];
    [self.view addSubview:self.tableView];
    
    self.leftBtn = [UIButton new];
    self.leftBtn.titleLabel.text = @"Left button";
    self.leftBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.leftBtn];
    
    self.rightBtn = [UIButton new];
    self.rightBtn.titleLabel.text = @"Right button";
    self.rightBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.rightBtn];
    
    
    
    [self updateViewConstraints];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VMZCellIdentifier forIndexPath:indexPath];
    
    //cell.set
    [cell fillDataWithName:@"Name" lastName:@"LASTNAME"];
    
    return cell;
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    self.leftBtn.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.leftBtn setFrame:CGRectMake(30, 30, 180, 180)];
    
    // Leading space to superview
    NSLayoutConstraint *leftButtonXLConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.leftBtn
                                                  attribute:NSLayoutAttributeLeft
                                                  relatedBy:NSLayoutRelationEqual
                                                  toItem:self.view
                                                  attribute:NSLayoutAttributeLeft
                                                  multiplier:1.0f constant:15];
    
    
    
    // Trailing space to superview
    NSLayoutConstraint *leftButtonXRConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.view attribute:NSLayoutAttributeCenterX
                                                 relatedBy:NSLayoutRelationEqual toItem:self.leftBtn attribute:NSLayoutAttributeTrailing
                                                 multiplier:1.0f constant:15];
    // Top space to superview Y
    NSLayoutConstraint *leftButtonYConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.leftBtn attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual toItem:self.view attribute:
                                                 NSLayoutAttributeTop multiplier:1.0f constant:25];
    
    // Fixed Height
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.leftBtn
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:44];
    
    [self.view addConstraint:leftButtonXLConstraint];
    [self.view addConstraint:leftButtonXRConstraint];
    [self.view addConstraint:leftButtonYConstraint];
    [self.view addConstraint:heightConstraint];
    
    //RIGHT BUTTON
    NSLayoutConstraint *rButtonXLConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.rightBtn
                                                  attribute:NSLayoutAttributeLeading
                                                  relatedBy:NSLayoutRelationEqual
                                                  toItem:self.leftBtn
                                                  attribute:NSLayoutAttributeTrailing
                                                  multiplier:1.0f constant:15];
    
    
    
    // Trailing space to superview
    NSLayoutConstraint *rButtonXRConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.view attribute:NSLayoutAttributeTrailing
                                                  relatedBy:NSLayoutRelationEqual toItem:self.rightBtn attribute:NSLayoutAttributeTrailing
                                                  multiplier:1.0f constant:15];
    // Top space to superview Y
    NSLayoutConstraint *rButtonYConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.rightBtn attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual toItem:self.view attribute:
                                                 NSLayoutAttributeTop multiplier:1.0f constant:25];
    
    // Fixed Height
    NSLayoutConstraint *rheightConstraint = [NSLayoutConstraint constraintWithItem:self.rightBtn
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:44];
    
    [self.view addConstraint:rButtonXLConstraint];
    [self.view addConstraint:rButtonXRConstraint];
    [self.view addConstraint:rButtonYConstraint];
    [self.view addConstraint:rheightConstraint];
    
    //TABLE VIEW
    // Leading space to superview
    NSLayoutConstraint *tableXLConstraint = [NSLayoutConstraint
                                             constraintWithItem:self.tableView
                                             attribute:NSLayoutAttributeLeft
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.view
                                             attribute:NSLayoutAttributeLeft
                                             multiplier:1.0f constant:0];
    // Trailing space to superview
    NSLayoutConstraint *tableXRConstraint = [NSLayoutConstraint
                                             constraintWithItem:self.view
                                             attribute:NSLayoutAttributeTrailing
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.tableView
                                             attribute:NSLayoutAttributeTrailing
                                             multiplier:1.0f constant:0];
    // Top space to superview Y
    NSLayoutConstraint *tableYTConstraint = [NSLayoutConstraint
                                             constraintWithItem:self.tableView attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual toItem:self.leftBtn attribute:
                                             NSLayoutAttributeBottom multiplier:1.0f constant:15];
    // Bottom space to superview Y
    NSLayoutConstraint *tableYBConstraint = [NSLayoutConstraint
                                             constraintWithItem:self.view attribute:NSLayoutAttributeBottom
                                             relatedBy:NSLayoutRelationEqual toItem:self.tableView attribute:
                                             NSLayoutAttributeBottom multiplier:1.0f constant:0];
    
    
    
    /* 4. Add the constraints to button's superview*/
    [self.view addConstraint:tableXLConstraint];
    [self.view addConstraint:tableXRConstraint];
    [self.view addConstraint:tableYTConstraint];
    [self.view addConstraint:tableYBConstraint];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
