//
//  emailSendHelper.m
//  iOS-email
//
//  Created by EaseMob on 16/6/13.
//  Copyright © 2016年 EaseMob. All rights reserved.
//

#import "emailSendHelper.h"

@implementation emailSendHelper

- (MFMailComposeViewController *)sendEmailWithSubject:(NSString *)subject andToRecipients:(NSArray *)toRecipients andccRecipients:(NSArray *)ccRecipients andbccRecipients:(NSArray *)bccRecipients andData:(NSData *)data andType:(NSString *)mimeType andFilename:(NSString *)filename andHtml:(NSString *)html andBody:(NSString *)body isHtml:(BOOL)isHtml {
    self.mailComposeViewController = [[MFMailComposeViewController alloc]init];
    self.mailComposeViewController.mailComposeDelegate = self;
    [self.mailComposeViewController setSubject:subject];
    // Set up recipients
    //设置收件人
    [self.mailComposeViewController setToRecipients:toRecipients];
    //抄送
    [self.mailComposeViewController setCcRecipients:ccRecipients];
    //秘送
    [self.mailComposeViewController setBccRecipients:bccRecipients];
    
    // Attach an image to the email
    
    [self.mailComposeViewController addAttachmentData:data mimeType:mimeType fileName:filename];
    
    // Fill out the email body text
    NSString *emailBody = body;
    [self.mailComposeViewController setMessageBody:emailBody isHTML:isHtml];
    return self.mailComposeViewController;
    
}

//- (MFMailComposeViewController *)mailComposeViewController {
//    if (!_mailComposeViewController) {
//        _mailComposeViewController =
//    }
//    return nil;
//}

- (void)sendEmail {
    
}

#pragma MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    if(_sendHelperDelegate && [_sendHelperDelegate respondsToSelector:@selector(didFinishWithResult:error:)]) {
        [_sendHelperDelegate didFinishWithResult:result error:error];
    }
}


@end
