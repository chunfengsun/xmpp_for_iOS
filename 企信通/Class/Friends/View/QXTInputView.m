//
//  QXTInputView.m
//  企信通
//
//  Created by 林柏参 on 14/8/6.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

#import "QXTInputView.h"
#import "QXTCollectionView.h"
#import "ZBMessageManagerFaceView.h"

@interface QXTInputView()<ZBMessageManagerFaceViewDelegate>

/**
 *  按钮名字从左到右
 */

//  录音按钮
@property (nonatomic,weak) IBOutlet UIButton *holdDownButton;
//表情按钮
@property (nonatomic,weak) IBOutlet UIButton *faceSendButton;
//+ 号按钮
@property (nonatomic,weak) IBOutlet UIButton *multiMediaSendButton;
//  按住说话
@property (nonatomic,weak) IBOutlet UIButton *voiceChangeButton;

@property (nonatomic,weak) IBOutlet UITextField *messageInputTextView;

@end

@implementation QXTInputView

-(void)btnWithNormalImage:(NSString *)Normal Highlighted:(NSString *)Highlighted button:(UIButton *)button
{
    [button setBackgroundImage:[UIImage resizedImageWithName:Normal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizedImageWithName:Highlighted] forState:UIControlStateHighlighted];
}

-(void)awakeFromNib
{
    [self btnWithNormalImage:@"VoiceBtn_Black" Highlighted:@"VoiceBtn_BlackHL" button:_holdDownButton];
}

-(IBAction)button:(UIButton *)sender
{
    ZBMessageManagerFaceView *managerFaceView = [[ZBMessageManagerFaceView alloc]initWithFrame:CGRectMake(0, 0, 320,216)];
    managerFaceView.delegate = self;
    managerFaceView.hidden = YES;

//    _managerFaceView.backgroundColor = [UIColor redColor];
    [self addSubview:managerFaceView];
    
    switch (sender.tag) {
        case 0:
        {
            self.faceSendButton.selected = NO;
            self.multiMediaSendButton.selected = NO;
            sender.selected = !sender.selected;

            if (sender.selected){
                NSLog(@"声音被点击的");
                [self.messageInputTextView setInputView:Nil];
                [self.messageInputTextView becomeFirstResponder];
                
            }else{
                NSLog(@"声音被点击结束");
                [self.messageInputTextView resignFirstResponder];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.holdDownButton.hidden = sender.selected;
                self.messageInputTextView.hidden = !sender.selected;
            } completion:^(BOOL finished) {
                
            }];
            
//            if ([self.delegate respondsToSelector:@selector(didChangeSendVoiceAction:)]) {
//                [self.delegate didChangeSendVoiceAction:sender.selected];
//            }
        }
            [_messageInputTextView reloadInputViews];
            break;
        case 1:
        {
            
            
            self.multiMediaSendButton.selected = NO;
            self.voiceChangeButton.selected = YES;
            
            sender.selected = !sender.selected;
            if (sender.selected) {
                 [self.messageInputTextView becomeFirstResponder];
                managerFaceView.hidden = NO;
                [self.messageInputTextView setInputView:managerFaceView];
                
                
                
                NSLog(@"表情被点击");
//                [self.messageInputTextView resignFirstResponder];
            }else{
                managerFaceView.hidden = YES;
                [self.messageInputTextView setInputView:Nil];
                
                NSLog(@"表情没被点击");
//                [self.messageInputTextView becomeFirstResponder];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.holdDownButton.hidden = YES;
                self.messageInputTextView.hidden = NO;
            } completion:^(BOOL finished) {
                
            }];
            
//            if ([self.delegate respondsToSelector:@selector(didSendFaceAction:)]) {
//                [self.delegate didSendFaceAction:sender.selected];
//            }
        }
            
            [_messageInputTextView reloadInputViews];
            
            break;
        case 2:
        {
            QXTCollectionView *collection = [[QXTCollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 216)];
            collection.hidden = YES;
            [self addSubview:collection];
            
            self.voiceChangeButton.selected = YES;
            self.faceSendButton.selected = NO;
            
            sender.selected = !sender.selected;
            if (sender.selected) {
                collection.hidden = NO;
                
                [self.messageInputTextView becomeFirstResponder];
                [self.messageInputTextView setInputView:collection];
                
                NSLog(@"分享被点击");
//                [self.messageInputTextView resignFirstResponder];
            }else{
                [self.messageInputTextView setInputView:Nil];
                collection.hidden = YES;
                
                NSLog(@"分享没被点击");
                
                
//                [self.messageInputTextView becomeFirstResponder];
            }
            
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.holdDownButton.hidden = YES;
                self.messageInputTextView.hidden = NO;
            } completion:^(BOOL finished) {

            }];
            
//            if ([self.delegate respondsToSelector:@selector(didSelectedMultipleMediaAction:)]) {
//                [self.delegate didSelectedMultipleMediaAction:sender.selected];
//            }
        }
            [_messageInputTextView reloadInputViews];
            
            break;
        default:
            break;
    }
}

/**
 *  拿到发送的表情了
 */
-(void)SendTheFaceStr:(NSString *)faceStr isDelete:(BOOL)dele
{
#warning 这里点最右下角会奔溃的bug 后期解决
    if (faceStr == nil) {
        UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"bug" message:nil delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [al show];
        
        return;
    };
    
    NSMutableString *str = [NSMutableString stringWithString:_messageInputTextView.text];
    [str appendString:faceStr];
    _messageInputTextView.text = str;
}
@end
