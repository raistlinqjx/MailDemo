//
//  ViewController.m
//  MailDemo
//
//  Created by Qian JX on 16/10/13.
//  Copyright © 2016年 zfsoft. All rights reserved.
//

#import "ViewController.h"
#import "MailAccountViewController.h"

@interface ViewController ()
@property (nonatomic, retain) NSArray *mailProviderArray;
@end

@implementation ViewController
@synthesize mailProviderTable, mailProviderArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mailProviderArray = @[@"163", @"126", @"QQ信息", @"新浪", @"搜狐"];
    
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.mailProviderTable = tv;
    self.mailProviderTable.delegate = self;
    self.mailProviderTable.dataSource = self;
    self.mailProviderTable.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);
    [self.view addSubview:self.mailProviderTable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mailProviderArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SurveyListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIdentifier];
        
    }
    cell.textLabel.text = [mailProviderArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MailAccountViewController *controller = [[MailAccountViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}




@end
