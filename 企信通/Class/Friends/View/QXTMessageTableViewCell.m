//
//  QXTMessageTableViewCell.m
//  企信通
//
//  Created by 林柏参 on 14/8/5.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

#import "QXTMessageTableViewCell.h"

@interface QXTMessageTableViewCell()

@end

@implementation QXTMessageTableViewCell

-(void)btnWithMessageString:(NSString *)message isOutgoing:(BOOL)isOutgoing
{
     CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(200, MAXFLOAT)];
    
    if (isOutgoing) {
        _chatBg.image = [UIImage resizedImageWithName:@"SenderTextNodeBkg"];
        
    }else
    {
        _chatBg.image = [UIImage resizedImageWithName:@"ReceiverTextNodeBkg"];
    }
    
    _titleConstraintsWeight.constant = size.width + 30;
    _titleConstraintsHeight.constant = size.height + 30;

    _chatTextView.text = message;
    _chatTextView.lineSpace = 1.0f;
    _chatTextView.font = [UIFont systemFontOfSize:13.0f];
    _chatTextView.backgroundColor = [UIColor clearColor];
    _chatTextView.contentMode = UIViewContentModeBottom;
    [self setNeedsLayout];
}
@end
