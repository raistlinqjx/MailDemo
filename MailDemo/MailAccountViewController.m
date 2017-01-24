//
//  MailAccountViewController.m
//  MailDemo
//
//  Created by Qian JX on 16/10/17.
//  Copyright © 2016年 zfsoft. All rights reserved.
//

#import "MailAccountViewController.h"
#import <MailCore/MailCore.h>
@interface MailAccountViewController ()

@end

@implementation MailAccountViewController
@synthesize userNameField, passwordField, manualBtn, nextBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"账户设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *tipLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 30)];
    tipLbl.textAlignment = NSTextAlignmentCenter;
    tipLbl.text = @"只需几个步骤即可完成电子邮件设置";
    tipLbl.textColor = [UIColor grayColor];
    [self.view addSubview:tipLbl];
    
    UITextField *field1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width-40, 30)];
    field1.borderStyle = UITextBorderStyleRoundedRect;
    field1.delegate = self;
    self.userNameField = field1;
    [self.view addSubview:self.userNameField];
    
    UITextField *field2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 170, self.view.frame.size.width-40, 30)];
    field2.borderStyle = UITextBorderStyleRoundedRect;
    field2.delegate = self;
    self.passwordField = field2;
    [self.view addSubview:self.passwordField];
    
    UIButton *btn1 = [UIButton new];
    btn1.frame = CGRectMake(20, 210, 100, 30);
//    btn1.titleLabel.text = @"手动设置";
    [btn1 setTitle:@"手动设置" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn1 setTintColor:[UIColor blueColor]];
    self.manualBtn = btn1;
    [self.view addSubview:self.manualBtn];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(240, 210, 100, 30);
    [btn2 setTitle:@"下一步" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.nextBtn = btn2;
    [self.view addSubview:self.nextBtn];
    
    MCOIMAPSession *session = [[MCOIMAPSession alloc] init];
    [session setHostname:@"imap.163.com"];
    [session setPort:993];
    [session setUsername:@"raistlin_qjx@163.com"];
    [session setPassword:@"MarbleScrew"];
    [session setConnectionType:MCOConnectionTypeTLS];
    
    session.connectionLogger = ^(void * connectionID,MCOConnectionLogType type,NSData * data) {
        
        if (type != MCOConnectionLogTypeSentPrivate) {
            
            NSLog(@"eventlogged:%p %i withData: %@", connectionID, type, [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            
        }
        
    };
    
    //检查登录邮箱
    
    MCOIMAPOperation *checkOp = [session checkAccountOperation];
    
    [checkOp start:^(NSError *error) {
        
        NSLog(@"finished checking account.");
        
        if (error == nil) {
            
            //在这里获取邮件
            NSLog(@"获取邮件");
            
        } else {
            
            NSLog(@"error loading account: %@", error);
            
//            [self hideLoading];
            
//            ALERT_SHOW(@"登录邮箱失败，请检查网络重试");
            
        }
        
        
        
//        checkOp = nil;
        
    }];

    
    MCOIMAPMessagesRequestKind requestKind = MCOIMAPMessagesRequestKindHeaders;
    NSString *folder = @"INBOX";
    MCOIndexSet *uids = [MCOIndexSet indexSetWithRange:MCORangeMake(1, UINT64_MAX)];
    
    MCOIMAPFetchMessagesOperation *fetchOperation = [session fetchMessagesOperationWithFolder:folder requestKind:requestKind uids:uids];
    
    [fetchOperation start:^(NSError * error, NSArray * fetchedMessages, MCOIndexSet * vanishedMessages) {
        //We've finished downloading the messages!
        
        //Let's check if there was an error:
        if(error) {
            NSLog(@"Error downloading message headers:%@", error);
        }
        
        //And, let's print out the messages...
        NSLog(@"The post man delivereth:%@", fetchedMessages);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
