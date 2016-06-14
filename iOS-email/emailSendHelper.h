//
//  emailSendHelper.h
//  iOS-email
//
//  Created by EaseMob on 16/6/13.
//  Copyright © 2016年 EaseMob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@protocol emailSendHelperDelegate <NSObject>

//回调方法
- (void)didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;

@end

@interface emailSendHelper : NSObject<MFMailComposeViewControllerDelegate,UINavigationBarDelegate>

@property (nonatomic, weak) id <emailSendHelperDelegate>sendHelperDelegate;

@property (nonatomic, strong)MFMailComposeViewController *mailComposeViewController;

- (void)sendEmail;
- (MFMailComposeViewController *)sendEmailWithSubject:(NSString *)subject andToRecipients:(NSArray *)toRecipients andccRecipients:(NSArray *)ccRecipients andbccRecipients:(NSArray *)bccRecipients andData:(NSData *)data andType:(NSString *)mimeType andFilename:(NSString *)filename andHtml:(NSString *)html andBody:(NSString *)body isHtml:(BOOL)isHtml;

@end
