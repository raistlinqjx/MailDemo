//
//  ViewController.h
//  MailDemo
//
//  Created by Qian JX on 16/10/13.
//  Copyright © 2016年 zfsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *mailProviderTable;

@end

