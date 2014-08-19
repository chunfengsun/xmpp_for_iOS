//
//  QXTMessageTableViewCell.h
//  企信通
//
//  Created by 林柏参 on 14/8/5.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQRichTextView.h"

@interface QXTMessageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleConstraintsHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *titleConstraintsWeight;

@property (strong, nonatomic) IBOutlet UIImageView *chatBg;

@property (strong, nonatomic) IBOutlet TQRichTextView *chatTextView;

-(void)btnWithMessageString:(NSString *)message isOutgoing:(BOOL)isOutgoing;

@end
