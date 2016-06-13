//
//  ViewController.m
//  iOS-email
//
//  Created by EaseMob on 16/6/13.
//  Copyright © 2016年 EaseMob. All rights reserved.
//
//屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//rgb
#define My_Color(a,b,c) [UIColor colorWithRed:(a)/255.0f green:(b)/255.0f blue:(c)/255.0f alpha:1.0]

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = My_Color(144, 89, 240);
    btn.frame = CGRectMake(50, 100, SCREEN_WIDTH-100, 120);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"发送邮件" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnClick:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        [self sendEmail];
    } else {
        NSLog(@"Device not configured to send SMS.");
    }
}

- (void)sendEmail {
    MFMailComposeViewController * mailComposeViewController = [[MFMailComposeViewController alloc]init];
    mailComposeViewController.mailComposeDelegate = self;
    [mailComposeViewController setSubject:@"Hello from easemob"];
    // Set up recipients
    //设置收件人
    NSArray *toRecipients = [NSArray arrayWithObject:@"zhangyb@easemob.com"];
    //抄送
    NSArray *ccRecipients = [NSArray arrayWithObjects:@"ted@easemob.com", nil];
    //秘送
    NSArray *bccRecipients = [NSArray arrayWithObject:@"zhuhy@easemob.com"];
    
    [mailComposeViewController setToRecipients:toRecipients];
    [mailComposeViewController setCcRecipients:ccRecipients];
    [mailComposeViewController setBccRecipients:bccRecipients];
    
    // Attach an image to the email
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
    [mailComposeViewController addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"1"];
    
    // Fill out the email body text
    NSString *emailBody = @"easemob!";
    [mailComposeViewController setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:mailComposeViewController animated:YES completion:NULL];
    
    
}


#pragma MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
