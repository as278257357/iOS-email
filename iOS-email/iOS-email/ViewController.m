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
#import "emailSendHelper.h"

@interface ViewController ()<emailSendHelperDelegate>

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
//        [self sendEmail];
        
        
        emailSendHelper *helper = [[emailSendHelper alloc]init];
        helper.sendHelperDelegate = self;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"];
        NSData *myData = [NSData dataWithContentsOfFile:path];
        MFMailComposeViewController *controller = [helper sendEmailWithSubject:@"Hello from easemob" andToRecipients:@[@"zhangyb@easemob.com"] andccRecipients:@[@"ted@easemo.com"] andbccRecipients:@[@"aaa@easemob.com"] andData:myData andType:@"image/jpeg" andFilename:@"1" andHtml:nil andBody:@"easemob" isHtml:NO];
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        NSLog(@"Device not configured to send SMS.");
    }
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
