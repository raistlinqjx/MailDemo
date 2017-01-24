//
//  MailAccountViewController.h
//  MailDemo
//
//  Created by Qian JX on 16/10/17.
//  Copyright © 2016年 zfsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MailAccountViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, retain) UITextField *userNameField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UIButton *manualBtn;
@property (nonatomic, retain) UIButton *nextBtn;
@end
